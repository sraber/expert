rulebase_name ='Test Rule Base 2'
rulebase_id = 'B40E3287-6E49-4651-82D0-A77E5A8837E1'
rulebase_version ='1.0.0'

function get_family_info( id, fn_family_info )
  print( "get_family_info call for id: " .. id )
  local check, o = get_store_value( id )
  if check==false then
    print( "created instance for id: " .. id )
    o = fn_family_info()
    put_store_value( id, o )
  end
  return o    
end

--======================================================================================================================
--                                            Test Fan rule
--
--          Component Layout
--    1        2
-- bearing -- fan
--
--************************************

function create_tag_exceedance_info() 
  return { called=0, passed=0 }
end
function tag_exceedance_called(info)
  info.called = info.called + 1
end
function tag_exceedance_passed(info)
  info.passed = info.passed + 1
end
function tag_exceedance_name()
  return "tag_exceedance"
end

function tag_exceedance( tag_index, tag, data_index, axis )
  local info = get_family_info( g_fault .. tag_exceedance_name(), create_tag_exceedance_info ) -- Many ways to identify this instance
  tag_exceedance_called(info)
  local res = analyze_by_tag( tag, tag_index, data_index, axis ) 
  tag_exceedance_passed(info)
  if res.found == false then return false end
  
  local severity = 0
  if res.pct >= 1.0 then severity = 10 
  elseif res.pct >= 0.5 then severity = 5 
  elseif res.pct >= 0.1 then severity = 1 
  else return false
  end
  assert2increment(severity)
  return true  
end

function tag_exceedance_scale_severity()
  -- The big question to be answered is how to create a unique tag for the [instance] of the function family.
  local info = get_family_info( rulebase_id..g_fault, create_tag_exceedance_info ) 
  local _,fs = get_fault()
  local svrty = fs.severity
  print( "calls: " .. info.called )
  print( "passed: " .. info.passed )
  svrty = svrty * info.called / info.passed
  assert2( svrty )
  return true
end

function load_fault_rules(g_fault_rules)
  local rulebase_unit_id = Unit.U_CM_SEC.id

  --======================================================================================================================
  --                                            Test Fan rule
  --
  --          Component Layout
  --    1        2
  -- bearing -- fan
  --
  --************************************
  table.insert( g_fault_rules, 
    {
    unit_id = rulebase_unit_id,
    rule=function() return tag_exceedance(2,'FANVNS',1,'r') end,  -- Test FANVNS tag on radial axis.
    nmrule='Fan rule 1',nmfault='FAN ROTATING ELEMENT FAULT', -- Only used for rule testing
    guid='64A44F4A-9051-4764-800F-8E2AC0513AAF',  -- Rule GUID.  We assign it here.
    parfault=nil,
    fault='7506ADE5-A3D8-4C78-90FC-650DCAE59D85', -- FAN ROTATING ELEMENT FAULT
    shaft='e38e1312-e578-4bdb-8570-c26a11a6a6f1', -- Test Fan
    prime=true, -- Primary rule.  It is one of the first called.
    pri=1,      -- Priority 1 - high.
    ort='a',    -- 'h' - horizontal, 'v' - verticle, 'a' - any
    conf=0.5,   -- Range -1 to 1.
                -- If this rule passes we have this much confidence that the macihne problem exists.
    aux=0 ,     -- Difficult to explain here.
    filter_parameters = {}, -- used for special rule filtering.  Used to determine when to use a rule.
    filter_function = standard_rule_filter
    } )

  table.insert( g_fault_rules, 
    {
    unit_id = rulebase_unit_id,
    rule=function() return tag_exceedance(2,'FANVNS',1,'a') end,  -- Test FANVNS tag on axial axis.
    nmrule='Fan rule 2',nmfault='FAN ROTATING ELEMENT FAULT', -- Only used for rule testing
    guid='80AEEC68-3D5A-4423-8B20-B580ABC2C1D4',  -- Rule GUID.  We assign it here.
    parfault=nil,
    fault='7506ADE5-A3D8-4C78-90FC-650DCAE59D85', -- FAN ROTATING ELEMENT FAULT
    shaft='e38e1312-e578-4bdb-8570-c26a11a6a6f1', -- Test Fan
    prime=true, -- Primary rule.  It is one of the first called.
    pri=1,      -- Priority 1 - high.
    ort='a',    -- 'h' - horizontal, 'v' - verticle, 'a' - any
    conf=0.5,   -- Range -1 to 1.
                -- If this rule passes we have this much confidence that the macihne problem exists.
    aux=0 ,     -- Difficult to explain here.
    filter_parameters = {}, -- used for special rule filtering.  Used to determine when to use a rule.
    filter_function = standard_rule_filter
    } )

  table.insert( g_fault_rules, 
    {
    unit_id = rulebase_unit_id,
    rule=function() return tag_exceedance(2,'FANVNS',1,'t') end,  -- Test FANVNS tag on tangential axis.
    nmrule='Fan rule 3',nmfault='FAN ROTATING ELEMENT FAULT', -- Only used for rule testing
    guid='6648CC5C-E29B-4F18-932B-1A39C6EC3A5F',  -- Rule GUID.  We assign it here.
    parfault=nil,
    fault='7506ADE5-A3D8-4C78-90FC-650DCAE59D85', -- FAN ROTATING ELEMENT FAULT
    shaft='e38e1312-e578-4bdb-8570-c26a11a6a6f1', -- Test Fan
    prime=true, -- Primary rule.  It is one of the first called.
    pri=1,      -- Priority 1 - high.
    ort='a',    -- 'h' - horizontal, 'v' - verticle, 'a' - any
    conf=0.5,   -- Range -1 to 1.
                -- If this rule passes we have this much confidence that the macihne problem exists.
    aux=0 ,     -- Difficult to explain here.
    filter_parameters = {}, -- used for special rule filtering.  Used to determine when to use a rule.
    filter_function = standard_rule_filter
    } )

  table.insert( g_fault_rules, 
    {
    unit_id = rulebase_unit_id,
    rule=function() return tag_exceedance_scale_severity() end,  -- Test FANVNS scale severity.
    nmrule='Fan rule 1',nmfault='FAN ROTATING ELEMENT FAULT', -- Only used for rule testing
    guid='F241C07C-8744-4A3F-9BF4-066DFDB589E8',  -- Rule GUID.  We assign it here.
    parfault=nil,
    fault='7506ADE5-A3D8-4C78-90FC-650DCAE59D85', -- FAN ROTATING ELEMENT FAULT
    shaft='e38e1312-e578-4bdb-8570-c26a11a6a6f1', -- Test Fan
    prime=false, -- Primary rule.  It is one of the first called.
    pri=2,      -- Priority 1 - high.
    ort='a',    -- 'h' - horizontal, 'v' - verticle, 'a' - any
    conf=0.5,   -- Range -1 to 1.
                -- If this rule passes we have this much confidence that the macihne problem exists.
    aux=0 ,     -- Difficult to explain here.
    filter_parameters = {}, -- used for special rule filtering.  Used to determine when to use a rule.
    filter_function = standard_rule_filter
    } )

  --======================================================================================================================
  --                                            Test Motor rule
  --
  --          Component Layout
  --    1        2          3
  -- bearing -- rotor -- bearing
  --
  --************************************
  table.insert( g_fault_rules, 
    {
    unit_id = rulebase_unit_id,
    rule=function() return tag_exceedance(0,'1X',3,'r') end,  -- Test FANVNS tag on radial axis.
    nmrule='Motor rule 1',nmfault='MOTOR ROTOR BAR FAULT', -- Only used for rule testing
    guid='ABD8A607-E9CD-4F51-9C37-3F079AC3FC82',  -- Rule GUID.  We assign it here.
    parfault=nil,
    fault='AEA1A9C8-DE2A-48C4-A5FB-E94701180056', -- MOTOR ROTOR BAR FAULT
    shaft='ccac6a6c-6481-4a65-9063-ae598f39e81b', -- Test Motor
    prime=true, -- Primary rule.  It is one of the first called.
    pri=1,      -- Priority 1 - high.
    ort='a',    -- 'h' - horizontal, 'v' - verticle, 'a' - any
    conf=0.5,   -- Range -1 to 1.
                -- If this rule passes we have this much confidence that the macihne problem exists.
    aux=0 ,     -- Difficult to explain here.
    filter_parameters = {}, -- used for special rule filtering.  Used to determine when to use a rule.
    filter_function = standard_rule_filter
    } )
