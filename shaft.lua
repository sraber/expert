-- shaft.lua    Rev 9     12/6/18

-------------------------------------------------------------------
--             Speed Walking algorithm
-- All the functions in this section have to do with finding the 
-- speed of all the shafts in the machine class.
--

local function has_value (tab, val)
  for _, value in pairs (tab) do
    if value == val then
      return true
    end
  end
return false
end

local function remove_value_from_array (tab, val)
  for i, value in ipairs (tab) do
    if value == val then
      table.remove(tab,i)
      break
    end
  end
end

function find_super_shaft_with_element( sups, ei )
  for i,ss in ipairs(sups) do
    if ss.elements[ei] then
      return i
    end
  end
  return 0
end

function find_super_shaft_with_component( sups, comp_number )
  for i,ss in ipairs(sups) do
    if ss.components[comp_number] then
      return i
    end
  end
  return 0
end

local function find_super_shaft_speeds( sups, speed, ssi, suplist, outlist )
  outlist[ssi]=speed
  remove_value_from_array(suplist,ssi)

  if #suplist == 0 then
    return
  end
  
  local em = sups[ssi].elements
  for ei,_ in pairs(em) do
    if #machine.elements[ei].sref > 0 then
      for _,er in ipairs(machine.elements[ei].sref) do
        local ssir = find_super_shaft_with_element(sups, er)
        if ssir>0 and ssir~=ssi then
          local eis = machine.elements[ei].sdim
          local ers = machine.elements[er].sdim
          if eis==0.0 then error( "Data error. Element["..ei.."] sdim is zero.  If the element is not a gear or pulley it should default to -1.") end
          if ers==0.0 then error( "Data error. Element["..er.."] sdim is zero.  If the element is not a gear or pulley it should default to -1.") end
          local spd = eis * speed / ers
          if spd<0.0 then error( "Data error. Speed is less than zero.  Element["..ei.."] drives element["..er.."], check that these are both speed change elements shuch as gears or pulleys." ) end
          find_super_shaft_speeds(sups, spd, ssir, suplist, outlist)
        end
      end
    end
  end
    
  if #suplist == 0 then
    return
  end
    
  for _, i in ipairs(suplist) do
    em = sups[i].elements
    for ei,_ in pairs(em) do
      if #machine.elements[ei].sref > 0 then
        for _,er in ipairs(machine.elements[ei].sref) do
          local ssir = find_super_shaft_with_element(sups, er)
          if ssir==ssi then
            local eis = machine.elements[ei].sdim
            local ers = machine.elements[er].sdim
            if eis==0.0 then error( "Data error. Element["..ei.."] sdim is zero.  If the element is not a gear or pulley it should default to -1.") end
            if ers==0.0 then error( "Data error. Element["..er.."] sdim is zero.  If the element is not a gear or pulley it should default to -1.") end
            local spd = ers * speed / eis
            if spd<0.0 then error( "Data error. Speed is less than zero.  Element["..ei.."] drives element["..er.."], check that these are both speed change elements such as gears or pulleys." ) end
            find_super_shaft_speeds(sups, spd, i, suplist, outlist)
          end
        end
      end
    end
  end
end

-- Super Shafts are collections of components that all turn at the same speed.
-- Layout:
--    super_shaft[i], where i is 1 to N
--    each super shaft has a "components" table and an "elements" table.
--    components - list of component indices
--    elements   - list of machine element indices

--               compute_super_shaft_speeds
-- Input:
--    sups - Super Shaft table
--    ci   - machine component of designated speed
--    cs   - speed of ci
--
-- Return:
--   A table if super shaft speeds.  Format speeds[super_shaft_index] = speed
--
-- Side affect:
--   The speed table is used to place a speed ratio value into each
--    super shaft table.
--
function compute_super_shaft_speeds( sups, ci, cs  )
  local speeds={}
  local suplist={}
    
  for ssi,_ in ipairs(sups) do
    table.insert(suplist,ssi)
  end
  
  local ssi = find_super_shaft_with_component( sups, ci )
  if ssi then
    find_super_shaft_speeds( sups, cs, ssi, suplist, speeds )
  else
    error("The value for element index does not exist in any super shaft")
  end
  
  for ssi,ss in ipairs(sups) do
    ss.speed_ratio = speeds[ssi]/machine.speed
  end
  
  return speeds
