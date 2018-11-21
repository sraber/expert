-- shaft.lua    Rev 6     3/26/18

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

local function find_super_shaft_with_element( sups, ei )
  for i,ss in ipairs(sups) do
    if ss.elements[ei] then
      return i
    end
  end
  return 0
end

local function find_super_shaft_with_component( sups, comp_number )
  for i,ss in ipairs(sups) do
    if ss.components[comp_number] then
      return i
    end
--    for _, cn in ipairs(ss.components) do
--      if comp_number==cn then
--        return i
--      end
--    end
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
            if spd<0.0 then error( "Data error. Speed is less than zero.  Element["..ei.."] drives element["..er.."], check that these are both speed change elements shuch as gears or pulleys." ) end
            find_super_shaft_speeds(sups, spd, i, suplist, outlist)
          end
        end
      end
    end
  end
end

-- REVIEW: Not needed
local function make_super_shaft_consolidation_ex( sups, ssi, suplist, outlist )
  table.remove(suplist,ssi)

  if #suplist == 0 then
    return
  end
  
  local em = sups[ssi].elements
  for ei,_ in pairs(em) do
    if #machine.elements[ei].sref > 0 then
      for _,er in ipairs(machine.elements[ei].sref) do
        local ssir = find_super_shaft_with_element(sups, er)
        if ssir then
          local eis = machine.elements[ei].sdim
          local ers = machine.elements[er].sdim
          if eis<0 and ers<0 then  
            outlist[ssi]=ssir
            make_super_shaft_consolidation_ex(sups, ssir, suplist, outlist)
            break
          end
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
            if eis<0 and ers<0 then  
              outlist[i]=ssi
              make_super_shaft_consolidation_ex(sups, i, suplist, outlist)
              break
            end
          end
        end
      end
    end
  end
end

local function find_super_shaft( shaft_number, complist, outlist )
  local loclist = {}
  remove_value_from_array(complist,shaft_number)
  table.insert(outlist,shaft_number)
  local shaft_elements = machine.components[shaft_number].map
  
  -- Find the shafts that contain the machine elements in "elements".
  -- Just create a local list becuase we don't want to modify complist
  -- while we're iterating through it.
  for _,ei in ipairs(shaft_elements) do
    for _,sn in pairs(complist) do
      if has_value( machine.components[sn].map, ei ) then
        table.insert( loclist, sn )
      end
    end
    -- Remove found shafts from complist and place the result
    -- in outlist.
    for _,sn in pairs(loclist) do
      remove_value_from_array(complist,sn)
    end
  end
  
  for _,sn in pairs(loclist) do
    find_super_shaft( sn, complist, outlist )
  end
end

-- make_super_shaft
-- Notes:
--    Creates a super shaft from an array of components.
--
-- Input:
--    components : An array of component numbers.
--
-- Return:
--   A super shaft table.  It has two nested tables:
--      components, elements
--
-- Error: 
--
local function make_super_shaft( components )
  local comp_numbers = {}
  local ele = {}
  for _,sn in ipairs(components) do
    comp_numbers[sn] = true
    for _,ei in ipairs(machine.components[sn].map) do
      ele[ei] = true
    end
  end
  return {components=comp_numbers,elements=ele}
end

--               make_super_shaft_consolidation_list
-- Input:
--    sups - Super Shaft table
--
local function make_super_shaft_consolidation_list( sups  )
  local conlist={}
  local suplist={}
  
  local function FindKey( t, key )
    for _,v in pairs(t) do
      if v.key == key then return v end
    end
    return nil
  end
    
  for ssi,_ in ipairs(sups) do
    table.insert(suplist,ssi)
  end
  
  --make_super_shaft_consolidation_ex( sups, 1, suplist, conlist )
  
  for _, i in ipairs(suplist) do
    local em = sups[i].elements
    for ei,_ in pairs(em) do
      if #machine.elements[ei].sref > 0 then
        for _,er in ipairs(machine.elements[ei].sref) do
          local ssir = find_super_shaft_with_element(sups, er)
          if ssir~=i then
            local eis = machine.elements[ei].sdim
            local ers = machine.elements[er].sdim
            if eis<0 and ers<0 then  
              table.insert( conlist, {key=i,value=ssir} )
              break
            end
          end
        end
      end
    end
  end
  
  local unions = {}
  while #conlist>0 do
  --for oli,k in pairs(conlist) do
    local un = {}
    --local iter, a, c = ipairs(conlist)
    --local oli,k = iter(a, c)
    local k,v = next(conlist,nil)
    local oli = v.key
    table.insert(un, oli)
    
    repeat
      local oln = v.value
      -- If it's an array, then when we remove an element, the index is renumbered.
      -- going to have to go with an array of pairs and a search function.
      table.remove(conlist,k)
      table.insert(un,oln)
      oli=oln
      v = FindKey( conlist, oli )
    until v==nil
    
    table.insert(unions,un)
  end

  return unions
end

-- Super Shafts are collections of components that all turn at the same speed.
-- Layout:
--    super_shaft[i], where i is 1 to N
--    each super shaft has a "components" table and an "elements" table.
--    components - list of component indices
--    elements   - list of machine element indices
function find_all_super_shafts_old()
  local complist={}
  local super_shafts={}
  
  -- Add all the component numbers to complist.
  for cn,comp in pairs(machine.components) do
    -- We do not want to put composites into this list.
    if machine.composites[comp.shaft]==nil then
      table.insert(complist,cn)
    end
  end
  
  while #complist>0 do
    local out_list={}
    find_super_shaft(complist[1], complist, out_list)
    table.insert( super_shafts, make_super_shaft( out_list ) )
    --print(#complist)
  end
  
  local unions = make_super_shaft_consolidation_list(super_shafts)
  
  local out_super_shafts = {}
  
  local function combiner( dest, source )
    for cn,_ in pairs(source.components) do
      dest.components[cn] = true
    end
    for en,_ in pairs(source.elements) do
      dest.elements[en] = true
    end
  end
  
  for _,un in ipairs(unions) do
    local first = true
    local theSS
    for _,k in ipairs(un) do
      if first then
        first = false
        theSS = super_shafts[k]
      else
        combiner( theSS, super_shafts[k] )
      end
      super_shafts[k] = nil
    end
    table.insert( out_super_shafts, theSS )
  end
  
  for _,ss in pairs(super_shafts) do
    if ss ~= nil then
      table.insert( out_super_shafts, ss )
    end
  end
  
  return out_super_shafts
end

--               compute_super_shaft_speeds
-- Input:
--    sups - Super Shaft table
--    ci   - machine component of designated speed
--    cs   - speed of ci
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
--
-- Return:
--   A super shaft table.  It has two nested tables:
--      components, elements
--
-- Error: 
--
local function make_super_shaft1( comp_numbers, e2c )
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
    table.remove( e2c, key )
    while changed do
      changed = false
      key, val = next(e2c,nil) 
      while key~=nil do
        if ss_sets_intersect( components, val.comp ) then
          ss_set_combine( components, val.comp )
          sse2c[val.key] = val.comp
          table.remove( e2c, key )
          key, val = next(e2c,nil) 
          changed = true
        else
          key, val = next(e2c,key) 
        end
      end
    end
    table.insert( super_shafts, make_super_shaft1( components, sse2c ) )
  end
  
  return super_shafts
end
