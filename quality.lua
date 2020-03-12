-- quality.lua    Rev 9 1/20/2020
-- rev 8 - added wrong speed check for multi speed motors searching for nominal speed with vspeed
-- rev 9 - fixed wrong speed to used normalized speed for normal speed and nominal speed for other speed
--
-- data_quality_fault_guids hold guids for quality faults that are pushed into outside of the rulebase.
local data_quality_fault_guids={
  ['data ranges']='b064a670-ef2e-4226-93fb-6d2dee66c570',
  ['crest factor']='9674b678-418a-4d3c-ac24-a548bbce7cff',
  ['high noise floor']='26477670-693a-4e5b-a17d-27eb1747ddc0',
  ['low noise floor']='ee3a6ea3-605e-4d09-9b07-80ddcfb480f1',
  ['no averages']='5ab56015-9bc5-4411-b608-a3da1fe82c14',
  ['no peaks']='4ba28d08-5839-4821-8e9e-b2cebd11a571',
  ['speed out of range']='dd71dc8c-7dfe-49a7-9c9c-59dc560c285c',
  ['speed change between pickups']='9fdf1b1a-dbaf-4078-9b5f-e1220ce1559a',
  ['speed change on pickup']='5ba9638c-72f2-4c20-ada0-299eeee6faa5',
  ['missing waveforms']='7a6e5c29-d253-4961-bf50-7040e30c0b0f',
  ['missing demod']='0a41634d-34ff-4385-8d14-e8f96754ec84',
  ['missing 1x']='ca0a76af-7c5a-4b25-9a9f-078027ad6810',
  ['higher range norm']='f067f248-ecb4-4b60-ae93-bb0a0917bb5e',
  ['2xlf normalize']='8b4fe728-ae8f-4a7d-95cf-97eef2224650',
  ['swapped pickups']='9b1c43c8-3251-4603-a2b0-3b185d368c84',
  ['duplicate data']='e20f8da1-d8f7-4153-99fa-f1482b7d80b9',
  ['wrong speed']='39db3e8e-df44-4331-b61d-af3f9c3a81da'}

local function data_quality_assert2(fault, severity, confidence)
  local f = assert( machine.quality_faults )
  f[fault]={["severity"]=severity,["conf"]=confidence}
end

local function data_quality_assert1(fault)
  data_quality_assert2(fault,1,1)
end
local function ds_avg_data_order_to_bin( order, ds )
  return (order / ds.bw) + 1
end

local function ds_data_order_to_bin( order, ds )
  return (order * ds.speed / ds.bw) + 1
end

local function ds_avg_data_max_order( ds )
  return ds.order
end

local function ds_data_max_order( ds )
  return ds.fmax / ds.speed
end

local function ds_value( ds, bin, unit )
  return ConvertSpectrum( g_internal_unit, unit, ds_spline_value(ds,bin) )
end

-- This function should be used with the conversion utility to work properly.
local function ds_avg_noise( ds, from_bin, to_bin, unit )
  assert( to_bin>=from_bin, "from_bin must be greater than or equal to to_bin." )
  local range_bin = to_bin - from_bin
  local bin_step = 0.5
  if bin_step > (range_bin / 10) then
    bin_step = range_bin / 10
  end
  local avg = 0
  local n = 0
  if bin_step==0 then 
    avg = ds_spline_avg( ds, from_bin )
  else
    for bin=from_bin,to_bin,bin_step do
      n = n + 1
      local a = 1.0 / n
      local b = 1 - a
      avg = (a * ds_spline_avg( ds, bin )) + (b * avg)
    end
  end

  return ConvertSpectrum( g_internal_unit, unit, avg )
end

function pickup_pairs( elements )
  local key = nil
  local ele = nil
  return 
  function()
    key,ele = next(elements,key)
    if key==nil then return end
    while (ele.data==nil or (ele.data.spec==nil and ele.data.time==nil)) do
      key,ele = next(elements,key)
      if key==nil then return end
    end
    return key,ele.data
  end
end

