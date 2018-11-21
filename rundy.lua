-- Date: 3/27/18    rev 3

require 'include'

local prtg=g_debugprinting

g_debugprinting= true 

local f = io.popen("dir testdata /b")
if f then
  local files={}
  repeat
    s = f:read ("*l") -- read one line
    if s then  -- if not end of file (EOF)
      -- print (s) -- print that line
      table.insert(files,s)
    end
    local files1=files
  until not s  -- until end of file
  print ()
  local last=0
  for i,file in ipairs (files) do
    print (i,file)
    last=i8
  end
  local answer
  print ()
  if last==1 then
    answer="1"
  else
    repeat
      io.write("Enter the number of the file you wish to use? ")
      io.flush()
      answer=io.read()
    until string.len(answer)>0 
  end
  for j,file1 in ipairs (files) do
    local testfile='testdata\\' .. file1
    --print (j,file1)
    if tonumber(answer)==j then 
      dofile (testfile) 
      print ()
      print ("Launching rulebase for "..file1)
      print ()
      goto out
    end
  end
  ::out::

end


initialize_data()
--g_peak_list=peak_list()


debugprint ("<<<<<<<<<<<<<<<<<<<<<<<<<  Start Fault Analysis  >>>>>>>>>>>>>>>>>>>>>>>>>>>>>")
g_faults_out, g_fr_passed, g_fr_failed = infer( do_fault_analysis )
debugprint ("<<<<<<<<<<<<<<<<<<<<<<<<<  Fault Analysis Complete >>>>>>>>>>>>>>>>>>>>>>>>>>>>>")
debugprint ("<<<<<<<<<<<<<<<<<<<<<<<<<  Start Recommendations   >>>>>>>>>>>>>>>>>>>>>>>>>>>>>")
g_recs_out, g_rr_passed, g_rr_failed = infer( do_rec_analysis )
debugprint ("<<<<<<<<<<<<<<<<<<<<<<<<<  Recommendations Complete  >>>>>>>>>>>>>>>>>>>>>>>>>>>>>")
printelements(machine.elements)
writenorms() 
writedata()
final_processing()
printdatasets( machine.datasets )

debugprint( "=============== ERRORS AND WARNINGS ================" )
debugprint("")
for sn,t in pairs(g_fr_failed) do
  debugprint("")
  debugprint( "Shaft GUID: "..machine.components[sn].shaft )
  debugprint( string.format("%-18s %-14s %-16s %s","rule guid","code","message","stack trace [file name:function name( line number )]@[next stack level]") )
  for _,r in pairs(t) do
    debugprint(string.format("%-18s %-14s %-16s %s",r.guid,err_des[r.code],r.message,r.trace))
  end
end

debugprint("")
debugprint( "================= FAULTS ====================" )
writefaults("faults.txt", g_faults_out)

debugprint("")
debugprint( "============== RECOMMENDATS ====================" )
writefaults("recs.txt", g_recs_out)

writefaultstones("faulttones.txt",g_fault_tones) 

debugprint("")

--if trouble_shoot then print (g_peak_list_xml) end
--print (g_fault_tones_xml)
g_debugprinting= prtg 
print("done")