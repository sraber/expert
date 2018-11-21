
rulebase_name = 'Simple Rulebase'
rulebase_id = 'D5038A42-F42B-46BB-84B4-54BBBCECFA93'
rulebase_version = '0.0.1'

rec_rulebase_name = 'Simple Rec Rulebase (no recs)'
rec_rulebase_id = '669998C3-D749-41F5-83E7-910BFBEC468C'
rec_rulebase_version = '0.0.1'


-- **************************************
local function simple_filter_function( fl )
  if fl.my_filter~=nil then return true end
  return false
end

function load_fault_rules(g_fault_rules)
local function rule1() 
  print("Fan Rule 1")
  local rFB = analyze_by_tag( 'FANVNS', 2, 1, 'r' ) 
  if rFB.found == false then return false end
  
  -- Is 1X signifigantly different from average data
  if rFB.dif <= 0 then return false end
  
  assert2increment( 1 )
  return true
end

--NOTE: This rule shows how to use a locally built filter function.
table.insert( g_fault_rules,
  {
  rule=rule1,
  nmrule='Fan Rule 1',
  nmfault='Rotor Balance',
  guid='3ccb277c-c10b-4492-bc6c-3ddefd467267',
  parfault=nil,
  fault='7506ade5-a3d8-4c78-90fc-650dcae59d85',
  shaft='7a129ef6-b295-4dff-b313-96b204fc6114',
  prime=true,
  pri=1,
  ort='h',
  conf=0.6,
  unit_id = Unit.U_CM_SEC.id,
  filter_parameters={
    my_filter={{'a','b'},{'c','d'}}
    },
  filter_function=simple_filter_function
  } 
)

local function pulley_assem_1() 
  print("pulley_assem_1")
  local r1X1 = analyze_by_tag( '1X', 1, 1, 'r' )
  local r1X4 = analyze_by_tag( '1X', 4, 4, 'r' ) 
  
  --if rFB.found == false then return false end
  
  -- Is 1X signifigantly different from average data
  --if rFB.dif <= 0 then return false end
  
  assert2increment( 1 )
  return true
  end

table.insert( g_fault_rules,
  {
  rule=pulley_assem_1,
  nmrule='Composite Rule',
  nmfault='Null',
  guid='00000000-0000-0000-0000-000000000000',
  parfault=nil,
  fault='00000000-0000-0000-0000-000000000000',
  shaft='5833ee2e-2bf9-49ac-b3d6-ee1eb98ca568',
  prime=true,
  pri=1,
  ort='h',
  conf=0.6,
  unit_id = Unit.U_CM_SEC.id
  } 
)

local function pulley_assem_2() 
  print("pulley_assem_2")
  local r1X1 = analyze_by_tag( '1X', 0, 1, 'r',nil,1 )
  local r1X4 = analyze_by_tag( '1X', 0, 4, 'r',nil,2 ) 
  
  -- Is 1X signifigantly different from average data
  if rFB.dif <= 0 then return false end
  
  assert2increment( 1 )
  return true
end

table.insert( g_fault_rules,
  {
  rule=pulley_assem_2,
  nmrule='Composite Rule',
  nmfault='Null',
  guid='00000000-0000-0000-0000-000000000000',
  parfault=nil,
  fault='00000000-0000-0000-0000-000000000000',
  shaft='5833ee2e-2bf9-49ac-b3d6-ee1eb98ca568',
  prime=true,
  pri=1,
  ort='h',
  conf=0.6,
  unit_id = Unit.U_CM_SEC.id
  } 
)


local function fan_rule2() 
  print("Fan Rule 2")

  local flts = get_faults_at_shaft_index( '00000000-0000-0000-0000-000000000000', 1 )
  
  assert1()
  return true
end