-- ["bw"]=1.250000E+000
-- ["sid"]=2.500000E+001
-- ["fmax"]=1.125000E+003
-- ["speed"]=3.000000E+001
-- local function make_avg_helper_struct()
--   return { max_order=compute_avg_data_max_order, order=compute_avg_data_order, bin=compute_avg_data_bin}
-- end
-- local function make_data_helper_struct()
--   return {max_order=compute_data_max_order, order=compute_data_order, bin=compute_data_bin}
-- end

local function ds_avg_noise_by_order( start, stop, tdsi )
  local os = start
  local oe = os + stop
  local function bw_sort( idx1, idx2 )
    return machine.datasets[idx1].bw < machine.datasets[idx2].bw
  end
  table.sort( tdsi, bw_sort )
  local ds = machine.datasets[tdsi[1]]
  local spec_type = ds.typ
  local make_bin
  local max_order
  if spec_type=='average' then
    make_bin = ds_avg_data_order_to_bin
    max_order = ds_avg_data_max_order
  elseif spec_type=='normal' then
    make_bin = ds_data_order_to_bin
    max_order = ds_data_max_order
  else
    assert('Unknown data type')
  end

  for _,dsi in ipairs(tdsi) do
    local ds = machine.datasets[dsi]
    if max_order(ds)~=nil and max_order(ds) >= oe then
      return ds_avg_noise( ds, make_bin(os,ds), make_bin(oe,ds), Unit.U_VDB )
    end
  end
  return nil
end
--
function rms(data)
  local sumsqr,n,min,max=0,0,data[1],data[1]
  for _,d in ipairs(data) do
    min=math.min(min,d)
    max=math.max(max,d)
    sumsqr=sumsqr+(d*d)
    n=n+1
  end
  return math.sqrt(sumsqr/n),min,max
end
--
local function data_check_axis( data, ax, ei,exerrors )
  local errors={}
  local faults={}
  -- spectral data checks
  local tndsi = data.spec.normal[ax]
  local tadsi={}
  if data.spec.average~=nil then
    tadsi = data.spec.average[ax]
  end
  local function fmax_sort( idx1, idx2 )
    return machine.datasets[idx1].fmax< machine.datasets[idx2].fmax
  end
  if tndsi==nil or #tndsi==0 then
    table.insert(errors,'Missing data - no normal spectral data on axis: '..ax..ei) 
    faults[data_quality_fault_guids['data ranges']]=30
  else
    table.sort( tndsi, fmax_sort )
    if tadsi==nil or #tadsi==0 then 
      table.insert(errors,'Missing data - No averages on axis: '..ax) 
      faults[data_quality_fault_guids['no averages']]=30
    else
      table.sort( tadsi, fmax_sort )
      local omin,omax,fmax,stop=0,0,0,0
      if #tndsi<#tadsi then 
        table.insert(errors,'Missing data - fewer normal spectral ranges than averages on axis: '..ax..ei) 
        faults[data_quality_fault_guids['data ranges']]=30
      else
        for i,adsi in ipairs (tadsi) do
          local normal=tndsi[i]
          fmax=math.min(machine.datasets[adsi].fmax,machine.datasets[normal].fmax)
          if i==1 then
            omin=15/machine.datasets[adsi].speed -- start at 15 hz (above 10 hz HP filter)
          else 
            omin=omax*1.02
          end
          omax=round(fmax/machine.datasets[adsi].speed,1)
          if machine.datasets[normal].peaks==nil or #machine.datasets[normal].peaks==0 then
            table.insert(errors,'No peaks in '..omax..' order range spectra on axis: '..ax..', ds: '..normal)
            faults[data_quality_fault_guids['no peaks']]=30
          end
          local start = omin
          stop = (omax-omin)*.98
          local step=(stop-start)/10
          local diftbl={}
          local dif,avedif,n =0,0,0
          if step >=0 or stop>=start then
            for begin=start,stop,step do
              local data_noise = ds_avg_noise_by_order( begin, begin+step, tndsi )  
              local avg_noise  = ds_avg_noise_by_order( begin, begin+step, tadsi )  
              if data_noise==nil or avg_noise==nil then break end
              dif = data_noise - avg_noise
              avedif=avedif+dif
              n=n+1
              table.insert(diftbl,dif)
            end
          end
          avedif=avedif/n
          if avedif > 13 then
            local sev=avedif*2 --10^(avedif/20)
            table.insert(errors,'Significantly higher than expected signal level on axis: '..ax..' ds: '..normal..' dif: '..round(avedif)..' sev: '..round(sev,1))
            faults[data_quality_fault_guids['high noise floor']]=sev
          elseif avedif < -26 then
            local sev=-avedif --10^(-avedif/20)
            table.insert(errors,'Significantly lower than expected signal level on axis: '..ax..' ds: '..normal..' dif: '..round(avedif)..' sev: '..round(sev,1))
            faults[data_quality_fault_guids['low noise floor']]=sev
          end
        end
      end
    end 
  end
  -- demod data check
  local dmdsi=data.spec.demod
  local art={'a','r','t'}
  local there=false
  if dmdsi~=nil then
    for _,ax in ipairs (art) do
      if dmdsi[ax]~=nil and #dmdsi[ax]>0 then
        there=true
        break
      end
    end
  end


  if dmdsi==nil or not(there) then
    local fired=false
    for _,err in ipairs (exerrors) do
      if err == 'Missing demod element: '..ei then 
        fired=true
        break
      end
    end
    if not(fired) then
      table.insert(errors,'Missing demod element: '..ei) 
      faults[data_quality_fault_guids['missing demod']]=10
    end
  end

  -- Wave form data checks 
  local wdsi = data.time.normal[ax]
  --local rmss={}
  if wdsi==nil or #wdsi==0 then
    table.insert(errors,'Missing waveform(s) axis: '..ei..ax) 
    faults[data_quality_fault_guids['missing waveforms']]=10
  else
    for _,ds in ipairs(wdsi) do
      local len=#machine.datasets[ds].data
      local cdata={}
      table.move(machine.datasets[ds].data,math.floor(len*.1),math.ceil(len*.9),1,cdata)
      local crms,cmn,cmx=rms(cdata)
      local ccrest=math.max(math.abs(cmx),math.abs(cmn))/crms
      if ccrest>=5 then 
        local sev=(ccrest-5)/5*100
        table.insert(errors,'Crest Factor '..round(ccrest,1)..' axis: '..ei..ax..' ds: '..ds) 
        faults[data_quality_fault_guids['crest factor']]=sev
      end
      local _
    end
  end
  return faults,errors
