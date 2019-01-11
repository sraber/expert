-- infer.lua    Rev 10     1/11/19

-- This provides a default engineering unit for a rule.  This is
-- not the desired way to define the rule unit.  It should be defined 
-- in the unit_id rule entry.
local rulebase_unit_id = Unit.U_VDB.id  --VdB

-- Functions for creating rule map for solution information.
-- This is a map of all the rules that were tried, not necessarily passed.

local function rule_map_get_table( t, key )
  local ret = t[key]
  if ret==nil then 
    ret={}
    t[key] = ret
  end
  return ret
end

local function FindRuleIndex( rules, guid )
  for id,r in pairs(rules) do
    if r.guid==guid then return id end
  end
  assert(false, "rule guid not found" )
end

local function filter( f, p )
  if f==nil then return true end
  if p==nil then return true end
  return f(p)
end
  
local function MakePrimaryRuleTable( comp, rls )
  local comp_rules = {}

  for _,r in pairs(rls) do
    if r.prime==true and r.shaft==comp.shaft 
       and (r.ort=="a" or (r.ort==comp.orient)) 
       and filter( r.filter_function, r.filter_parameters)  then
      debugprint( "load primary rule: ", r.nmrule )
      table.insert(comp_rules,r)
      if g_rule_map then
        local rm_comp = rule_map_get_table( g_rule_map, g_shaft_number )
        local rm_comp_fault = rule_map_get_table( rm_comp, r.fault )
        rm_comp_fault[g_rule_map_order] = r
        g_rule_map_order = g_rule_map_order + 1
      end
    end
  end
  return comp_rules
end

-- MakeSecondaryRuleTable
-- Notes:
--    This function selects rules for evaulation based on the
--    primary fault list and other rule attributes.  The primary fault list
--    is built after the primary rules are evaluated and does not change.
--
-- Input:
--    comp           : The current component (shaft) table.
--    rls            : The rule base list
--    primary_faults : List of primary faults for this component.  Format: [fault] = true
--    priority       : Current priority
--
-- Return:
--    An array of rules to be evaulated.
--
-- Error:
--    There are no managed errors emitted from this function.
--
local function MakeSecondaryRuleTable( comp, rls, primary_faults, priority )
  local comp_rules = {}
  -- Look for primary rules that have passed
  for _,r in pairs(rls) do
    if r.prime==false and r.pri==priority and r.shaft==comp.shaft and primary_faults[r.fault]
      and (r.ort=="a" or (r.ort==comp.orient))
      and filter( r.filter_function, r.filter_parameters)  then
      debugprint( "load secondary rule: ", r.nmrule )
      table.insert(comp_rules,r)
      if g_rule_map then
        local rm_comp = rule_map_get_table( g_rule_map, g_shaft_number )
        local rm_comp_fault = rule_map_get_table( rm_comp, r.fault )
        rm_comp_fault[g_rule_map_order] = r
        g_rule_map_order = g_rule_map_order + 1
      end
    end
  end

  return comp_rules
end

--
-- MakeChildRuleTable
-- Notes:
--    This function selects rules for evaulation based on the
--    fault list and other rule attributes.  The fault list
--    is the current faults associated with the shaft.
--
-- Input:
--    comp           : The current component (shaft) table.
--    rls            : The rule base list
--    faults : List of faults for this component.  Format: [fault] = true
--    priority       : Current priority
--
-- Return:
--    An array of rules to be evaulated.
--
-- Error:
--    There are no managed errors emitted from this function.
--
local function MakeChildRuleTable( comp, rls, tried_rls, faults, priority )
  local comp_rules = {}
  -- Look for primary rules that have passed
  for _,r in pairs(rls) do
    if r.prime==false and r.pri==priority and r.shaft==comp.shaft 
      and r.parfault~=nil
      and faults[r.parfault]
      and not tried_rls[r.guid]
      and (r.ort=="a" or (r.ort==comp.orient))
      and filter( r.filter_function, r.filter_parameters)  then
      debugprint( "load child rule: ", r.nmrule )
      table.insert(comp_rules,r)
      if g_rule_map then
        local rm_comp = rule_map_get_table( g_rule_map, g_shaft_number )
        local rm_comp_fault = rule_map_get_table( rm_comp, r.fault )
        rm_comp_fault[g_rule_map_order] = r
        g_rule_map_order = g_rule_map_order + 1
      end
    end
  end

  return comp_rules
