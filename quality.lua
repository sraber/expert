-- quality.lua    Rev 1 11/8/18

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
  for bin=from_bin,to_bin,bin_step do
    n = n + 1
    local a = 1.0 / n
    local b = 1 - a
    avg = (a * ds_spline_avg( ds, bin )) + (b * avg)
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

local function ds_avg_noise_by_order( start, step, tdsi )
  local os = start
  local oe = os + step
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

local function data_check_axis( data, ax )
  local tndsi = data.spec.normal[ax]
  local tadsi = data.spec.average[ax]
  
  local start = 2
  local step = 4
  while true do
    local data_noise = ds_avg_noise_by_order( start, step, tndsi )  
    local avg_noise  = ds_avg_noise_by_order( start, step, tadsi )  
    start = start + step
    if data_noise==nil or avg_noise==nil then return 0 end
    local dif = data_noise - avg_noise
    if dif > 20 then
      return 1
    elseif dif < -20 then
      return -1
    end
  end
end

function data_quality()
  local high_noise_levels = '26477670-693A-4E5B-A17D-27EB1747DDC0'
  local low_noise_levels = 'EE3A6EA3-605E-4D09-9B07-80DDCFB480F1'
  local axis = { 'r','t','a'}
  for mi,data in pickup_pairs(machine.elements) do
    if data.spec~=nil and data.spec.normal~=nil and data.spec.average~=nil then
      for _,ax in ipairs(axis) do
        local res = data_check_axis( data, ax )
        if res > 0 then
          data_quality_assert1(high_noise_levels)
        elseif res < 0 then
          data_quality_assert1(low_noise_levels)
        end
      end
    end
  end
end