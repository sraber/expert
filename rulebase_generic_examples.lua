rulebase_unit_id = 27 --VdB
g_fault_rules={}

local shaft_guid
local fault_guid
local primary_rule
local rule_guid
--======================================================================================================================
--                                            MOTOR rules
shaft_guid = "F82DBB79-B5DF-46F5-8AFE-2F1EF9B02971"
--
--          Component Layout
--  1        2         3         4
-- Fan -- bearing -- rotor -- bearing
--

--************************************
--   Begin rules to identify rotor stator problem
fault_guid = "MOTOR_STATOR_ROTOR_FAULT"
--
-- Look for 2*linef
--
-- Make a generic rule that can be used to check for 
-- pole pass frequency on electric motor.
-- This function will work with any electric motor, doesn't matter how many fans
-- or where the bearings are.  This function only needs to be passed the index of
-- the rotor and the index of the pickup.
--
function PolePassFrequencyCheck(rotor,pickup, axis)
  local poles = get_attribute_value( "POLES", rotor )
  local rFL = find_frequency_info( poles * machine.linef, pickup, axis )
  if rFL.found then
                -- VdB
    if rFL.value > 100 then
      -- assert2 tells the system that the fault this rule is written for exists 
      -- and its parameter specifies the value that should be associated with the
      -- severity of the fault.
      -- I just made up this value, but it could be as simple as a 0 to 10 scale.
      -- 0 being no severity and 10 being the worst.
      assert2(5)
      return true
    end
  end
  return false
end


--*************************************
--        Rule
-- Check for Pole Pass Frequency - b1 - radial
primary_rule = true
rule_guid = "G-rulePPF1r"

function rulePPF1r()
  -- Note: You don't need to define these variables.  They make the
  --       code clearer, but are not needed.  The numbers could be entered
  --       directly into the function call.
  local b1 = 2
  local b2 = 4
  local rotor = 3
  return PolePassFrequencyCheck(rotor,b1,"r")
end
table.insert( g_fault_rules, {rule=rulePPF1r,guid=rule_guid,fault=fault_guid,shaft=shaft_guid,prime=primary_rule,pri=1,ort='h',conf=0.6,AS=nil,RS=nil,NS=nil,attpar=nil} )

--*************************************
--        Rule
-- Check for Pole Pass Frequency on bearing 1 - Tangential
primary_rule = true
rule_guid = "G-rulePPF1t"

function rulePPF1t()
  local b1 = 2
  local b2 = 4
  local rotor = 3
  return PolePassFrequencyCheck(rotor,b1,"t")
end
table.insert( g_fault_rules, {rule=rulePPF1t,guid=rule_guid,fault=fault_guid,shaft=shaft_guid,prime=primary_rule,pri=1,ort='h',conf=0.6,AS=nil,RS=nil,NS=nil,attpar=nil} )
--*************************************
--        Rule
-- Check for Pole Pass Frequency - b2 - radial
primary_rule = true
rule_guid = "G-rulePPF2r"

function rulePPF2r()
  local b1 = 2
  local b2 = 4
  local rotor = 3
  return PolePassFrequencyCheck(rotor,b2,"r")
end
table.insert( g_fault_rules, {rule=rulePPF2r,guid=rule_guid,fault=fault_guid,shaft=shaft_guid,prime=primary_rule,pri=1,ort='h',conf=0.6,AS=nil,RS=nil,NS=nil,attpar=nil} )

--*************************************
--        Rule
-- Check for Pole Pass Frequency on bearing 2 - Tangential
primary_rule = true
rule_guid = "G-rulePPF2t"

function rulePPF2t()
  local b1 = 2
  local b2 = 4
  local rotor = 3
  local poles = get_attribute_value( "POLES", rotor )
  return PolePassFrequencyCheck(rotor,b2,"t")
end
table.insert( g_fault_rules, {rule=rulePPF2t,guid=rule_guid,fault=fault_guid,shaft=shaft_guid,prime=primary_rule,pri=1,ort='h',conf=0.6,AS=nil,RS=nil,NS=nil,attpar=nil} )
--
--        End of rotor stator diagnosis
--***************************************************************************************************************

--===============================================================================================================
--                                            Coupling rules
--
--*************************************************************************
--        Generic Rule Family to check for angular misalignment
--*************************************************************************
-- Check for high 1X and 2X - pickup - axis
function CheckAngularMisalign(coupling,pickup,axis)  
  local r1X = analyze_by_tag( "1X", coupling, pickup, axis ) 
  if r1X.found == false then return false end
  
  -- Is 1X signifigantly different from average data
  if r1X.dif < 3 then return false end
  
  -- Use Harmonic analyser to find 2X.
  local r1XH = analyze_harmonic_by_tag( "1X", coupling, pickup, axis ) 
  
  if r1XH.found == false then return false end
  -- Did we find the 2nd order harmonic
  if r1XH.matches[1].order ~= 2 then return false end
  -- The difference between 1X and 2X should be small.
  local dif = math.abs( r1X.sval - r1XH.matches[1].sval )
  if dif > 3 then return false end
   
  put_store_value( "CheckForHigh1X2X_r1X1", r1X )
  put_store_value( "CheckForHigh1X2X_r2X1", r1XH.matches[1] )
  increment_store_counter("CheckForHigh1X2X_Count")
  
  local severity
  if r1X.dif > 20 then severity = 10 
  elseif r1X.dif > 10 then severity = 5 
  elseif r1X.dif > 6 then severity = 2 
  else severity = 1
  end
  assert2increment(severity)
  return true
