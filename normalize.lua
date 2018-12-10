-- normalize.lua    Rev 10     12/7/18

-- returns true if an AC motor in in the train
function fixed_speed()
  local fixedspeed=false
  local guid=categories.MOTOR.mincat.AC
  for _,shaft in pairs(machine.shafts) do
    if shaft.cat2==guid then
      fixedspeed=true
      break 
    end 
    --if string.match(shaft.name,'MOTIND')=='MOTIND' then -- remove hard coded section later
    --fixedspeed=true
    --break 
    --end
  end
  if fixedspeed then 
    debugprint('                Fixed Speed Machine == Tight Range Normalization') 
  else
    debugprint('              Variable Speed Machine == Wider Range Normalization') 
  end
  return fixedspeed
end

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
    -- NOTE: The search range widens as the order goes up.  If the machine 1x varies by %2
    --       then the 2x will vary by %4, etc.
    local rng = machine.vspeed * obin / 100
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
  repeat
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
    --remove outliers were sigma is greater than .5%  on fixed speed machines and 5% on non-fixed speed machines (changed turbines to 5% because Mn Circs were having problem on pump.)
    local removed=false
    local spdvar=.005
    if not (fixedspeed)  then spdvar=.05 end 
    avespd=sum/n
    if n>2 then sigma=math.sqrt((sumsqr-(sum^2/n))/(n-1)) end  
    debugprint('ave speed: '..round(avespd,1),'sigma: '..round(sigma,2),'% dev: '..round(100*sigma/avespd,2)..' allowable % dev: '..spdvar*100) 
    if sigma/avespd>spdvar  then
      if sigma/avespd>spdvar then -- if sigma > sprvar remove it
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
        if math.abs(maxdif-avespd)>sigma and info.sfreq>0 then
          debugprint('Removing Outlier - mi: '..sr1xs[maxmia].mi..' axis: '..sr1xs[maxmia].axis..' range: '..maxinfo..' - '..round(info.sfreq/sr1xs[maxmia].shaftspeed,2) ..' hz '..round(info.sfreq*60/sr1xs[maxmia].shaftspeed,1)..' rpm %deviation: '..round(100*sigma/avespd))
          info.sfreq=-1
          info.sord=nil
          info.sbin=nil
          info.speed=nil
          removed=true
        end
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
                          --add_1x_place_holders_to_ds_peaks (ds,i) 
                          updated=true
                        end
                      end
                    end
                    --end
                    if not (updated) and miaspeed>0 then
                      debugprint('Pickup: '..sr1x.mi..' Axis: '..sr1x.axis..' dsi: '..ds..' Fmax: '..round(fm)..' speed set to: '..round(miaspeed,3)..' hz '..round(miaspeed*60/sr1x.shaftspeed,2))
                      machine.datasets[ds].speed=miaspeed
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
  return updated, sr1xs
end

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
function normalize2( ss_data_groups )
  local updated=false
  -- g_peak_list=reduced_peak_list()  -- Build a minimized peak list DAY
  local sr1xs=pattern_normalize()--z_analyze_PL_harmonics_for_1x()
  updated,_=update_dataset_speeds(sr1xs)--z_update_dataset_speeds(sr1xs,orders)  --  analysis peaklist harmonics for 1x, return false if current dataset speeds are within vspeed DAY

  assert(updated,"Data Normalization Failed") -- returns an error normalizezation fails DY
  flag_normalized_peaks_in_cpl(sr1xs)
  --if not updated then normalize1( ss_data_groups ) end
  return sr1xs
end


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


