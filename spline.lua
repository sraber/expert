-- spline.lua    Rev 2     4/30/18

-- The spline code in this file has been optomized for delta x (dx) equals 1.  That is, it is assumed that dx = 1.
-- To interpolate with respect to a variable other than the bin (or index) value of the data it is a simple task
-- to do that trasfomration of variable at the time of point interpolation (in splint).  The desired variable is passed in
-- and trasfored to bin value which is used by the interpolating functions.  That's not been provided here as all interpolation
-- in this code is done with respted to spectrum bin value.

-- y  - data
-- y2 - acceleration
function spline( y)
  check_nil( y, "y" )
	local n = #y
  if n<=4 then error( M_PARAM_ARG("n("..n..")<=4" ) ) end
  local u = {}
  local y2 = {}
	local p


  -- Natural boundary condition
  y2[1] = 0
  u[1] = 0
	
	for i=2, n-1 do  
		p=0.5*y2[i-1]+2.0
		y2[i]= -0.5/p
		u[i]= y[i+1]- 2.0*y[i] + y[i-1]
		u[i]=( (3.0*u[i]) - 0.5*u[i-1] )/p
	end
	
	y2[n]=0.0
	for k=n-1,1, -1 do
		y2[k]=y2[k]*y2[k+1]+u[k]
  end
  
  return y2
end

function splint(x, y, y2)
  check_nil( x, "x" )
  check_nil( y, "y" )
  check_nil( y2, "y2" )
  local n = #y
	local klo,khi
	local b,a

	klo = math.floor(x)
	khi = klo + 1

	a = (khi - x)
	b = 1.0 - a
  
	if khi>=n then return y[n] end
  
  local v = a*y[klo]+b*y[khi]+((a*a*a-a)*y2[klo]+(b*b*b-b)*y2[khi])/6.0
  if v < 0.0 then
    return 0.0
  end
  
	return v
end

function splint2(x, y, y2)
  check_nil( y, "y" )
  check_nil( y2, "y2" )
  local n = #y
	local klo,khi
	local b,a

	klo = math.floor(x)
	khi = klo + 1

	a = (khi - x)
	b = 1.0 - a
  
	if khi>n then 
    local dvn = (y[n]-y[n-1])
    return y[n],dvn,y2[n] 
  end
  
  local v = a*y[klo]+b*y[khi]+((a*a*a-a)*y2[klo]+(b*b*b-b)*y2[khi])/6.0
  
-- This looks good on a graph but will through a convergance algorithm
-- such as Newton's method for a loop.
--  if v < 0.0 then
--    local f1 = a*y[klo]+b*y[khi]
--    local f2 = ((a*a*a-a)*y2[klo]+(b*b*b-b)*y2[khi])/6.0
--    local c = -f1 / f2
--    local ddv = c*(a*y2[klo] + b*y2[khi])
--    return 0.0,0.0,ddv
--  end
  
  local dv = (y[khi]-y[klo]) - (3*a*a-1)*y2[klo]/6 + (3*b*b-1)*y2[khi]/6
  local ddv = a*y2[klo] + b*y2[khi]
	return v,dv,ddv
end

function newton_search( x1, x2, xseed, y, y2, result )
  local f,df,ddf
  local x = xseed
  
  for _=1,10 do
    f,df,ddf = splint2(x,y,y2)
    local e = -df/ddf
    local xx=x+e
    
    --If the search runs out of bounds just leave.
    if xx<x1 or xx>x2 then return false end
    
    x = xx
    if  math.abs(df)<0.00001 then
      if ddf < 0 then
        result["f"]=f
        result["x"]=x
        return true
      else
        --Converged to a minimum instead of a maximum.
        return false
      end
    end
  end
  
  --If it doesn't converge fast enough leave
  return false
end
  
--function findmaxima_old( x1, x2, xseed, y, y2 )
--  check_nil( x1, "x1" )
--  check_nil( x2, "x2" )
--  check_nil( y, "y" )
--  check_nil( y2, "y2" )
--  if x2<=x1 then error( M_PARAM_ARG("x2("..x2..")<=x1("..x1..")" ) ) end
--  --if not (xseed>=x1 and xseed<=x2) then error( M_PARAM_ARG("not x1("..x1..")<=xseed("..xseed..")<=x2("..x2..")" ) ) end
--  if xseed<x1 then xseed=x1 end
--  if xseed>x2 then xseed=x2 end
  
--  local result={}
--  --First, just jump in and try a straight forward Newton-Raphson algorithm
--  --and see if it converges at a peak (It could converge at a trough).
--  if newton_search( x1, x2, xseed, y, y2, result ) then
--    return result.f,result.x
--  end
  
--  --Straight forward approach didn't work.
--  local step = (x2-x1)/10
--  local xmax
--  local max = -100000
--  local _,odf,_ = splint2(x1,y,y2)
--  local is_root = false
--  for x=x1,x2,step do
--    local f,df,_ = splint2(x,y,y2)
--    if f>max then
--      -- REVIEW: Also consider f that is cloest to xseed.
--      max = f
--      xmax = x
--    end
    
