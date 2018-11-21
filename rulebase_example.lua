require 'rulebase functions'
g_rulebase_ID="this is a guid"
g_rulebase_version="1.0.0"
rulebase_unit_id = 27 --VdB
g_fault_rules={}

-- Two dashes makes a comment.  
-- You might want to generate some comments if you have the information.
-- Errors that occur in rules will be displayed in a stack trace that will lead to a line number in this file.
-- If there are some generated comments, like a generated rule name such as: Motor Balance 1 R
-- it could help with debugging.

table.insert( g_fault_rules, {
    rule=function()
      return checkrotorbalance(3,2,"r","MOTOR")
    end
    ,guid="rule guid - generate this",fault="the fault guid",shaft="the shaft guid",prime=true,pri=1,ort='h',conf=0.6,AS=nil,RS=nil,NS=nil,attpar=nil} )