end
--
-- Check for duplicate data compares ave axis (average of a,r,and t) for each pickup to all the others 
function duplicate_data()
  local totpeaks,maxdb, maxfound,dbup,dbdnup,dn,up=0,0,0,0,0,0,0,0,0
  local found=false
  local match=''
  local result={}
  for e1,data1 in ipairs(machine.elements) do
    if data1.data.spec~=nil and data1.data.spec.cpl~=nil and data1.data.spec.cpl.normal~=nil and data1.data.spec.cpl.normal.ave~=nil then
      result[e1]={}
      local tf, tpct, tp, t,t2,u,d,du,dd= 0,0,0,0,0,0,0,0,0
      for e2,data2 in ipairs(machine.elements) do
        if e1~=e2 then
          local sigdif=false
          if data2.data.spec~=nil and data2.data.spec.cpl~=nil and data2.data.spec.cpl.normal~=nil and data2.data.spec.cpl.normal.ave~=nil then
            local cpl=machine.elements[e1].data.spec.cpl
            if cpl['average']~=nil  and cpl['average']['avetoave']~=nil and cpl['average']['avetoave'][e2]~=nil then 
              local avetoave=cpl['average']['avetoave'][e2]
              local lopct= avetoave.less/avetoave.matches
              local hipct=avetoave.greater/avetoave.matches
              local dbdif=avetoave.dbgreater-avetoave.dbless
              if ((hipct>=1/4 or lopct>=1/4 or math.abs(dbdif)>=12) and avetoave.matches>6) or hipct>=.5 or lopct>=.5 then sigdif=true end
            else -- no averages
              sigdif=true
            end
            local ave=data2.data.spec.cpl.normal.ave
            for f2,i2 in pairs (ave) do
              if i2.n>1 then
                t2=t2+1
              end 
            end
            for fr,inf in pairs (data1.data.spec.cpl.normal.ave) do
              if inf.n>1 then 
                t=t+1 
                if ave[fr]~=nil and sigdif and ave[fr].n>0 then
                  local db=20*math.log(inf.sval/ave[fr].sval,10)
                  local band=3
                  if  db>band then
                    u=u+1
                    du=du+db-band
                  elseif db<-band then
                    d=d+1
                    dd=dd+db+band
                  end
                  tf=tf+1
                  tpct=tpct+100*db
                end
              end
            end
            local dbd=0
            if d~=0 then dbd=dd/d end
            local dbu=0
            if u~=0 then dbu=du/u end
            if tf>0 and tf/t>.5 and math.min(t/t2,t2/t)>=.8 then
              found=true

              local dbdif=round(math.max(dbu,-dbd),1)
              if totpeaks==0 then 
                totpeaks=u+d
                maxdb=dbdif
                match=e1..' - '..e2
                maxfound=totpeaks/tf
              else
                if maxdb<dbdif then 
                  totpeaks=u+d
                  maxdb=dbdif
                  maxfound=totpeaks/tf
                  match=e1..' - '..e2
                end
              end
            end
          end    
        end
      end
    end
  end

  return {found=found,peaks=totpeaks,maxdb=maxdb,best=match,pctfound=round(maxfound*100,1)}