--    --if df and odf are oppsite sign then there is a root in the range
--    --and the product will be less than zero.
--    if df*odf < 0 then
--      is_root = true
--    end
--  end
--  if is_root==true then
--    if newton_search( x1, x2, xmax, y, y2, result ) then
--      return result.f,result.x
--    end
--  else
--    print( "No peak was detected in the range ".. x1.. ",".. x2.. " Are you on the side of a hill?" )
--    return max, xmax
--  end

  
--  --REVIEW: Investigate how to report things like this.  How will we
--  --        know when this algorithm is failing.
--  -- assert( 0, "mamima not found.  No convergance.")
--  --TEST: print out for now
--  print( "mamima not found.  No convergance for seed value of "..xseed )
--  return max, xmax
--end

function findmaxima( x1, x2, xseed, y, y2, stack_depth )
  stack_depth = stack_depth or 0
  stack_depth = stack_depth + 1
  check_nil( x1, "x1" )
  check_nil( x2, "x2" )
  check_nil( y, "y" )
  check_nil( y2, "y2" )
  if x2<=x1 then error( M_PARAM_ARG("x2("..x2..")<=x1("..x1..")" ) ) end

  if xseed<x1 then xseed=(x1+x2)/2.0 end
  if xseed>x2 then xseed=(x1+x2)/2.0 end
  
  local function f( i ) return splint( i, y, y2 ) end
  local function check( vl, v, vr ) return (v > vl and v > vr) end
  
  local n = 5
  local dl = (xseed - x1)/n
  local dr = (x2 - xseed)/n
  
  if stack_depth==10 or dl<=1e-6 or dr<=1e-6 then return f(xseed), xseed end
  
  local l_pos_l = xseed - dl
  local l_pos_m = xseed
  local l_pos_h = xseed + dr
  local r_pos_l = l_pos_l
  local r_pos_m = l_pos_m
  local r_pos_h = l_pos_h
  local r_l = f(r_pos_l)
  local r_m = f(r_pos_m)
  local r_h = f(r_pos_h)
  local l_l = r_l
  local l_m = r_m
  local l_h = r_h
  
  local def_v = r_m
  
  local function shift_left( v )
      l_h = l_m
      l_m = l_l
      l_l = v
    end
  
  local function shift_right( v )
      r_l = r_m
      r_m = r_h
      r_h = v
    end
  
  local function shift_pos_left( p )
      l_pos_h = l_pos_m
      l_pos_m = l_pos_l
      l_pos_l = p
    end
  
  local function shift_pos_right( p )
      r_pos_l = r_pos_m
      r_pos_m = r_pos_h
      r_pos_h = p
    end
    
  local result={}
  
  if check(r_l,r_m,r_h) == true then
    if newton_search( r_pos_l, r_pos_h, r_pos_m, y, y2, result ) then
      return result.f,result.x
    else
      return findmaxima( r_pos_l, r_pos_h, r_pos_m, y, y2, stack_depth + 1 )
    end    
  end
  
  for _=1,n do
    shift_pos_right( r_pos_h + dr )    
    shift_right( f(r_pos_h) )
    
    if check(r_l,r_m,r_h) == true then
      if newton_search( r_pos_l, r_pos_h, r_pos_m, y, y2, result ) then
        return result.f,result.x
      else
        return findmaxima( r_pos_l, r_pos_h, r_pos_m, y, y2, stack_depth + 1 )
      end
    end
    
    shift_pos_left( l_pos_l - dl )       
    shift_left( f(l_pos_l) )
    
    if check(l_l,l_m,l_h) == true then
      if newton_search( l_pos_l, l_pos_h, l_pos_m, y, y2, result ) then
        return result.f,result.x
      else
        return findmaxima( l_pos_l, l_pos_h, l_pos_m, y, y2, stack_depth )
      end
    end
  end
  
  -- No convergence on a peak.  We are probably on a hillside.
  local sum = f(x1)
  sum = sum + f(x2)
  sum = sum + f(xseed)
  sum = sum / 3.0

  return sum, xseed
end

--function peakpos(dx, x, y, y2)
--  local n = #y
--	local klo,khi
--	local a,b,c
--	local xdx = x/dx

--	klo = math.floor(xdx)
--	khi = klo + 1

--	if khi>=n then return -1 end
  
--  a = y2[khi] - y2[klo]
--  b = 2*dx*y2[klo]
--  c = -y2[khi]*dx*dx -2*(y[khi]-y[klo])
  
--  b=b/a
--  c=-c/a
  
--  local c4 = 4*c
--  local bb = b*b
--  if (c4 + bb) < 0 then return -1 end -- no root
--  local cb = math.sqrt( bb + c4 )
--  local r1 = (cb - b) / 2
--  local r2 = (-cb - b) / 2
  
--  if r1 < 0 then
--    if r2 >= 0 then
--      if r2 <= dx then return r2 end
--    end
--  elseif r2 < 0 then
--    if r1 >= 0 then
--      if r1 <= dx then return r1 end
--    end
--  else
--    if r1 <= dx then return r1 end
--    if r2 <= dx then return r2 end
--    -- there is a root but it is outside the 0 to dx range
--  end
--  return -1
--end
