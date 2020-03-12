-- filter.lua    Rev 5 10/28/19
--    if cp.comp==1 then return {} end -- If composite Do Not Throw ERROR Return FALSE NIL ERW 10/28/2019

-- The # operator only works on arrays.  It's crazy, but a known issue for Lua.
-- Lua is a beautiful language and we can deal with this one small problem.
local function table_count(T)
  local count = 0
  for _ in pairs(T) do count = count + 1 end
  return count
end
-------------------------------------------

-- get_component_map
-- Input:
--    cns - A list of components in searchable format.  Format: {ni=true,nk=true,...}
-- Return:
--    A table of shaft guids in searchable format.
-- Notes:
--
local function get_component_map( cns )
  local shafts={}
  -- There may be more than one like component.
  -- This section makes a set of unique shafts.
  for cn,_ in pairs(cns) do
    local cp = assert( machine.components[cn] )
    shafts[ assert(cp.shaft) ]=true
  end
  return shafts
end

-- get_category_map_from_shafts
-- Input:
--    shafts - A list of component guids in searchable format.  Format: {ni=true,nk=true,...}
-- Return:
--    A table of categories with major category mapped to minor category. 
--    Format: { major guid = {minor guid=true, minor guid=true,..},  ..}
-- Notes:
--
local function get_category_map_from_shafts(shafts)
  local categories={}
  for s,_ in pairs(shafts) do
    local sft = machine.shafts[s]
    if sft.cat1~=nil then
      if categories[sft.cat1]==nil then categories[sft.cat1]={} end
      if sft.cat2~=nil then categories[sft.cat1][sft.cat2]=true end
    end
  end
  return categories
end

-- get_attr_map_from_comps
-- Input:
--    cns - A list of components in searchable format.  Format: {ni=true,nk=true,...}
-- Return:
--    A table of attributes with attribute mapped to one or more values.
--    Format: { att = {value=true, value=true,..},  ..}
-- Notes:
--
local function get_attr_map_from_comps(cns)
  local attrmap={}
  for cn,_ in pairs(cns) do
    local cp = assert( machine.components[cn] )
    for att,val in pairs(cp.attr) do
      if attrmap[att]==nil then attrmap[att]={} end
      attrmap[att][val]=true
    end
  end
  return attrmap
end

-- get_cat_map_from_comps
-- Input:
--    cns - A list of component numbers in searchable format.  Format: {ni=true,nk=true,...}
-- Return:
--    A table of categories with major category mapped to minor category
--    Format: { major guid = {minor guid, minor guid,..}, major guid = { minor guid, ..}, ..}
-- Notes:
--
local function get_cat_map_from_comps( cns )
  return get_category_map_from_shafts( get_component_map(cns)  )
end

