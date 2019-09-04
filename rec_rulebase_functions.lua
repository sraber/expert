-- 5-31-2019 rev 10
-- rec_rulebase_functions

--
function setseverity(severity)  -- This function sets the recomendation level 0-3 based on the severity scale.
  -- severity level ranges adjusted to the similar perportions as history DY 2/4/2019
  if severity > 100 then  -- Severity Extreme, Mandatory Repair
    assert2(4)
    assert3(1)
  elseif severity > 60 then -- Severity Serious, Important Repair old val 85
    assert2(3)
    assert3(.8)
  elseif severity > 30 then -- Severity Moderate, Desirable Repair old val 60
    assert2(2)
    assert3(.65)
  elseif severity > 10 then -- Severity Slight, No Rec Repair old val 25
    assert2(1)
    assert3(.5)
  else
    --less than 10 Allowable range no recommendation to report
    return false
  end
  return true
end

-- This function receives list of recommendations to remove and goes througn g_recs and remve all but the appearance first recommmentation
function remove_dup_recs(rec_table,conf_adjustment) 
  local set_conf=conf_adjustment~=nil
  for rec_guide,cns in pairs(rec_table) do
    local count=0
    for s,recs in ipairs(g_recs) do
      for rec,info in pairs (recs) do
        if rec_guide==rec then
          count=count+1
          if count>1 and set_conf then
            info.conf=conf_adjustment
          end
        end
      end
    end
  end
  return 
end


function combine_recommendations(rec_table,conf_adjustment)
  local set_conf=conf_adjustment~=nil
  local sev,maxsev,n=0,0,0 
  if true then
    for rec_guide,cns in pairs(rec_table) do
      if cns.severity~=nil then 
        if cns.severity>maxsev then maxsev=cns.severity end
        if cns.conf>=0 then
          sev=sev+cns.severity
          n=n+1
        end
        local comp=cns.cn or g_shaft_number
        if set_conf then 
          g_recs[comp][rec_guide].conf=conf_adjustment 
        end
      else
        for _,cn in ipairs(cns) do
          if cn.conf>=0 then
            if cn.severity>maxsev then maxsev=cn.severity end
            sev=sev+cn.severity
            n=n+1
          end
          if set_conf then 
            local comp=cn.cn or g_shaft_number
            g_recs[comp][rec_guide].conf=conf_adjustment 
          end
        end
      end
    end
  end
  return maxsev,sev,n,sev/n
end
--
function recommendation_cleanup()
  for s,recs in ipairs(g_recs) do
    for rec,info in pairs (recs) do
      if info.conf<0 then recs[rec]=nil end
    end
  end
end

function rulebase_final_processing()
  debugprint("CVAT final_processing Called")
  remove_dup_recommendations()
  recommendation_cleanup()
  fault_cleanup()
end



--
