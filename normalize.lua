-- normalize.lua    Rev 20    2/24/2020

-- rev 20 2/24/2020 added check for 2XLF in pattern to not suppress 2XLF for those cases.

-- returns true if an AC motor in in the train and return the component index of the motor
function fixed_speed()
  local comp,ci 
  local fixedspeed=false
  local mag=false
  local guid=categories.MOTOR.mincat.AC
  local magguid=categories.COUPLING.mincat.MAGNETIC
  for sg,shaft in pairs(machine.shafts) do
    if shaft.cat2==guid then
      fixedspeed=true
      for ci,c in ipairs(machine.components) do
        if c.shaft==sg then
          comp=ci
          break
        end
      end
      --break 
    end 
    if shaft.cat2==magguid then mag=true end
  end
  if fixedspeed and not(mag) then 
    debugprint('                Fixed Speed Machine == Tight Range Normalization') 
  else
    debugprint('              Variable Speed Machine == Wider Range Normalization') 
  end
  return fixedspeed,comp
end
--
local function FindPeakSet( bin, seed_pos, peaks, min, max, range )
  local high = bin + range
  local low = bin - range
  local valid={}
  local pos 
  local count = 1
  valid[seed_pos] = peaks[seed_pos]

  pos = seed_pos - 1
  for i=pos,min,-1 do
    if peaks[i] >= low then
      valid[i] = peaks[i]
      count = count + 1
    else
      break
    end
  end

  pos = seed_pos + 1
  for i=pos,max do
    if peaks[i] <= high then 
      valid[i] = peaks[i]
      count = count + 1
    else
      break
    end
  end
  table.sort(valid)
  return valid, count
end

local function FindClosestPeak( bin, seed_pos, ds, min, max, range )
  local peaks = ds.peaks
  local dif = 1e6
  local pos = seed_pos
  if peaks[pos] - bin > 0 then
    for i=seed_pos,min,-1 do
      local val = math.abs(peaks[i]-bin)
      if val > dif then return pos end
      pos = i
      dif = val
    end
  else
    for i=seed_pos,max do
      local val = math.abs(peaks[i]-bin)
      if val > dif then return pos end
      pos = i
      dif = val
    end
  end
  return pos;
end

--
-- Input:
--   0 <= x <= r
--   r = range, function returns weight of 0.1 at r.
--   function returns 1 at x = 0
local function weight_linear( x, r )
  return (1.0 - x*0.9/r)
end

local function FindWeightedPeak( bin, seed_pos, ds, min, max, range )
  local valid, count = FindPeakSet( bin, seed_pos, ds.peaks, min, max, range )
  local f = weight_linear
  local res = -1
  local pos = -1
  if count > 1 then
    for i,b in pairs(valid) do
      local db = math.abs(bin - b)
      local amplitude = ds_spline_value(ds,b)
      local aw = amplitude * f(db, range)
      if aw > res then
        res = aw
        pos = i
      end
    end
  else
    pos,_ = next(valid,nil)
  end
  return pos;
end

local function FindPeak( bin, tlan, ds, method )
  method = method or FindClosestPeak
  local peaks = ds.peaks
  local n = #peaks
  if n == 0 then return false, 0 end
  local min = 1
  local max = n
  if max > n then max = n end

  tlan = tlan or 1E-6
  -- Apply the binary search algorithm
  local pos
  repeat
    pos = math.floor( ((min+max)/2) + 0.5 )
    if math.abs(peaks[pos]-bin) < tlan then
      return true, method( bin, pos, ds, min, max, tlan )
    elseif peaks[pos] < bin then
      min = pos + 1
    else
      max = pos - 1
    end

  until min>max
  return false, max
end