function pattern_normalize(range)
  local percent_pattern_match=30
  local peak_quality=machine.scale  -- defines minimum mpct for use calculating speed (fans have short peaks and need smaller mpct)
  if peak_quality~=0 then 
    peak_quality=10^(peak_quality/20)
  else
    peak_quality=10^(10/20)
  end

  local sss = machine.supershafts
  local speeds = compute_super_shaft_speeds(sss, machine.ispeed, 1.0 )
  local fff = MakeForcingOrdersForSuperShafts(sss, true )
  local ff={}      
  for i,sp in ipairs(fff) do
    for _,en in ipairs(sp) do
      -- if en.tag ~= '1X' then
      table.insert(ff,{speed=speeds[i],order=en.order,tag=en.tag})
      --end
    end
  end
  if #ff==0 then
    for i,sp in ipairs (speeds) do 
      table.insert(ff,{speed=sp,order=1,tag='1X'})
    end
  end
  --
  -- determine if the train is fixed speed (i.e ac motor drive) or variable speed (i.e. turbine drives)
  --
  local fixedspeed=fixed_speed()
  local close=.002
  local searchrange= range or machine.vspeed/100*2
  if not(fixedspeed) then  -- if the train is not fixed speed then open up the search range
    close=.005
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
    if e.data~=nil and e.data.spec~=nil and e.data.spec.cpl~=nil and e.data.spec.cpl.normal~=nil  then
      for ax,inf in pairs (e.data.spec.cpl.normal) do
        axis=ax
        debugprint('Normalizing to machine speed '..round(machine.speed*60,1)..' +/-'..round(machine.speed*60*machine.vspeed/100,2) .. ' rpm     shaft speed: '..round(machine.speed*e.speedratio*60,1))
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
          table.sort(pattern,function (a,b) return a<b end)

          -- get the data ranges
          local dataranges={}
          for _,ds in ipairs(e.data.spec.normal[ax]) do
            table.insert(dataranges,{dsi=ds,orders=machine.datasets[ds].fmax/(machine.speed*e.speedratio)})  -- set the dataset max orders based on  machineclass nominal speed
          end

          -- sort the data ranges
          local moved=true
          local temp={}
          while moved do
            moved=false
            for i,j in ipairs(dataranges) do
              if dataranges[i+1]~=nil then
                if j.orders>dataranges[i+1].orders then
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
            for _,p in ipairs(pattern) do
              local lowlimit=.05 
              if #pattern==1 and d==1 then lowlimit=0 end
              if d>1 then lowlimit=dataranges[d-1].orders*1.02/dr.orders end
              if p>lowlimit*dr.orders and p<dr.orders*.98 then
                table.insert(pat,p)
              end
            end
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
              for p,pk1 in ipairs (inf.peaks) do                    -- subject peaks
                if pk1.sord>dr.orders then break end 
                if pk1.sord>=lastorders and pk1.sord<=dr.orders then
                  for s,sp in ipairs (speeds) do                    -- speeds of each shaft
                    if (dr.orders/(sp/e.speedratio) < 300 and sp~=1) or sp==1 then
                      local harms=dr.orders/sp*.98
                      --if sp/e.speedratio<.25 then harms=15 end
                      for  i=1,harms,1 do -- harmonic of interest
                        --
                        -- is subject peak 1x (peak freq/shaft speed/harmonic) in the search range of machine 1x and the same dataset
                        --
                        if (pk1.sfreq/(sp/e.speedratio))/i>machine.speed*e.speedratio*(1-searchrange) and (pk1.sfreq/(sp/e.speedratio))/i<machine.speed*e.speedratio*(1+searchrange) and pk1.sdsi==dr.dsi  then 
                          local te=0
                          local ct=0
                          for _,pt in ipairs (pat) do -- orders to normalize on
                            for j,pk2 in ipairs (inf.peaks) do 
                              if pk2.sdsi==dr.dsi then
                                if pk2.sord>=lastorders and pk2.sord<=dr.orders then
                                  if pk2.sord*.99>(pk1.sord/(sp/e.speedratio))/i*pt then break end
                                  --
                                  -- is this peak a multiple of the subject peak 1x * pattern order
                                  --
                                  local itismult,mult,rmdr=z_is_a_multiple((pk1.sord/(sp/e.speedratio))/i*pt,pk2.sord,close) 
                                  --
                                  -- is subject peak prominant and is this peak slighty significant and not the noise floor
                                  --
                                  if itismult and mult==1 and pk1.mpct>peak_quality and (pk2.mpct>.2 and pk2.sval>minamp+(.05*dynamicrange)) then
                                    --
                                    -- add a slight weighting to 1x in pattern for cases were the higher orders have tight side bands 
                                    --
                                    if pt==1 and #pat<=3 then -- added 'and #pat<3' to remove weighting on complex drivetrains 
                                      te=te+ pk2.sval*3.5
                                    else
                                      te=te+ pk2.sval*2
                                    end
                                    ct=ct+1
                                  end
                                end
                              end
                            end  
                          end
                          if te*ct>=maxte and ct>=maxct and ct~=0  and sp/e.speedratio>=spd then
                            mt=i
                            spd=(sp/e.speedratio)
                            index=p
                            sord=(pk1.sord/(sp/e.speedratio))/i
                            freq1x=(pk1.sfreq/(sp/e.speedratio))/i
                            sbin=pk1.sbin
                            maxte=te*ct
                            maxct=ct
                            debugprint(">>>",p,i,round((sp/e.speedratio)*e.speedratio,3),round(pk1.sfreq,1),round ((pk1.sfreq/(sp/e.speedratio))/i,1),round ((pk1.sfreq/(sp/e.speedratio))/i*60,1),round(te),ct,'mpct:'..round(pk1.mpct),round ((pk1.sfreq/(sp/e.speedratio))/i*60/e.speedratio,1), maxct)
                          end  -- how many matches
                        end  -- is calculated 1x in searchranges
                      end -- harmonic of interest
                    end -- speed is big enough percentage of the range
                  end-- speeds of each shaft
                end -- is pk1 in dataset range
              end-- subject peaks
              --
              --  is there a pattern match
              --
              if freq1x>0 and maxct>0 and (#pat<=3 or (#pat>3 and maxct>=math.ceil (#pat*(percent_pattern_match/100)))) then
                table.insert (sr1x,{sfreq=freq1x,pk_index=index,sord=sord,speed=e.speedratio,dsi=dr.dsi,sbin=sbin})
                debugprint('mi: '..ei..' axis: '..axis..' order: '..round(sord,2)..'x at '..round(freq1x,1)..'hz from '..round(freq1x*mt*spd,2)..'/('..mt..'*'..round(spd*e.speedratio,3)..')  '..maxct..'/'..#pat.." FO pattern "..' RPM '..round(freq1x*60,1),round(dr.orders)..'x range',round(freq1x*60/e.speedratio,1), mt)
                lastspeed=freq1x
                speedfound=true
              else
                table.insert (sr1x,{sfreq=-1,dsi=dr.dsi})
                debugprint ("No pattern match for "..round(dr.orders)..'x range.')
              end  -- is the pattern 
            end  -- #pat>0
            lastorders=dr.orders
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
        table.insert(sr1xs,{found=speedfound,mi=mi,axis=axis,info=sr1x,shaftspeed=e.speedratio})
        local stop
      end --for m,inf
    end
  end  
  return sr1xs

end-- function