end
--
function data_quality()
  local axis = { 'r','t','a'}
  local errors={}
  debugprint ("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Data Quality Check Started >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>")
  local dup=duplicate_data()
  for ei,data in pickup_pairs(machine.elements) do
    if data.spec~=nil and data.spec.normal~=nil then
      for _,ax in ipairs(axis) do
        local fault,error = data_check_axis( data, ax, ei,errors )
        if dup.found and ((dup.maxdb<=3 and dup.pctfound<=15) or (dup.maxdb<=1 and dup.pctfound<=50)) then
          table.insert(error,'Duplicate data detected between pickups: '..dup.best) 
          fault[data_quality_fault_guids['duplicate data']]=round(59-dup.pctfound)
          dup.found=false
        end
        if #error > 0 then
          for _,err in ipairs(error) do
            table.insert(errors,err)
          end
          local sev=0
          for fguid,sev in pairs (fault) do
            local f =  machine.quality_faults 
            if f[fguid]~=nil then
              sev=math.max(sev,f[fguid].severity)
            end
            data_quality_assert2(fguid,sev,1)
          end
        end
      end
    end
  end

  local _
  local high,low,nh,nl=false,false,0,0
  for _,err in ipairs(errors) do
    if string.match(err,'higher than')=='higher than' then
      high=true
      nh=nh+1
    end
    if string.match(err,'lower than')=='lower than' then 
      low=true
      nl=nl+1
    end

    debugprint(err)
  end
  if high and low and false then -- turned off for now.
    debugprint('Pickups possibly swapped - Both high and low signals detected') 
    table.insert(errors,'Pickups possibly swapped - Both high and low signals detected')
    data_quality_assert2(data_quality_fault_guids['swapped pickups'],10*(nh+nl),1)
  end
  debugprint('**************************************************************************************')
  return errors
end
--