end

-- End Speed Walking
-- Support functions

-- Input:
--   sss : Super Shaft Speeds, format is sss[ssi]=speed, where ssi is super shaft index
--   ssl  : Super Shaft list
function get_component_speeds(sss,ssl)
  local cs = {}
  for ssi,speed in ipairs(sss) do
    local ss = ssl[ssi]
    for cn,_ in pairs(ss.components) do
      cs[cn] = speed
    end
  end
  return cs
end

----------------------------------------
local function ss_set_combine( dest, src )
  for cn,_ in pairs(src) do
    dest[cn]=true
  end
end

local function ss_set_combine_exclusive( dest, src, n )
  for cn,_ in pairs(src) do
    if cn~=n then
      dest[cn]=true
    end
  end
end

local function ss_sets_intersect( s1, s2 )
  for n,_ in pairs(s2) do
    if s1[n] then return true end
  end    

  return false
end

-- make_super_shaft
-- Notes:
--    Creates a super shaft from an array of components.
--
-- Input:
--    components : An array of component numbers.
--    e2c: a map of element to table of component numbers it intersects.
-- Return:
--   A super shaft table with the following entries:
--      components
--      elements
--      e_to_c
--      c_to_c
--
-- Error: 
--
local function make_super_shaft( comp_numbers, e2c )
  local ele = {}
  local c2c = {}
  for sn,_ in pairs(comp_numbers) do
    c2c[sn] = {}
    for _,ei in ipairs(machine.components[sn].map) do
      ele[ei] = true
    end
    for _,cns in pairs(e2c) do
      if ss_sets_intersect({[sn]=true},cns) then
        ss_set_combine_exclusive( c2c[sn], cns, sn )
      end
    end
  end
  
  return {components=comp_numbers,elements=ele, e_to_c=e2c, c_to_c=c2c}
end

-- Super Shafts are collections of components that all turn at the same speed.
-- Return:
--    An array of tables.  Each table represents a super shaft.
-- Super Shaft table layout
--    components - A list of component indices.  These are the components that are part of this super shaft.
--                 Format: [n]=true, where n is a component number.
--    elements   - A list of machine element indices.  These are the machine element index numbers that are part of this super shaft.
--                 Format: [n]=true, where n is a element index.
--    e_to_c     - A map of element index to component number.  It maps each component that overlays this element number.
--                 Format: [n]={c1=true, c2=true, ...}, where n is an element index used to access a table with component numbers.
--    c_to_c     - A map of component number (cn) to other component numbers.  It maps each component that overlays or is linked to component cn.
--                 Format: [n]={c1=true, c2=true, ...}, where n is an component number used to access a table with component numbers.
function find_all_super_shafts()
  local e2c={}
  local super_shafts={}
  
  -- Create an element to component map
  for cn,comp in pairs(machine.components) do
    -- We do not want to put composites into this list.
    if machine.composites[comp.shaft]==nil then
      for _,ei in ipairs(comp.map) do
        if e2c[ei]==nil then e2c[ei]={key=ei,comp={}} end
        e2c[ei].comp[cn] = true
        local ele = machine.elements[ei]
        if ele.sref~=nil and ele.sdim<0 then
          for _,si in ipairs(ele.sref) do
            if e2c[si]==nil then e2c[si]={key=si,comp={}} end
            e2c[si].comp[cn] = true   
          end
        end
      end
    end
  end
  
  while next(e2c)~=nil do
    local changed = true
    local components = {}
    local sse2c = {}
    local key, val = next(e2c,nil)
    ss_set_combine( components, val.comp )
    sse2c[val.key] = val.comp
    --table.remove( e2c, key )
    e2c[key]=nil
    while changed do
      changed = false
      key, val = next(e2c,nil) 
      while key~=nil do
        if ss_sets_intersect( components, val.comp ) then
          ss_set_combine( components, val.comp )
          sse2c[val.key] = val.comp
          --table.remove( e2c, key )
          e2c[key]=nil
          key, val = next(e2c,nil) 
          changed = true
        else
          key, val = next(e2c,key) 
        end
      end
    end
    table.insert( super_shafts, make_super_shaft( components, sse2c ) )
  end
  
  return super_shafts
end