end

--*****************************************************************************************
-- Recommendation Rule Base

function fault_recommendation( fault )
  local check,fs = get_fault_all( fault )
  if check then
    assert1()
    return true
  end
  
  return false
end

function load_rec_rules(g_rec_rules)
  table.insert( g_rec_rules, 
    {
    unit_id = rulebase_unit_id,
    rule=function() return fault_recommendation('7506ADE5-A3D8-4C78-90FC-650DCAE59D85') end,  
    nmrule='Fan rec rule 1',nmfault='FAN PROBLEM', -- Only used for rule testing
    guid='64A44F4A-9051-4764-800F-8E2AC0513AAF',  -- Rule GUID.  We assign it here.
    parfault=nil,
    fault='FE20B5E9-A8A3-41F6-8B78-947CB017AFC0', -- FAN Problem
    shaft='e38e1312-e578-4bdb-8570-c26a11a6a6f1', -- Test Fan
    prime=true, -- Primary rule.  It is one of the first called.
    pri=1,      -- Priority 1 - high.
    ort='a',    -- 'h' - horizontal, 'v' - verticle, 'a' - any
    conf=0.5,   -- Range -1 to 1.
                -- If this rule passes we have this much confidence that the macihne problem exists.
    aux=0 ,     -- Difficult to explain here.
    filter_parameters = {}, -- used for special rule filtering.  Used to determine when to use a rule.
    filter_function = standard_rule_filter
    } )  

  table.insert( g_rec_rules, 
    {
    unit_id = rulebase_unit_id,
    rule=function() return fault_recommendation('AEA1A9C8-DE2A-48C4-A5FB-E94701180056') end,  
    nmrule='Motor rule 1',nmfault='MOTOR ROTATIONAL RATE VIBRATION', -- Only used for rule testing
    guid='ABD8A607-E9CD-4F51-9C37-3F079AC3FC82',  -- Rule GUID.  We assign it here.
    parfault=nil,
    fault='06ED1404-34CF-4C74-9286-4F90B0F2BDA6', -- MOTOR ROTATIONAL RATE VIBRATION
    shaft='ccac6a6c-6481-4a65-9063-ae598f39e81b', -- Test Motor
    prime=true, -- Primary rule.  It is one of the first called.
    pri=1,      -- Priority 1 - high.
    ort='a',    -- 'h' - horizontal, 'v' - verticle, 'a' - any
    conf=0.5,   -- Range -1 to 1.
                -- If this rule passes we have this much confidence that the macihne problem exists.
    aux=0 ,     -- Difficult to explain here.
    filter_parameters = {}, -- used for special rule filtering.  Used to determine when to use a rule.
    filter_function = standard_rule_filter
    } )

end
