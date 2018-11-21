-- extract.lua    Rev 2     10/26/17
-- mean_n
-- Notes:
--
--
-- Input:
--    data  : spectrum data
--    a     : start
--
-- Return:
--    
--
-- Error:     
--
local function mean_n( data, a, n )
	assert( a>0 and n>0 )
  assert( (a+n) <= #data )
	local mean = 0.0
   for i=a,(a+n) do
      mean = mean + data[i]
  end
	return (mean / n)
end

local function mean_rem_peak_n(data, peaks, a, n )
	assert( a>0 and n>0 )
  assert( (a+n) <= #data )
  local mean = 0.0
  local m = 0.0
  for i=a,(a+n) do
    if peaks[i]==nil then
      mean = mean + data[i]
      m = m + 1
    end
  end
  if m>0 then
    mean = mean / m 
	else 
		mean = data[a]
	end
  return mean
end

local function std_n( mean, data, a, n )
	assert( a>0 and n>0 )
  assert( (a+n) <= #data )
  local stdv = 0.0
  for i=a, (a+n) do
    local d = data[i] - mean
    stdv = stdv + (d * d)
  end
  stdv = stdv / n
	return math.sqrt(stdv)
end

local function std_rem_peak_n( mean, data, peaks, a, n )
	assert( a>0 and n>0 )
  assert( (a+n) <= #data )
  local stdv = 0.0
  local m = 0.0
  for i=a,(a+n) do
    if peaks[i]==nil then
      local d = data[i] - mean
      stdv = stdv + (d * d)
      m=m+1
    end
  end
  if m>0 then
    stdv = stdv / m
  else
    stdv = data[a] - mean
    stdv = stdv*stdv
  end
  return math.sqrt(stdv)
end

-- Input:
--    data    : spectrum data
--    window  : the size of the window for the moving average
--
-- Return: mean, stdv
--    mean    : the moving average
--    stdv    : the standard deviation of each point of the mean
-- Error:     
--
function mean_and_stdv(window, data)
  local n = #data
  local mean = {}
  local stdv = {}
  local s
  local s1
  local m = math.floor( window / 2 )

  ----------------------------
  -- Look for the begining of the pass band for data that has been high pass filtered.
  -- We will avoid any bins below s.  We assume this is data in the Stop Band.
  s = 1
  for i = 1,n do
    if data[i] > g_stop_band_threshold then 
      s = i
      break
    end
  end
  
  -- Sanity check
  -- If we detect that the pass band is %25 into the data then we are probably
  -- wrong or the filter was set up wrong.  Either way, no sense in throwing out
  -- %25 of the data.
  if s > (0.25*n) then s = 1 end
  
  -- Once we know s we know what s1 should be.
  if s > 2 then
    s1 = s
  else
    s1 = 2
  end
  ----------------------------
  -- 1st Pass
  -- Determine 1st estimate of the mean and standard deviation.
  -- The estimate will include anomolus peaks in the average.
  --
  -- This line was:
  -- for i = 1, m do
  for i = s, m+s do
    local v = mean_n(data, i, window)
    mean[i] = v
    stdv[i] = std_n(v, data, i, window)
  end
  
  -- This line was:
  -- for i = m+1, (n-m) do
  for i = m+s+1, (n-m) do
    local v = mean_n(data, i - m, window)
    mean[i] = v
    stdv[i] = std_n(v, data, i - m, window)
  end

  local p = n-m
  local vm = mean[p]
  local vs = stdv[p]
  for i = p+1, n do
    mean[i] = vm
    stdv[i] = vs
  end

  local n1 = n - 1
  local peaks = {}

  -- Now that we have a 1st pass mean + stdv use it to
  -- collect points that exceed it.
  -- This line was:  
  -- for i = 2, n1 do
  for i = s1, n1 do
    if data[i] > (mean[i] + stdv[i]) then
      peaks[i]=true
    end
  end

  -- 2nd Pass
  -- Form the mean and standard deviation that does not include
  -- the peak points.
  for i = s, m+s do
    mean[i] = mean_rem_peak_n(data, peaks, i, window)
    stdv[i] = std_rem_peak_n(mean[i], data, peaks, i, window)
  end

  for i = m+s+1, (n-m) do
    mean[i] = mean_rem_peak_n(data, peaks, i - m, window)
    stdv[i] = std_rem_peak_n(mean[i], data, peaks, i - m, window)
  end

  vm = mean[p]
  vs = stdv[p]
  for i = p+1, n do
    mean[i] = vm
    stdv[i] = vs
  end

  -- 3rd Pass
  -- Again, collect up the position of the data points
  -- that exceed the mean + stdv.
  for i = s1, n1 do
    if data[i] > (mean[i] + stdv[i]) then
      peaks[i]=true
    end
  end

  -- Create the mean and stdv with the new set of peak points.
  for i = s, m+s do
    mean[i] = mean_rem_peak_n(data, peaks, i, window)
    stdv[i] = std_rem_peak_n(mean[i], data, peaks, i, window)
  end

  for i = m+s+1, (n-m) do
    mean[i] = mean_rem_peak_n(data, peaks, i - m, window)
    stdv[i] = std_rem_peak_n(mean[i], data, peaks, i - m, window)
  end

  vm = mean[p]
  vs = stdv[p]
  for i = p+1, n do
    mean[i] = vm
    stdv[i] = vs
  end
  
  -- Now fill in below s
  local ms = mean[s]
  local ss = stdv[s]
  for i=1,s do
    mean[i] = ms
    stdv[i] = ss
  end
  
  return mean, stdv
end

function get_peaks( bound, data )
  local peaks={}
	local n = #data
	assert(#bound == n)
	local n1 = n - 1
	for i = 2, n1 do
		-- Inverted centered 2nd order differance.  
		-- When this value turns positive the signal has become concave
		-- (it's starting to turn down).  Most of the time this happens at the peak,
		-- but on broader peaks the signal turns concave early and we need to
		-- climb to the top of the peak.
		--
		local a = (2 * data[i]) - data[i - 1] - data[i + 1]
		if a > 0 then  
			-- Check if the peak is behind us.  Broad peaks are concave on both sides
			-- so will trick the 2nd order differance equation.  If the point behind us
			-- is higher, that's all we need to know.  Skip this point because we already 
			-- know about it.
			if data[i - 1] < data[i] then
				-- There is the question of the possibility of two equal valued points next to each other.
				-- A flat peak.  Should it be counted as two peaks next to each other?
				-- Using <= comparision will keep both points, using < comparison
				-- only keeps the first one.  Currently that's what we do.

				--  Climb to the top of the peak.
				while (i <= n1 and data[i] < data[i + 1]) do    
					i=i+1
				end

				if data[i] > bound[i] and i<n then
          peaks[i]=true    
				end
			end
		end
	end
  local out={}
  for p,_ in pairs(peaks) do
    table.insert( out, p )
  end
  table.sort( out )
  return out
end

--function compare_array( a, b )
--  local m = #a
--  local n = #b
--  if m~=n then error( m..","..n ) end
--  for i=1,n do
--    if math.abs( a[i]-b[i] ) > 1e-5 then print( "no compare i("..i..") a("..a[i]..") b("..b[i]..") dif("..a[i]-b[i]..")" ) end
--  end
--end
