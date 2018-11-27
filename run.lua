local use_chunk = false

if use_chunk then
  dofile( 'vdsdiagcore.out' )
  --load_rulebase('testing.rules')
  load_rulebase('cvat.rules')
else
  require 'include'
end

g_debugprinting=true

require 'TestData\\ACCW2'
--require 'TestData\\data'
--require 'TestData\\composite'


-- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
-- REVIEW: Some normal stuff was commented out to work on the composite functions.
--         Include was changed.
--         Initialized_Data had peeks at the bottom of the loop commented out.



initialize_data()

require "adhock"
findLF()

g_faults_out, g_fr_passed, g_fr_failed = infer( do_fault_analysis )


xml = get_infer_solution()

local out = assert( io.open("solution_fault.xml","w") )
out:write( xml )
out:close()


g_recs_out, g_rr_passed, g_rr_failed = infer( do_rec_analysis )
xml = get_infer_solution()
out = assert( io.open("solution_rec.xml","w") )
out:write( xml )
out:close()

print("")
print( "================= FAULTS ====================" )
writefaults("faults.lua", g_faults_out)

print("")
print( "============== RECOMMENDATIONS ====================" )
writefaults("recs.lua", g_recs_out)

print("")
print( "=============== ERRORS AND WARNINGS ================" )
print("")
for sn,t in pairs(g_fr_failed) do
  print("")
  print( "Shaft GUID: "..machine.components[sn].shaft )
  print( string.format("%-18s %-14s %-16s %s","rule guid","code","message","stack trace [file name:function name( line number )]@[next stack level]") )
  for _,r in pairs(t) do
    print(string.format("%-18s %-14s %-16s %s",r.guid,err_des[r.code],r.message,r.trace))
  end
end

final_processing()

print("done")