-- 11-27-2018 rev 9
-- rec_rulebase_functions

--
function setseverity(severity)  -- This function sets the recomendation level 0-3 based on the severity scale.
  if severity > 100 then  -- Severity Extreme, Mandatory Repair
    assert2(4)
  elseif severity > 85 then -- Severity Serious, Important Repair
    assert2(3)
  elseif severity > 60 then -- Severity Moderate, Desirable Repair
    assert2(2)
  elseif severity > 25 then -- Severity Slight, No Rec Repair
    assert2(1)
  else
    --less than 25 Allowable range no recommendation to report
    return false
  end
  return true
end

--
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
      if info.conf<=0 then recs[rec]=nil end
    end
  end
end

function rulebase_final_processing()
  debugprint("CVAT final_processing Called")
  recommendation_cleanup()
end



--