table.insert( g_fault_rules,
  {
  rule=fan_rule2,
  nmrule='Fan Rule',
  nmfault='Rotor Balance',
  guid='3ccb277c-c10b-4492-bc6c-3ddefd467267',
  parfault=nil,
  fault='7506ade5-a3d8-4c78-90fc-650dcae59d85',
  shaft='7a129ef6-b295-4dff-b313-96b204fc6114',
  prime=true,
  pri=1,
  ort='h',
  conf=-0.6,
  unit_id = Unit.U_CM_SEC.id
  } 
)

local function motor_rule1() 
  print("Motor Rule 1")
  local rFB = analyze_by_tag( 'FANVNS', 1, 2, 'r' ) 
  --if rFB.found == false then return false end
  
  -- Is 1X signifigantly different from average data
  --if rFB.dif <= 0 then return false end
  
  assert2increment( 1 )
  return true
end

table.insert( g_fault_rules,
  {
  rule=motor_rule1,
  nmrule='Motor Rule 1',
  nmfault='Rotor Balance',
  guid='3ccb277c-c10b-4492-bc6c-3ddefd467267',
  parfault=nil,
  fault='7506ade5-a3d8-4c78-90fc-650dcae59d85',
  shaft='89419b28-6123-4ecb-80dd-41e88cd20fcd',
  prime=true,
  pri=1,
  ort='h',
  conf=0.6,
  unit_id = Unit.U_CM_SEC.id,
-- or 
-- unit_id = Unit.U_CM_SEC.id
  filter_parameters={
    have_attr={{"MFR","SKF"}}
    },
  filter_function=standard_rule_filter
  } 
)


local function motor_rule2() 
  print("Motor Rule 2")
  local flts = get_faults_at_shaft_index( '00000000-0000-0000-0000-000000000000', 2, true )
  
  assert1()
  return true
end

table.insert( g_fault_rules,
  {
  rule=motor_rule2,
  nmrule='Motor Rule 2',
  nmfault='Rotor Balance',
  guid='3ccb277c-c10b-4492-bc6c-3ddefd467267',
  parfault=nil,
  fault='7506ade5-a3d8-4c78-90fc-650dcae59d85',
  shaft='89419b28-6123-4ecb-80dd-41e88cd20fcd',
  prime=true,
  pri=1,
  ort='h',
  conf=-0.6,
  unit_id = Unit.U_CM_SEC.id,
  filter_parameters={
    cat_on_mach={{'C433AB84-F084-47BA-8FE0-18F233CBB1E4','B6C4A041-9D63-46D0-AAA3-666A3C9DF951'}},
    cat_near={{'47F22D7B-BCF6-4FFA-BEC0-30AF1691A7D1','2A8E771C-72BB-40BE-8049-5666DA779125'}} -- mag coupling
    },
  filter_function=standard_rule_filter
  } 
)

local function motor_rule3() 
  print("Motor Rule 3 - Only if bearing is part of the motor")
  
  assert1()
  return true
end

table.insert( g_fault_rules,
  {
  rule=motor_rule3,
  nmrule='Motor Rule 3',
  nmfault='Rotor Balance',
  guid='3ccb277c-c10b-4492-bc6c-3ddefd467267',
  parfault=nil,
  fault='7506ade5-a3d8-4c78-90fc-650dcae59d85',
  shaft='89419b28-6123-4ecb-80dd-41e88cd20fcd',
  prime=true,
  pri=1,
  ort='h',
  conf=-0.6,
  unit_id = Unit.U_CM_SEC.id,
  filter_parameters={
    cat_on_mach={{'C433AB84-F084-47BA-8FE0-18F233CBB1E4','B6C4A041-9D63-46D0-AAA3-666A3C9DF951'}},
    cat_mine={{'EDFB4285-C425-475A-B166-848842A96B41','F114269B-3B51-4E9F-B9A6-3E06ABAB38CD'}}
    },
  filter_function=standard_rule_filter
  } 
)

end

function load_rec_rules(g_rec_rules)
  
end