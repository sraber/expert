-- 12/2/2019 rev 14
-- rec_rulebase_functions

--
function setseverity(severity)  -- This function sets the recomendation level 0-3 based on the severity scale.
  -- severity level ranges adjusted to the similar perportions as history DY 2/4/2019
  if severity > 100 then  -- Severity Extreme, Mandatory Repair
    assert2(4)
    --assert3(.5)
  elseif severity > 60 then -- Severity Serious, Important Repair old val 85
    assert2(3)
    --assert3(.4)
  elseif severity > 30 then -- Severity Moderate, Desirable Repair old val 60
    assert2(2)
    --assert3(.3)
  elseif severity > 10 then -- Severity Slight, No Rec Repair old val 25
    assert2(1)
    --assert3(.2)
  else
    --less than 10 Allowable range no recommendation to report
    --assert3(-1)
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
  local sev,maxsev,n,adjsev,np=0,0,0,0,0
  local sevs={0,0,0,0}
  if true then
    for rec_guide,cns in pairs(rec_table) do
      if cns.severity~=nil then 
        if cns.severity>maxsev then maxsev=cns.severity end
        if cns.conf>=0 and cns.severity>0 then
          sevs[cns.severity]=sevs[cns.severity]+1
          sev=sev+cns.severity
          n=n+1
          np=np+1
        end
        local comp=cns.cn or g_shaft_number
        if set_conf then 
          g_recs[comp][rec_guide].conf=conf_adjustment 
          debugprint('Killing rec: '..guid_name(rec_guide)..' on '..comp..' for '..guid_name(g_fault))
        end
      else
        local found=true
        for _,cn in ipairs(cns) do
          if cn.conf>=0 and cn.severity>0 then
            if cn.severity>maxsev then maxsev=cn.severity end
            sevs[cn.severity]=sevs[cn.severity]+1
            sev=sev+cn.severity
            n=n+1
            if found then
              np=np+1
              found=false
            end
          end
          if set_conf then 
            local comp=cn.cn or g_shaft_number
            if g_recs[comp]~=nil and g_recs[comp][rec_guide] ~=nil then
              g_recs[comp][rec_guide].conf=conf_adjustment 
              debugprint('Killing rec: '..guid_name(rec_guide)..' on '..comp..' for '..guid_name(g_fault))
            end
          end
        end
      end
    end
    if sevs[1]>4 then sevs[2]=sevs[2]+1 end
    if sevs[2]>3 then sevs[3]=sevs[3]+1 end
    if sevs[3]>2 then sevs[4]=sevs[4]+1 end
    for i,j in ipairs(sevs) do
      if j>0 then adjsev=i end
    end
  end
  return maxsev,sev,np,sev/n, adjsev, sevs,n
end
--
-- if conf is nil then all recommendations with low severity or negative conf are deleted
-- if conf is not nil then recommendations have there conf set to conf
function recommendation_cleanup(conf)
  local kill=false
  if conf==nil then kill=true end
  for s,recs in ipairs(g_recs) do
    for rec,info in pairs (recs) do
      if kill then
        if info.conf<=0 or info.severity<2 then recs[rec]=nil end
      else
        info.conf=conf
      end
    end
  end
end



function rulebase_final_processing()
  debugprint("CVAT final_processing Called")
  --remove_dup_recs()
  recommendation_cleanup()
  fault_cleanup()
  remove_aves_from_cpl()
end
function adjustedseverity(input)
  local output,recsev=0,0
  if input > 100 then  -- Severity Extreme, Mandatory Repair
    output=input-50
    recsev=4
  elseif input > 60 then -- Severity Serious, Important Repair 
    output=input-30
    recsev=3
  elseif input > 30 then -- Severity Moderate, Desirable Repair 
    output=input-15
    recsev=2
  elseif input > 10 then -- Severity Slight, No Rec Repair 
    output=input-5
    recsev=1
  elseif input>0 then    -- No severity, No Repair Recommendation
    output=0
    recsev=0
  end
  return output,recsev
end

function combine_faults(fault_table,conf_adjustment)
  local set_conf=conf_adjustment~=nil
  local sev,maxsev,n,adjsev,as,np=0,0,0,0,0,0
  if true then
    for fault_guide,cns in pairs(fault_table) do
      if cns.severity~=nil then 
        if cns.severity>maxsev then maxsev=cns.severity end
        if cns.conf>=0 then
          sev=sev+cns.severity
          as=adjustedseverity(cns.severity)
          adjsev=adjsev+as
          n=n+1
          np=np+1
        end
        local comp=cns.cn or g_shaft_number
        if set_conf then 
          g_recs[comp][rec_guide].conf=conf_adjustment 
          debugprint('Killing fsault: '..guid_name(fault_guide)..' on '..comp..' for '..guid_name(g_fault))
        end
      else
        local found=true
        for _,cn in ipairs(cns) do
          if cn.conf>=0 and cn.severity>0 then
            if cn.severity>maxsev then maxsev=cn.severity end
            as=adjustedseverity(cn.severity)
            adjsev=adjsev+as           
            sev=sev+cn.severity
            n=n+1
            if found then
              np=np+1
              found=false
            end
          end
          if set_conf then 
            local comp=cn.cn or g_shaft_number
            if g_recs[comp]~=nil and g_recs[comp][rec_guide] ~=nil then
              g_recs[comp][rec_guide].conf=conf_adjustment 
              debugprint('Killing fault: '..guid_name(fault_guide)..' on '..comp..' for '..guid_name(g_fault))
            end
          end
        end
      end
    end
  end
  return maxsev,sev,np,adjsev,n
end
function recommendation_maxseverity()
  local maxsev=0
  for s,recs in ipairs(g_recs) do
    for rec,info in pairs (recs) do
      if info.conf>=0 and info.severity>maxsev then
        maxsev=info.severity
      end
    end
  end
  return maxsev
end