local function FindHarmonics( bin, ds, order_range )
  local peaks = ds.peaks
  local fundimental_offset = bin-1
  local harm={}
  -- Peaks is sorted low to high.  The last entry is the max value.
  local mbin = peaks[#peaks]
  --local rng_mult =  g_peak_margin * bins_per_order / 100.0
  local h_order = 2
  --local j = 2
  local ob = h_order * fundimental_offset
  local rng = order_range
  local avg = 0
  while ob<=mbin do
    --local rng = h_order * order_range
    local found, position = FindPeak( ob+1, rng, ds )
    if found then
      local fb = peaks[position]

      -- update the fundimental with information from the found harmonic.
      --local a = 1/j
      --local b = 1-a
      --local havg = (fb-1)/h_order
      --fundimental_offset = a*havg + b*fundimental_offset
      table.insert(harm, {bin=fb,order=h_order,pos=position})
      -- increment the average  number
      --j=j+1
    end
    h_order=h_order+1
    ob = h_order * fundimental_offset
  end
  return harm, avg
end

-- Input
-- binwidth   - fmax/lines of spectrum in Hz
-- speed      - nominal speed (seed speed)
-- orders     - A table of combo order tag vs. Order.  Pair Format: tag:[number] , Order number,
--              where number is a machine index or a negitive component index.
-- peaks      - A table of bin values representing found peaks in the data
function match_peaks( ds, orders )
  local binwidth = ds.bw
  local speed = ds.speed
  local peaks = ds.peaks
  local ident={}
  local has_order = 0
  local unique_orders = {}

  for _,ord in pairs(orders) do
    has_order = 1
    unique_orders[ord] = false
  end

  -- Beleive it or not checking the size of orders has to be done this way.
  -- #orders only works for array type tables.  It doesn't work here.  So we have
  -- to set a flag to show we dropped into the loop above to know.
  assert( has_order>0, "No forcing orders given. Normalize stopped." )

  -- We have to introduce another table to sort the unique orders.
  local sorted_orders = {}
  for uord, _ in pairs( unique_orders ) do
    table.insert( sorted_orders, uord )
  end
  table.sort( sorted_orders )

  for _, cord in ipairs(sorted_orders) do
    local obin = speed*cord / binwidth
    if obin>=4 then -- is there enough resolution to find matches DY 5/22/19
      -- NOTE: The search range widens as the order goes up.  If the machine 1x varies by %2
      --       then the 2x will vary by %4, etc.
      local rng = machine.vspeed * (speed / binwidth) / 100  -- machine.vspeed * obin / 100  -- Fixed range instead of constant percentage range DY 5/22/19
      if rng<1 then rng=1 end  -- in high binwidth situations rng goes fractional too small DY 7/30/19
      local found, position = FindPeak( obin+1,rng,ds)
      if found then
        local fb = peaks[position]      
        for ctag, ord in pairs(orders) do
          if ord==cord then
            table.insert( ident, {type='F', tag=ctag, bin=fb, pos=position} )
          end
        end
        --NOTE: fb is found within a range.  But now that we have it, we know our ideal machine speed
        --      and we know where fb was found.  We could compute a new tighter range based on where
        --      fb is actually located.
        -- local precise_range = math.abs(fb - obin - 1)/obin
        -- This unit offset thing is a nightmare.  Yes, need obin+1.
        local hm, _ = FindHarmonics( obin+1, ds, g_peak_margin * speed / binwidth/ 100 )
        if #hm>0 then
          for _,h in ipairs(hm) do
            for ctag, ord in pairs(orders) do
              if ord==cord then
                table.insert( ident, {type='H', tag=ctag, bin=h.bin, pos=h.pos, order=h.order} )
              end
            end
          end
        end
      end
    end
  end

  --------------------------------------------------
  -- Search for line frequency
  -- Compute line frequency order based on speed
  local lft={}
  local cord = machine.linef / speed
  local ctag = "LF:".. math.floor( ds.mi + 0.5 )
  table.insert(lft,{["cord"]=cord,["ctag"]=ctag})
  cord = 2.0 * machine.linef / speed
  ctag = "2XLF:".. math.floor( ds.mi + 0.5 )
  table.insert(lft,{["cord"]=cord,["ctag"]=ctag})

  for _,lfi in ipairs(lft) do
    local obin = speed*lfi.cord / binwidth
    -- NOTE: The search range is narrower for line frequency.
    local rng = g_linef_margin * obin / 100
    local found, position = FindPeak( obin+1,rng,ds)
    if found then
      local fb = peaks[position]      
      table.insert( ident, {type='F', tag=lfi.ctag, bin=fb, pos=position} )
      local hm, _ = FindHarmonics( obin+1, ds, g_linef_margin * speed / binwidth/ 100 )
      if #hm>0 then
        for _,h in ipairs(hm) do
          table.insert( ident, {type='H', tag=lfi.ctag, bin=h.bin, pos=h.pos, order=h.order} )
        end
      end
    end
  end
  ---
  return ident
end

local function speed_from_peaks( ds, speed, orders )
  local binwidth = ds.bw
  local peaks = ds.peaks
  local avg_spd = speed
  --local avg_count = 1
  local has_order = 0
  local unique_orders = {}
  for _,ord in pairs(orders) do
    has_order = 1
    unique_orders[ord] = false
  end
  -- Beleive it or not checking the size of orders has to be done this way.
  -- #orders only works for array type tables.  It doesn't work here.  So we have
  -- to set a flag to show we dropped into the loop above to know.
  assert( has_order>0, "No forcing orders given. Normalize stopped." )

  -- We have to introduce another table to sort the unique orders.
  local sorted_orders = {}
  for uord, _ in pairs( unique_orders ) do
    table.insert( sorted_orders, uord )
  end
  table.sort( sorted_orders )

  for _, cord in ipairs(sorted_orders) do
    local obin = avg_spd*cord / binwidth
    -- NOTE: The search range widens as the order goes up.  If the machine 1x varies by +-1 bin
    --       then the 2x will vary by +-2 bin, etc.
    local rng = machine.vspeed * obin / 100
    local found, position = FindPeak( obin+1,rng,ds,FindWeightedPeak)
    if found then
      local fb = peaks[position]

      -- estimate of speed based on found forcing frequency
      local spd = (fb-1.0) * binwidth / cord
      -- DEBUG:
      debugprint( "Order: "..cord.." Speed: "..spd )
      --if spd > 59.6 then
      --  print( "stop here" )
      --end
      --local a = 1/avg_count
      --local b = 1-a
      --avg_count=avg_count+1
      --avg_spd = a*spd + b*avg_spd
      avg_spd = spd


--      local hm, avgh = FindHarmonics( fb, ds, speed / binwidth )
--      if #hm>0 then

--           -- avgh is a better estimate of the correct value of fb
--           local hspd = (avgh-1.0) * binwidth / cord
--           local a = 1/avg_count
--           local b = 1-a
--           avg_count=avg_count+1
--           avg_spd = a*hspd + b*avg_spd

--        end

    end
  end
  return avg_spd
end

-- normalize0
-- Input:
--    ss_data_groups - Data grouped by super shaft
--           Format: [ssi][ei][bw][OST]->data index 
--            where ssi = super shaft index, ei = machine element index, bw=data bin width, 
--                  OST=Data Time Stamp in OS format (a number)
--
-- Return:
--    No return value.
--
-- Error: 
-- Notes:
--    Does nothing.  Does not normalize.
--
function normalize0( ss_data_groups )

end

-- normalize1
-- Input:
--    ss_data_groups - Data grouped by super shaft
--           Format: [ssi][ei][bw][OST]->data index 
--            where ssi = super shaft index, ei = machine element index, bw=data bin width, 
--                  OST=Data Time Stamp in OS format (a number)
--
-- Return:
--    No return value.
--
-- Error: 
-- Notes:
--    Update the speed associated with the data based on peak matching.
--
function normalize1( ss_data_groups )
  local sss = machine.supershafts
  local sspds = compute_super_shaft_speeds(sss, machine.ispeed, 1.0 )
  local fff = MakeForcingOrdersForSuperShafts(sss, true )
  ------------------------------------------------------------------
  -- sdgs[element index]->[bin width]->[Timestamp]-> data index
  -- 
  for i,dgtbl in pairs(ss_data_groups) do --Data groups for super shaft i

    local rff={}
    for j,ff in ipairs(fff) do
      local div = sspds[j]/sspds[i]
      for _,f in pairs(ff) do
        local key = f.tag .. ":" .. f.en
        rff[key]=f.order * div
      end
    end

    for ei,etbl in pairs(dgtbl) do

      -------------------------------
      -- find minimum bin width table
      local bw_min=1000
      for bw,_ in pairs(etbl) do 
        if bw<bw_min then bw_min = bw end
      end
      local sbwtbl = etbl[bw_min]
      if sbwtbl==nil then goto nodata end
      -------------------------------

      local spd = sspds[i] * machine.speed
      local avg_spd = spd
      local avg_count = 1
      for _,dg in pairs(sbwtbl) do
        for k,d in ipairs(dg) do
          local data = machine.datasets[d]
          --debugprint( data.bw, data.axis )

          local a = 1/k
          local b = 1 - a
          local spd_est = speed_from_peaks( data, spd, rff )
          spd = a*spd_est + b*spd
        end
        --debugprint( "Speed first pass: "..spd )

        -- Set the speed of each data array in the group to the average speed for the group.
        for _,d in ipairs(dg) do
          local data = machine.datasets[d]
          data.speed = spd
        end

        local avg_a = 1/avg_count
        local avg_b = 1 - avg_a
        avg_spd = avg_a * spd + avg_b*avg_spd
      end

      for bw,bwtbl in pairs(etbl) do
        if bw~=bw_min then
          for _,dg in pairs(bwtbl) do
            for _,d in ipairs(dg) do
              local data = machine.datasets[d]
              data.speed = avg_spd
            end
          end
        end
      end
      local ele = machine.elements[ei]
      if ele.data.spec~=nil then
        if ele.data.spec.demod~=nil then
          for _,axis_data in pairs(ele.data.spec.demod) do
            for _,di in ipairs(axis_data) do
              local data = machine.datasets[di]
              data.speed = avg_spd
            end
          end
        end
      end
      ::nodata::
    end
  end  
end
--
local function add_dataset_speed_time_data(ei,axis,bw,freq1x)
  if machine.elements[ei]~=nil and machine.elements[ei].data~=nil and machine.elements[ei].data.time~=nil and machine.elements[ei].data.time.normal[axis]~=nil then
    local dataset=machine.elements[ei].data.time.normal[axis]
    for _,ds in ipairs(dataset) do
      if round(machine.datasets[ds].fmax,2)==round(1/bw,2) then
        machine.datasets[ds].speed=freq1x
        break
      end
    end
  end
  return
end
--

local function update_dataset_speeds(sr1xs)
  -- preview sr1xs to determine if there are different speeds for the ranges.
  local ranges=0
  local axes=#sr1xs
  local none=false
  local ave={}
  -- determine if the train is fixed speed (i.e motor drive) or variable speed (i.e. turbine drives)
  local fixedspeed=fixed_speed()

  local lastmi,mis=0,0  
  for m,mia in ipairs (sr1xs) do
    if lastmi~=mia.mi then 
      mis=mis+1
      lastmi=mia.mi
      local temp={}
      for i=1,#mia.info do
        table.insert(temp,{sum=0,sumsqr=0,n=0,sfreqs={1},speed=0})
      end
      ave[mia.mi]=temp
    end 
  end
  -- preview preview sr1xs and calc ave speed and deviation
  local hasspeed=false  
  --remove outliers were sigma is greater than 1/3 of vspeed  on fixed speed machines and 50% of vspeed non-fixed speed machines (changed turbines to 5% because Mn Circs were having problem on pump.)
  local iter=0
  local spdvar=machine.vspeed/3
  if not (fixedspeed)  then spdvar=machine.vspeed/2 end
  spdvar=get_custom_parameter('OutlierTHLD') or spdvar
  repeat
    iter=iter+1
    local sum,sumsqr,n,avespd,sigma=0,0,0,0,0
    for m,mia in ipairs (sr1xs) do
      if mia.found then
        for i,info in ipairs(mia.info) do
          if info.dsi~=nil and i==1 then ranges=ranges+1 end
          if info.sfreq>0 then
            hasspeed=true 
            n=n+1
            sum=sum+info.sfreq/mia.shaftspeed
            sumsqr=sumsqr+((info.sfreq/mia.shaftspeed)^2)
          end
        end
      end 
    end
    local removed=false
    avespd=sum/n
    if n>2 then sigma=math.sqrt((sumsqr-(sum^2/n))/(n-1)) end  
    debugprint('ave speed: '..round(avespd*60,1),'sigma: '..round(sigma,2),'% dev: '..round(100*sigma/avespd,2)..' allowable % dev: '..spdvar) 
    if sigma/avespd*100>spdvar then -- if sigma > sprvar remove it
      -- first iteration remove biggest deveiation from machine.speed if the speed variation is large 4/9/19
      if iter<2 and sigma>.2 then avespd=machine.speed end 
      local maxmia, maxinfo,maxdif=0,0,0
      -- find the greatest outlier
      for m,mia in ipairs (sr1xs) do
        if mia.found then
          for i,info in ipairs(mia.info) do  
            if math.abs(info.sfreq/mia.shaftspeed-avespd)>maxdif and info.sfreq>0 then
              maxdif=math.abs(info.sfreq/mia.shaftspeed-avespd)
              maxinfo=i
              maxmia=m
            end
          end
        end
      end
      local info=sr1xs[maxmia].info[maxinfo]
      if maxdif/avespd*100>spdvar and info.sfreq>0 then
        debugprint('General Outlier Removing - mi: '..sr1xs[maxmia].mi..' axis: '..sr1xs[maxmia].axis..' range: '..maxinfo..' - '..round(info.sfreq/sr1xs[maxmia].shaftspeed,2) ..' hz '..round(info.sfreq*60/sr1xs[maxmia].shaftspeed,1)..' rpm %deviation: '..round(100*sigma/avespd))
        info.sfreq=-1
        info.sord=nil
        info.sbin=nil
        info.speed=nil
        removed=true
      end
    end
  until not(removed)  -- outliers removed
  -- calculate the average speed for each range at each pickup
  for m,mia in ipairs (sr1xs) do
    if mia.found then
      for i,info in ipairs(mia.info) do
        if info.sfreq>0 then
          ave[mia.mi][i].speed=info.speed
          ave[mia.mi][i].n=ave[mia.mi][i].n+1
          ave[mia.mi][i].sum=ave[mia.mi][i].sum+info.sfreq
          ave[mia.mi][i].sfreqs[ave[mia.mi][i].n]=info.sfreq
        end
      end
    end
  end
  local updated=false
  if hasspeed then
    local count=0
    local lasti=1
    local lastmi=0
    local n,total,machave=0,0,0
    for mi,m in pairs (ave) do
      for r,rng in ipairs (m) do
        if rng.n>0 then
          total=rng.sum
          n=rng.n
          total, n, sr1xs=check_pickup_speed(total,n,mi,sr1xs,r) -- removes outliers from average and sets all axes to the range average
          if n==0 then 
            rng.avefreq=0
            rng.n=0
          else
            rng.sum=total
            rng.n=n
          end
        end
      end
    end
    machave,n=0,0  -- calculate the average for the all available pickups
    for mi,m in pairs (ave) do
      for r,rng in ipairs (m) do
        if rng.sum~=0 then
          machave=machave+(rng.sum/rng.n)/rng.speed
          n=n+1
        end
      end
    end
    machave=machave/n

    for m,mia in ipairs(sr1xs) do
      local lastspeed=0
      local source={}
      for i,inf in ipairs (mia.info) do
        inf['speedsource']="-"
        if ave[mia.mi][i]==nil then
          ave[mia.mi][i]={sum=0,sumsqr=0,n=0,sfreqs={1},speed=0}
        end
        if ave[mia.mi][i].n==0 and lastspeed==0 then
          for i1,inf1 in ipairs (mia.info) do
            if i~=i1 and ave[mia.mi][i1].n~=0 then
              source.rangenum=i1
              lastspeed=ave[mia.mi][i1].sum/ave[mia.mi][i1].n
              break
            end
          end 
          if lastspeed==0 then
            inf.speedsource='machine average'
            mia.shaftrate=machave*mia.shaftspeed
            inf.sfreq=machave*mia.shaftspeed
            none=true
          else
            inf.speedsource='higher range'
            mia.shaftrate=lastspeed
            inf.sfreq=lastspeed
            none=true
          end
        elseif ave[mia.mi][i].n>0  then
          inf.speedsource='own average'
          mia.shaftrate=ave[mia.mi][i].sum/ave[mia.mi][i].n
          inf.sfreq=ave[mia.mi][i].sum/ave[mia.mi][i].n
          lastspeed=ave[mia.mi][i].sum/ave[mia.mi][i].n
          none=true
        elseif ave[mia.mi][i].n==0 and lastspeed~=0 then
          inf.speedsource='lower range'
          mia.shaftrate=lastspeed
          inf.sfreq=lastspeed
          none=true
        end
      end
    end
    for ei,e in ipairs(machine.elements) do -- build a table of dataset indexs associated to the range
      if e.data~=nil and e.data.spec~=nil and e.data.spec.cpl~=nil and e.data.spec.cpl.normal~=nil  then
        for ax,inf in pairs (e.data.spec.cpl.normal) do
          if string.len(ax)==1 then
            local i=ax..ei
            local dataranges={}
            dataranges[i]={}

            for _,ds in ipairs(e.data.spec.normal[ax]) do
              local drng={}
              if dataranges[i][tostring(machine.datasets[ds].fmax)]~=nil then
                drng=dataranges[i][tostring(machine.datasets[ds].fmax)]
              end
              table.insert(drng,ds)
              dataranges[i][tostring(machine.datasets[ds].fmax)]=drng
            end

            local miaspeed
            for i,mia in pairs(dataranges) do
              local ax=string.sub(i,1,1)
              local mi=tonumber(string.sub(i,2))
              miaspeed=0
              local dss={}
              for fm,dss in pairs(mia) do
                fm=tonumber(fm)
                for _,ds in ipairs(dss) do
                  updated=false
                  for _,sr1x in ipairs(sr1xs) do 
                    if sr1x.mi==mi and sr1x.axis==ax then
                      if sr1x.info[1]~=nil then
                        for _,inf in ipairs (sr1x.info) do
                          if inf.sfreq~=nil then
                            if inf.sfreq>0 then
                              miaspeed=inf.sfreq 
                            end
                          end
                          if inf.dsi==ds and miaspeed>0 then

                            debugprint('>Pickup: '..sr1x.mi..' Axis: '..sr1x.axis..' dsi: '..ds..' Fmax: '..round(fm)..' speed set to: '..round(miaspeed,3)..' hz '..round(miaspeed*60/sr1x.shaftspeed,2))
                            machine.datasets[ds].speed=miaspeed
                            add_dataset_speed_time_data(ei,ax,machine.datasets[ds].bw,miaspeed)
                            --add_1x_place_holders_to_ds_peaks (ds,i) 
                            updated=true
                          end
                        end
                      end
                      --end
                      if not (updated) and miaspeed>0 then
                        debugprint('Pickup: '..sr1x.mi..' Axis: '..sr1x.axis..' dsi: '..ds..' Fmax: '..round(fm)..' speed set to: '..round(miaspeed,3)..' hz '..round(miaspeed*60/sr1x.shaftspeed,2))
                        machine.datasets[ds].speed=miaspeed
                        add_dataset_speed_time_data(ei,ax,machine.datasets[ds].bw,miaspeed)
                        --add_1x_place_holders_to_ds_peaks (ds,i) 
                        updated=true
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
  return updated, sr1xs
end
--


-- This function puts an 'n' flag on the tones in the peak list that were used to normalize
local function flag_normalized_peaks_in_cpl(sr1xs)
  for ei,e in ipairs(machine.elements) do 
    if e.data~=nil and e.data.spec~=nil and e.data.spec.cpl~=nil then
      for typ,axes in pairs(e.data.spec.cpl) do
        if typ=='normal' then
          for ax, pl in pairs(axes) do
            for _,mia in ipairs(sr1xs) do
              if mia.mi==ei and ax==mia.axis then
                for _,i in pairs(mia.info) do
                  if i.sbin~=nil then
                    for _,pk in ipairs (pl.peaks) do
                      if i.sbin==pk.sbin then 
                        local flags=pk.flags
                        pk.flags=add_flag(flags,'n')
                        break
                      end
                    end
                  end
                end
              end 
            end
          end
        end
      end
    end
  end
  return 
end



-- normalize2
-- Input:
--    ss_data_groups - Data grouped by super shaft
--           Format: [ssi][ei][bw][OST]->data index 
--            where ssi = super shaft index, ei = machine element index, bw=data bin width, 
--                  OST=Data Time Stamp in OS format (a number)
--
-- Return:
--    No return value.
--
-- Error: 
-- Notes:
--    Update the speed associated with the data based on peak matching.
--
function normalize2( ss_data_groups,psl )
  local updated=false
  local sr1xs=pattern_normalize(psl)
  updated,_=update_dataset_speeds(sr1xs)--z_update_dataset_speeds(sr1xs,orders)  --  analysis peaklist harmonics for 1x, return false if current dataset speeds are within vspeed DAY
  if not(updated) then
    sr1xs=pattern_normalize(psl,nil,nil,true)
    updated,_=update_dataset_speeds(sr1xs)
  end
  assert(updated,"Data Normalization Failed") -- returns an error normalization when fails DY
  flag_normalized_peaks_in_cpl(sr1xs)
  return sr1xs
end
--
-- Harmonic Energy Normalization,  looks for harmonic series that are target speed or harmonics of target speed
function normalize3( ss_data_groups )

  local sr1xs=harm_energy_normalize()
  updated,_=update_dataset_speeds(sr1xs)--z_update_dataset_speeds(sr1xs,orders)  --  analysis peaklist harmonics for 1x, return false if current dataset speeds are within vspeed DAY
  assert(updated,"Data Normalization Failed") -- returns an error when normalization fails DY
  flag_normalized_peaks_in_cpl(sr1xs)
  return sr1xs
end
--[[
local function fixed_speed()
  local fixedspeed=false
  local guid=categories.MOTOR.mincat.AC
  for _,shaft in pairs(machine.shafts) do
    if shaft.cat2==guid then
      fixedspeed=true
      break 
    end 
    if string.match(shaft.name,'MOTIND')=='MOTIND' then -- remove hard coded section later
      fixedspeed=true
      break 
    end
  end
  if fixedspeed then 
    debugprint('                Fixed Speed Machine == Tight Range Normalization') 
  else
    debugprint('              Variable Speed Machine == Wider Range Normalization') 
  end
  return fixedspeed
end
]]
-- binary search for keys (sord or sfreq) in peaks of peaklist returns an index delta percent below target
local function find_nearest_peak_in_cpl(pl,target,delta,start,speedratio,key)
  start=start or 1
  key=key or 'sord'
  speedratio=speedratio or 1
  local low,hi,mid=start,#pl,0
  while low<=hi do
    mid=math.floor((low+hi)/2)
    local value=pl[mid][key]
    if key=='sord' then value=value/speedratio end
    if value<=target*(1-delta) then
      low=mid+1
    else
      hi=mid-1
    end
  end
  low=low-1
  if low==0 then low=1 end
  return low
end


function pattern_normalize(psl,range,percent_pattern_match,use2XLF)
  percent_pattern_match=percent_pattern_match or 30
  use2XLF=use2XLF or false
  local peak_quality=machine.scale  -- defines minimum mpct for use calculating speed (fans have short peaks and need smaller mpct)
  if peak_quality~=0 then 
    peak_quality=10^(peak_quality/20)
  else
    peak_quality=10^(10/20)
  end
  peak_quality=.3
  local sss = machine.supershafts
  local speeds = compute_super_shaft_speeds(sss, machine.ispeed, 1.0 )

  local fff = MakeForcingOrdersForSuperShafts(sss, true )
  local ff={}      
  for i,sp in ipairs(fff) do
    for _,en in ipairs(sp) do
      if speeds[i] ~= nil then
        table.insert(ff,{speed=speeds[i],order=en.order,tag=en.tag})
      end
    end
  end
  if #ff==0 then
    for i,sp in ipairs (speeds) do 
      table.insert(ff,{speed=sp,order=1,tag='1X'})
    end
  end
  -- remove duplicate speeds
  if #speeds>1 then
    local spds={}
    for _,sp in ipairs(speeds) do
      spds[sp]=true
    end
    speeds={}
    for sp,_ in pairs(spds) do
      table.insert(speeds,sp)
    end  
  end
  table.sort(speeds,function (a,b) return a<b end)  
  local patincludes2XLF=false  -- 2/24/2020 DY
  if #ff>=1 then 
    for _,f in ipairs(ff) do
       if math.abs(f.order*f.speed*machine.speed-machine.linef*2)/(machine.linef*2)*100 < 2 then patincludes2XLF=true end --2/2/2020 DY
      debugprint('order='..f.order..', speed='..f.speed..',  hz='..f.order*f.speed*machine.speed..', tag='..f.tag)
    end
  end
  --
  -- determine if the train is fixed speed (i.e ac motor drive) or variable speed (i.e. turbine drives)
  --
  local fixedspeed,mtrci=fixed_speed()
  local close=.002
  local highhz,lowhz
  local speedissync=is_a_multiple(machine.speed,machine.linef,close) 
  local searchrange= range or machine.vspeed/100*2
  local normalize={range=searchrange,pattern_match=percent_pattern_match,use_2XLF=use2XLF}
  local freq1x=0
  local sr1xs={}
  local sr1x={}
  local mtrpoles=2
  local polesbyspd=0
  if fixedspeed then
    for _,ei in ipairs(machine.components[mtrci].map) do
      if machine.elements[ei]~=nil and machine.elements[ei].forders~={} and machine.elements[ei].forders.MOTPOLES~=nil and machine.elements[ei].forders.MOTPOLES.order~=nil then
       mtrpoles=machine.elements[ei].forders.MOTPOLES.order
        --break
      elseif machine.elements[ei]~=nil and machine.elements[ei].speedratio~=nil  then
        polesbyspd=math.floor(machine.linef/(machine.speed*machine.elements[ei].speedratio))*2 
        --break
      end
    end
  end 
  if mtrpoles~=polesbyspd then  mtrpoles=polesbyspd end
  --
  debugprint()

  -- Drill into peaklist
  local mi,axis
  for ei,e in ipairs(machine.elements) do
    mi=ei
    if e~=nil and e.data~=nil and e.data.spec~=nil and e.data.spec.cpl~=nil and e.data.spec.cpl.normal~=nil  then 
      local mspeed=machine.speed*e.speedratio
      if (fixedspeed  and machine.vspeed<4) then -- limit speed range on AC motors driven machines to 1% above syncronous
        lowhz=mspeed*(1-searchrange)
        highhz=((machine.linef*1.01/(mtrpoles/2))/g_comp_speed_ratio[mtrci])* e.speedratio -- fixed the calc for 101% sycronous speed of element DY - 8/14/19 
        if highhz>mspeed*(1+searchrange) or highhz<lowhz then highhz=mspeed*(1+searchrange) end
      else -- if the train is not fixed speed then open up the search range
        use2XLF=true
        lowhz=mspeed*(1-2*searchrange)
        highhz=mspeed*(1+2*searchrange)
      end

      for ax,inf in pairs (e.data.spec.cpl.normal) do
        if string.len(ax)>1 and ax~='ave' then -- find the xnorm peak lists with duplicate tones from both ranges
          axis=string.sub(ax,1,1)
          debugprint('Normalizing to machine speed '..round(lowhz*60,1)..' - '..round(highhz*60,1) .. ' rpm, '..round(lowhz,1)..' - '..round(highhz,1)..' Hz  shaft speed: '..round(mspeed*60,1)..' +/-'..machine.vspeed..'%')
          sr1x={}  
          freq1x=0
          local index
          local speedfound=false
          -- Deterimine if there are enough forcing orders to pattern match by building a table of orders to match
          local pattern={}
          local ptrn={}
          if #ff>=1 then 
            -- build pattern table
            for _,f in ipairs(ff) do
              local ord=f.speed/e.speedratio*f.order 
              ptrn[tostring(ord)]=true
            end
            for ord,_ in pairs(ptrn) do
              table.insert(pattern,tonumber(ord))
            end
            -- sort the pattern table
            table.sort(pattern,function (a,b) return a<b end)
            -- get the data ranges
            local dataranges={}
            for _,ds in ipairs(e.data.spec.normal[string.sub( ax,1,1)]) do
              table.insert(dataranges,{dsi=ds,orders=machine.datasets[ds].fmax/(mspeed),fmax=machine.datasets[ds].fmax})  -- set the dataset max orders based on  machineclass nominal speed
            end

            -- sort the data ranges
            local moved=true
            local temp={}
            while moved do
              moved=false
              for i,j in ipairs(dataranges) do
                if i~=nil and dataranges[i+1]~=nil then
                  if j.fmax>dataranges[i+1].fmax then
                    temp=dataranges[i]
                    dataranges[i]=dataranges[i+1]
                    dataranges[i+1]=temp
                    moved=true
                  end
                end
              end
            end
            local maxte=0
            local maxct=0
            local sord,mt,spd=0,0,0
            local minamp,maxamp=0,0
            for j,pk in ipairs(inf.peaks) do
              if j>1 then
                if minamp>=pk.sval then
                  minamp=pk.sval
                end
                if maxamp<=pk.sval then
                  maxamp=pk.sval
                end
              else
                minamp=pk.sval
              end
            end
            local dynamicrange=maxamp-minamp
            local pat={}
            --
            -- This section of code examines each peak in the peak list to determine if it is a harmonic of any shaft in the train that has the best pattern match
            --
            local lastorders=0
            local lastspeed=0
            local sbin=0

            for d,dr in ipairs(dataranges) do
              maxte=0
              maxct=0
              --  determine the part of the pattern that can be used for each dataset
              pat={}
              local lowlimit=.01 
              for _,p in ipairs(pattern) do
                lowlimit=.01
                if #pattern==1 and d==1 then lowlimit=0 end
                if d>1 then lowlimit=dataranges[d-1].orders*.99/dr.orders end
                if p>lowlimit*dr.orders and p<dr.orders*.99 then
                  table.insert(pat,p)
                end
              end
              local patmax=10000000
              if d>1 and #pat~=0 then
                patmax=0
                pat={}
                if dr.orders/dataranges[d-1].orders <= 14 then
                  lowlimit=dataranges[d-1].orders*.4
                else 
                  lowlimit=dr.orders*.04
                end
                for _,p in ipairs(pattern) do

                  if p>lowlimit and p<dr.orders*.99 then
                    table.insert(pat,p)
                    patmax=math.max(p,patmax)
                  end
                end
              end
              if #pat>1 and (patmax>0 and patmax<dr.orders*.15) then pat={} end
              if #pat==0 then
                debugprint ("No pattern to match for "..round(dr.orders)..'x range.')
                table.insert (sr1x,{sfreq=-1,dsi=dr.dsi})
              else
                for _,p in ipairs(pat) do
                  debugprint(p)
                end
                spd=0
                maxte=0
                maxct=0
                freq1x=0
                -- build a subset of peaks that are from the same dataset
                local peaks={}
                for p,pk in ipairs (inf.peaks) do
                  if pk.sdsi==dr.dsi then table.insert (peaks,pk) end
                end
                -- check each peak in the dataset to see if it is part of the forcing order pattern or a harmonic of one
                local mtchs={}
                for p,pk1 in ipairs (peaks) do                    -- subject peaks
                  if pk1.sfreq>dr.fmax then break end  -- peak beyond data range
                  if pk1.sfreq/mspeed>=lastorders and pk1.sfreq<=dr.fmax then  -- peak in data range
                    for f,fo in ipairs (pat) do   -- forcing orders from the pattern                   -- 
                      for  i=1,10,1 do -- harmonic of interest
                        if pk1.sfreq>4960 and pk1.sfreq<4970 and i==3 and fo==33 then
                          local _
                          end
                        -- is the subject peak freq/pattern forcing order/harmonic# in the search range of machine 1x for this dataset
                        if pk1.sfreq/fo/i>lowhz and pk1.sfreq/fo/i<highhz then 
                          local te=0 -- total energy of the pattern
                          local ct=0 -- total count of pattern matches
                          -- Are there pattern matches for the 1x from this peak
                          for _,pt in ipairs (pat) do -- pt is the forcing orders to normalize on
                            local _,_,pk2=peaksearch(psl,ei,'normal',ax,pk1.sfreq/fo/i*pt,'sfreq',close,pk1.sdsi)
                            if pk2~=nil and pk2~={} then -- is there a peak at the calculated frequency 
                              local pk2is2XLFmult=is_a_multiple(2*machine.linef,pk2.sfreq,.005)
                              -- is subject peak prominant and is this peak slighty significant and above the noise floor
                              if  pk1.mpct>peak_quality and (pk2.mpct>.1 and pk2.sval>minamp+6) and (speedissync or patincludes2XLF or (not(speedissync) and (not(pk2is2XLFmult) or use2XLF ))) then  --2/24/2020 DY
                                ct=ct+1
                                table.insert(mtchs,{pk1=round(pk1.sfreq,2),pk2=round(pk2.sfreq,2),pt=round(pt,4),sr1x=round((pk1.sfreq/mspeed/fo)/i,2),h=i})
                                local pe=(pk2.sval*pk2.mpct)*pk1.mpct*i*fo*f*i   --  quality weighted peak energy
                  
                                if (pt==1 and #pat<=3) or (pk2.pk_index==p) then -- added 'and #pat<3' to remove weighting on complex drivetrains 
                                  te=te+ pe*2-- add a slight weighting to 1x or exact peak match in pattern for cases were the higher orders have tight side bands 
                                else
                                  te=te+ pe
                                end
                                goto nextptrn
                              end  -- is peak an acceptable match
                            end -- is peak in range
                            :: nextptrn ::
                          end  -- pattern
                          if ((te*ct>=maxte and ct>=maxct) or (te>2*maxte and maxct~=#pat))  and ct~=0 then 
                            local ffwgt=1
                            local tagmatch=''
                            mt=i
                            spd=fo
                            index=p
                            sord=(pk1.sfreq/mspeed/fo)/i
                            freq1x=(pk1.sfreq/fo)/i
                            sbin=pk1.sbin
                            maxte=te*ct
                            maxct=ct
                            debugprint(">>> pk: "..p..'  '..i..' x '..round((fo),3)..' tone freq: '..round(pk1.sfreq,1)..' ord: '.. round ((pk1.sfreq/fo)/i,3)..' rpm: '..round (freq1x*60,1)..' mxte: '..round(maxte,4)..' ct: '..ct..' '..maxct..' mpct:'..round(pk1.mpct,3)..' fo sft rpm: '..round ((pk1.sfreq/fo)/i*60/e.speedratio,1),tagmatch )
                            for i,j in ipairs(mtchs) do
                              debugprint(i,'sr1x: '..j.sr1x..' pt: '..j.pt,' pk1: '..j.pk1..'/'..j.h,' pk2: '..j.pk2)
                            end
                          end  -- how many matches
                          mtchs={}
                        end  -- is calculated 1x in searchranges
                      end -- harmonic of interest
                      --end -- speed is big enough percentage of the range
                    end-- speeds of each shaft
                  end -- is pk1 in dataset range
                end-- subject peaks
                --
                --  is there a pattern match
                --
                if freq1x>0 and maxct>0 and (#pat<=3 or (#pat>3 and maxct>=math.ceil (#pat*(percent_pattern_match/100)))) then
                  table.insert (sr1x,{sfreq=freq1x,pk_index=index,sord=sord,speed=e.speedratio,dsi=dr.dsi,sbin=sbin})
                  debugprint('mi: '..ei..' axis: '..axis..' order: '..round(sord,2)..'x at '..round(freq1x,1)..'hz from '..round(freq1x*mt*spd,2)..'/('..mt..'*'..round(spd--[[*e.speedratio]],3)..')  '..maxct..'/'..#pat.." FO pattern "..' RPM '..round(freq1x*60,1),round(dr.orders)..'x range',round(freq1x*60/e.speedratio,1), mt)
                  lastspeed=freq1x
                  speedfound=true
                else
                  table.insert (sr1x,{sfreq=-1,dsi=dr.dsi})
                  debugprint ("No pattern match for "..round(dr.orders)..'x range, mi: '..ei..' axis: '..axis)
                end  -- is the pattern 
              end  -- #pat>0
              lastorders=dr.orders/5
            end-- data ranges
            goto nxtinf
            if speedfound then goto nxtinf end
          else
            speedfound=false
          end
          if mi==nil or axis==nil then
            debugprint('No speed match found')
          else
            debugprint('No speed match found for '..mi..' - '..axis)
          end
          table.insert (sr1x,{speed=e.speedratio})
--
          ::nxtinf::
          --
          if ei==1 then
            table.insert(sr1xs,{found=speedfound,mi=mi,axis=axis,info=sr1x,shaftspeed=e.speedratio,normalize=normalize})
          else
            table.insert(sr1xs,{found=speedfound,mi=mi,axis=axis,info=sr1x,shaftspeed=e.speedratio})
          end
          local stop
        end --for m,inf
      end
    end
  end  
  return sr1xs

end-- function
--
function harm_energy_normalize()

  -- Harmonic energy normalization for item with only 1 item in the pattern, 1x
  -- Finds the tone in the peak list in the search range with the most highest harmonic energy
  -- on the assumtion that the shaftrate series will have the highest harmonic energy
  --
  local sss = machine.supershafts
  local speeds = compute_super_shaft_speeds(sss, machine.ispeed, 1.0 )

  local fff = MakeForcingOrdersForSuperShafts(sss, true )
  local ff={}      
  for i,sp in ipairs(fff) do
    for _,en in ipairs(sp) do
      if speeds[i] ~= nil then
        table.insert(ff,{speed=speeds[i],order=en.order,tag=en.tag})
      end
    end
  end
  -- remove duplicate speeds
  if #speeds>1 then
    local spds={}
    for _,sp in ipairs(speeds) do
      spds[sp]=true
    end
    speeds={}
    for sp,_ in pairs(spds) do
      table.insert(speeds,sp)
    end  
  end
  table.sort(speeds,function (a,b) return a<b end)
  --
  -- determine if the train is fixed speed (i.e ac motor drive) or variable speed (i.e. turbine drives)
  --
  local fixedspeed=fixed_speed()
  local close=.0025
  local speedissync=is_a_multiple(machine.speed,machine.linef,close) 
  local searchrange= range or machine.vspeed/100*2
  local normalize={range=range,pattern_match=percent_pattern_match,use_2XLF=use2XLF}
  if not(fixedspeed) then  -- if the train is not fixed speed then open up the search range
    close=.002
    searchrange=2*searchrange
  end
  local freq1x=0
  local sr1xs={}
  local sr1x={}
  --
  debugprint()

  -- Drill into peaklist
  local mi,axis
  for ei,e in ipairs(machine.elements) do
    mi=ei
    if e~=nil and e.data~=nil and e.data.spec~=nil and e.data.spec.cpl~=nil and e.data.spec.cpl.normal~=nil  then 
      local mspeed=machine.speed*e.speedratio
      for ax,mia in pairs (e.data.spec.cpl.normal) do
        if string.len(ax)>1 and ax~='ave' then -- work on _norm
          axis=string.sub(ax,1,1)
          debugprint('Normalizing to machine speed '..round((machine.speed*(1-machine.vspeed/100))*60,1)..' - '..round((machine.speed*(1+machine.vspeed/100))*60,1) .. ' rpm, '..round((machine.speed*(1-machine.vspeed/100)),1)..' - '..round((machine.speed*(1+machine.vspeed/100)),1)..' Hz     shaft speed: '..round(machine.speed*e.speedratio*60,1))
          sr1x={}  
          freq1x=0

          local speedfound=false

          local orders={}
          --
          -- Build an info list for peaks in harmonic energy sort from peak list
          --
          if mia.sorts.harm_energy=={} then
            table.insert(orders,{pk_index=nil,  sord=nil, sfreq=nil,harms=nil, mi=mi,axis=axis,speed=e.speedratio})
          else
            for h,he in ipairs(mia.sorts.harm_energy) do
              local harms={}
              local f1x=mia.peaks[he].sfreq
              local ord=f1x/(machine.speed*e.speedratio)
              for p,pi in ipairs(mia.peaks[he].harm_pk_index) do
                table.insert (harms,{order=round(mia.peaks[tonumber(pi)].sfreq/f1x),sfreg=mia.peaks[tonumber(pi)].sfreq,pk_index=pi})
              end
              table.insert(orders,{pk_index=he,  sord=ord, harms=harms ,sfreq=mia.peaks[he].sfreq, mi=mi,axis=axis,speed=e.speedratio})
            end
          end
          local matches={}
          local ratios={}
          -- look for the first match within vspeed% of faster speed shafts then slower speed shaft 
          for i,he in ipairs(orders) do
            speedfound=false
            mi=he.mi or 'No mi'
            axis=he.axis or 'No axis'
            if he.sord~=nil then
              if #speeds>1 then
                -- multishaft machine
                for j,sp in ipairs(speeds) do
                  local ratio=(sp/e.speedratio)
                  for m=1,3 do  -- m is used to look for high order harmonic series of shaft speed
                    -- check for match to secondary speed shaft 
                    local itis,mult,rmdr=z_is_a_multiple(ratio,he.sord,searchrange) 
                    if itis and mult==m then
                      local spd=ratio*e.speedratio
                      table.insert(matches,{freq=he.sfreq/(ratio*m),ratio=ratio,m=m,sord=he.sord/(ratio*m),speed=he.speed,pk_index=he.pk_index})
                      ratios[ratio]=true
                    end
                  end --for m=1,3
                end -- for j,sp
              else -- if #speed
                -- single shaft machine
                for m=1,3 do-- m is used to look for high order harmonic series of shaft speed
                  -- primary shaft 
                  local itis,mult,rmdr=z_is_a_multiple(1,he.sord,searchrange) 
                  if itis and mult==m then
                    table.insert (sr1x,{sfreq=he.sfreq/m,mi=he.mi,axis=he.axis,pk_index=he.pk_index,sord=he.sord/m,speed=he.speed})
                    debugprint('order: '..round(he.sord/m,3)..'x at '..round(he.sfreq/m,2)..'hz from '..round(he.sfreq,3).." primary shaft "..round(he.sfreq/m,3)..' RPM: '..round(he.sfreq/m*60,2), m)
                    speedfound=true
                    goto nxtmia
                  end
                end --for m=1,3
              end -- if #speeds>1
            end --if he.sord~=nil
          end --for i,he
          if #speeds>1 then
            for i,m1 in ipairs(matches) do
              if #matches==1 or #ratios==1 then
                table.insert (sr1x,{sfreq=m1.freq,mi=mia.mi,axis=mia.axis,pk_index=m1.pk_index,sord=m1.sord,speed=m1.speed})
                debugprint('order: '..round (m1.sord,3)..'x at '..round(m1.freq,2)..'hz from '..round(m1.freq*m1.ratio,3).." single shaft match "..round(m1.freq/m1.m,3)..' RPM: '..round(m1.freq*60,2),m1.ratio)
                speedfound=true
                goto nxtmia
              end
              for j,m2 in ipairs(matches) do
                if i~=j then
                  local itis,mult,rmdr=z_is_a_multiple(m1.freq,m2.freq,.011) 
                  if itis and mult==1 then--and m1.ratio~=m2.ratio then
                    table.insert (sr1x,{sfreq=(m1.freq+m2.freq)/2,pk_index=m1.pk_index,sord=m1.sord,speed=m1.speed,dsi=m1.sdsi})
                    debugprint('order: '..round(m1.sord,3)..'x at '..round((m1.freq+m2.freq)/2,2)..'hz from '..round((m1.freq+m2.freq)/2*m1.ratio,3).." multiple shafts "..round(((m1.freq+m2.freq)/2)/m1.m,3)..' RPM: '..round((m1.freq+m2.freq)/2*60,2),m1.ratio,m2.ratio)
                    speedfound=true
                    goto nxtmia
                  end
                end --if i~=J 
              end --for i,m2
            end --for i,m1
          end --if #speed>1
          speedfound=false

          if mi==nil or axis==nil then
            debugprint('No speed match found')
          else
            debugprint('No speed match found for '..mi..' - '..axis)
          end
          table.insert (sr1x,{speed=e.speedratio})

          ::nxtmia::
          debugprint()
          table.insert(sr1xs,{found=speedfound,mi=mi,axis=axis,info=sr1x,shaftspeed=e.speedratio})
        end -- is it '_norm' peaks
      end --axis
    end  -- is there data
  end  -- elements
  return sr1xs,orders
end  -- function