--
function normalization_quality(errors,sr1xs,psl)
  errors=errors or {}
  local axis = { 'r','t','a'}
  local targetspeed=machine.speed
  local vspeed=machine.vspeed
  local mt,mts,mn,mmax,mmin=0,0,0,0,1e999
  local pu={}
  local first=true
  debugprint ("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Normalization Quality Check Started >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>")

  if sr1xs~=nil then
    for _,mia in ipairs(sr1xs) do 
      if mia.normalize~=nil and mia.normalize.use_2xLF~=nil and mia.normalize.use_2xLF then
        data_quality_assert2(data_quality_fault_guids['2xlf normalize'],26,1)
        table.insert(errors,'Warning - Data normalized without 2xLF suppression')
      end
      for _,inf in ipairs(mia.info) do
        if inf.speedsource=='higher range' then
          data_quality_assert2(data_quality_fault_guids['higher range norm'],26,1)
          table.insert(errors,'Warning - Data on pickup: '..mia.mi..' axis: '..mia.axis..' normalized using higher reange speed')
        end
      end
    end
  end
  for ei,data in pickup_pairs(machine.elements) do
    local t,ts,n,min,max=0,0,0,1e999,0
    if data.spec~=nil and data.spec.normal~=nil then
      local ssr=machine.elements[ei].speedratio
      for _,ax in ipairs (axis) do
        if data.spec.normal[ax]~=nil then
          
          local _,_,pk=peaksearch(psl,ei,'normal',ax,1,'sord',.015)
          if pk==nil then 
             data_quality_assert2(data_quality_fault_guids['missing 1x'],26,1)
          table.insert(errors,'Warning - Missing Data, No 1X at pickup '..ei..' axis: '..ax)
            
          end
            
          for _,ds in ipairs (data.spec.normal[ax]) do
            local speed=machine.datasets[ds].speed/ssr
            if first then 
              min=speed
              mmin=min
              first=false
            end
            if speed~=0 then
              max=math.max(max,speed)
              min=math.min(min,speed)
            end
            n=n+1
            t=t+speed
          end
        end
      end
      mt=mt+t
      mn=mn+n
      pu[tostring(ei)]={t=t,n=n,min=min,max=max,ave=t/n}
    end
    mmax=math.max(max,mmax)
    mmin=math.min(min,mmin)
  end
  local ma=mt/mn
  if (mmax-mmin)/ma>.02 then 
    local sev=((mmax-mmin)/ma-.02)/.02*50
    table.insert(errors,'Warning - Speed change between pickups > 2% during testing.  Average speed - '..round(ma*60,1)..' RPM, Speed change - '..round((mmax-mmin)*60,2)..' RPM')
    data_quality_assert2(data_quality_fault_guids['speed change between pickups'],sev,1)
  end
  local mpd=math.abs(targetspeed-ma)/targetspeed
  if mpd>vspeed/100 then 
    local sev=(mpd*100-vspeed)/vspeed*50 
    table.insert(errors,'Warning - Speed out of range. Average machine of '..round(ma*60,1)..' RPM is greater than '..(vspeed)..'% from the VTAG speed of '..round(targetspeed*60,1)..' RPM.' )
    data_quality_assert2(data_quality_fault_guids['speed out of range'],sev,1)
  end
  for ei,p in pairs(pu) do
    local a=p.t/p.n
    if (p.max-p.min)/a>.01 then 
      local sev=((p.max-p.min)/a-.01)/.01*50
      table.insert(errors,'Warning - Speed change > 1% during aquisition on pickup '..ei..'.  Pickup average speed - '..round(a*60,1)..' RPM, Speed change - '..round((p.max-p.min)*60,2)..' RPM.')
      data_quality_assert2(data_quality_fault_guids['speed change on pickup'],sev,1)
    end
  end
  local wrngspd=wrong_speed(psl)
  if wrngspd~=nil and wrngspd.speedratio~=0 then
    table.insert(errors,'Error - the machine is running at '..round(wrngspd.speedratio,2)..' of normal speed.')
    data_quality_assert2(data_quality_fault_guids['wrong speed'],--[[10*wrngspd.energyratio]]31,1)
    --datami=z_fault_tone_list(0,wrngspd.element,'R',round(wrngspd.speedratio,3), 20*math.log(wrngspd.energyratio,1), 6,round(wrngspd.speedratio,2)*10,1,1, "Wrong Speed ",round(wrngspd.speedratio,3)..'X', 0) 
  end
  local _
  for _,err in ipairs(errors) do
    debugprint(err)
  end
  debugprint('**************************************************************************************')
  return errors