-- am_i_part_of_them
-- Input:
--    e1 - Element array.  Unit offset array of machine element indexes.
--    e2 - Element array.  Unit offset array of machine element indexes.
-- Return:
--    True or False
-- Notes:
--    Given the element map of two coponents this function determines
--    if the first one is wholy part of the second.
--
local function am_i_part_of_them( e1, e2 ) 
  local u={}
  for _,c in ipairs(e1) do u[c]=true end
  for _,c in ipairs(e2) do u[c]=true end
  return (#e2==table_count(u))
end

-- are_they_part_of_me
-- Input:
--    e1 - Element array.  Unit offset array of machine element indexes.
--    e2 - Element array.  Unit offset array of machine element indexes.
-- Return:
--    True or False
-- Notes:
--    Given the element map of two coponents this function determines
--    if the first one completly encloses the second.
--
local function are_they_part_of_me( e1, e2 ) 
  local u={}
  for _,c in ipairs(e1) do u[c]=true end
  for _,c in ipairs(e2) do u[c]=true end
  return (#e1==table_count(u))
end

-- get_component_possess
-- Input:
--    eles - Element array.  Unit offset array of machine element indexes.
--           Presumably the elements of the current component.
--    cns - A list of component numbers in searchable format.  Format: {ni=true,nk=true,...}
--    test_function - A test function from above: am_i_part_of_them or are_they_part_of_me
-- Return:
--    A table of component guids in searchable format. 
--    Format: { guid=true, guid=true,.. }
-- Notes:
--
local function get_component_possess( eles, cns, test_function )
  local shafts={}
  -- There may be more than one like component.
  -- This section makes a set of unique shafts.
  for cn,_ in pairs(cns) do
    local cp = assert( machine.components[cn] )
    if test_function(eles, cp.map) then
      shafts[ assert(cp.shaft) ]=true
    end
  end
  return shafts
end

-- get_component_possess_array
-- Input:
--    eles - Element array.  Unit offset array of machine element indexes.
--           Presumably the elements of the current component.
--    cns - A list of component numbers in searchable format.  Format: {ni=true,nk=true,...}
--    test_function - A test function from above: am_i_part_of_them or are_they_part_of_me
-- Return:
--    A table of component numbers in searchable format. 
--    Format: { 3=true, 4=true,.. }
-- Notes:
--
local function get_component_possess_array( eles, cns, test_function )
  local comps={}
  -- There may be more than one like component.
  -- This function returns them all by component number.
  for cn,_ in pairs(cns) do
    local cp = assert( machine.components[cn] )
    if test_function(eles, cp.map) then
      comps[ cn ]=true
    end
  end
  return comps
end

-- get_category_possess_map
-- Input:
--    eles - Element array.  Unit offset array of machine element indexes.
--           Presumably the elements of the current component.
--    cns - A list of component numbers in searchable format.  Format: {ni=true,nk=true,...}
--    test_function - A test function from above: am_i_part_of_them or are_they_part_of_me
-- Return:
--    A table of categories with major category mapped to minor category. 
--    Format: { major guid = {minor guid, minor guid,..}, major guid = { minor guid, ..}, ..}
-- Notes:
--
local function get_category_possess_map( eles, cns, test_function )
  return get_category_map_from_shafts( get_component_possess(eles, cns, test_function)  )
end

-- get_attr_possess_map
-- Input:
--    eles - Element array.  Unit offset array of machine element indexes.
--           Presumably the elements of the current component.
--    cns - A list of component numbers in searchable format.  Format: {ni=true,nk=true,...}
--    test_function - A test function from above: am_i_part_of_them or are_they_part_of_me
-- Return:
--    A table of attributes with attribute mapped to one or more values.
--    Format: { att = {value=true, value=true,..},  ..}
-- Notes:
--
local function get_attr_possess_map( eles, cns, test_function )
  return get_attr_map_from_comps( get_component_possess(eles, cns, test_function)  )
end

-- get_category_map_from_machine
-- Input:
--
-- Return:
--    A table of categories with major category mapped to minor category. 
--    Format: { major guid = {minor guid=true, minor guid=true,..}, major guid = { minor guid=true, ..}, ..}
-- Notes:
--
local function get_category_map_from_machine()
  local categories={}
  for _,sft in pairs(machine.shafts) do
    if sft.cat1~=nil then
      if categories[sft.cat1]==nil then categories[sft.cat1]={} end
      if sft.cat2~=nil then categories[sft.cat1][sft.cat2]=true end
    end
  end
  return categories
end

-- get_attr_map_from_machine
-- Input:
--
-- Return:
--    A table of categories with major category mapped to minor category. 
--    Format: { major guid = {minor guid, minor guid,..}, major guid = { minor guid, ..}, ..}
-- Notes:
--
local function get_attr_map_from_machine()
  local attrmap={}
  for _,cp in ipairs(machine.components) do
    for att,val in pairs(cp.attr) do
      if attrmap[att]==nil then attrmap[att]={} end
      attrmap[att][val]=true
    end
  end
  return attrmap
end

--=============================== Component Filter Functions ========================================
-- comp_filter
-- Input:
--    comps  - A component list in searchable format.  {guid=true,guid=true,...}
--    filter - A component list.  Format: {guid,guid,guid,..}
-- Return:
--    true or false
-- Notes:
--    Determines if any components in the filter are in the comps list.
--    This is a helper function.
--    
--
local function comp_filter( comps, filter )
  for _,cp in pairs(filter) do
    if comps[ cp ]==true then
      return true
    end
  end
  return false
end

-- is_comp_on_mach
-- Input:
--    component_filter - A component list.  Format: {guid,guid,guid,..}
-- Return:
--    true or false
-- Notes:
--    The function determines if any component in the list is part of the machine class.
--    
--
local function is_comp_on_mach( component_filter )
  if component_filter~=nil then
    for _,cp in pairs(component_filter) do
      if machine.shafts[ cp ]~=nil then
        return true
      end
    end
    return false
  end
  return true
end

-- is_comp_on_line
-- Input:
--    component_filter - A component list.  Format: {guid,guid,guid,..}
-- Return:
--    true or false
-- Notes:
--    The function must determine the super shaft that the current component belongs to
--    then search that super shaft for components meeting the conditions of the component
--    filter.
--
local function is_comp_on_line( component_filter )
  if component_filter~=nil and g_super_shaft_number~=nil then
    local ss = assert( machine.supershafts[g_super_shaft_number], "Parameter Error: Incorrect Super Shaft index" )
    return comp_filter( get_component_map(ss.components), component_filter)
  end
  return true
end

-- is_comp_near
-- Input:
--    component_filter - A component list.  Format: {guid,guid,guid,..}
-- Return:
--    true or false
-- Notes:
--    The function must determine the super shaft that the current component belongs to
--    then search that super shaft for near-by components meeting the conditions of the component
--    filter.
--
local function is_comp_near( component_filter )
  if component_filter~=nil and g_super_shaft_number~=nil then
    local ss = assert( machine.supershafts[g_super_shaft_number], "Parameter Error: Incorrect Super Shaft index." )
    return comp_filter( get_component_map( assert( ss.c_to_c[g_shaft_number], "Parameter Error: Component number not on super shaft." ) ),
                         component_filter)
  end
  return true
end

-- is_comp_mine
-- Input:
--    cats - A category list.  Format: {{guid,guid},{guid,guid}}
-- Return:
--    true or false
-- Notes:
--    The function must determine which components, if any, are completely overlapped
--    by the current component. This would typically be used to find the bearings that
--    are part of the current component.
--
local function is_comp_mine( component_filter )
  if component_filter~=nil and g_super_shaft_number~=nil then
    local ss = assert( machine.supershafts[g_super_shaft_number], "Parameter Error: Incorrect Super Shaft index." )
    return comp_filter( get_component_possess(  machine.components[g_shaft_number].map, 
                                              assert( ss.c_to_c[g_shaft_number], "Parameter Error: Component number not on super shaft." ),
                                              are_they_part_of_me
                                            ),
                         component_filter )
  end
  return true
end

-- am_part_of_comp
-- Input:
--    cats - A category list.  Format: {{guid,guid},{guid,guid}}
-- Return:
--    true or false
-- Notes:
--    The function must determine which components, if any, completely overlapped
--    the current component. This would typically be used by a bearing rule to find
--    which component it belongs to.
--
local function am_part_of_comp( component_filter )
  if component_filter~=nil and g_super_shaft_number~=nil then
    local ss = assert( machine.supershafts[g_super_shaft_number], "Parameter Error: Incorrect Super Shaft index." )
    return comp_filter( get_component_possess(  machine.components[g_shaft_number].map, 
                                              assert( ss.c_to_c[g_shaft_number], "Parameter Error: Component number not on super shaft." ),
                                              am_i_part_of_them
                                            ),
                         component_filter )
  end
  return true
end
--=========================== End Component Filter Functions 

--=============================== Category Filter Functions ========================================
--
-- cat_filter
-- Input:
--    catmap - A category map.  --    Format: { major guid = {minor guid=true, minor guid=true,..}, ..}
--    filter - A category list.  Format: {{guid,guid},{guid,guid}}
-- Return:
--    true or false
-- Notes:
--    Determines if any categories in the filter are in the category list.
--    This is a helper function.
--    
--
local function cat_filter( catmap, filter )
  for _,cp in pairs(filter) do
    if cp[1]~=nil and catmap[ cp[1] ]~=nil then
      if cp[2]==nil then
        return true
      elseif catmap[ cp[1] ][cp[2]] then
        return true
      end
    end
  end
  return false
end

-- is_comp_of_cat_on_mach
-- Input:
--    cats - A category list.  Format: {{guid,guid},{guid,guid}}
-- Return:
--    true or false
-- Notes:
--    The function determines if any component of the machine class meets
--    the conditions of the category filter.  
--
local function is_comp_of_cat_on_mach( cats )
  if cats~=nil then
    return cat_filter( get_category_map_from_machine(), cats )
  end
  return true
  end

-- is_comp_of_cat_on_line
-- Input:
--    cats - A category list.  Format: {{guid,guid},{guid,guid}}
-- Return:
--    true or false
-- Notes:
--    The function must determine the super shaft that the current component belongs to
--    then search that super shaft for components meeting the conditions of the category
--    filter.
--
local function is_comp_of_cat_on_line( cats )
  if g_super_shaft_number==nil then return true end
  if cats~=nil then
    local ss = assert( machine.supershafts[g_super_shaft_number], "Parameter Error: Incorrect Super Shaft index" )
    return cat_filter( get_cat_map_from_comps(ss.components), cats )
  end
  -- If no categories to test, then return true
  return true
end

-- is_comp_of_cat_near
-- Input:
--    cats - A category list.  Format: {{guid,guid},{guid,guid}}
-- Return:
--    true or false
-- Notes:
--    The function must determine the super shaft that the current component belongs to
--    then search that super shaft for components meeting the conditions of the category
--    filter.
--
local function is_comp_of_cat_near( cats )
  if g_super_shaft_number==nil then return true end
  if cats~=nil then
    local ss = assert( machine.supershafts[g_super_shaft_number], "Parameter Error: Incorrect Super Shaft index." )
    return cat_filter( get_cat_map_from_comps( assert( ss.c_to_c[g_shaft_number], "Parameter Error: Component number not on super shaft." ) ), 
                       cats )
  end
  -- If no categories to test, then return true
  return true
end

-- is_comp_of_cat_mine
-- Input:
--    cats - A category list.  Format: {{guid,guid},{guid,guid}}
-- Return:
--    true or false
-- Notes:
--    The function must determine which components, if any, are completely overlapped
--    by the current component. This would typically be used to find the bearings that
--    are part of the current component.
--
local function is_comp_of_cat_mine( cats )
  if g_super_shaft_number==nil then return true end
  if cats~=nil then
    local ss = assert( machine.supershafts[g_super_shaft_number], "Parameter Error: Incorrect Super Shaft index." )
    return cat_filter(  get_category_possess_map(  machine.components[g_shaft_number].map, 
                                                    assert( ss.c_to_c[g_shaft_number], "Parameter Error: Component number not on super shaft." ),
                                                    are_they_part_of_me
                                                  ), 
                       cats )
  end
  -- If no categories to test, then return true
  return true
end

-- am_part_of_comp_of_cat
-- Input:
--    cats - A category list.  Format: {{guid,guid},{guid,guid}}
-- Return:
--    true or false
-- Notes:
--    The function must determine which components, if any, completely overlapped
--    the current component. This would typically be used by a bearing rule to find
--    which component it belongs to.
--
local function am_part_of_comp_of_cat( cats )
  if g_super_shaft_number==nil then return true end
  if cats~=nil then
    local ss = assert( machine.supershafts[g_super_shaft_number], "Parameter Error: Incorrect Super Shaft index." )
    return cat_filter(  get_category_possess_map(  machine.components[g_shaft_number].map, 
                                                    assert( ss.c_to_c[g_shaft_number], "Parameter Error: Component number not on super shaft." ),
                                                    am_i_part_of_them
                                                  ), 
                       cats )
  end
  -- If no categories to test, then return true
  return true
end
--=========================== End Category Filter Functions ========================================

--=============================== Attribute Filter Functions ========================================

--
-- attr_filter
-- Input:
--    attmap - An attribute map.  Format: { att={val=true,val=true,..},... }
--    filter - A attribute list.  Format: {{att,val},{att,val}}
-- Return:
--    true or false
-- Notes:
--    Determines if any att/val pair in the filter are in the attribute map.
--    This is a helper function.
--    
--
local function attr_filter( attmap, filter )
  for _,ap in pairs(filter) do
    local arg1 = assert( ap[1], "Error: Rule filter format" )
    local arg2 = assert( ap[2], "Error: Rule filter format" )
    if attmap[arg1]~=nil and attmap[arg1][arg2]==true then
      return true
    end
  end
  return false
end

-- is_comp_attr_on_mach
-- Input:
--    atts - A attribute list.  Format: {{att,val},{att,val}}
-- Return:
--    true or false
-- Notes:
--    The function determines if any component of the machine class meets
--    the conditions of the attribute filter.  
--
local function is_comp_attr_on_mach( atts )
  if atts~=nil then
    return attr_filter( get_attr_map_from_machine(), atts )
  end
  return true
end

-- have_attr
-- Input:
--    atts - A attribute list.  Format: {{att,val},{att,val}}
-- Return:
--    true or false
-- Notes:
--    The function determines the current component and asks if it
--    meets the conditions of the attribute filter.  
--
local function have_attr( atts )
  if g_super_shaft_number==nil then return true end
  if atts~=nil then
    return attr_filter( get_attr_map_from_comps( {[g_shaft_number]=true} ), atts )
  end
  return true
end

-- is_comp_attr_on_line
-- Input:
--    atts - A attribute list.  Format: {{att,val},{att,val}}
-- Return:
--    true or false
-- Notes:
--    The function must determine the super shaft that the current component belongs to
--    then search that super shaft for components meeting the conditions of the attribute
--    filter.
--
local function is_comp_attr_on_line( atts )
  if g_super_shaft_number==nil then return true end
  if atts~=nil then
    local ss = assert( machine.supershafts[g_super_shaft_number], "Parameter Error: Incorrect Super Shaft index" )
    return attr_filter( get_attr_map_from_comps(ss.components), atts )
  end
  return true
end

-- is_comp_attr_near
-- Input:
--    atts - A attribute list.  Format: {{att,val},{att,val}}
-- Return:
--    true or false
-- Notes:
--    The function must determine the super shaft that the current component belongs to
--    then search that super shaft for components meeting the conditions of the attribute
--    filter.
--
local function is_comp_attr_near( atts )
  if g_super_shaft_number==nil then return true end
  if atts~=nil then
    local ss = assert( machine.supershafts[g_super_shaft_number], "Parameter Error: Incorrect Super Shaft index." )
    return attr_filter( get_attr_map_from_comps( assert( ss.c_to_c[g_shaft_number], "Parameter Error: Component number not on super shaft." ) ), 
                       atts )
  end
  return true
end

-- is_comp_attr_mine
-- Input:
--    atts - A attribute list.  Format: {{att,val},{att,val}}
-- Return:
--    true or false
-- Notes:
--    The function must determine which components, if any, are completely overlapped
--    by the current component. This would typically be used to find the bearings that
--    are part of the current component.
--
local function is_comp_attr_mine( atts )
  if g_super_shaft_number==nil then return true end
  if atts~=nil then
    local ss = assert( machine.supershafts[g_super_shaft_number], "Parameter Error: Incorrect Super Shaft index." )
    return attr_filter(  get_attr_possess_map(  machine.components[g_shaft_number].map, 
                                                    assert( ss.c_to_c[g_shaft_number], "Parameter Error: Component number not on super shaft." ),
                                                    are_they_part_of_me
                                                  ), 
                       atts )
  end
  return true
end

-- am_part_of_comp_attr
-- Input:
--    atts - A attribute list.  Format: {{att,val},{att,val}}
-- Return:
--    true or false
-- Notes:
--    The function must determine which components, if any, completely overlapped
--    the current component. This would typically be used by a bearing rule to find
--    which component it belongs to.
--
local function am_part_of_comp_attr( atts )
  if g_super_shaft_number==nil then return true end
  if atts~=nil then
    local ss = assert( machine.supershafts[g_super_shaft_number], "Parameter Error: Incorrect Super Shaft index." )
    return attr_filter(  get_attr_possess_map(  machine.components[g_shaft_number].map, 
                                                    assert( ss.c_to_c[g_shaft_number], "Parameter Error: Component number not on super shaft." ),
                                                    am_i_part_of_them
                                                  ), 
                       atts )
  end
  return true
end

--============================End Attribute Filter Functions ========================================

function standard_rule_filter( fl )
  if fl.cat_on_mach~=nil      and is_comp_of_cat_on_mach(fl.cat_on_mach)==false     then return false end
  if fl.not_cat_on_mach~=nil  and is_comp_of_cat_on_mach(fl.not_cat_on_mach)==true  then return false end
  if fl.cat_on_line~=nil      and is_comp_of_cat_on_line(fl.cat_on_line)==false     then return false end
  if fl.not_cat_on_line~=nil  and is_comp_of_cat_on_line(fl.not_cat_on_line)==true  then return false end
  if fl.cat_near~=nil         and is_comp_of_cat_near(fl.cat_near)==false           then return false end
  if fl.not_cat_near~=nil     and is_comp_of_cat_near(fl.not_cat_near)==true        then return false end
  if fl.cat_mine~=nil         and is_comp_of_cat_mine(fl.cat_mine)==false           then return false end
  if fl.not_cat_mine~=nil     and is_comp_of_cat_mine(fl.not_cat_mine)==true        then return false end
  if fl.part_of_cat~=nil      and am_part_of_comp_of_cat(fl.part_of_cat)==false     then return false end
  if fl.not_part_of_cat~=nil  and am_part_of_comp_of_cat(fl.not_part_of_cat)==true  then return false end
  
  if fl.have_attr~=nil         and have_attr(fl.have_attr)==false                   then return false end
  if fl.not_have_attr~=nil     and have_attr(fl.not_have_attr)==true                then return false end
  if fl.attr_on_mach~=nil      and is_comp_attr_on_mach(fl.attr_on_mach)==false     then return false end
  if fl.not_attr_on_mach~=nil  and is_comp_attr_on_mach(fl.not_attr_on_mach)==true  then return false end
  if fl.attr_on_line~=nil      and is_comp_attr_on_line(fl.attr_on_line)==false     then return false end
  if fl.not_attr_on_line~=nil  and is_comp_attr_on_line(fl.not_attr_on_line)==true  then return false end
  if fl.attr_near~=nil         and is_comp_attr_near(fl.attr_near)==false           then return false end
  if fl.not_attr_near~=nil     and is_comp_attr_near(fl.not_attr_near)==true        then return false end
  if fl.attr_mine~=nil         and is_comp_attr_mine(fl.attr_mine)==false           then return false end
  if fl.not_attr_mine~=nil     and is_comp_attr_mine(fl.not_attr_mine)==true        then return false end
  if fl.part_of_attr~=nil      and am_part_of_comp_attr(fl.part_of_attr)==false     then return false end
  if fl.not_part_of_attr~=nil  and am_part_of_comp_attr(fl.not_part_of_attr)==true  then return false end
  
  if fl.comp_on_mach~=nil     and is_comp_on_mach(fl.comp_on_mach)==false           then return false end
  if fl.not_comp_on_mach~=nil and is_comp_on_mach(fl.not_comp_on_mach)==true        then return false end
  if fl.comp_on_line~=nil     and is_comp_on_line(fl.comp_on_line)==false           then return false end
  if fl.not_comp_on_line~=nil and is_comp_on_line(fl.not_comp_on_line)==true        then return false end
  if fl.comp_near~=nil        and is_comp_near(fl.comp_near)==false                 then return false end
  if fl.not_comp_near~=nil    and is_comp_near(fl.not_comp_near)==true              then return false end
  if fl.comp_mine~=nil        and is_comp_mine(fl.comp_mine)==false                 then return false end
  if fl.not_comp_mine~=nil    and is_comp_mine(fl.not_comp_mine)==true              then return false end
  if fl.part_of_comp~=nil     and am_part_of_comp(fl.part_of_comp)==false           then return false end
  if fl.not_part_of_comp~=nil and am_part_of_comp(fl.not_part_of_comp)==true        then return false end

  return true
end

--====================== Global Filter Functions ==========================
--

-- get_comps_on_line
-- Input:
--    comp_number - [optional] A component number.
-- Return:
--    A table of shaft guids in searchable format. 
--    Format: { guid=true, guid=true,.. }
-- Notes:
--    The return is a list of unique shaft guids that are on the same
--    super shaft as the input component.
-- Errors:
--    It will return an error if called on a composite.
--
function get_comps_on_line( comp_number )
  local cn = comp_number or g_shaft_number
  local cp = assert( machine.components[cn], "Parameter Error: Component number not valid." )
    if cp.comp==1 then return {} end -- If composite Do Not Throw ERROR Return FALSE NIL ERW 10/28/2019
  check_arg( cp.comp == 0, "get_comps_on_line not allowed to be called on a composite component." )
  local ssi = find_super_shaft_with_component( machine.supershafts, cn )
  check_arg( ssi>0, "Machine Component Number: "..cn.." was not found in any super shaft" )
  local ss = machine.supershafts[ssi]
  return get_component_map(ss.components)
end

-- get_comps_on_line_array
-- Input:
--    comp_number - [optional] A component number.
-- Return:
--    A table of component guids in searchable format. 
--    Format: { [cn]=true, [cn]=true,.. }
-- Notes:
--    The return is a list of component numbers that are on the same
--    super shaft as the input component.
-- Errors:
--    It will return an error if called on a composite.
--
function get_comps_on_line_array( comp_number )
  local cn = comp_number or g_shaft_number
  local cp = assert( machine.components[cn], "Parameter Error: Component number not valid." )
    if cp.comp==1 then return {} end -- If composite Do Not Throw ERROR Return FALSE NIL ERW 10/28/2019
  check_arg( cp.comp == 0, "get_comps_on_line not allowed to be called on a composite component." ) -- if not composite error 9/5/19 DY
  local ssi = find_super_shaft_with_component( machine.supershafts, cn )
  check_arg( ssi>0, "Machine Component Number: "..cn.." was not found in any super shaft" )
  local ss = machine.supershafts[ssi]
  return ss.components
end

-- get_comps_near
-- Input:
--    comp_number - [optional] A component number.
-- Return:
--    A table of component guids in searchable format. 
--    Format: { guid=true, guid=true,.. }
-- Notes:
--
function get_comps_near( comp_number )
  local cn = comp_number or g_shaft_number
  local cp = assert( machine.components[cn], "Parameter Error: Component number not valid." )
  if cp.comp > 0 then
    local results = {}
    for _, cpcn in ipairs(cp.cmap) do
      local res = get_comps_near( cpcn )
      for k,v in pairs(res) do
        results[k] = v
      end
    end
    return results
  else
    local ssi = find_super_shaft_with_component( machine.supershafts, cn )
    check_arg( ssi>0, "Machine Component Number: "..cn.." was not found in any super shaft" )
    local ss = machine.supershafts[ssi]
    return get_component_map( assert( ss.c_to_c[cn], "Parameter Error: Component number not on super shaft." ) )
  end
end

-- get_comps_near_array
-- Input:
--    comp_number - [optional] A component number.
-- Return:
--    A table of component guids in searchable format. 
--    Format: { [2]=true, [4]=true,.. }
-- Notes:
--
function get_comps_near_array( comp_number )
  local cn = comp_number or g_shaft_number
  local cp = assert( machine.components[cn], "Parameter Error: Component number not valid." )
  if cp.comp > 0 then
    local results = {}
    for _, cpcn in ipairs(cp.cmap) do
      local res = get_comps_near_array( cpcn )
      for k,v in pairs(res) do
        results[k] = v
      end
    end
    return results
  else
    local ssi = find_super_shaft_with_component( machine.supershafts, cn )
    check_arg( ssi>0, "Machine Component Number: "..cn.." was not found in any super shaft" )
    local ss = machine.supershafts[ssi]
    return assert( ss.c_to_c[cn], "Parameter Error: Component number not on super shaft." )
  end
end

-- get_comps_mine
-- Input:
--    comp_number - [optional] A component number.
-- Return:
--    A table of component guids in searchable format. 
--    Format: { guid=true, guid=true,.. }
-- Notes:
--
function get_comps_mine( comp_number )
  local cn = comp_number or g_shaft_number
  local cp = assert( machine.components[cn], "Parameter Error: Component number not valid." )
  if cp.comp > 0 then
    local results = {}
    for _, cpcn in ipairs(cp.cmap) do
      local res = get_comps_mine( cpcn )
      for k,v in pairs(res) do
        results[k] = v
      end
    end
    return results
  else
    local ssi = find_super_shaft_with_component( machine.supershafts, cn )
    check_arg( ssi>0, "Machine Component Number: "..cn.." was not found in any super shaft" )
    local ss = machine.supershafts[ssi]
    return get_component_possess(  machine.components[cn].map, 
                                   assert( ss.c_to_c[cn], "Parameter Error: Component number not on super shaft." ),
                                   are_they_part_of_me
                                )
  end
end

-- get_comps_mine_array
-- Input:
--    comp_number - [optional] A component number.
-- Return:
--    A table of component guids in searchable format. 
--    Format: { [2]=true, [4]=true,.. }
-- Notes:
--
function get_comps_mine_array( comp_number )
  local cn = comp_number or g_shaft_number
  local cp = assert( machine.components[cn], "Parameter Error: Component number not valid." )
  if cp.comp > 0 then
    local results = {}
    for _, cpcn in ipairs(cp.cmap) do
      local res = get_comps_mine_array( cpcn )
      for k,v in pairs(res) do
        results[k] = v
      end
    end
    return results
  else
    local ssi = find_super_shaft_with_component( machine.supershafts, cn )
    check_arg( ssi>0, "Machine Component Number: "..cn.." was not found in any super shaft" )
    local ss = machine.supershafts[ssi]
    return get_component_possess_array(  machine.components[cn].map, 
                                   assert( ss.c_to_c[cn], "Parameter Error: Component number not on super shaft." ),
                                   are_they_part_of_me
                                )
  end
end