end

-- NOTE: This call should be made prior to calling infer()
--       It can be called from elsewhere and is why it is commented out
--       here.
--initialize_data()

function infer( do_analysis )
  local shaft_faults = {}
  local infer_solution = {}
  local shaft_rules_passed = {}
  local shaft_rules_failed = {}
  local shaft_rules_warn = {}
  local parent_faults = {}
  local rules_tried = {}
  local shaft_rules = nil
  g_shaft_store = {}

  local priority = 1
  local primary = true
  local maxpri = 0
  
  g_infer_output = shaft_faults
  g_infer_rules_passed = shaft_rules_passed
  g_infer_rules_failed = shaft_rules_failed
  g_infer_rules_warn = shaft_rules_warn
  if g_warning_level > 1 then
    g_rule_map = {}
  else
    g_rule_map = nil
  end
  g_rule_map_order = 1
  
  ---------------------------------------------------------
  -- Initialize some arrays
  -- cn   = component number
  -- comp = component

  for cn,_ in pairs(machine.components) do
    shaft_rules_passed[cn]={}
    shaft_rules_failed[cn]={}
    shaft_rules_warn[cn]={}
    rules_tried[cn]={}
    shaft_faults[cn]={}
    infer_solution[cn]={}
    parent_faults[cn]={}
    g_shaft_store[cn]={}
  end
  -------------------------------------------------------
  
  local rules = do_analysis( shaft_faults, infer_solution )
    
  --*******************************************************
  -- This call forces a full garbage collection cycle.  
  -- Lua does stepped garbage collection if left to its own devices.
  -- This place in the code seems like a logical place to tell Lua,
  -- "we're starting over, clean things up".
  collectgarbage()
  --*******************************************************
    
  for _,comp in pairs(machine.components) do
    -- Scan for maximum priority rule
    for _,r in pairs(rules) do
      if r.shaft==comp.shaft then
        if maxpri < r.pri then maxpri = r.pri end
      end
    end
  end

  -- *******************************************************
  --      Embedded Function
  local function get_super_shaft_for_component( comp_number )
    if machine.supershafts==nil then return nil end
    for i,ss in ipairs(machine.supershafts) do
      if ss.components[comp_number] then
        return i
      end
    end
    return nil
  end
  --*********************************************************
 
  local rpi = 1
  while priority<=maxpri do
    for sn,cmp in ipairs(machine.components) do
      g_shaft_number = sn
      g_super_shaft_number = get_super_shaft_for_component( sn )
      debugprint( "Evaulating " .. cmp.shaft )     
      if primary==true then
        shaft_rules = MakePrimaryRuleTable( cmp, rules )
      else
        shaft_rules = MakeSecondaryRuleTable( cmp, rules, parent_faults[sn], priority )
      end
      
      -- We're keeping track of any rule that is being tired.  We need this
      -- to support the parent fault method below.
      for _,r in pairs(shaft_rules) do rules_tried[sn][r.guid]=true end
      
      repeat
        repeat
          local i_pass={}
          local i_remove={}
          local add_parent_faults={}
          local satiated = true
          for _,r in pairs(shaft_rules) do

            -- Setup current rule properties for use by rule functions
            g_rule_guid = r.guid
            g_rule_name = r.nmrule
            g_shaft   = r.shaft
            g_fault   = r.fault
            g_fault_name = r.nmfault
            g_prime   = r.prime
            g_ort     = r.ort
            g_conf    = r.conf
            g_priority= r.pri
            if r.unit_id~=nil then
              g_unit_id = r.unit_id
            else
              g_unit_id = rulebase_unit_id
            end
            
            -- *******************************************************
            --      Embedded Function (so cool!)
            -- Think of this function as a variable defination.  It is defined within 
            -- the scope of this area of code, so it can "see" the r variable and the
            -- tables that are declared above in this function: shaft_rules_failed, and i_remove.
            --
            -- Furthermore, this function is passed into xpcall.  The way xpcall works is if
            -- anything goes wrong in the call to (in this case) r.rule, the error will be passed
            -- into this function (we are conforming to a prescribed function signiture).
            -- Some of the errors we've already formatted, but others, when things really go wrong
            -- are not, and here we are able to perform a stack trace so we can report where the problem
            -- occured.
            local function ErrorHandler( err )
              table.insert(i_remove,r.guid)
              -- NOTE: If we've failed AND the result is a table we assume it is our error table.
              --       Format: {int:code, string:message}
              if type(err)=="table" then 
                if     g_warning_level==0 then return
                elseif g_warning_level==1 and ( err.code==E_DATA or err.code==E_ATTR_TAG or err.code==E_ORDER_TAG) then return
                elseif g_warning_level==2 and ( err.code==E_DATA ) then return
                end
                r.message = err.data
                r.code = err.code
                r.trace = err.trace                  
                table.insert(shaft_rules_warn[sn],r)
              else 
                r.message = err
                r.code = 0
                r.trace = traceback(4)
                table.insert(shaft_rules_failed[sn],r)
              end
            end
            --*********************************************************
            
            --local check, result = pcall( r.rule )
            local check, result = xpcall( r.rule, ErrorHandler )
            if check then
              if result then
                satiated = false
                -- rpi let's us know the order that the rule pass evaulation.
                r.rpi=rpi
                rpi=rpi+1
                table.insert(shaft_rules_passed[sn],r)
                table.insert(i_pass,r.guid)
              elseif r.aux~=nil and r.aux==1 then 
                table.insert(i_remove,r.guid)
              end
              if result==nil then
                r.message="Rule returned nil."
                r.code=E_RULE_RETURN
                r.trace="@infer.lua:infer()"
                -- Putting the rule in this list won't remove it, it just puts it in the ERRORS AND WARNINGS
                -- output.  It may end up in this list more than once.
                table.insert(shaft_rules_failed[sn],r)
              end
            end
          end
          
          -- Note: The algorithm flow chart shows the rules being removed
          --       from inside the loop above.  Conceptually it works but code
          --       wise I didn't want to alter this list while we are itterating
          --       through it.  So I keep a list of passes and fails then alter
          --       the rules list below.
          --
          -- Remove rules that passed
          for _,g in pairs(i_pass) do
            table.remove( shaft_rules, FindRuleIndex(shaft_rules,g) ) 
          end

          -- Remove rules that failed
          for _,g in pairs(i_remove) do
            table.remove( shaft_rules, FindRuleIndex(shaft_rules,g) )
          end
          --print(#rls)
        until satiated 
        
        shaft_rules = MakeChildRuleTable( cmp, rules, rules_tried[sn], shaft_faults[sn], priority )
        for _,r in pairs(shaft_rules) do rules_tried[sn][r.guid]=true end
        
      until #shaft_rules==0
    end --machine.components loop
    
    if primary==true then
      primary=false
      -- Build the list of primary faults.  Secondary rules are selected based on this list and other
      -- rule attributes.  This is different from the parent-child fault paradigm and is handled elsewhere.
      for sn,_ in ipairs(machine.components) do
        for _,r in ipairs(shaft_rules_passed[sn]) do
          parent_faults[sn][ r.fault ] = true 
        end
      end
    else
      priority=priority+1
    end
  end

  return shaft_faults, shaft_rules_passed, shaft_rules_failed
end -- end infer function