end

--********************************************************************
--        Generic Rule - Secondary
--********************************************************************
function CheckAngularMisalign_Second()  
  local check, r1X1, r2X1, r1X2, r2X2
  check, r1X1 = get_store_value( "r1X1" )
  if check==false then return false end
  
  check, r2X1 = get_store_value( "r1X1" )  
  if check==false then return false end 
  
  check, r1X2 = get_store_value( "r1X2" )
  if check==false then return false end
  
  check, r2X2 = get_store_value( "r1X2" )  
  if check==false then return false end 
  
  if math.abs(r1X1.sval-r1X2.sval) > 3 or
     math.abs(r2X1.sval-r2X2.sval) > 3 then return false end

  -- Success, elevate confidence
  assert1()
  return true
end

--********************************************************************
--        Generic Rule - Finish
--********************************************************************
-- This function normalizes the severity value.  It always passes,
-- it is not really a rule, thought it is called like one,
-- it is clean-up code.  It must be set at a lower priority then
-- the evaulation rules to work right.
--
function CheckAngularMisalign_Finish(coupling,pickup,axis)  
  local count = get_store_value("CheckForHigh1X2X_Count")
  -- If count is 2 then there is nothing to do.  It will not be zero,
  -- this code won't be called if count is zero.
  if count < 2 then
    local check,fault = get_fault()
    -- The fault should be there, this step really is not necessary.
    if check then
      local severity = 2 * fault.severity
      assert2(severity)
    end
  end
  return true
end
--
--
shaft_guid = "A4BE8A7C-3AED-4B18-B87D-C229FBC415B8"
--
--          Component Layout
--    1          2          3
-- bearing -- coupling -- bearing
--

--************************************
--   Begin rules for coupling angular misalignment problem
fault_guid = "COUPLING_MISALIGN_ANGULAR_FAULT"

-- Angular misalignement often characterized by high 1X and 2X in the axial direction
-- and 180 deg out of phase accross the coupling.  (We cannot detect phase currently)
--
-- Look for high axial 1X and 2X with the amplitude of 2X being roughly equal to 1X.
-- If the above criterion occurs on both sides of the coupling then confidence is raised.

--*************************************
--        Rule
-- Check for high 1X and 2X - b1 - axial
primary_rule = true
rule_guid = "G-ruleMA1"

function ruleMA1()  
  local b1 = 1
  local b2 = 3
  local coupling = 2
  return CheckAngularMisalign(coupling, b1, "a")
end
table.insert( g_fault_rules, {rule=ruleMA1,guid=rule_guid,fault=fault_guid,shaft=shaft_guid,prime=primary_rule,pri=1,ort='h',conf=0.6,AS=nil,RS=nil,NS=nil,attpar=nil} )

--*************************************
--        Rule
-- Check for high 1X and 2X - b2 - axial
primary_rule = true
rule_guid = "G-ruleMA2"

function ruleMA2()  
  local b1 = 1
  local b2 = 3
  local coupling = 2
  return CheckAngularMisalign(coupling, b2, "a")
end
table.insert( g_fault_rules, {rule=ruleMA2,guid=rule_guid,fault=fault_guid,shaft=shaft_guid,prime=primary_rule,pri=1,ort='h',conf=0.6,AS=nil,RS=nil,NS=nil,attpar=nil} )

--*************************************
--        Rule
-- Check to see if 1X and 2X are near equal across the coupling.  Requires data from both sides.
primary_rule = false
rule_guid = "G-ruleMAs"

function ruleMAs()  
  return CheckAngularMisalign_Second()
end
table.insert( g_fault_rules, {rule=ruleMAs,guid=rule_guid,fault=fault_guid,shaft=shaft_guid,prime=primary_rule,pri=1,ort='h',conf=0.8,AS=nil,RS=nil,NS=nil,attpar=nil} )

--*************************************
--        Rule
-- Clean up rule.
-- Lower priority (set pri parameter to 2 in table.insert call below)

primary_rule = false
rule_guid = "G-ruleMAf"

function ruleMAf()  
  return CheckAngularMisalign_Second()
end
table.insert( g_fault_rules, {rule=ruleMAs,guid=rule_guid,fault=fault_guid,shaft=shaft_guid,prime=primary_rule,pri=2,ort='h',conf=0.8,AS=nil,RS=nil,NS=nil,attpar=nil} )

--
--        End of angular misalignment diagnosis
--***************************************************************************************************************
