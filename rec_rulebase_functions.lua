-- 3-6-18 rev 8
-- rec_rulebase_functions

--
function setseverity(severity)  -- This function sets the recomendation level 0-3 based on the severity scale.
  if severity > 100 then  -- Severity Extreme, Mandatory Repair
    assert2(3)
    return 3
  elseif severity > 85 then -- Severity Serious, Important Repair
    assert2(2)
    return 2
  elseif severity > 60 then -- Severity Moderate, Desirable Repair
    assert2(1)
    return 1
  elseif severity > 25 then -- Severity Slight, No Rec Repair
    assert2(0)
    return 0
  else
    --less than 25 Allowable range no recommendation to report
    return nil
  end
end

--
function combine_recommendations(rec_table,conf_adjustment)
  local set_conf=conf_adjustment~=nil
  local sev,maxsev,n=0,0,0
  for rec_guide,cns in pairs(rec_table) do
    for _,cn in ipairs(cns) do
    if set_conf then 
      g_recs[cn.cn][rec_guide].conf=conf_adjustment 
      g_recs[cn.cn][rec_guide].severity=conf_adjustment
      end
    if cn.severity>maxsev then maxsev=cn.severity end
    sev=sev+cn.severity
    n=n+1
  end
end
return maxsev,sev,n,sev/n
end



--