end
--
-- Wrong Speed function - This function totals the peak energy (linear sval) of all of the peaks 
-- in the normalization pattern to determine if any of the running speeds have better tone matches 
-- the VTAG speed.
function wrong_speed(psl)
  --get the machine speeds attribute
  local cn=whole_machine_comp_number()
  local mspeeds=''
  local info=machine.components[cn]
  if info.attr~=nil and info.attr.SPEEDS~=nil then
    mspeeds=info.attr.SPEEDS
  else -- no speeds saved.
    return nil
  end
  local msp={}
  for str in string.gmatch(mspeeds, "([^/]+)") do
    table.insert(msp, tonumber(str))
  end
  local michspeed=machine.speed*60
  local vspeed=machine.vspeed/100
  local si=1
  local spcn=machine.ispeed
  --if spcn==1 then
  --  for i,s in ipairs(msp) do
  --    if michspeed/s>1-vspeed and michspeed/s<1+vspeed then si=i end
  --  end
  --else
  -- determine which machine speed index is the nominal speed of the speed component
  for ei,e in ipairs(machine.elements) do
    if e.data~=nil and e.data.spec~=nil and e.data.spec.cpl~=nil then
      for ci,cinf in ipairs(machine.components) do
        for cei,mi in ipairs(cinf.map) do -- find the speed component in the map
          if cei==spcn and mi==ei then 
            for i,s in ipairs(msp) do
              if michspeed*e.speedratio/s>1-vspeed and michspeed*e.speedratio/s<1+vspeed then
                si=i 
                goto out
              end
            end 
          end
        end
      end
    end
  end
  --end
  ::out::
  -- get the nomalization orders pattern
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
  --sort the table of normalization orders pattern table
  table.sort(speeds,function (a,b) return a<b end)  
  if #ff>=1 then 
    for _,f in ipairs(speeds) do
      debugprint('order='..f)
    end
  end
  local te={}
  for ei,e in ipairs(machine.elements) do
    if e.data~=nil and e.data.spec~=nil and e.data.spec.cpl~=nil then
      te[ei]={}
      local pattern={}
      local ptrn={}   
      if #ff>=1 then
        -- build pattern table
        for _,f in ipairs(ff) do
          local ord=f.speed*e.speedratio*f.order 
          ptrn[tostring(ord)]=true
        end
        for ord,_ in pairs(ptrn) do
          table.insert(pattern,tonumber(ord))
        end
        -- sort the pattern table
        table.sort(pattern,function (a,b) return a<b end)
      else
        pattern={e.speedratio} -- if no pattern is specified then set at least 1x of the speed component as the pattern
      end
      for _,f in ipairs(pattern) do
        debugprint('elememt='..ei,'order='..f)
      end
      for i,s in ipairs(msp) do
        local rat=s/msp[si]
        te[ei][rat]={}
        te[ei][rat].tot=0.0000000001 -- keep the amplitude ratio from going infinite if no peaks are detected
        te[ei][rat].n=0
        for ax,inf in pairs (e.data.spec.cpl.normal) do
          if string.len(ax)==1 then
            for _,p in ipairs(pattern) do
              local pk={}
              if rat==1 then
                _,_,pk=peaksearch(psl,ei,'normal',ax,e.speedratio*rat*p,'sord',vspeed)
              else
                _,_,pk=peaksearch(psl,ei,'normal',ax,machine.speed*e.speedratio*rat*p,'sfreq',vspeed)
              end
              if pk~=nil and pk.mpct>1 then  -- if there is a significant peak add its amplitiude
                te[ei][rat]['tot']=te[ei][rat]['tot']+pk.sval 
                te[ei][rat]['n']=te[ei][rat]['n']+1
              end
            end
          end
        end
      end
    end
  end
  -- determine the maximum energy ratio and what speed ratio it occured at.
  local enrgyrat,spratio,ele=0,0,0
  for ei,ter in pairs (te) do
    for rat,enrgy in pairs (ter) do
      if rat~=1 and (enrgy.tot*enrgy.n)/(ter[1].tot*ter[1].n)>2 and (enrgy.tot*enrgy.n)/(ter[1].tot*ter[1].n)>enrgyrat then
        spratio=rat
        enrgyrat=(enrgy.tot*enrgy.n)/(ter[1].tot*ter[1].n)
        ele=ei
        debugprint('speed ratio='..round(spratio,3),'pickup='..ele,'energy ratio='..round(enrgyrat,1))
      end
    end
  end
  if enrgyrat>10 then enrgyrat=10 end
  local _
  return {speedratio=spratio,energyratio=enrgyrat,element=ele} -- return maximum energy ratio and what speed ratio it occured at
end
