-- quality.lua    Rev 5 1/9/19

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
  ['higher range norm']='f067f248-ecb4-4b60-ae93-bb0a0917bb5e',
  ['2xFL normalize']='8b4fe728-ae8f-4a7d-95cf-97eef2224650'}

local function data_quality_assert2(fault, severity, confidence)
  local f = assert( machine.quality_faults )
  -- ToDo:
  -- Keep a complimentary table for additional information for the fault.
  --qfc[fault]={ melguid = { axis = true }}
  -- It keeps melguid for the fault.  melguid is the key and value is a table with axis letters.
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
    if max_order(ds) >= oe then
      return ds_avg_noise( ds, make_bin(os,ds), make_bin(oe,ds), Unit.U_VDB )
    end
  end
  return nil
end
--
local function rms(data)
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
local function data_check_axis( data, ax, ei )
  local errors={}
  local faults={}
  -- spectral data checks
  local tndsi = data.spec.normal[ax]
  local tadsi = data.spec.average[ax]
  local function fmax_sort( idx1, idx2 )
    return machine.datasets[idx1].fmax< machine.datasets[idx2].fmax
  end
  if tndsi==nil or #tndsi==0 then
    table.insert(errors,'Missing data - fewer normal spectral ranges than averages on axis: '..ax) 
    faults[data_quality_fault_guids['data ranges']]=100
  else
    table.sort( tndsi, fmax_sort )
    if tadsi==nil then 
      table.insert(errors,'Missing data - No averages on axis: '..ax) 
      faults[data_quality_fault_guids['no averages']]=20
    else
      table.sort( tadsi, fmax_sort )
      local omin,omax,fmax,stop=0,0,0,0
      if #tndsi<#tadsi then 
        table.insert(errors,'Missing data - fewer normal spectral ranges than averages on axis: '..ax) 
        faults[data_quality_fault_guids['data ranges']]=50
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

  -- Wave form data checks 
  local wdsi = data.time.normal[ax]
  local rmss={}
  if wdsi==nil or #wdsi==0 then
    table.insert(errors,'Missing waveform(s) axis: '..ax) 
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
        table.insert(errors,'Crest Factor '..round(ccrest,1)..' axis: '..ax..' ds: '..ds) 
        faults[data_quality_fault_guids['crest factor']]=sev
      end
      local _
    end
  end
  return faults,errors
end
--
function data_quality()
  local axis = { 'r','t','a'}
  local faults,errors={},{}
  debugprint ("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Data Quality Check Started >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>")
  for ei,data in pickup_pairs(machine.elements) do
    if data.spec~=nil and data.spec.normal~=nil and data.spec.average~=nil then
      for _,ax in ipairs(axis) do
        local fault,error = data_check_axis( data, ax, ei )
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
  for _,err in ipairs(errors) do
    debugprint(err)
  end
  debugprint('**************************************************************************************')
  return errors
end
--

--
function normalization_quality(errors,sr1xs)
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
        data_quality_assert2(data_quality_fault_guids['2xFL normalize'],26,1)
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
    if data.spec~=nil and data.spec.normal~=nil and data.spec.average~=nil then
      local ssr=machine.elements[ei].speedratio
      for _,ax in ipairs (axis) do
        if data.spec.normal[ax]~=nil then
          for _,ds in ipairs (data.spec.normal[ax]) do
            if first then 
              min=machine.datasets[ds].speed/ssr
              mmin=min
              first=false
            end
            if machine.datasets[ds].speed/ssr~=0 then
              max=math.max(max,machine.datasets[ds].speed/ssr)
              min=math.min(min,machine.datasets[ds].speed/ssr)
            end
            n=n+1
            t=t+machine.datasets[ds].speed/ssr
          end
        end
      end
      mt=mt+t
      mn=mn+n
      pu[tostring(ei)]={t=t,n=n,min=min,max=max}
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
  local _
  for _,err in ipairs(errors) do
    debugprint(err)
  end
  debugprint('**************************************************************************************')
  return errors
end
--