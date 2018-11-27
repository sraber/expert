-- Revision 34  11/23/18

-- 
trouble_shoot=false -- turns on printing and extra output for troubleshooting
-- Catagory guids
--
--  Functions starting with z_ are generic functions that are called by element specific functions
--
--*****************************************
-- Generic Forcing Frequency Check Functions 
-- Totals 1xFF, harmonics, and first 1xSR sidebands of 1xff
--**************************************************
function rotorforcingfrequency_fundamental(strtag,element,brg,straxis,strrotorname,threshold,svrtymult) -- Checks for a tone match at  forcing order (strtag)
  threshold,svrtymult=z_get_rule_tune_info(element,threshold,svrtymult)
  return z_forcingfrequencyfundamental(strtag,element,brg,straxis,strrotorname,threshold,svrtymult) 
end
function motor_2xLF_fundamental(element,brg,straxis,strrotorname,threshold,svrtymult)-- Checks for a tone match at 2xLF (two times line frequency)
  threshold,svrtymult=z_get_rule_tune_info(element,threshold,svrtymult)
  return z_forcingfrequencyfundamental("2xLF",element,brg,straxis,strrotorname,threshold,svrtymult)
end
function bearingOR_fundamental(element,brg,straxis,strrotorname,threshold,svrtymult)-- Checks for a tone match at bearing outer rece frequency
  threshold,svrtymult=z_get_rule_tune_info(element,threshold,svrtymult)
  return z_forcingfrequencyfundamental("FOR",element,brg,straxis,strrotorname,threshold,svrtymult)
end
function bearingIR_fundamental(element,brg,straxis,strrotorname,threshold,svrtymult)-- Checks for a tone match at bearing inner rece frequency
  threshold,svrtymult=z_get_rule_tune_info(element,threshold,svrtymult)
  return z_forcingfrequencyfundamental("FIR",element,brg,straxis,strrotorname,threshold,svrtymult)
end
function bearingBS_fundamental(element,brg,straxis,strrotorname,threshold,svrtymult)-- Checks for a tone match at  bearing ball spin frequency
  threshold,svrtymult=z_get_rule_tune_info(element,threshold,svrtymult)
  return z_forcingfrequencyfundamental("FBS",element,brg,straxis,strrotorname,threshold,svrtymult)
end
function bearingThrustShoe_fundamental(element,brg,straxis,strrotorname,threshold,svrtymult)-- Checks for a tone match at  Thrust Shoe (BRGSEG) frequency
  threshold,svrtymult=z_get_rule_tune_info(element,threshold,svrtymult)
  return z_forcingfrequencyfundamental("BRGSEG",element,brg,straxis,strrotorname,threshold,svrtymult)
end
function z_countuniquecalls(strtag,element,brg,straxis)
  local _, calls = get_store_value("calls"..element..strtag)
  if calls==nil then calls={} end
  calls[straxis..brg]=true
  put_store_value("calls"..element..strtag,calls)
end 
function z_forcingfrequencyfundamental(strtag,element,brg,straxis,strrotorname,threshold,svrtymult) -- Checks for a tone match at forcing order (strtag)
  local rn=strrotorname or ''
  debugprint (rn.." FF Fundamental rule started on "..rn.." Rotor",element,"bearing",brg,"axis",straxis,"for strtag",strtag)
  increment_store_counter( "pts"..element..strtag )  -- count the attempts to call
  local ffthld = threshold or 108
  local smult = svrtymult or 1
  local sverity=0
  local close=.004
  local mrb=(strtag=='MOTRTRBARS')
  z_countuniquecalls(strtag,element,brg,straxis)
  local sbt=string.upper(strtag)  
  local lf=string.match(sbt,'LF')=='LF'
  local rF1x=analyze_by_tag( "1X", element, brg, straxis )  -- check for valid data
  increment_store_counter( "pt"..element..strtag ) -- count the times data is found
  --local ordr1x=rF1x.sord or 1 
  local sr1x=rF1x.sfreq 
  local _,alias,spdratio =z_get_brg_and_data_set_speed_ratio(element,brg)
  if sr1x==nil then
    for _,ds in ipairs (machine.datasets)  do
      if ds.dom=='spec' and ds.typ=='normal' and ds.axis==straxis and ds.mi==alias then
        sr1x=ds.speed*spdratio -- use the dataset speed when 1X is not present
        break
      end
    end 
  end
  local taghz
  local rFff={}
  local tagord
  if lf then 
    if string.find(sbt,"X")== nil then
      taghz=machine.linef
    else
      local xpos,_=string.find(sbt,"X")
      local lfx,_=string.sub(sbt, 1,xpos-1)
      lfx=lfx or "1"
      taghz=machine.linef*tonumber(lfx)
    end
    tagord=taghz/sr1x
    rFff=analyze_by_order( tagord,  brg, straxis,true,true,true )
    if rFff==nil then rFff={found=false} end
  else
    if strtag=='GRTTH' then
      local _
    end

    local tago=get_tag_order( strtag, element,-1 )
    tagord=tago.order*spdratio
    if mrb and tagord<0 then
      local rbpeaks=unknownrotorbars(strtag,element,brg,straxis,strrotorname,threshold,svrtymult)
      if  rbpeaks.found then
        for pk,rFff in ipairs(rbpeaks.peaks) do
          local sval=rFff.sval
          local aval=rFff.aval
          --local diff=rFff.dif
          local ordr=rFff.sord
          local shcf=rFff.sord*sr1x/spdratio
          local severity=rFff.severity
          sverity=sverity+severity
          if sval >ffthld then

            --  sverity=sverity+z_high_level_severity(sval,ffthld)
          end
          local datami=z_fault_tone_list(element,brg,straxis, ordr, sval, aval,severity,rFff.sdsi,rFff.sbin,'#'..pk.." Unk "..strtag.. ' tone on '..rn,"Unk "..strtag, shcf)
          z_flag_tone_as_found (element,brg,straxis,rFff.sbin,datami)
        end

        local check,count = get_store_value("svrty"..element..strtag)
        if check==true then
          count = count + sverity*smult
        else
          count = sverity*smult
        end
        if sverity~=0 then
          put_store_value("svrty"..element..strtag,count)
          debugprint (strtag,"like tones fired - Severity",count,sverity)
          assert2(1)
          return true
        end 
      end 
    else
--local rFff=analyze_by_order  ( tagord, element, brg, straxis )
      rFff=analyze_by_tag( strtag, element, brg, straxis )
--debugprint ( strtag, element, brg, straxis ,rFff.found,rFff.dif,rFff.sval,rFff.aval)
    end
  end
  if rFff.found then
    local sval=rFff.sval
    local aval=rFff.aval
    local diff=rFff.dif
    local ordr=rFff.sord
    local shcf=rFff.sord*sr1x/spdratio
    local islfx,mtrissync=z_peak_is_2xLF_mult(shcf,sr1x/spdratio)   -- tone is multiple of 2x line frequency
    local peakistag,x,_= z_is_a_multiple(tagord ,ordr,close)
    peakistag = peakistag and x==1 
    --local tagisint ,_,_= z_is_a_multiple(1,tagord ,close)----(frac<close or 1-frac<close)
    --local peakisint,_,_ = z_is_a_multiple(1,ordr ,close)-- (frac<close or 1-frac<close)
    debugprint (strtag,tagord,ordr,peakistag,'  <<<<<<<<<<<<<<<<FOFOFOFOFOFOF')
    if (peakistag and lf and islfx and not(mtrissync)) or (peakistag and not (lf) and (mtrissync or (not(mtrissync) and not (islfx)))) then
      if diff > g_fault_tone_threshold  or( sval> g_significance_threshold and diff>3)  then

        sverity=z_amplitude_weighted_severity(diff,sval,108)--diff--*(sval/140)  -- not amplitude weighting just yet on wundmental

        if sval >ffthld then

          -- sverity=sverity+z_high_level_severity(sval,ffthld)
        end
        local datami=z_fault_tone_list(element,brg,straxis, ordr, sval, aval,sverity,rFff.sdsi,rFff.sbin, "1x of "..strtag.. ' on '..rn,"1x("..strtag..')', shcf)
        z_flag_tone_as_found (element,brg,straxis,rFff.sbin,datami)
      end
      local check,count = get_store_value("svrty"..element..strtag)
      if check==true then
        count = count + sverity*smult
      else
        count = sverity*smult
      end
      if sverity~=0 then
        put_store_value("svrty"..element..strtag,count)
        debugprint (strtag,"fundamental fired - Severity",count,sverity)
        assert2(1)
        return true
      end 
    end 
  end
  debugprint (rn.." "..strtag.." FF Fundamental FALSE")
  return false
end
--
-- Generic forcing frequency harmonic check function
--
function rotorforcingfrequency_harmonics(strtag,element,brg,straxis,howmany,strrotorname,threshold,svrtymult) -- checks for tone matches at harmonics of a forcing order (strtag)
  threshold,svrtymult=z_get_rule_tune_info(element,threshold,svrtymult)
  return z_forcingfrequencyharmonics(strtag,element,brg,straxis,howmany,strrotorname,threshold,svrtymult)
end 
function motor_2xLF_harmonics(element,brg,straxis,howmany,strrotorname,threshold,svrtymult)-- Checks for a tone match at harmonics of 2xLF
  threshold,svrtymult=z_get_rule_tune_info(element,threshold,svrtymult)
  return z_forcingfrequencyharmonics("2xLF",element,brg,straxis,howmany,strrotorname,threshold,svrtymult)
end
function bearingOR_harmonics(element,brg,straxis,howmany,strrotorname,threshold,svrtymult)-- Checks for a tone match at bearing outer rece frequency
  threshold,svrtymult=z_get_rule_tune_info(element,threshold,svrtymult)
  return z_forcingfrequencyharmonics("FOR",element,brg,straxis,howmany,strrotorname,threshold,svrtymult)
end
function bearingIR_harmonics(element,brg,straxis,howmany,strrotorname,threshold,svrtymult)-- Checks for a tone match at bearing inner rece frequency
  threshold,svrtymult=z_get_rule_tune_info(element,threshold,svrtymult)
  return z_forcingfrequencyharmonics("FIR",element,brg,straxis,howmany,strrotorname,threshold,svrtymult)
end
function bearingBS_harmonics(element,brg,straxis,howmany,strrotorname,threshold,svrtymult)-- Checks for a tone match at  bearing ball spin frequency
  threshold,svrtymult=z_get_rule_tune_info(element,threshold,svrtymult)
  return z_forcingfrequencyharmonics("FBS",element,brg,straxis,howmany,strrotorname,threshold,svrtymult)
end
function bearingThrustShoe_harmonics(element,brg,straxis,howmany,strrotorname,threshold,svrtymult)-- Checks for a tone match at  Thrust Shoe (BRGSEG) frequency
  threshold,svrtymult=z_get_rule_tune_info(element,threshold,svrtymult)
  return z_forcingfrequencyharmonics("BRGSEG",element,brg,straxis,howmany,strrotorname,threshold,svrtymult)
end
function z_forcingfrequencyharmonics(strtag,element,brg,straxis,howmany,strrotorname,threshold,svrtymult) -- checks for tone matches at harmonics of a forcing order (strtag)
  local rn=strrotorname or ''
  debugprint (rn.." FF harmonic rule started on "..rn.." Rotor",element,"bearing",brg,"axis",straxis, "for tag",strtag)
  increment_store_counter( "pts"..element..strtag )
  local hm= howmany or 4
  local ffthld=threshold or 108
  local smult=svrtymult or 1
  local close=.004
  local sverity=0
  local fford=0
  z_countuniquecalls(strtag,element,brg,straxis)
  local sbt=string.upper(strtag)  
  local lf=string.match(sbt,'LF')=='LF'
  local _,alias,spdratio =z_get_brg_and_data_set_speed_ratio(element,brg)
  local rF1x=analyze_by_tag( '1X', element, brg, straxis )
  increment_store_counter( "pt"..element..strtag )
  local sr1x=rF1x.sfreq  
  if sr1x==nil then
    for _,ds in ipairs (machine.datasets)  do
      if ds.dom=='spec' and ds.typ=='normal' and ds.axis==straxis and ds.mi==alias then
        sr1x=ds.speed*spdratio
        break
      end
    end 
  end
  local taghz
  local rFff={}
  local tagord=1
  if lf then
    if string.find(sbt,"X")== nil then
      taghz=machine.linef
    else
      local xpos,_=string.find(sbt,"X")
      local lfx,_=string.sub(sbt, 1,xpos-1)
      lfx=lfx or "1"
      taghz=machine.linef*tonumber(lfx)
    end
    tagord=taghz/sr1x
    rFff=analyze_by_order( tagord,  brg, straxis,true,true,true )
    if rFff==nil then rFff={found=false} end
  else
    rFff=analyze_by_tag( strtag, element, brg, straxis )
  end

-- debugprint ( strtag, element, brg, straxis ,rFff.found,rFff.sord,rFff.dif)
  if rFff.found then 
    fford=rFff.sord
    if not(lf) then
      local tago=get_tag_order( strtag, element,-1 )
      if strtag=='1X' and tago.order==-1 then tago.order=1 end
      tagord=tago.order*spdratio
    end
    if tagord>0 then
      --local tagisint,x,frac=z_is_a_multiple(1,tagord,.001)
      local peakisint = z_is_a_multiple(1,fford,.01)--frac<.02 or 1-frac<.02
      local peakistag,x,frac= z_is_a_multiple(tagord,fford,.01 )
      peakistag=peakistag and x==1
      if  peakistag  then
        local rHff=get_harmonic_groups_from_cpl(element,brg,straxis,strtag)--analyze_harmonic_by_tag( strtag, element, brg, straxis )
        if rHff.found then
          for _,mtch in ipairs(rHff.matches) do
            --stoppoint(strtag,'1X')
            stoppoint (sbt,"PMPVNS")
            local islfx,mtrissync=z_peak_is_2xLF_mult(mtch.sord*sr1x/spdratio,sr1x/spdratio) -- tone is multiple of 2x line frequency
            if (peakistag and lf and islfx and not(mtrissync)) or (peakistag and not (lf) and (mtrissync or (not(mtrissync) and not (islfx)))) then 
              local isharm
              isharm,x,frac= z_is_a_multiple((mtch.order*tagord),mtch.sord,close)
              --x,frac=math.modf(mtch.sord/(mtch.order*tagord))
              --x=x+round(frac)
              if isharm and x==1 then
                if trouble_shoot then debugprint (strtag,'harmonic matches',mtch.order,mtch.dif,'<<<<<<<<<<<<<<<<<<<<')      end
                if mtch.dif ~= nil then
                  if (mtch.dif>g_fault_tone_threshold or (mtch.sval>g_significance_threshold and mtch.dif>3)) and mtch.order <= hm and mtch.order~=1 then 
                    local hsverity=z_amplitude_weighted_severity(mtch.dif,mtch.sval,108)
                    local order=nopointzero(tostring(round(mtch.order)))
                    --if mtch.sval > ffthld then hsverity=hsverity+z_high_level_severity(mtch.sval,ffthld) end
                    if hsverity>1.5 then
                      sverity=sverity+hsverity
                      local datami=z_fault_tone_list(element,brg,straxis, mtch.order*fford, mtch.sval, mtch.aval,hsverity,mtch.sdsi, mtch.sbin ,order.."x harmonic of "..strtag.." on "..rn,order.."xh("..strtag..')', mtch.sord*sr1x/spdratio)
                      z_flag_tone_as_found (element,brg,straxis, mtch.sbin ,datami)
                    end
                  end
                end
              end
            end
          end
          if sverity>0 then
            local check,count = get_store_value("svrty"..element..strtag)
            if check==true then
              count = count + sverity*smult
            else
              count = sverity*smult
            end
            --debugprint ("svrty"..element..strtag,count,smult)
            put_store_value("svrty"..element..strtag,count)
            debugprint (strtag,"harmonics fired - Severity",count,sverity)
            assert2(2)
            return true
          end -- if sverity>0
        end -- if rHff.found
      end
    end --if  peakistag and not (islfx)
  end

  debugprint (rn.." "..strtag.." FF harmonics FALSE")
  return false
end
--
-- Generic forcing frequency sideband check function
--
function rotorforcingfrequency_sidebands(strtag,element,brg,straxis,strsbtag,howmany,strrotorname,threshold,svrtymult) -- checks for tone matches at strsbtag sideband of strtag forcing orders 
  threshold,svrtymult=z_get_rule_tune_info(element,threshold,svrtymult)
  return z_forcingfrequencysidebands(strtag,element,brg,straxis,strsbtag,howmany,strrotorname,threshold,svrtymult)
end
function bearingOR_sidebands(element,brg,straxis,strsbtag,howmany,strrotorname,threshold,svrtymul)-- Checks for a tone match at bearing outer rece frequency
  threshold,svrtymult=z_get_rule_tune_info(element,threshold,svrtymult)
  return z_forcingfrequencysidebands("FOR",element,brg,straxis,strsbtag,howmany,strrotorname,threshold,svrtymul)
end
function bearingIR_sidebands(element,brg,straxis,strsbtag,howmany,strrotorname,threshold,svrtymul)-- Checks for a tone match at bearing inner rece frequency
  threshold,svrtymult=z_get_rule_tune_info(element,threshold,svrtymult)
  return z_forcingfrequencysidebands("FIR",element,brg,straxis,strsbtag,howmany,strrotorname,threshold,svrtymul)
end
function bearingBS_sidebands(element,brg,straxis,strsbtag,howmany,strrotorname,threshold,svrtymul)-- Checks for a tone match at  bearing ball spin frequency
  threshold,svrtymult=z_get_rule_tune_info(element,threshold,svrtymult)
  return z_forcingfrequencysidebands("FBS",element,brg,straxis,strsbtag,howmany,strrotorname,threshold,svrtymul)
end
function bearingThrustShoe_sidebands(element,brg,straxis,strsbtag,howmany,strrotorname,threshold,svrtymul)-- Checks for a tone match at  Thrust Shoe (BRGSEG) frequency
  threshold,svrtymult=z_get_rule_tune_info(element,threshold,svrtymult)
  return z_forcingfrequencysidebands("BRGSEG",element,brg,straxis,strsbtag,1,strrotorname,threshold,svrtymul)
end
--
function z_forcingfrequencysidebands(strtag,element,brg,straxis,strsbtag,howmany,strrotorname,threshold,svrtymult) -- checks for tone matches at strsbtag sideband of strtag forcing orders 
  local rn= strrotorname or ''
  local sbt=strsbtag or "1X"
  local close=.004
  z_countuniquecalls(strtag,element,brg,straxis)
  debugprint (rn.." FF sideband rule started on "..rn.." Rotor",element,"bearing",brg,"axis",straxis, "for tag", strtag,"with sidebands of",sbt)
  increment_store_counter( "pts"..element..strtag )
  local sbfreq=0
  sbt=string.upper(sbt)
  local lfsb=string.match(sbt,"LF")=='LF'
  if sbt~="1X" then
    if lfsb then
      close=.0007
      if string.match(sbt,"X")~= "X" then
        sbfreq=machine.linef
      else
        local xpos,_=string.find(sbt,"X")
        local lfx,_=string.sub(sbt, 1,xpos-1)
        lfx=lfx or "1"
        sbfreq=machine.linef*tonumber(lfx)
      end
    end
  end
  --local --maxdata=maximum_data_range(element,brg,straxis)
  local hmharms=howmany or 4
  local hmsb=4
  local ffthld=threshold or 108
  local smult=svrtymult or 1
  local sverity=0
  local awsth=108
  local sevth=2
  local lf=string.match(string.upper(strtag),'LF')=='LF'

  local rF1x=analyze_by_tag( "1X", element, brg, straxis )
  local sr1x=rF1x.sfreq 
  local bearing,alias,spdratio =z_get_brg_and_data_set_speed_ratio(element,brg)
  if strtag =='GRTTH'then
    local _
  end
  if sr1x==nil then
    for i,ds in ipairs (machine.datasets)  do
      if ds.dom=='spec' and ds.typ=='normal' and ds.axis==straxis and ds.mi==alias then
        sr1x=ds.speed*spdratio
        break
      end
    end 
  end
  increment_store_counter( "pt"..element..strtag )
  local rFff=analyze_by_tag( strtag, element, brg, straxis )
  --debugprint ( strtag, element, brg, straxis ,rFff.found)
  local tagord
  if rFff.found then 
    local tago=get_tag_order( strtag, element,-1 )
    tagord=tago.order*spdratio
    if tagord>0 then
      if tagord<=3 then
        hmsb=math.min (0,hmsb)
      elseif tagord<=5 then
        hmsb=math.min (1,hmsb)
      elseif tagord<=6 then
        hmsb=math.min (2,hmsb)
      elseif tagord<=10 then
        hmsb=math.min (3,hmsb)
      elseif tagord>10 then
        hmsb=math.min(round(tagord)/4,hmsb)
      end
      local sbcf=rFff.sfreq
      local harmord=rFff.sord
      local ordrsbt, rFsbt,srsbt

      if sbfreq==0 then
        local tago=get_tag_order( strtag, element,-1 )
        ordrsbt=tago.order*spdratio
        rFsbt=analyze_by_tag( sbt, element, brg, straxis )
        if rFsbt.found then 
          ordrsbt=rFsbt.sord
          srsbt=rFsbt.sfreq
        end
      else
        srsbt=sbfreq
        ordrsbt=sbfreq/sr1x
      end
      if strtag=="MOTRTRBARS" then
        awsth=120
        sevth=1
      end
      if ordrsbt==0 then
        debugprint (rn.." "..strtag.." FF sideband FALSE")
        return false
      end
      local sbdif=0
      local sbford=0
      local sb
      local sbdiford=0
      local sbval=0  --[[
    local _,b=math.modf(tagord)
    local tagisint= b<.001 or 1-b<.001  -- is tagord an integer
    local _,frac=math.modf(harmord)
    local peakisint = frac<.02 or 1-frac<.02 -- is the peak an integer
    if tagisint==false and peakisint==true then 
    debugprint (rn.." "..strtag.." FF sideband FALSE")
      return false
    end ]]

      local islfx,mtrissync=z_peak_is_2xLF_mult(sbcf,sr1x/spdratio)   -- tone is multiple of 2x line frequency
      local peakistag,x,frac= z_is_a_multiple(tagord,harmord,close)
      local tagisint,_,_= z_is_a_multiple(1,tagord,close)
      local peakisint =  z_is_a_multiple(1,harmord,close) --(frac<close or 1-frac<close)
      debugprint (strtag,tagord,harmord,peakistag,'  <<<<<<<<<<<<<<<<FOFOFOFOFOFOF')
      if (peakistag and lf and islfx) or (peakistag  and (mtrissync and not(lf) or (not(mtrissync) and not (islfx)))) then 
        for harm=1,hmharms,1 do
          local sbc=0
          for i=1,hmsb,1 do
            sbdiford=i*ordrsbt
            for sbside=-1,1,2 do
              sbford=harm*tagord +(sbside*sbdiford) -- harmord or tagord ???
              if true --[[sbford<maxdata*.98]] then
                --debugprint (sbford,brg,straxis)
                if sbford>0 and not (round(sbford,1)==1 or round(sbford,1)==2 or round(sbford,1)==3) and brg~=nil and straxis~=nil then
                  sb= analyze_by_order(sbford,brg,straxis,true,true,true )
                  if sb~=nil then 
                    if sb.found and sb.dif~=nil then
                      sbdif=sb.dif
                      sbval=sb.sval
                      local isasb,_,_= z_is_a_multiple(sb.sord,sbford,.004)
                      --_,frac=math.modf(math.abs(sbford/sb.sord))
                      if isasb --[[frac<.001 or 1-frac<.001]] then
                        if sbdif>g_fault_tone_threshold or  (sbdif>3 and sbval>g_significance_threshold)  then 
                          if math.abs(i*sbside)<=4 or (math.abs(i*sbside)>4 and sbc>2) then -- supress single way out sidebands 
                            sbc=sbc+1
                            local sbsverity=z_amplitude_weighted_severity(sbdif,sbval,awsth)
                            if sr1x==nil then
                              debugprint()
                            end
                            -- if sbval>ffthld then sbsverity=z_high_level_severity(sbval,ffthld) end 
                            if sbsverity>sevth then
                              sverity=sverity+sbsverity
                              local datami=z_fault_tone_list(element,brg,straxis, sb.sord, sbval, sbval-sbdif,sbsverity,sb.sdsi,sb.sbin, i*sbside..'x('..sbt..") Sideband of "..harm.."x"..strtag..' on '..rn,i*sbside..'x('..sbt..")sb"..harm.."x"..strtag, sb.sfreq) 
                              z_flag_tone_as_found (element,brg,straxis,sb.sbin ,datami)
                              --debugprint(element,brg,straxis, sb.sord, sbval, sbval-sbdif,sbsverity,sb.sdsi,sb.sbin, i*sbside..'x('..sbt..") Sideband of "..harm.."x"..strtag..' on '..rn,i*sbside..'x('..sbt..")sb"..harm.."x"..strtag, sb.sfreq)
                              debugprint (sbt.." Sideband of "..harm.."x"..strtag.." found at "..sbford.." orders",sbdif,sbsverity)
                            end --if sbsverity>sevth
                          end --if math.abs(i*sbside)<=4 or (math.abs(i*sbside)>4 and sbc>2)
                        end --if sbdif>g_fault_tone_threshold or  (sbdif>3 and sbval>g_significance_threshold)
                      end --if isasb
                    end --if sb.found and sb.dif~=nil
                  end --if sb~=nil
                end --if sbford>0 and not (round(sbford,1)==1 or round(sbford,1)==2 or round(sbford,1)==3) and brg~=nil and straxis~=nil
              end --if true
            end --for sbside=-1,1,2
          end --for i=1,hmsb,1
        end -- for harm=1,hmharms,1 
        local check,count = get_store_value("svrty"..element..strtag)
        if check==true then
          count = count + sverity*smult
        else
          count = sverity*smult
        end
        if sverity~=0 then 
          put_store_value("svrty"..element..strtag,count)
          debugprint (sbt,"sidband of", strtag,"fired - Severity",count,sverity)
          assert2(3)
          return true
        end --if sverity~=0
      end --if (peakistag and lf and islfx) or (peakistag  and (mtrissync and not(lf) or (not(mtrissync) and not (islfx))))
    end --if tagord>0 
  end  --if rFff.found

  debugprint (rn.." "..strtag.." FF sideband FALSE")
  return false
end
--
--
-- Calculate generic Forcing Function Normalized Severity
--
function rotorforcingfrequencyseverity(strtag,element,strrotorname) -- Calculate rotor Forcing Function Normalized Severity
  return z_forcingfrequencyseverity(strtag,element,strrotorname)
end
function motor_2xLF_severity(element,strrotorname) -- Calculate motor 2xLF Forcing Function Normalized Severity
  return z_forcingfrequencyseverity("2xLF",element,strrotorname)
end
function bearingORseverity(element,strrotorname) -- Calculate bearing outer race Forcing Function Normalized Severity
  return z_forcingfrequencyseverity("FOR",element,strrotorname)
end
function bearingIRseverity(element,strrotorname) -- Calculate bearing inner race Forcing Function Normalized Severity
  return z_forcingfrequencyseverity("FIR",element,strrotorname)
end
function bearingBSseverity(element,strrotorname) -- Calculate bearing ball spin Forcing Function Normalized Severity
  return z_forcingfrequencyseverity("FBS",element,strrotorname)
end
function bearingThrustShoeseverity(element,strrotorname) -- Calculate Thrust Shoe (BRGSEG Forcing Function Normalized Severity
  return z_forcingfrequencyseverity("BRGSEG",element,strrotorname)
end
--
function z_forcingfrequencyseverity(strtag,element,strrotorname) -- Calculate generic Forcing Function Normalized Severity
  local rn=strrotorname or ''
  debugprint ("Normalizing FF severity of "..strtag.. " on element "..element.." fault on rotor "..rn)
  local _, calls = get_store_value("calls"..element..strtag)
  local cls=pairscount(calls)
  local check2,points = get_store_value("pts"..element..strtag)
  --debugprint ("pts"..element..strtag,check2,points)
  local check,count = get_store_value("pt"..element..strtag)
  --debugprint ("pt"..element..strtag,check,count)
  count=count or points
  --
  local check1,svrty = get_store_value("svrty"..element..strtag)
  --debugprint ("svrty"..element..strtag,check1,svrty)
  svrty=svrty or 0
  --
  --debugprint (strtag,points,count,svrty)
  if check==true then
    if count-points<0 then
      svrty= svrty*(points/count)
    end
    local

    svrty= svrty/cls
    local fault=''
    if strtag=='GRTTH' then fault= gear_analysis(strtag,element,1) end
    debugprint (strtag,"Fault Calculated Normalized Severity",count,svrty,fault,string.gsub(strtag,strtag,fault..' '..strtag,5))
    assert2(svrty)

    return true,svrty
  end
  debugprint (rn.." "..strtag.." FF severity FALSE")
  return false,0
end
--
function analyze_calls(calls)
  local axes={}
  local brgs={}
  for i,c in ipairs (calls) do
    local af=false
    for j,a in ipairs (axes) do
      if a==c.axis then af=true end
    end
    if not(af) then table.insert(axes, c.axis) end
    local bf=false
    for j,b in ipairs(brgs) do
      if b==c.brg then bf=true end
    end
    if not(bf) then table.insert(brgs, c.brg) end
  end
  return #brgs,#axes
end
--
function pairscount(prs)
  local count=0
  if prs~=nil then
    for _,p in pairs (prs) do
      count=count+1
    end
  end
  return count
end
---- Generic Rotor Balance Check Function no average
--**************************************************
function rotorbalancenoave(element,brg,straxis,strrotorname,threshold,svrtymult) -- Generic Rotor Balance Check Function
  --goto out
  threshold,svrtymult=z_get_rule_tune_info(element,threshold,svrtymult)
  local ampthresh=tonumber(get_attribute_value("AMPTHRESH",element, 110)) 
  local rn=strrotorname or ''
  local rff={}
  debugprint ("Amplitube threshold balance rule started on "..rn.." Rotor",element,"bearing",brg,"axis",straxis)
  increment_store_counter( "ptsbal")
  local balthld=threshold or 108
  local smult=svrtymult or 1
  local sverity=0
  if strrotorname=="MOTRTRBARS" then
    local _
  end
  z_countuniquecalls('1x','',brg,straxis)
  local rFBal=find_tag_info( "1X", element, brg, straxis )
  increment_store_counter( "ptbal" )
  if rFBal.found then
    local sval=rFBal.value
    local aval=ampthresh
    local dif=aval-sval
    local ordr=rFBal.order

    if dif>0 then
      sverity=z_amplitude_weighted_severity( dif,sval,110)
      local datami
      if trouble_shoot then
        datami=z_fault_tone_list(element,brg,straxis,ordr, sval, aval,sverity,rFBal.dsi,rFBal.bin, "Rotor Balance "..rn.." sord-"..rFBal.freq,"1X", rFBal.sfreq) 
      else
        datami=z_fault_tone_list(element,brg,straxis,ordr, sval, aval,sverity,rFBal.dsi,rFBal.bin, "Rotor Balance "..rn,'1X', rFBal.freq) 
        --debugprint (sverity)
      end
      z_flag_tone_as_found (element,brg,straxis, rFBal.bin ,datami)
      local check,count = get_store_value("balsvrty")
      if check==true then
        count = count + sverity*smult*3
      else
        count = sverity*smult
      end
      if sverity~=0 then 
        put_store_value("balsvrty",count)
        assert2(1)
        debugprint ("Amplitude Threshold Balance rule fired - Severity",sverity,'dif',dif,'theshold', aval,'sval', sval)
        return true
      end
    end
  end  
  ::out::
  debugprint ("Balance rule FALSE")
--]]

  return false
end
-- Generic Rotor Balance Check Function
--**************************************************
function rotorbalance(element,brg,straxis,strrotorname,threshold,svrtymult) -- Generic Rotor Balance Check Function
  --goto out
  threshold,svrtymult=z_get_rule_tune_info(element,threshold,svrtymult)
  local rn=strrotorname or ''
  local rff={}
  debugprint ("Balance rule started on "..rn.." Rotor",element,"bearing",brg,"axis",straxis)
  increment_store_counter( "ptsbal")
  local balthld=threshold or 108
  local smult=svrtymult or 1
  local sverity=0
  if strrotorname=="MOTRTRBARS" then
    local _
  end
  z_countuniquecalls('1x','',brg,straxis)
  local rFBal=find_tag_info( "1X", element, brg, straxis )
  if rFBal.found then 
    increment_store_counter( "ptbal" )
    rFBal=z_get123orders( "1X", element, brg, straxis )
    if rFBal.found and rFBal.sval1x>0 then
      local sval=rFBal.sval1x
      local aval=rFBal.aval1x
      local dif=rFBal.dif1x
      local ordr=rFBal.sord1x
      local haveave=true
      if aval==0 then
        balthld=tonumber(get_attribute_value("AMPTHRESH",element, 110)) 
        aval=balthld
        if sval~=0 then
          dif=aval-sval
        else
          dif=0
        end
        haveave=false
      end

      if ((dif > g_fault_tone_threshold or (dif >3  and sval>g_significance_threshold)) and haveave) or (not(haveave) and dif>0) then
        sverity=z_amplitude_weighted_severity( dif,sval,balthld)

        local datami
        if trouble_shoot then
          datami=z_fault_tone_list(element,brg,straxis,ordr, sval, aval,sverity,rFBal.sdsi1x,rFBal.bin1x, "Rotor Balance "..rn.." sord-"..rFBal.sfreq,"1X", rFBal.sfreq) 
        else
          datami=z_fault_tone_list(element,brg,straxis,ordr, sval, aval,sverity,rFBal.sdsi1x,rFBal.bin1x, "Rotor Balance "..rn,'1X', rFBal.sfreq) 
          --debugprint (sverity)
        end
        z_flag_tone_as_found (element,brg,straxis, rFBal.sbin ,datami)
        local check,count = get_store_value("balsvrty")
        if check==true then
          count = count + sverity*smult*3
        else
          count = sverity*smult
        end
        if sverity~=0 then 
          put_store_value("balsvrty",count)
          assert2(1)
          debugprint ("Balance rule fired - Severity",sverity,'dif',dif,'aval', aval,'sval', sval)
          return true
        end
      end
    end  
  end
  ::out::
  debugprint ("Balance rule FALSE")
--]]

  return false
end
--
-- Calculate balance Normalized Severity function
--
function rotorbalanceseverity(strrotorname) -- Calculate balance Normalized Severity function
  local name=strrotorname or ""
  debugprint (name..' Balance severity normalization started')
  local check2,pts = get_store_value("ptsbal")
  local check,count = get_store_value("ptbal")
  local check1,svrty = get_store_value("balsvrty")
  local _, calls = get_store_value("calls"..''..'1x')
  local cls=pairscount(calls)
  if check==true then
    if count-pts<0 then
      svrty= svrty*(pts/count)
    end
    svrty= svrty/cls*3  -- normalized to one axis and multiplied times 3 for scaling
    debugprint ("-- Calculate Normalized Severity --",count,svrty,name,"Rotor Balance" )
    assert2(svrty)
    return true
  end
  debugprint ("Balance severity false")
  return false
end
--
-- Generic Rotor structural looseness/soft foot Check Function
--**************************************************
function rotorsoftfoot(element,brg,strrotorname, threshold, svrtymult) -- Generic Rotor structural looseness/soft foot Check Function
  threshold,svrtymult=z_get_rule_tune_info(element,threshold,svrtymult)
  local cn=get_this_comp_number()
  local orient=get_comp_orientation(cn)
  if orient== 'v' then 
    debugprint('Vertical component - Softfoot rule terminated')
    return false 
  end
  local rn=strrotorname or ''
  debugprint ("Softfoot rule started on "..rn.." Rotor",element,"bearing",brg)
  increment_store_counter( "sfpts")
  local balthld = threshold or 108
  local smult = svrtymult or 1
  local sverity=0
  z_countuniquecalls('1x','',brg,'t')
  local rF1xt=analyze_by_tag( "1X", element, brg, "t" )
  increment_store_counter( "sfpt" )
  local rF1xr=analyze_by_tag( "1X", element, brg, "r" )
  if rF1xr.found and rF1xt.found then
    local tsval=rF1xt.sval
    local taval=rF1xt.aval
    local tdif=rF1xt.dif
    local rsval=rF1xr.sval
    local raval=rF1xr.aval
    local rdif=rF1xr.dif
    local trdif=tsval-rsval
    if tdif>3 and trdif>10 and tsval>g_significance_threshold  and tdif-rdif>3 then
      sverity=tdif -- not amplitude weighted sverity
      --debugprint (sverity)
      if tsval >balthld then
        sverity=sverity+z_high_level_severity(tsval,balthld)
      end
      local datami=z_fault_tone_list(element,brg,"t", rF1xt.sord, tsval, taval,sverity,rF1xt.sdsi,rF1xt.sbin, "Rotor Softfoot "..rn,"1X", rF1xt.sfreq)
      z_flag_tone_as_found (element,brg,"t", rF1xt.sbin ,datami)
      increment_store_counter( "sfpt" )
      local check,count = get_store_value("sfsvrty")
      if check==true then
        count = count + sverity*smult
      else
        count = sverity*smult
      end
      if sverity~=0 then
        put_store_value("sfsvrty",count)
        assert2(1)
        debugprint (rn.." softfoot rule fired - Severity",sverity)
        return true
      end
    end
  end

  ::out::
  debugprint(rn.." Softfoot rule FALSE")
  return false
end
-- 
-- ***********  Soft foot severity nomalization function *****************

function rotorsoftfootseverity (strrotorname) -- Soft foot severity nomalization function 
  local rn=strrotorname or ''
  debugprint (rn.." Softfoot severity rule started")  
  local check2,pts = get_store_value("sfpts")
  local check,count = get_store_value("sfpt")
  local check1,svrty = get_store_value("sfsvrty")
  local _, calls = get_store_value("calls"..''..'1x')
  local cls=pairscount(calls)
  if check==true then
    if count-pts<0 then
      svrty= svrty*(pts/count)
    end
    svrty= svrty/cls*4 -- times 4 for scaling
    debugprint ("-- Calculate Motor Softfoot Normalized Severity --",count,svrty,rn.." Softfoot SSSSSSSSSSSSSSSSSSSSSSSSSSS")
    assert2(svrty)
    return true
  end
  debugprint (rn.." Softfoot rule FALSE")
  return false
end
---- Generic Rotor overhung mass imbalance Check Function no average
--**************************************************
function rotoroverhungbalancenoave(element,brg,strrotorname, threshold, svrtymult) -- Generic Rotor overhung mass imbalance Check Function no ave
  threshold,svrtymult=z_get_rule_tune_info(element,threshold,svrtymult)
  local ampthresh=tonumber(get_attribute_value("AMPTHRESH",element, 110)) 
  local rn=strrotorname or ''
  debugprint ("Overhung balance rule started on "..rn.." Rotor",element,"bearing",brg)
  increment_store_counter( "ptsob")
  local balthld = threshold or 108
  local smult = svrtymult or 1
  local sverity=0
  z_countuniquecalls('1x','',brg,'a')
  local rF1xa=find_tag_info( "1X", element, brg, "a" )
  increment_store_counter( "ptob" )
  z_countuniquecalls('1x','',brg,'r')
  local rF1xr=find_tag_info( "1X", element, brg, "r" )
  z_countuniquecalls('1x','',brg,'t')
  local rF1xt=find_tag_info( "1X", element ,brg, "t" )
  if rF1xa.found then
    local asval=rF1xa.value
    local aaval=ampthresh
    local adif=aaval-asval
    local rsval=rF1xr.value or 0
    local raval=ampthresh
    local rdif=raval-rsval
    local tsval=rF1xt.value or 0
    local taval=ampthresh
    local tdif=taval-tsval
    local datami
    --if (asval > rsval) and (asval > tsval) then
    if  adif>0 then 

      local asverity=z_amplitude_weighted_severity( adif,asval,ampthresh)

      sverity=sverity+asverity
      datami=z_fault_tone_list(element,brg,"a", rF1xa.order, asval, aaval,asverity,rF1xa.dsi,rF1xa.bin, "Rotor Imbalance - Overhung",'1X',rF1xa.freq) 
      z_flag_tone_as_found (element,brg,"a", rF1xa.bin ,datami)
    end
    if rdif>0 then 

      local rsverity=z_amplitude_weighted_severity( rdif,rsval,ampthresh)
      sverity=sverity+rsverity
      datami=z_fault_tone_list(element,brg,"r",rF1xr.order, rsval, raval,rsverity,rF1xr.dsi,rF1xr.bin, "Rotor Imbalance - Overhung",'1X',  rF1xr.freq) 
      z_flag_tone_as_found (element,brg,"r", rF1xr.bin ,datami)
    end
    if tdif>0 then 

      local tsverity= z_amplitude_weighted_severity( tdif,rsval,ampthresh)


      sverity=sverity+tsverity
      datami=z_fault_tone_list(element,brg,"t",rF1xt.order, tsval, taval,tsverity,rF1xt.dsi,rF1xt.bin, "Rotor Imbalance - Overhung",'1X', rF1xt.freq) 
      z_flag_tone_as_found (element,brg,"t", rF1xt.bin ,datami)
    end
    local check,count = get_store_value("obsvrty")
    if check==true then
      count = count + sverity*smult
    else
      count = sverity*smult
    end
    if sverity~=0 then
      put_store_value("obsvrty",count)
      assert2(1)
      debugprint (rn.." overhung balance rule fired - Severity",sverity)
      return true
    end
    --end
  end

  ::out::
  debugprint(rn.." overhung balance rule FALSE")
  return false
end
-- Generic Rotor overhung mass imbalance Check Function
--**************************************************
function rotoroverhungbalance(element,brg,strrotorname, threshold, svrtymult) -- Generic Rotor overhung mass imbalance Check Function
  threshold,svrtymult=z_get_rule_tune_info(element,threshold,svrtymult)
  local rn=strrotorname or ''
  debugprint ("Overhung balance rule started on "..rn.." Rotor",element,"bearing",brg)
  increment_store_counter( "ptsob")
  local balthld = threshold or 108
  local smult = svrtymult or 1
  local sverity=0
  z_countuniquecalls('1x','',brg,'a')
  local rF1xa=analyze_by_tag( "1X", element, brg, "a" )
  increment_store_counter( "ptob" )
  z_countuniquecalls('1x','',brg,'r')
  local rF1xr=analyze_by_tag( "1X", element, brg, "r" )
  z_countuniquecalls('1x','',brg,'t')
  local rF1xt=analyze_by_tag( "1X", element ,brg, "t" )
  if rF1xa.found then
    local asval=rF1xa.sval
    local aaval=rF1xa.aval
    local adif=rF1xa.dif
    local rsval=rF1xr.sval or 0
    local raval=rF1xr.aval or 0
    local rdif=rF1xr.dif or 0
    local tsval=rF1xt.sval or 0
    local taval=rF1xt.aval or 0
    local tdif=rF1xt.dif or 0 
    local datami
    --if (asval > rsval) and (asval > tsval) then
    if adif>g_fault_tone_threshold or ( adif>3 and asval>g_significance_threshold) then 

      local asverity= adif -- not amplitude weighted

      if asval >balthld then asverity=asverity + z_high_level_severity(asval,balthld)  end
      sverity=sverity+asverity
      datami=z_fault_tone_list(element,brg,"a", rF1xa.sord, asval, aaval,asverity,rF1xa.sdsi,rF1xa.sbin, "Rotor Imbalance - Overhung",'1X', rF1xa.sfreq) 
      z_flag_tone_as_found (element,brg,"a", rF1xa.sbin ,datami)
    end
    if rdif>g_fault_tone_threshold or (rdif>3 and rsval>g_significance_threshold) then 

      local rsverity=rdif  -- not amplitude weighted

      if rsval >balthld then rsverity=rsverity+z_high_level_severity(rsval,balthld)  end
      sverity=sverity+rsverity
      datami=z_fault_tone_list(element,brg,"r",rF1xr.sord, rsval, raval,rsverity,rF1xr.sdsi,rF1xr.sbin, "Rotor Imbalance - Overhung",'1X',  rF1xr.sfreq) 
      z_flag_tone_as_found (element,brg,"r", rF1xr.sbin ,datami)
    end
    if tdif>g_fault_tone_threshold or (tdif> 3 and tsval>g_significance_threshold) then 

      local tsverity= tdif -- not amplitude weighted

      if tsval >balthld then tsverity=tsverity+z_high_level_severity(tsval,balthld)  end
      sverity=sverity+tsverity
      datami=z_fault_tone_list(element,brg,"t",rF1xt.sord, tsval, taval,tsverity,rF1xt.sdsi,rF1xt.sbin, "Rotor Imbalance - Overhung",'1X', rF1xt.sfreq) 
      z_flag_tone_as_found (element,brg,"t", rF1xt.sbin ,datami)
    end
    local check,count = get_store_value("obsvrty")
    if check==true then
      count = count + sverity*smult
    else
      count = sverity*smult
    end
    if sverity~=0 then
      put_store_value("obsvrty",count)
      assert2(1)
      debugprint (rn.." overhung balance rule fired - Severity",sverity)
      return true
    end
    --end
  end

  ::out::
  debugprint(rn.." overhung balance rule FALSE")
  return false
end
-- 
-- *********** Generic Rotor overhung mass imbalance severity nomalization function *****************

function rotoroverhungbalanceseverity (strrotorname) -- Overhung balance severity nomalization function 
  local rn=strrotorname or ''
  debugprint (rn.." overhung balance severity rule started")
  local check2,pts = get_store_value("ptsob")
  local check,count = get_store_value("ptob")
  local check1,svrty = get_store_value("obsvrty")
  local _, calls = get_store_value("calls"..''..'1x')
  local cls=pairscount(calls)
  if check==true then
    if count-pts<0 then
      svrty= svrty*(pts/count)
    end
    svrty= svrty/cls *3 -- normalize to one axis and multiplied time 3 for scaling
    debugprint ("-- Calculate Rotor Overhung Balance Normalized Severity --",count,svrty,rn.." overhung balance SSSSSSSSSSSSSSSSSSSSSSSSSSS")
    assert2(svrty)
    return true
  end
  debugprint (rn.." overhung balance severity rule FALSE")
  return false
end
--
-- Generic Rotor Looseness Check Function
--**************************************************
function rotorlooseness(element,brg,straxis,strrotorname,threshold,svrtymult) -- Generic Rotor Looseness Check Function
  threshold,svrtymult=z_get_rule_tune_info(element,threshold,svrtymult)
  local rn=string.upper(strrotorname) or ''
  local cplg=(rn=='COUPLING')
  local cn=get_this_comp_number()
  debugprint ("Looseness rule started on ",rn," Rotor",element,"bearing",brg,"axis",straxis)
  local loosthld = threshold or 108
  local smult = svrtymult or 1
  local ampwtsvth=108
  if cplg then
    ampwtsvth=100
  end
  local x=''
  local sverity=0 
  local hcount=0
  local howmanyharmonics=20
  z_countuniquecalls('1x',element,brg,straxis)
  increment_store_counter( "ptsloos")
  local rFff=find_tag_info( "1X", element, brg, straxis )
  if rFff.found then
    increment_store_counter( "ptloos")
    if rn=='PUMP' then
      local _
    end 
    local rFLoos=get_harmonic_groups_from_cpl(element,brg,straxis,'1X')
    --local rFLoos=z_get_harmonic_groups_from_peak_list(element,brg,straxis,'1X')-- analyze_harmonic_by_tag( "1X", element, brg, straxis )
    if rFLoos.found then 
      local mxorders=rFLoos.orders 
      local ordcount=rFLoos.count
      local ordmatches=rFLoos.matches
      local firstorder=100
      local sval, aval, dif, difs=0,0,0,0
      for ord,tm in pairs(ordmatches) do 
        if tm.dif== nil then break end
        local isff=false
        for _,mtch in ipairs(tm.matches) do
          local x=string.match(string.upper(mtch.tag),'X')
          if x==nil and not (mtch.tag=='MOTPOLES' or mtch.tag=='LF' ) and cn==mtch.cn then isff=true end
        end
        local islfx,mtrissync = z_peak_is_2xLF_mult(tm.sfreq,rFff.freq)
        if not (islfx and mtrissync) and not (isff) then  -- tone not multiple of line frequency and 1x not too close syncronous to tell or a forcing frequency (pump vanes, fan blases, etc.)
          if tm.order >= 3 and tm.order <= howmanyharmonics  then-- Only count orders 3 thru howmanyharmonics
            if firstorder==100 then firstorder=tm.order end
            if cplg then
              local odd=(math.fmod(tm.order,3)==0)
              if (tm.dif> g_fault_tone_threshold or (tm.dif>3 and tm.sval>g_significance_threshold)) and odd then difs=difs+1 end
            else
              if tm.dif> g_fault_tone_threshold or (tm.dif>3 and tm.sval>g_significance_threshold) then difs=difs+1 end
            end
          end
        end
      end
      local edif,odif,eval,oval=0,0,0,0    
      if difs>=3 or (difs>2 and cplg) then 
        if cplg then
          for ord,tm in pairs(ordmatches) do
            local isff=false
            for _,mtch in ipairs(tm.matches) do
              x=string.match(string.upper(mtch.tag),'X')
              if x==nil and not (mtch.tag=='MOTPOLES' or mtch.tag=='LF') then isff=true end
            end
            if tm.order >= 3 and tm.order <= howmanyharmonics and not (isff) and firstorder<11 then-- Only count orders 3-howmanyharmonics
              local odd=(math.fmod(tm.order,3)==0)
              if odd then
                if tm.dif> g_fault_tone_threshold or (tm.dif>3 and tm.sval>g_significance_threshold) then 
                  odif=odif+tm.dif 
                  oval=oval+tm.sval
                end
              else
                if tm.dif> g_fault_tone_threshold or (tm.dif>3 and tm.sval>g_significance_threshold) then 
                  edif=edif+tm.dif
                  eval=eval+tm.sval
                end
              end
            end
          end
        end
        if (odif>edif and oval>eval and cplg) then
          for ord,tm in pairs(ordmatches) do 
            if tm.order >= 3 and tm.order <= howmanyharmonics then -- Only count orders 3-howmanyharmonics
              local isff=false
              for _,mtch in ipairs(tm.matches) do
                x=string.match(string.upper(mtch.tag),'X')
                if x==nil and not (mtch.tag=='MOTPOLES' or mtch.tag=='LF') then isff=true end
              end
              if math.fmod(tm.order,3)==0 and not (isff) and firstorder<11 then
                local sval=tm.sval
                local aval=tm.aval
                local dif=tm.dif
                local islfx,mtrissync = z_peak_is_2xLF_mult(tm.sfreq,rFff.freq)
                if not (islfx) and not (mtrissync) then  -- tone not multiple of line frequency and 1x not too close syncronous to tell
                  if dif> g_fault_tone_threshold or (dif>3 and tm.sval>g_significance_threshold) then
                    hcount=hcount+1
                    local hsverity=z_amplitude_weighted_severity(dif,sval,ampwtsvth)
                    if sval >loosthld then
                      --hsverity=hsverity+z_high_level_severity(sval,loosthld)
                    end
                    sverity=sverity+hsverity
                    debugprint ('Rotor '..tm.order..'x harmonic found in '..straxis..'axis on '..rn, sverity,dif,hsverity)
                    local datami=z_fault_tone_list(element,brg,straxis, tm.order, sval, aval,hsverity,tm.sdsi,tm.sbin,tm.order.."x(1X) Rotor Looseness on "..rn,tm.order..'x(1X)', tm.sfreq) 
                    z_flag_tone_as_found (element,brg,straxis, tm.sbin ,datami)
                  end
                end
              end
            end
          end
        elseif not(cplg) then
          for ord,tm in pairs(ordmatches) do 
            local isff=false
            for _,mtch in ipairs(tm.matches) do
              x=string.match(string.upper(mtch.tag),'X')
              if x==nil and not (mtch.tag=='MOTPOLES' or mtch.tag=='LF') then isff=true end
            end
            if tm.order >= 3 and tm.order <= howmanyharmonics and not (isff) and firstorder<11  then -- Only count orders 3-howmanyharmonics
              local sval=tm.sval
              local aval=tm.aval
              local dif=tm.dif
              local islfx,mtrissync = z_peak_is_2xLF_mult(tm.sfreq,rFff.freq)
              if not (islfx) and not (mtrissync) then  -- tone not multiple of line frequency and 1x not too close syncronous to tell
                if dif~=nil then 
                  if dif> g_fault_tone_threshold or (dif>3 and tm.sval>g_significance_threshold) then
                    hcount=hcount+1

                    local hsverity=z_amplitude_weighted_severity(dif,sval,ampwtsvth)

                    if sval >loosthld then
                      hsverity=hsverity+sval-loosthld
                    end
                    sverity=sverity+hsverity
                    debugprint ('Rotor '..tm.order..'x harmonic found in '..straxis..'axis on '..rn, sverity,dif,hsverity)
                    local datami=z_fault_tone_list(element,brg,straxis, tm.order, sval, aval,hsverity,tm.sdsi,tm.sbin,tm.order.."x(1X) Rotor Looseness on "..rn,tm.order..'x(1X)', tm.sfreq) 
                    z_flag_tone_as_found (element,brg,straxis, tm.sbin ,datami)
                  end
                end
              end
            end
          end
        end
      end
    end
    if (sverity)~=0 and hcount>2 then
      local thirdsubharmonics,s3sverty=0,0 -- z_subharmonics("1X",element,brg,straxis,1/3,6,strrotorname,threshold,svrtymult, "Rotor Looseness")
      local quartersubharmonics,s4sverty=0,0 -- z_subharmonics("1X",element,brg,straxis,.25,6,strrotorname,threshold,svrtymult, "Rotor Looseness")
      local fifthsubharmonics,s5sverty=0,0 -- z_subharmonics("1X",element,brg,straxis,.2,6,strrotorname,threshold,svrtymult, "Rotor Looseness")
      local check,count = get_store_value("loossvrty")
      if check==true then
        count = count + (sverity+s3sverty+s4sverty+s5sverty)*smult
      else
        count = (sverity+s3sverty+s4sverty+s5sverty)*smult
      end
      put_store_value("loossvrty",count)
      assert2(1) 
      debugprint (rn.." Looseness rule fired - Severity",sverity*smult," from ",howmanyharmonics,"harmonics")
      return true
    end
  end
  debugprint (rn.." Looseness rule FALSE")
  return false
end 
--
function rotorloosenessseverity(element,strrotorname) --  Rotor Looseness Severity Function
  local rn=strrotorname or ''
  --element=element or 2
  debugprint (rn.." Looseness severity started")
  local check2, points = get_store_value("ptsloos")
  local check,count = get_store_value("ptloos")
  count=count or points
  local check1,svrty = get_store_value("loossvrty")
  local _, calls = get_store_value("calls"..element..'1x')
  local cls=pairscount(calls)
  svrty=svrty or 0
  if check==true then
    if count-points<0 then
      svrty= svrty*(points/count)
    end
    svrty= svrty/cls
    debugprint ("-- Calculate Normalized Severity --",count,svrty,rn," looseness LLLLLLLLLLLLLLLLLLLLLLLLLLLLL")
    assert2(svrty)
    return true
  end
  debugprint ("Looseness severity FALSE")
  return false
end
--
--  ****************************************************************************

--
--  This function get the dif and sval for 1x thru 3x
function z_get123orders(strtag,element,brg,straxis) --  This function gets the dif and sval for 1x thru 3x order of 1X.
  local r1X = find_tag_info( strtag, element, brg, straxis ) 
  if r1X == nil or r1X.found == false then 
    return {["found"]=false}
  end  
  local ord1val=0
  local ord1aval=0
  local ord1dif=0 
  local ord1ord=0
  local sfreq=0
  local ord1bin=0
  local ord1dsi=0
  local ord2val=0
  local ord2aval=0
  local ord2dif=0
  local ord2ord=0
  local ord2bin=0
  local ord2dsi=0
  local ord3val=0
  local ord3aval=0
  local ord3dif=0
  local ord3ord=0
  local ord3bin=0
  local ord3dsi=0
  --local r1XH = analyze_harmonic_by_tag( strtag, element, brg, straxis) 
  local rFHarm=get_harmonic_groups_from_cpl(element,brg,straxis,strtag) --analyze_harmonic_by_tag( , element, brg, straxis )
  if rFHarm.found == true then 
    local set=false
    for i,match in ipairs(rFHarm.matches) do
      if round (match.order) == 1 then
        if match.sfreq~=nil then
          set=true
          sfreq=match.sfreq
          local islfx,mtrissync = z_peak_is_2xLF_mult(match.sfreq,sfreq)
          if match.order ~= nil then ord1ord=match.sord end
          if match.sval ~= nil then ord1val=match.sval end
          if match.aval ~= nil then ord1aval=match.aval end
          if match.dif ~= nil then ord1dif=match.dif end
          if match.sbin ~= nil then ord1bin=match.sbin end
          if match.sdsi ~= nil then ord1dsi=match.sdsi end
        end 
      end
      if round (match.order) == 2 then
        if match.sfreq~=nil then
          local islfx,mtrissync = z_peak_is_2xLF_mult(match.sfreq,sfreq)
          if not (islfx and mtrissync) then  -- tone not multiple of line frequency and 1x not too close syncronous to tell
            set=true
            if match.order ~= nil then ord2ord=match.sord end
            if match.sval ~= nil then ord2val=match.sval end
            if match.aval ~= nil then ord2aval=match.aval end
            if match.dif ~= nil then ord2dif=match.dif end
            if match.sbin ~= nil then ord2bin=match.sbin end
            if match.sdsi ~= nil then ord2dsi=match.sdsi end
          end 
        end 
      end
      if round(match.order) == 3 then 
        if match.sfreq~=nil then
          local islfx,mtrissync = z_peak_is_2xLF_mult(match.sfreq,sfreq)
          if not (islfx and mtrissync) then  -- tone not multiple of line frequency and 1x not too close syncronous to tell
            set=true
            if match.order ~= nil then ord3ord=match.sord end
            if match.sval ~= nil then ord3val=match.sval end
            if match.aval ~= nil then ord3aval=match.aval end
            if match.dif ~= nil then ord3dif=match.dif end
            if match.sbin ~= nil then ord3bin=match.sbin end
            if match.sdsi ~= nil then ord3dsi=match.sdsi end
          end 
        end
      end
    end
    if not(set) then return {["found"]=false} end
  end
  return { ["found"]=true, ["sval1x"] = ord1val, ["aval1x"] = ord1aval, ["dif1x"] = ord1dif, ["sval2x"] = ord2val, ["aval2x"] = ord2aval, ["dif2x"] = ord2dif, ["sval3x"] = ord3val, ["aval3x"] = ord3aval, ["dif3x"] = ord3dif , ['sord1x'] = ord1ord , ['sord2x'] = ord2ord , ['sord3x'] = ord3ord ,['sfreq']=sfreq,['bin1x']=ord1bin,['bin2x']=ord2bin,['bin3x']=ord3bin,['dsi1x']=ord1dsi,['dsi2x']=ord2dsi,['dsi3x']=ord3dsi}
end
--
--
-- Coupling Angular Misalignment Check Function
--**************************************************
--
function couplingangularmisalignment(element,brg,threshold,svrtymult) -- Coupling Angular Misalignment Check Function
  threshold,svrtymult=z_get_rule_tune_info(element,threshold,svrtymult)
  debugprint ("Angular misalignment started on Rotor",element,"bearing",brg)
  local balthld = threshold or 108
  local smult = svrtymult or 1
  local sverity=0
  z_countuniquecalls('1x','',brg,'a')
  increment_store_counter( "angpts" )
  local rFAm=z_get123orders( "1X", element, brg, "a" )
  if rFAm.found then 
    increment_store_counter( "angpt" )
    local datami
    local dif1x=rFAm.dif1x
    if rFAm.aval1x>0 then
      --debugprint (dif1x)
      if dif1x>g_fault_tone_threshold or (dif1x>3 and rFAm.sval1x>g_significance_threshold) then
        local brgsv = z_amplitude_weighted_severity( dif1x,rFAm.sval1x,balthld)
        sverity=brgsv
        if rFAm.sval1x >balthld then sverity=sverity+z_high_level_severity(rFAm.sval1x,balthld) end
        datami=z_fault_tone_list(element,brg,"a", rFAm.sord1x, rFAm.sval1x, rFAm.aval1x,sverity,rFAm.dsi1x,rFAm.bin1x, "Coupling Misalignment - Angular",'1x(1X)', rFAm.sfreq) 
        z_flag_tone_as_found (element,brg,"a", rFAm.bin1x ,datami)
        local dif2x=rFAm.dif2x
        local dif3x=rFAm.dif3x
        --debugprint (dif1x,dif2x,dif3x)

        if dif2x>g_fault_tone_threshold or (dif2x>3 and rFAm.sval2x>g_significance_threshold) then 
          brgsv= z_amplitude_weighted_severity( dif2x,rFAm.sval2x,balthld)
          sverity=sverity+brgsv
          --if rFAm.sval2x >balthld then sverity=sverity+z_high_level_severity(rFAm.sval2x,balthld) end
          datami=z_fault_tone_list(element,brg,"a", rFAm.sord2x,rFAm.sval2x , rFAm.aval2x,sverity,rFAm.dsi2x,rFAm.bin2x, "Coupling Misalignment - Angular",'2x(1X)', rFAm.sfreq*2) 
          z_flag_tone_as_found (element,brg,"a", rFAm.bin2x ,datami)
        end
        if dif3x>g_fault_tone_threshold or ( dif3x>3 and rFAm.sval3x>g_significance_threshold) then 
          brgsv= z_amplitude_weighted_severity( dif3x,rFAm.sval3x,balthld)
          sverity=sverity+brgsv
          --if rFAm.sval3x >balthld then sverity=sverity+z_high_level_severity(rFAm.sval3x,balthld) end
          datami=z_fault_tone_list(element,brg,"a",  rFAm.sord3x, rFAm.sval3x, rFAm.aval3x,sverity,rFAm.dsi3x,  rFAm.bin3x, "Coupling Misalignment - Angular",'3x(1X)', rFAm.sfreq*3) 
          z_flag_tone_as_found (element,brg,"a", rFAm.bin3x ,datami)
        end 
      end
    else
      local ampthresh=tonumber(get_attribute_value("AMPTHRESH",element, 110))
      if rFAm.sval1x>0 then 
        dif1x=ampthresh - rFAm.sval1x 
      else
        dif1x=0
      end
      if dif1x>0 then
        local brgsv = z_amplitude_weighted_severity( dif1x,rFAm.sval1x,ampthresh)
        sverity=brgsv
        datami=z_fault_tone_list(element,brg,"a", rFAm.sord1x, rFAm.sval1x, ampthresh,sverity,rFAm.dsi1x,rFAm.bin1x, "Coupling Misalignment - Angular",'1x(1X)', rFAm.sfreq) 
        z_flag_tone_as_found (element,brg,"a", rFAm.bin1x ,datami)
        local dif2x=ampthresh - rFAm.sval2x
        local dif3x=ampthresh - rFAm.sval3x
        --debugprint (dif1x,dif2x,dif3x)

        if dif2x>0 then 
          brgsv= z_amplitude_weighted_severity( dif2x,rFAm.sval2x,ampthresh)
          sverity=sverity+brgsv
          --if rFAm.sval2x >balthld then sverity=sverity+z_high_level_severity(rFAm.sval2x,balthld) end
          datami=z_fault_tone_list(element,brg,"a", rFAm.sord2x,rFAm.sval2x , ampthresh,sverity,rFAm.dsi2x,rFAm.bin2x, "Coupling Misalignment - Angular",'2x(1X)', rFAm.sfreq*2) 
          z_flag_tone_as_found (element,brg,"a", rFAm.bin2x ,datami)
        end
        if dif3x>0 then 
          brgsv= z_amplitude_weighted_severity( dif3x,rFAm.sval3x,ampthresh)
          sverity=sverity+brgsv
          --if rFAm.sval3x >balthld then sverity=sverity+z_high_level_severity(rFAm.sval3x,balthld) end
          datami=z_fault_tone_list(element,brg,"a",  rFAm.sord3x, rFAm.sval3x, ampthresh,sverity,rFAm.dsi3x,  rFAm.bin3x, "Coupling Misalignment - Angular",'3x(1X)', rFAm.sfreq*3) 
          z_flag_tone_as_found (element,brg,"a", rFAm.bin3x ,datami)
        end
      end
    end
    increment_store_counter( "angpt" )
    if sverity>0 then
      local check,count = get_store_value("angsvrty")
      if check==true then
        count = count + sverity*smult*3
      else
        count = sverity*smult*3
      end
      put_store_value("angsvrty",count)
      debugprint ("Angular Misalignment rule fired - Severity",sverity,count,"AAAAAAAAAAAAAAAAAAAAAA")
      assert2(1)
      return true
    end
  end

  debugprint ('Angular misalignment false')
  return false
end
--
function couplingangularmisalignmentseverity () -- Coupling Angular Misalignment normalization Function
  debugprint ("Angular misalignment severity started")

  local check,count = get_store_value("angpt")
  local check2,pts = get_store_value("angpts")
  count = count or pts
  local check1,svrty = get_store_value("angsvrty")
  local _, calls = get_store_value("calls"..''..'1x')
  local cls=pairscount(calls)
  svrty=svrty or 0
  if check==true then
    --debugprint (check,count,check1,svrty)
    if count-pts<0 then
      svrty= svrty*(pts/count)
    end
    svrty= svrty/cls*4 -- times 4 for scaling
    debugprint ("-- Calculate Normalized Severity --",count,svrty,"Angular Misalignment SSSSSSSSSSSSSSSSSSSSSSSSSSS")
    assert2(svrty)
    return true
  end
  debugprint ("Angular misalignment severity FALSE")
  return false
end
--
-- Coupling Parallel Misalignment Check Function
--**************************************************
function couplingparallelmisalignment(element,brg,threshold,svrtymult) -- Coupling Parallel Misalignment Check Function
  threshold,svrtymult=z_get_rule_tune_info(element,threshold,svrtymult)
  debugprint ("Parallel misalignment started on Rotor",element,"bearing",brg)
  local ampthresh=tonumber(get_attribute_value("AMPTHRESH",element, 110))
  local balthld = threshold or 108
  local smult = svrtymult or 1
  local sverity=0
  increment_store_counter( "parpts" )
  z_countuniquecalls('1x',element,brg,'r')
  local rFpmr=z_get123orders( "1X", element, brg, "r" )
  if rFpmr.found then 
    increment_store_counter( "parpt" )
    local dif1xr=rFpmr.dif1x
    local dif2xr=rFpmr.dif2x
    local dif3xr=rFpmr.dif3x
    local sval1xr=rFpmr.sval1x
    local sval2xr=rFpmr.sval2x
    local sord1xr=rFpmr.sord1x
    local sord2xr=rFpmr.sord2x
    local fxdth=false
    if rFpmr.aval==0 then
      dif1xr=ampthresh-sval1xr
      dif2xr=ampthresh-sval2xr
      dif3xr=ampthresh-rFpmr.sval3x
      fxdth=true
      balthld=ampthresh
    end
    local datami=0
    if dif2xr>0  then
      if sval2xr>sval1xr  then
        if ((dif2xr>g_fault_tone_threshold or (dif2xr>3 and sval2xr>g_significance_threshold))and not (fxdth)) or (fxdth and dif2xr>0) then 
          local rsverity=-z_amplitude_weighted_severity(dif2xr,rFpmr.sval2x,balthld)
          sverity=sverity+rsverity  
          datami= z_fault_tone_list(element,brg,"r", sord2xr, sval2xr, sval2xr-dif2xr,rsverity,rFpmr.dsi2x,rFpmr.bin2x, "Coupling Misalignment - Parallel",'2x(1X)',rFpmr.sfreq*2)
          z_flag_tone_as_found (element,brg,"r", rFpmr.bin2x,datami)
        end

        if ((dif3xr>g_fault_tone_threshold or (dif3xr>3 and rFpmr.sval3x>g_significance_threshold)) and not(fxdth)) or (fxdth and dif3xr>0) then 
          local rsverity=z_amplitude_weighted_severity(dif3xr,rFpmr.sval3x,balthld)
          sverity=sverity+rsverity 
          datami= z_fault_tone_list(element,brg,"r", rFpmr.sord3x, rFpmr.sval3x, rFpmr.sval3x-dif3xr,rsverity ,rFpmr.dsi3x,rFpmr.bin3x,"Coupling Misalignment - Parallel",'3x(1X)',rFpmr.sfreq*3)
          z_flag_tone_as_found (element,brg,"r", rFpmr.bin3x ,datami)
        end
      end
    end
  end
  z_countuniquecalls('1x','',brg,'t')
  local rFpmt=z_get123orders( "1X", element, brg, "t" )
  if rFpmt.found then
    local dif1xt=rFpmt.dif1x
    local dif2xt=rFpmt.dif2x
    local dif3xt=rFpmt.dif3x 
    local sval1xt=rFpmt.sval1x
    local sval2xt=rFpmt.sval2x
    local sord1xt=rFpmt.sord1x
    local sord2xt=rFpmt.sord2x
    local fxdth=false
    if rFpmt.aval==0 then
      dif1xt=ampthresh-sval1xt
      dif2xt=ampthresh-sval2xt
      dif3xt=ampthresh-rFpmt.sval3x
      fxdth=true
      balthld=ampthresh
    end
    local datami=0
    if  dif2xt>0 then
      if  sval2xt>sval1xt then
        if ((dif2xt>g_fault_tone_threshold or (dif2xt>3 and sval2xt>g_significance_threshold)) and not (fxdth)) or (fxdth and dif2xt>0) then 
          local tsverity= z_amplitude_weighted_severity(dif3xt,rFpmt.sval3x,balthld)
          sverity=sverity + tsverity 
          datami= z_fault_tone_list(element,brg,"t", sord2xt, sval2xt, sval2xt-dif2xt,tsverity,rFpmt.dsi2x,rFpmt.bin2x, "Coupling Misalignment - Parallel",'2x(1X)',rFpmt.sfreq*2)
          z_flag_tone_as_found (element,brg,"t",  rFpmt.bin2x,datami)
        end
        if ((dif3xt>g_fault_tone_threshold or (dif3xt>3 and rFpmt.sval3x>g_significance_threshold))and not (fxdth)) or (fxdth and dif3xt>0) then 
          local tsverity= z_amplitude_weighted_severity(dif3xt,rFpmt.sval3x,balthld) 
          sverity=sverity+ tsverity
          datami= z_fault_tone_list(element,brg,"t", rFpmt.sord3x, rFpmt.sval3x, rFpmt.sval3x-dif3xt,tsverity,rFpmt.dsi3x,rFpmt.bin3x, "Coupling Misalignment - Parallel",'3x(1X)',rFpmt.sfreq*3)
          z_flag_tone_as_found (element,brg,"t", rFpmt.bin3x ,datami)
        end 
      end
    end
  end
  if rFpmr.found or rFpmt.found then
    if sverity>0 then
      local check,count = get_store_value("parsvrty")
      if check==true then
        count = count + sverity*smult*3
      else
        count = sverity*smult*3

      end 
      put_store_value("parsvrty",count)
      debugprint ("Parallel Misalignment rule fired - Severity",count,"PPPPPPPPPPPPPPPPPP")
      assert2(1)
      return true
    end
  end


  debugprint ("Parallel Misalignment FALSE")
  return false
end
--
--
function couplingparallelmisalignmentseverity () -- Coupling Parallel Misalignment normalization Function

  debugprint ("Parallel Misalignment normalize started")
  local check,count = get_store_value("parpt")
  local check2,pts = get_store_value("parpts")
  count=count or pts
  local check1,svrty = get_store_value("parsvrty")
  local _, calls = get_store_value("calls"..''..'1x')
  local cls=pairscount(calls)
  svrty=svrty or 0
  if check==true then
    if count-pts<0 then
      svrty= svrty*(pts/count)
    end
    svrty= svrty/cls*3 -- time 3 for scaling
    debugprint ("-- Calculate Normalized Severity --",count,svrty,"parallel Misalignment PPPPPPPPPPPPPPPPPPPPPPPPPPPPP")
    assert2(svrty)
    return true
  end
  debugprint ("Parallel Misalignment FALSE")
  return false
end
--
-- End coupling misalignment functions
--
--  **************************************************************
--
-- Ski slope avaluation (ski slope is BB noise < 3x1X with the the lower frequencies > than higher frequencies)
--
function bearingLFskislopes(element,brg,straxis,strrotorname,threshold,svrtymult) -- Ski slope avaluation (ski slope is BB noise < 3x1X with the the lower frequencies > than higher frequencies)
  local bearing,alias,spdratio =z_get_brg_and_data_set_speed_ratio(element,brg)
  local stop,start=maximum_data_range(element,brg,straxis)
  local rn=strrotorname or ''
  z_countuniquecalls('SS','',brg,straxis)
  if start==nil and stop==nil then
    debugprint (rn.." No data to analysis - Ski Slope FALSE")
    return false
  end
  if bearing==alias then
    threshold,svrtymult=z_get_rule_tune_info(element,threshold,svrtymult)
    debugprint ("Ski slope evaluation started on "..rn.." Rotor",element,"bearing",brg,"axis",straxis)
    increment_store_counter( "SSpts"..rn )
    local ssthld=threshold  or 100
    local smult=svrtymult or .5
    local rF1x=analyze_by_tag( "1X", element, brg, straxis )
    increment_store_counter( "SSpt"..rn )
    local ordr1x=rF1x.sord
    local sr1x=rF1x.sfreq
    local bearing,alias,spdratio =z_get_brg_and_data_set_speed_ratio(element,brg)
    if sr1x==nil then
      for i,ds in ipairs (machine.datasets)  do
        if ds.dom=='spec' and ds.typ=='normal' and ds.axis==straxis and ds.mi==alias then
          sr1x=ds.speed*spdratio
          break
        end
      end 
    end
    if sr1x ~=nil then
      local ssdif=0
      local ssval=0
      local sdsi=0
      local lastsval=0
      local check,count = get_store_value("sssvrty"..rn)
      if check==false then count=0 end
      local step=(start-stop)/10
      local totalsvrity=0
      local sverity=0
      local rFss
      local maxamp,maxdif, maxampfreq, lastord,firstord=0,0,0,0,0
      for i=start,stop,-1*step do
        rFss = analyze_noise_floor( i, i+step, brg, straxis )
        ssdif=rFss.dif
        ssval=rFss.sval
        sdsi=rFss.sdsi
        if ssdif > 3 then 
          sverity=sverity+z_amplitude_weighted_severity(ssdif,ssval,108) 
          if lastord==0 then lastord=i end
          firstord=i-step
          if maxamp<ssval then 
            maxamp=ssval 

          end
          if maxdif<ssdif then 
            maxdif=ssdif 
            maxampfreq=i
          end
        end

        -- if ssval >ssthld then sverity=sverity+z_high_level_severity(ssval,ssthld)  end
        if i<2 then
          if lastsval-3>ssval then
            totalsvrity=0
            sverity=0
            lastord=0
            maxamp=0
            maxdif=0
            maxampfreq=0
          end
        end
        lastsval=ssval
        totalsvrity = totalsvrity + sverity*smult
        debugprint ( straxis ,round(i,3),round(ssval),round(ssdif), round(sverity) ,round(totalsvrity))
      end
      if totalsvrity>0 then
        z_fault_tone_list(element,brg,straxis, firstord, maxamp, maxamp-maxdif,totalsvrity,sdsi,nil, "High Ski Slope "..rn,'HSS',maxampfreq ,lastord)
        --z_fault_tone_list(element,brg,straxis, orderlow, sval, aval,sev,dsi,bin, info, fo_info, orderfreq, orderhigh)
        put_store_value("sssvrty"..rn,count+totalsvrity)
        debugprint ("Ski Slope rule fired- Severity "..count+totalsvrity.." on "..rn.." rotor")
        assert2(1)
        return true
      end
    end

  end
  debugprint (rn.." Ski Slope FALSE")
  return false
end
--
function bearingLFskislopeseverity(strrotorname)-- Ski slope normalization function
  local rn=strrotorname or ''
  debugprint ("Normalizing LF Ski Slope severity fault on rotor "..rn)
  local check2,points = get_store_value("SSpts"..rn)
  --debugprint ("sspts"..rn,check2,points)
  local check,count = get_store_value("SSpt"..rn)
  --debugprint ("sspt"..rn,check,count)
  count=count or points
  --
  local check1,svrty = get_store_value("sssvrty"..rn)
  --debugprint ("sssvrty"..rn,check1,svrty)
  svrty=svrty or 0
  local _, calls = get_store_value("calls"..''..'SS')
  local cls=pairscount(calls)
  --debugprint ('LSSS',points,count,svrty)
  if check==true then
    if count-points<0 then
      svrty= svrty*(points/count)
    end
    svrty= svrty/cls
    debugprint ("Ski Slope Issue Calculated Normalized Severity",count,svrty)
    assert2(svrty)
    return true
  end
  debugprint (rn.." ".." LF Ski Slope severity FALSE")
  return false
end
--  **************************************************************
---- Gear Broadband Noise evaluation 
function gearbroadbandnoise(element,brg,straxis,strrotorname,strtag,threshold,svrtymult) -- Gear BBN evaluates BBN at 1,2,3x gearmesh +/- 10%
  threshold,svrtymult=z_get_rule_tune_info(element,threshold,svrtymult) 
  local th=threshold or 90
  local sm=svrtymult or 1  
  local bearing,alias,spdratio =z_get_brg_and_data_set_speed_ratio(element,brg)
  local rn=strrotorname..'GBBN'..element
  z_countuniquecalls(strtag,element,brg,straxis)
  local _,dstart,_,dstop=maximum_data_range(element,brg,straxis)
  local tago=get_tag_order( strtag, element,-1 )
  if dstop==nil or dstart==nil or tago.order<1 or dstop<dstart or tago.order>dstop then return false,0 end
  local pm=.1*tago.order*spdratio
  local fstep= 2*pm/20
  local startf,stopf
  local gmbbn=false
  local gmbbnsev=0
  local dsi=0
  for h=1,3,1 do
    startf=h*tago.order*spdratio-pm
    stopf=h*tago.order*spdratio+pm
    if startf<dstop then
      if stopf>dstop then stopf=dstop end
      local gm,gmsev=z_broadbandnoise(element,brg,straxis,dsi,rn,startf,stopf,fstep,th,sm)
      if gm then
        gmbbn=true
        gmbbnsev=gmbbnsev+gmsev
      end
    end
  end
  return gmbbn , gmbbnsev
end
--
-- Broadband Noise evaluation 
function rotorbroadbandnoiseMF(element,brg,straxis,strrotorname,startf,stopf,step,threshold,svrtymult)-- Middle Freq BBN evaluation default 3 to 10 order in 1 order steps.
  threshold,svrtymult=z_get_rule_tune_info(element,threshold,svrtymult)
  local _,start,stop,_=maximum_data_range(element,brg,straxis)
  startf=start or startf
  stopf=stop or stopf
  if stopf==nil or startf==nil then return false,0 end
  local rn=strrotorname..'MF'
  if stopf<startf then return false end
  local fstep= step or (stopf-startf)/20
  local th=threshold or 90
  local sm=svrtymult or 1
  local dsi=0
  return z_broadbandnoise(element,brg,straxis,dsi,rn,startf,stopf,fstep,th,sm)
end
--
function rotorbroadbandnoiseHF(element,brg,straxis,strrotorname,startf,stopf,step,threshold,svrtymult) -- High Freq BBN evaluation default 10 to 100 order in 10 order steps.
  threshold,svrtymult=z_get_rule_tune_info(element,threshold,svrtymult)
  local _,_,start,stop=maximum_data_range(element,brg,straxis)
  startf=startf or start
  stopf=stopf or stop
  if stopf==nil or startf==nil then return false,0 end
  local rn=strrotorname..'HF'
  if stopf<=startf then return false end
  local fstep= step or (stopf-startf)/20
  if fstep<startf/20 then return false end
  local th=threshold or 90
  local sm=svrtymult or 1
  local dsi=0
  return z_broadbandnoise(element,brg,straxis,dsi,rn,startf,stopf,fstep,th,sm)
end
-- 

function maximum_data_range(element,brg,straxis)
  local dataranges=get_data_ranges(element,brg,straxis)
  if #dataranges==0 then
    local _
    return nil,nil,nil,nil
  end
  local skislopemax,skislopemin,lfmax,hfmax
  --find the start of the data after the highpass filter 
  skislopemin=0
  local start=0
  local dataset=machine.datasets[dataranges[1].sdsi]
  for i,amp in ipairs(dataset.data) do
    if amp>g_stop_band_threshold then 
      start=i
      break
    end
  end
  skislopemin=start*dataset.bw*1.10  -- frequency
  if skislopemin<5 then skislopemin=5 end -- no since looking below 5 Hz
  skislopemin=skislopemin/dataset.speed  -- orders
  if dataranges[1].aomax~=nil then
    skislopemax=math.min(dataranges[1].somax, dataranges[1].aomax)*.25
    lfmax=math.min(dataranges[1].somax, dataranges[1].aomax)
    hfmax=0
    if #dataranges>1 then
      hfmax= math.min(dataranges[#dataranges].somax, dataranges[#dataranges].aomax)*.98
    end
  else
    skislopemax=dataranges[1].somax*.25
    lfmax=dataranges[1].somax
    if #dataranges>1 then
      hfmax=dataranges[#dataranges].somax*.98
    end
  end
  return skislopemin,skislopemax,lfmax,hfmax
end

function z_broadbandnoise(element,brg,straxis,dsi,strrotorname,start,stop,step,threshold,svrtymult) -- Broadband Noise evaluation function
  --if true then return false end
  local rn=strrotorname or ''
  local startf=start or 3
  local stopf=stop or 10
  local fstep= step or (stopf-startf)/20
  debugprint (startf.." - "..stopf.." order BB Noise evaluation started on "..rn.." Rotor",element,"bearing",brg,"axis",straxis)
  increment_store_counter( "BBpts"..rn )
  local bbthld=threshold or 90
  local smult=svrtymult or 1
  z_countuniquecalls(rn,'',brg,straxis) --('bbn',element,brg,straxis)
  local rF1x=analyze_by_tag( "1X", element, brg, straxis )
  increment_store_counter( "BBpt"..rn ) 
  local sr1x=rF1x.sfreq 
  local bearing,alias,spdratio =z_get_brg_and_data_set_speed_ratio(element,brg)
  if sr1x==nil then
    for i,ds in ipairs (machine.datasets)  do
      if ds.dom=='spec' and ds.typ=='normal' and ds.axis==straxis and ds.mi==alias then
        sr1x=ds.speed*spdratio
        break
      end
    end 
  end
  local bbdif=0
  local bbmaxdif=0
  local bbval=0
  local lastdif=0
  local firstfreq=0
  local maxamp=0
  local maxampfreq=0
  local lastfreq=0
  local sumsval=0
  local sumaval=0
  local num=0
  local tsev=0
  local check,count = get_store_value("BBsvrty"..rn )
  if check==false then count=0 end
  local sverity=0
  local rFbb
  stoppoint(startf,10)
  if fstep==0 then fstep=.5 end
  for i=startf,stopf-fstep,fstep do
    rFbb = analyze_noise_floor( i, i+fstep, brg, straxis, true )
    if rFbb==nil then break end
    dsi=rFbb.sdsi
    bbdif=rFbb.dif
    bbval=rFbb.sval
    if trouble_shoot then debugprint ( element, brg, straxis ,i,bbdif, bbval) end
    if bbdif>3 and rFbb.sval>63 then
      if firstfreq==0 then firstfreq=i end
      if bbdif>bbmaxdif then bbmaxdif=bbdif end
      sverity=z_amplitude_weighted_severity(bbdif,rFbb.sval,bbthld)
      tsev=tsev+sverity
      sumsval=sumsval+ rFbb.sval  --ConvertSpectrum( Unit.U_VDB , g_internal_unit    , rFbb.sval )
      sumaval=sumaval+ rFbb.aval  --ConvertSpectrum( Unit.U_VDB , g_internal_unit    , rFbb.aval )
      num=num+1
      lastfreq=i+fstep
      --element,brg,straxis, orderlow, sval, aval,sev,dsi,bin, info, fo_info, orderfreq, orderhig
      --z_fault_tone_list(element,brg,straxis, i, bbval,bbval-bbdif, sverity,num,nil, "Broadband Noise "..rn,'BBN',sr1x ,i+fstep)
    end
    if bbval >bbthld then
      --sverity=sverity+z_high_level_severity(bbval,bbthld)
    end
    if bbdif>lastdif then
      lastdif=bbdif
      maxampfreq=i
      maxamp=bbval
    end
  end  
  if tsev>0 then
    count = count + tsev*smult
  end  
  if count>0 and num>0 then
    local _,aliasmi,_=z_get_brg_and_data_set_speed_ratio(element,brg)
    z_fault_tone_list(element,brg,straxis, firstfreq, maxamp, maxamp-lastdif,tsev,dsi,nil, "High Noise Floor "..rn,'HNF',maxampfreq ,lastfreq)
--z_fault_tone_list(element,brg,straxis, orderlow, sval, aval,dsi,bin, info, fo_info, orderfreq, orderhigh)
    put_store_value("BBsvrty"..rn,count)
    debugprint (startf.." - "..stopf.." order BB Noise rule fired- Severity "..count.." on "..rn.." rotor near "..lastfreq.." orders.")
    assert2(1)
    return true,tsev
  end

  debugprint (rn.." MF BB Noise FALSE")
  return false,0
end
function gearbroadbandnoiseseverity(element,strrotorname,startf,stopf) -- Gear BBN severity normalization

  local rn=strrotorname..'GBBN'..element

  return z_broadbandnoiseseverity(rn,startf,stopf,element)
end
function rotorbroadbandnoiseMFseverity(strrotorname,startf,stopf) -- Middle Freq Broadband Noise normalization function default 3 to 10 orders

  local rn=strrotorname..'MF'
  return z_broadbandnoiseseverity(rn,startf,stopf)
end
function rotorbroadbandnoiseHFseverity(strrotorname,startf,stopf) -- High Freq Broadband Noise normalization function default 10 to 100 orders

  local rn=strrotorname..'HF'
  return z_broadbandnoiseseverity(rn,startf,stopf)
end
function z_broadbandnoiseseverity(strrotorname,start,stop,element) -- Broadband Noise normalization function 
  local rn= strrotorname or ''
  element=element or ''
  debugprint ("Normalizing BB Noise severity fault on rotor "..rn)
  local check2,points = get_store_value("BBpts"..rn )
  --debugprint ("BBspts"..rn,check2,points)
  local check,count = get_store_value("BBpt"..rn )
  --debugprint ("BBpt"..rn,check,count)
  count=count or points
  --
  local check1,svrty = get_store_value("BBsvrty"..rn )
  debugprint ("BBsvrty"..rn,check2,check1,points,count,svrty)
  local _, calls = get_store_value("calls"..rn) --element..'bbn')
  local cls=pairscount(calls)
  svrty=svrty or 0
  --debugprint ('BBpt',points,count,check)
  if check==true then
    if count-points<0 then
      svrty= svrty*(points/count)
    end
    svrty= svrty/cls
    debugprint (rn.." BB Noise Issue Calculated Normalized Severity",count,svrty)
    assert2(svrty)
    return true
  end
  debugprint (rn.." ".." BB Noise severity FALSE")
  return false
end
--
-- Cocked Bearing Check Function
--**************************************************
function bearingcocked(element,brg,threshold,svrtymult) -- Cocked Bearing Check Function
  threshold,svrtymult=z_get_rule_tune_info(element,threshold,svrtymult)
  debugprint ("Cocked Bearing started on Rotor",element,"bearing",brg)
  local balthld = threshold or 108
  local smult = svrtymult or 1
  local sverity=0
  increment_store_counter( "ptsckdb" )
  z_countuniquecalls('1X','',brg,'a')
  local rFpma=z_get123orders( "1X", element, brg, "a" )
  increment_store_counter( "ptckdb" )
  if rFpma.found then 
    local dif1xa=rFpma.dif1x
    local dif2xa=rFpma.dif2x
    local dif3xa=rFpma.dif3x
    local sval1xa=rFpma.sval1x
    local sval2xa=rFpma.sval2x
    local sval3xa=rFpma.sval3x
    --debugprint (dif1xa,dif2xa,dif3xa,sval1xa,sval2xa,sval3xa)
    local datami
    if dif2xa>3 then
      if sval2xa>sval1xa and sval2xa>sval3xa then
        if dif2xa>g_fault_tone_threshold or (dif2xa>3 and sval2xa>g_significance_threshold) then 
          local x2sv=dif2xa 
          if sval2xa>balthld then x2sv=x2sv+z_high_level_severity(sval2xa,balthld) end
          sverity=sverity+x2sv
          datami= z_fault_tone_list(element,brg,"a",rFpma.sord2x, sval2xa, sval2xa-dif2xa,x2sv,rFpma.dsi3x,rFpma.bin3x,"Cocked Bearing",'2x(1X)',rFpma.sfreq*2 ) 
          z_flag_tone_as_found (element,brg,"a", rFpma.bin2x ,datami)
        end
        if dif1xa>g_fault_tone_threshold or ( dif1xa>3 and sval1xa>g_significance_threshold) then
          local x1sv=dif1xa 
          if sval1xa>balthld then x1sv=x1sv+z_high_level_severity(sval1xa,balthld) end
          sverity=sverity+x1sv
          datami= z_fault_tone_list(element,brg,"a", rFpma.sord1x, sval1xa, sval1xa-dif1xa,x1sv,rFpma.dsi1x,rFpma.bin1x, "Cocked Bearing",'1x(1X)',rFpma.sfreq*1) 
          z_flag_tone_as_found (element,brg,"a", rFpma.bin1x ,datami)
        end
        if dif3xa>g_fault_tone_threshold or ( dif3xa>3 and sval3xa>g_significance_threshold) then
          local x3sv=dif3xa 
          if sval3xa>balthld then x3sv=x3sv+z_high_level_severity(sval3xa,balthld) end
          sverity=sverity+x3sv
          datami= z_fault_tone_list(element,brg,"a", rFpma.sord3x, sval3xa, sval3xa-dif3xa,x3sv,rFpma.dsi3x,rFpma.bin3x, "Cocked Bearing",'3x(1X)',rFpma.sfreq*3) 
          z_flag_tone_as_found (element,brg,"a", rFpma.bin3x ,datami)
        end
      end
      if sverity>0 then
        local check,count = get_store_value("ckdsvrty")
        if check==true then
          count = count + sverity*smult
        else
          count = sverity*smult
        end 
        put_store_value("ckdsvrty",count)
        debugprint ("Cocked Bearing rule fired - Severity",count,"CCCCCCCCCCCCCCCCC")
        assert2(count)
        return true
      end
    end

  end
  debugprint ("Cocked Bearing FALSE")
  return false
end
--
--
function bearingcockedseverity () -- Cocked Bearing severity Function
  debugprint ("Cocked Bearing normalize started")
  local _, calls = get_store_value("calls"..''..'1X')
  local cls=pairscount(calls)
  local check,count = get_store_value("ptckdb")
  local check2,pts = get_store_value("ptsckdb")
  count=count or pts
  local check1,svrty = get_store_value("ckdsvrty")
  svrty=svrty or 0
  if check==true then
    if count-pts<0 then
      svrty= svrty*(pts/count)
    end
    svrty= svrty/cls
    debugprint ("-- Calculate Normalized Severity --",count,svrty,"Cocked Bearing CCCCCCCCCCCCCCCCCCCCCC")
    assert2(svrty)
    return true
  end
  debugprint ("Cocked Bearing FALSE")
  return false
end --]
--
-- End Cocked Bearing functions
--
-- Bearing looseness
function z_subharmonics(strtag,element,brg,straxis,suborder,howmany,strrotorname,threshold,svrtymult,strrule,multiplecheck) -- Function checks for subharmonic around a forcing frequency (strtag)
  local tag=strtag or "1X"
  local rn= strrotorname or ''
  suborder=suborder or .5
  multiplecheck=multiplecheck or false
  local bearing,alias,spdratio =z_get_brg_and_data_set_speed_ratio(element,brg)
  if strrule~=nil then
    debugprint ("     "..suborder.." subharmonics check for "..strrule.." started on "..rn.." Rotor",element,"bearing",brg,"axis",straxis, "for tag", tag,"with sidebands of",suborder)
  else
    debugprint ("     "..suborder.." subharmonics rule started on "..rn.." Rotor",element,"bearing",brg,"axis",straxis, "for tag", tag)
  end
  local neworder=false
  local firstorder=suborder
  local there, shinfo= get_store_value("shinfo"..tag..element..rn)
  shinfo=shinfo or {}
  if #shinfo~=0 then firstorder=shinfo[1].ord end
  table.insert(shinfo,{brg=brg,axial=straxis,ord=suborder})
  put_store_value("shinfo"..tag..element..rn,shinfo)
  if firstorder==suborder then
    increment_store_counter( "shpts"..tag..element..rn )
  end
  z_countuniquecalls(strtag,element,brg,straxis)
  local rF1x=analyze_by_tag( "1X", element, brg, straxis )
  local ordr1x=rF1x.sord
  local sr1x=rF1x.sfreq 
  if sr1x==nil then
    for i,ds in ipairs (machine.datasets)  do
      if ds.dom=='spec' and ds.typ=='normal' and ds.axis==straxis and ds.mi==alias then
        sr1x=ds.speed*spdratio
        break
      end
    end 
  end
  local hm=howmany or 5
  local ffthld=threshold or 90
  local smult=svrtymult or 1
  local sverity=0
  tag=string.upper(tag)  
  local lf=string.match(tag,'LF')=='LF'
  local taghz
  local rFff={}
  local tagord
  local check,count
  if lf then
    if string.find(tag,"X")== nil then
      taghz=machine.linef
    else
      local xpos,_=string.find(tag,"X")
      local lfx,_=string.sub(tag, 1,xpos-1)
      lfx=lfx or "1"
      taghz=machine.linef*tonumber(lfx)
    end
    tagord=taghz/sr1x
    rFff=analyze_by_order( tagord,  brg, straxis,true,true,true )
    if rFff==nil then rFff={found=false} end
  else
    if tag~='1X' then
      local tago=get_tag_order( strtag, element,-1 )
      tagord=tago.order*spdratio
    else
      tagord=ordr1x
    end
    rFff=analyze_by_tag( tag, element, brg, straxis )
  end

  if rFff.found then
    increment_store_counter( "shpt"..tag..element..rn )

    -- build a list of subharmonics to determine if there is a significant subharmonic series  

    local targetorder
    local order=0
    local shdif,shval=0,0
    local rFsbt
    local sublist={}
    for i=suborder,hm,suborder do
      local iisint,_,b= z_is_a_multiple(1,i,.01) --math.modf(i)
      if not (iisint) then -- is i not an integer
        targetorder=i*tagord
        --debugprint (order,i,tagord)
        if  math.abs(math.fmod (targetorder,tagord)-1)  > 0.1 then  --  ~= order % tagord
          rFsbt=analyze_by_order( targetorder, brg, straxis,true,true,true  )
          if rFsbt~=nil then
            if rFsbt.found and rFsbt.dif~=nil then 
              order=rFsbt.sord
              local orderistarget,_,_=  z_is_a_multiple(targetorder,order,.002) -- .5% match
              if orderistarget then
                debugprint (suborder..' subharmonic of '..tag..' found at '..order)
                shdif=rFsbt.dif
                shval=rFsbt.sval
                local sbsverity=0
                if shdif>g_fault_tone_threshold or ( shdif>3 and shval>g_significance_threshold) then 
                  sbsverity=z_amplitude_weighted_severity(shdif,shval,108)
                  --if shval>ffthld then sbsverity=sbsverity+z_high_level_severity(shval,ffthld) end 
                end
                -- list of potential subharmonics
                table.insert(sublist,{ord=round (targetorder,3),sev=sbsverity,dif=shdif,sval=shval,sbin=rFsbt.sbin,sfreq=rFsbt.sfreq,sdsi=rFsbt.sdsi,sord=order})
              end -- if orderistarget
            end -- if rFsbt.found
          end
        end -- if  math.abs(math.fmod (targetorder,tagord)-1)  > 0.1
      end -- if not (iisint)
    end -- for i=suborder
    local adjharm,adjsb,numharm,numsb=false,false,0,0
    local maxdif=0
    -- Real subharmonics should not be alone.
    -- Check the list of subharmonics for adjacent subharmonics tones and/or higher order sidebands 
    if #sublist>1 then
      for i,s1 in ipairs (sublist) do 
        if s1.dif>maxdif then maxdif=s1.dif end
        for j,s2 in ipairs (sublist) do 
          if round(math.fmod(s1.ord,1),2)==.5 then
            if round(s2.ord,2)==round(s1.ord+tagord,2) then  -- Check for higher order sidebands -- add check for .5 orders
              adjharm=true
              numharm=numharm+1
            end
          else
            if round(s2.ord,2)==round(s1.ord+suborder,2) then  -- Check for higher order sidebands 
              adjharm=true
              numharm=numharm+1
            end
          end
          if round(s2.ord,2)==round(s1.ord+tagord+suborder,2) or round(s2.ord,2)==round(s1.ord+suborder+2*tagord,2) or round(s2.ord,2)==round(s1.ord+suborder+3*tagord,2) or round(s2.ord,2)==round(s1.ord+suborder+4*tagord,2)then  -- check for neihboring subharmonics
            adjsb=true
            numsb=numsb+1
          end
        end
      end

      if (adjharm and ((numharm>0 and sublist[1].sord<=3) or (numharm>1 and sublist[1].sord>3)) and (suborder==.25 or suborder==.5)) or (adjsb and numsb>=2 and adjharm and numharm>0 ) or not (multiplecheck) then -- are there adjacent tones
        --{ord=round (targetorder,3),sev=sbsverity,dif=shdif,sval=shval,sbin=rFsbt.sbin,sfreq=rFsbt.sfreq,sdsi=rFsbt.sdsi,sord=order}
        for _,sh in ipairs (sublist) do 
          if sh.sev>1 then
            sverity=sverity+sh.sev
            local datami
            if strrule == nil then
              datami= z_fault_tone_list(element,brg,straxis, sh.sord, sh.sval, sh.sval-sh.dif,sh.sev,sh.sdsi ,sh.sbin, sh.ord.."x("..strtag..") Subharmonic on "..rn,sh.ord.."x("..strtag..')',sh.sfreq) 
              z_flag_tone_as_found (element,brg,straxis, sh.sbin ,datami)
            else
              datami=  z_fault_tone_list(element,brg,straxis, sh.sord, sh.sval, sh.sval-sh.dif,sh.sev,sh.sdsi ,sh.sbin, sh.ord.."x("..strtag..') '..strrule..' on '..rn,sh.ord.."x("..strtag..')', sh.sfreq)
              z_flag_tone_as_found (element,brg,straxis, sh.sbin ,datami)
            end
            debugprint (rn,sh.ord.." subharmonic of "..tag.." found at",sh.sord," orders",sh.dif,sh.sev)
          end
        end
      end
    end

    check,count = get_store_value("shsvrty"..tag..element..rn)
    if check==true then
      count = count + sverity*smult*suborder
    else
      count = sverity*smult*suborder
    end
    put_store_value("shsvrty"..tag..element..rn,count)
    if count~=nil then
      if count>0 then
        --put_store_value("shsvrty"..tag..element..rn,count)
        debugprint (rn,suborder,"subharmonic of", tag,"fired - Severity",count)
        assert2(count)
        return true, sverity
      end
    end
  end -- if rFff.found


  debugprint (rn, suborder.." of "..tag.." subharmonic FALSE")
  return false, 0
end
--
function bearinglooseness(strtag,element,brg,straxis,suborder,howmany,strrotorname,threshold,svrtymult)
  threshold,svrtymult=z_get_rule_tune_info(element,threshold,svrtymult)
  return z_subharmonics(strtag,element,brg,straxis,suborder,howmany,strrotorname,threshold,svrtymult)
end
--
function z_subharmonicseverity (strtag,element,strrotorname) -- Subharmonic severity Function
  debugprint ("subharmonic severity normalize started")
  local t=strtag or "1X"
  local rn= strrotorname or ''
  local _, calls = get_store_value("calls"..element..t)
  local cls=pairscount(calls)
  local check,count = get_store_value("shpt"..t..element..rn)
  local check2,points = get_store_value("shpts"..t..element..rn)
  local check1,svrty = get_store_value("shsvrty"..t..element..rn)
  count=count or points
  svrty=svrty or 0
  if check1==true then
    if count-points<0 then
      svrty= svrty*(points/count)
    end
    svrty= svrty/cls
    if svrty ~= 0 then
      debugprint ("-- Calculate Normalized Severity --",count,svrty,"Subharmonics SHSHSHSHSHSHSHSH")
      assert2(svrty)
      return true,svrty
    end
  end
  debugprint ("Subharmonics FALSE")
  return false,0
end --]

function bearingloosnessseverity(strtag,element,strrotorname)
  return z_subharmonicseverity (strtag,element,strrotorname)
end

function z_get_rule_tune_info(element,threshold,svrtymult)
  local thrshld=tonumber(get_attribute_value("FAULT_THRESHOLD",element, 108)) -- or threshold
  local svrtymlt=tonumber(get_attribute_value("FAULT_SVRTYMULT",element, 1)) -- or svrtymult
  return thrshld,svrtymlt
end
--
function rotor_rub(strtag,element,brg,straxis,suborder,howmany,strrotorname,threshold,svrtymult)  -- Looks for 1/3, 1/4, 1/5 shaft rate subharmonics
  threshold,svrtymult=z_get_rule_tune_info(element,threshold,svrtymult)
  --local harmonics=z_forcingfrequencyharmonics("1X",element,brg,straxis,howmany,strrotorname,threshold,svrtymult)
  local hm=howmany or 8
  local fifthsubharmonics=z_subharmonics("1X",element,brg,straxis,1/5,hm,strrotorname,threshold,svrtymult,'Rotor Rub',true)
  local quartersubharmonics=z_subharmonics("1X",element,brg,straxis,1/4,hm,strrotorname,threshold,svrtymult,'Rotor Rub',true)
  local thirdsubharminics=z_subharmonics("1X",element,brg,straxis,1/3,hm,strrotorname,threshold,svrtymult,'Rotor Rub',true)
  return fifthsubharmonics or quartersubharmonics or thirdsubharminics
end
--
function rotor_rubseverity(strtag,element,strrotorname)  -- Normalizes the severity of 1/3, 1/4, 1/5 shaft rate subharmonics
  --local harm,harmseverity= z_forcingfrequencyseverity("1X",element,strrotorname)
  local subharm,subharmseverity= z_subharmonicseverity ("1X",element,strrotorname)
  --harmseverity=harmseverity or 0
  subharmseverity=subharmseverity or 0
  if subharm then 
    assert2(subharmseverity)
    return  subharm 
  end
  return false
end
function bearingclearance(strtag,element,brg,straxis,suborder,howmany,strrotorname,threshold,svrtymult)  -- Looks for shaft rate harmonics and, 1/2 and 1/3 subharmonics
  z_countuniquecalls('1X',element,brg,straxis)
  threshold,svrtymult=z_get_rule_tune_info(element,threshold,svrtymult)
  debugprint('Bearing Clearance Started')
  local harmonics=z_forcingfrequencyharmonics("1X",element,brg,straxis,howmany,strrotorname,threshold,svrtymult)
  local hm=howmany or 2
  local halfsubharmonics=z_subharmonics("1X",element,brg,straxis,.5,hm,strrotorname,threshold,svrtymult)
  local thirdsubharminics=z_subharmonics("1X",element,brg,straxis,.33333333333,hm,strrotorname,threshold,svrtymult)
  debugprint('Bearing Clearance Completed')
  return harmonics or halfsubharmonics or thirdsubharminics
end
--
function bearingclearanceseverity(strtag,element,strrotorname)  -- Normalizes the severity of shaft rate harmonics and, 1/2 and 1/3 subharmonics
  local harm,harmseverity= z_forcingfrequencyseverity("1X",element,strrotorname)
  local subharm,subharmseverity= z_subharmonicseverity ("1X",element,strrotorname)
  harmseverity=harmseverity or 0
  subharmseverity=subharmseverity or 0
  if harm or subharm then 
    assert2(harmseverity+subharmseverity)
    return harm or subharm 
  end
  return false
end
--[********************************************************* 
function z_get123harmonicsidebands(strtag,element,brg,straxis,strsbtag,howmany,strrotorname,threshold,svrtymult) -- checks for tone matches at strsbtag sideband of strtag forcing orders 
  local rn= strrotorname or ''
  local sbt=strsbtag or "1X"
  local axis={straxis} or {'a','r','t'}
  local sbfreq=0
  local freq1x=0
  local energyratio={}
  local ordrsbt,srsbt
  sbt=string.upper(sbt)
  if sbt~="1X" then
    if string.find(sbt,"LF")~= nil then 
      if string.find(sbt,"X")~= nil then
        local xpos,_=string.find(sbt,"X")
        local lfx,_=string.sub(sbt, 1,xpos-1)
        lfx=lfx or "1"
        sbfreq=machine.linef*tonumber(lfx)
      else
        sbfreq=machine.linef
      end
    end
  end
  local hm=howmany or 4
  local ffthld=threshold or 108
  local smult=svrtymult or 1
  local harms={}
  local _,_,_,maxdata=maximum_data_range(element,brg,straxis)
  for _,ax in ipairs (axis) do
    local r1x=analyze_by_tag( '1X', element, brg, ax )
    if r1x.found then
      freq1x=r1x.sfreq
    end
    local bearing,alias,spdratio =z_get_brg_and_data_set_speed_ratio(element,brg)
    if freq1x==0 then
      for i,ds in ipairs (machine.datasets)  do
        if ds.dom=='spec' and ds.typ=='normal' and ds.axis==straxis and ds.mi==alias then
          freq1x=ds.speed*spdratio
          break
        end
      end 
    end
    local rFF=analyze_by_tag( strtag, element, brg, ax )
    if rFF.found then 
      local fundhz=rFF.sfreq
      local fundord=rFF.sord
      if sbfreq==0 then
        local tago=get_tag_order( strtag, element,-1 )
        ordrsbt =tago.order*spdratio
        local rFsbt=analyze_by_tag( sbt, element, brg, ax )
        if rFsbt.found then 
          ordrsbt=rFsbt.sord
          srsbt=rFsbt.sfreq
        end
      else
        srsbt=sbfreq
        ordrsbt=sbfreq/freq1x
      end
      if ordrsbt==0 then return {["found"]=false} end
      local sidebandinfo={}
      local centertoneinfo={}
      local cntrord=0
      local center={}
      local sbford, sb
      local tdif,energy,sbsvrty,sverty, sbmax, sbdif,cntrsval
      for harm=1,3,1 do
        sverty=0
        tdif=0
        sbdif=0
        energy=0
        cntrord=harm*fundord
        sbmax=0
        cntrsval=0
        if  cntrord<maxdata*.98 then
          center=analyze_by_order(cntrord,brg,ax,true,true,true )
          if center~=nil then
            if center.found and center.dif~=nil then
              cntrord=center.sord
              cntrsval=center.sval
              local isaharm,_,frac=  z_is_a_multiple(harm*fundord,cntrord,.0015) --math.modf(math.abs(cntrord-harm*fundord))
              if isaharm --[[frac<.02 or 1-frac<.02]] then
                tdif=center.dif
                energy=ConvertSpectrum( Unit.U_VDB , g_internal_unit    , cntrsval )
                if tdif>g_fault_tone_threshold or ( tdif>3 and cntrsval>g_significance_threshold) then
                  sverty=sverty+z_amplitude_weighted_severity(tdif,center.sval,108)
                end
                if cntrsval >ffthld then
                  --sverty=sverty+z_high_level_severity(center.sval-ffthld)
                end
              end
            end 
          end
        end
        sidebandinfo={}
        for sbside=-1,1,2 do
          local ii
          for i=1,hm,1 do
            ii=i
            sbsvrty=0
            sbdif=i*ordrsbt
            if cntrord~=0 then
              sbford=cntrord+(sbside*sbdif)
            else
              sbford=harm*fundord+(sbside*sbdif)
            end
            if sbford>1 and sbford<maxdata*.98 then
              sb= analyze_by_order(sbford,brg,ax,true,true,true )

              if sb==nil then
                local _
              else
                if sb.found then
                  if sb.dif~=nil then
                    local isasb,_,frac=z_is_a_multiple(sbford,sb.sord,.0015) --math.modf(math.abs(sbford-sb.sord))
                    if isasb --[[frac<.02 or 1-frac<.02]] then
                      tdif=tdif+sb.dif
                      energy=energy+ConvertSpectrum( Unit.U_VDB , g_internal_unit    , sb.sval )
                      if sb.sval>sbmax then sbmax=sb.sval end
                      if sb.dif>g_fault_tone_threshold or ( sb.dif>3 and sb.sval>g_significance_threshold)  then 
                        sverty=sverty+z_amplitude_weighted_severity(sb.dif,sb.sval,108)
                        sbsvrty=sbsvrty+z_amplitude_weighted_severity(sb.dif,sb.sval,108)
                      end
                      local thldoffset=20*math.log(harm,10) 
                      if sb.sval >ffthld-thldoffset then
                        --sverty=sverty+z_high_level_severity(sb.sval,(ffthld-thldoffset))
                        --sbsvrty=sbsvrty+z_high_level_severity(sb.sval,(ffthld-thldoffset))
                      end
                      sb.severity=sbsvrty 
                      table.insert(sidebandinfo,sb)
                    end
                  end
                end
              end
            end
          end
          if center~=nil then
            if energy~=0 then
              center.energyratio=ConvertSpectrum( Unit.U_VDB , g_internal_unit    ,cntrsval )/(energy-ConvertSpectrum( Unit.U_VDB , g_internal_unit    ,cntrsval ))
            else
              center.energyratio=0
            end
            center.sidebands=sidebandinfo
            center.tdif=tdif
            center.energy=energy
            center.severity=sverty
            center.sbmax=sbmax
            center.dif=center.dif or 0
            --table.insert(centertoneinfo,center)
            centertoneinfo[harm]=center
          end
        end
      end
      table.insert(harms,{['axis']=ax,['info']=centertoneinfo})  
    end
  end
  if #harms==0 then return {["found"]=false} end
  --[[if #harms==1 then
      return {['found']=true, ['harmonics']=harms,
        ['tdif']=     {harms[1].info[1].tdif ,      harms[1].info[2].tdif ,     harms[1].info[3].tdif},
        ['energy']=   {harms[1].info[1].energy ,    harms[1].info[2].energy ,   harms[1].info[3].energy},
        ['severity']= {harms[1].info[1].severity ,  harms[1].info[2].severity , harms[1].info[3].severity},
        ['dif']=      {harms[1].info[1].dif ,       harms[1].info[2].dif ,      harms[1].info[3].dif},
        ['energyratio']=  {harms[1].info[1].energyratio ,      harms[1].info[2].energyratio ,     harms[1].info[3].energyratio}}
    else ]]
  local pdif,tdif,dif,energy,sverty={},{},{},{},{}
  for a,ax in ipairs (harms) do
    for i=1,3,1 do
      if ax.info[i]~=nil then
        table.insert(tdif,ax.info[i].tdif)
        table.insert(energy, ax.info[i].energy)
        table.insert(sverty,ax.info[i].severity)
        table.insert(dif,ax.info[i].dif)
        --if i==1 then
        table.insert(energyratio,ax.info[i].energyratio)
        --else
        --table.insert(energyratio,math.max(ax.info[i].energyratio,ax.info[i-1].energyratio))
        --end
      else
        table.insert(tdif,-9999)
        table.insert(energy, 0)
        table.insert(sverty,0)
        table.insert(dif,-9999)
        table.insert(energyratio,0)
      end
    end
    return {['found']=true, ['harmonics']=harms, ['tdif']=tdif, ['energy']=energy, ['severity']=sverty, ['dif']=dif,['energyratio']=energyratio}
  end
  return {["found"]=false}
end

function gear_analysis(strtag,element,brg,straxis,strsbtag,howmany,strrotorname,threshold,svrtymult)  -- this function determines determine gear faults by analyzing gear mesh data
  local rn= strrotorname or ''
  local sbt=strsbtag or "1X"
  local hm=howmany or 4
  local ffthld=threshold or 108
  local smult=svrtymult or 1
  local sverity=0
  straxis=straxis or "r"
  local shaft=analyze_by_tag( "1X", element, brg, straxis )
  local fault=""
  local aval1X,sval1X,dif1x=0,0,0
  if shaft.found then
    aval1X=shaft.aval
    sval1X=shaft.sval
    dif1x=shaft.dif
  end
  local gt= z_get123harmonicsidebands(strtag,element,brg,straxis,sbt,howmany,strrotorname,threshold,svrtymult)
  if gt.found then
    if gt.dif[1]>gt.dif[2] and gt.dif[1]>gt.dif[3] then
      if gt.energyratio[1]>.3 and gt.dif[1]>0 then fault=fault..", TOOTH LOAD" end
    end
    if gt.energy[2]>2*gt.energy[1] and gt.energy[2]>2*gt.energy[3]and gt.tdif[2]>gt.tdif[1] and gt.tdif[2]>gt.tdif[3] then fault=fault..", GEAR ALIGNMENT" end
    if gt.energy[1]>2*gt.energy[2] and gt.energy[3]>2*gt.energy[2] and (gt.severity[1]>0 or gt.severity[3]>0) then 
      if gt.tdif[1]-gt.dif[1]>gt.dif[1]  and (gt.dif[1]>0 or gt.tdif[1]-gt.dif[1]>0) and dif1x>0 then 
        fault=fault..", ECCENTIC GEAR" 
      else if gt.tdif[1]-gt.dif[1]>gt.dif[1]  and (gt.tdif[3]>gt.tdif[1] or gt.tdif[2]>gt.tdif[1] ) then 
        fault=fault..", GEAR WEAR"
      else
        fault=fault..", GEAR BACKLASH"
      end
    end
  end
  if fault=="" then fault=', UNSPECIFIED GEAR PROBLEM' end
  fault=string.gsub(fault,", ","",1)
end
return fault 
end --]
--  **************************************************************
--
-- Oil whirl evaluation (Oil whirl is strong tone .38-.48x)
--
function bearingoilwhirl(element,brg,straxis,strrotorname,threshold,svrtymult) -- Oil whirl evaluation (Oil whirl is strong tone .38-.48x)
  threshold,svrtymult=z_get_rule_tune_info(element,threshold,svrtymult)
  local rn=strrotorname or ''
  debugprint ("Oil whirl evaluation started on "..rn.." Rotor",element,"bearing",brg,"axis",straxis)
  increment_store_counter( "OWpts"..rn )
  local OWthld=threshold  or 90
  local smult=svrtymult or 1
  z_countuniquecalls('OW','',brg,straxis)
  local rF1x=analyze_by_tag( "1X", element, brg, straxis )
  if rF1x.found then
    increment_store_counter( "OWpt"..rn ) 
    local ordr1x=rF1x.sord
    local sr1x=rF1x.sfreq 
    local bearing,alias,spdratio =z_get_brg_and_data_set_speed_ratio(element,brg)
    if sr1x==nil then
      for i,ds in ipairs (machine.datasets)  do
        if ds.dom=='spec' and ds.typ=='normal' and ds.axis==straxis and ds.mi==alias then
          sr1x=ds.speed*spdratio
          break
        end
      end 
    end
    local sval1x=rF1x.sval
    local OWdif=0
    local OWval=0
    local OWord=0
    local OWmdif=0
    local OWbin=0
    local lastsval=0
    local lastdif=0
    local lastord=0
    local lastmdif=0
    local lastbin=0
    local check,count = get_store_value("OWsvrty"..rn)
    if check==false then count=0 end
    local step=.02
    local totalsvrity=0
    --SR moved here
    local sverity=0
    local rFOW=0
    for i=.38*ordr1x,.48*ordr1x,((.48*ordr1x)-(.38*ordr1x))/10 do
      --SR: Moved above
      --local sverity=0
      rFOW = analyze_by_order( i, brg, straxis ,true,true,true )
      if rFOW~=nil then
        if rFOW.found and rFOW.dif~=nil then
          local istarget,x,frac=z_is_a_multiple(i,rFOW.sord,.001) --math.modf(math.abs(i-rFOW.sord))
          istarget=istarget and x==1
          if istarget--[[frac<.015 or 1-frac<.015]] then
            OWdif=rFOW.dif
            OWval=rFOW.sval
            OWord=rFOW.sord  
            OWmdif=rFOW.mdif
            OWbin=rFOW.sbin
            if OWval>lastsval then
              lastsval=OWval
              lastdif=OWdif
              lastord=OWord
              lastmdif=OWmdif
              lastbin=OWbin
            end
          end
        end 
      end
    end
    local othershaft=false

    for _,spd in ipairs(g_comp_speed_ratio) do
      if spd~=1 then
        local x,rmdr = math.modf(lastord*spd)      
        x=math.modf(x+round(rmdr))       
        if x==1 and (rmdr<.01 or 1-rmdr<.01) then 
          othershaft=true
          break
        end 
      end
    end
    if not (othershaft) then
      if lastdif > g_fault_tone_threshold or (lastdif >3 and lastsval>g_significance_threshold) then 
        local owsverity=z_amplitude_weighted_severity(lastdif,lastsval,OWthld)
        --if lastsval >OWthld then owsverity=owsverity+z_high_level_severity(lastsval,OWthld) end
        if lastsval>sval1x then owsverity=owsverity+(lastsval-sval1x) end
        sverity=sverity+owsverity
        z_fault_tone_list(element,brg,straxis, lastord, lastsval, lastsval-lastdif,owsverity ,rFOW.sbin,lastbin, "Bearing Oil Whirl",'Oil Whirl', lastord/spdratio*sr1x ) 
      end


      --SR: this was seen as global and was sometime nil and raised error
      sverity = sverity*smult
      if trouble_shoot then debugprint( element, brg, straxis ,lastdif, lastsval,sverity, count)   end
      if sverity>0 then
        put_store_value("OWsvrty"..rn,count+sverity)
        debugprint ("Oil whirl rule fired- Severity "..count+sverity.." on "..rn.." rotor")
        assert2(1)
        return true
      end
    end  --if not (othershaft)
    debugprint (rn.." Oil whirl FALSE")
  else
    debugprint (rn.." oil whirl failed due to no 1X found")
  end

  return false
end
--
function bearingoilwhirlseverity(strrotorname)-- Oil whirl normalization function
  local rn=strrotorname or ''
  debugprint ("Normalizing LF Oil whirl severity fault on rotor "..rn)
  local check2,points = get_store_value("OWpts"..rn)
  --debugprint ("OWpts"..rn,check2,points)
  local check,count = get_store_value("OWpt"..rn)
  --debugprint ("OWpt"..rn,check,count)
  count=count or points
  --
  local check1,svrty = get_store_value("OWsvrty"..rn)
  --debugprint ("OWsvrty"..rn,check1,svrty)
  svrty=svrty or 0
  local _, calls = get_store_value("calls"..''..'OW')
  local cls=pairscount(calls)
  --debugprint ('OW',points,count,svrty)
  if check==true then
    if count-points<0 then
      svrty= svrty*(points/count)
    end
    svrty= svrty/cls
    debugprint ("Oil whirl Issue Calculated Normalized Severity",count,svrty)
    assert2(svrty)
    return true
  end
  debugprint (rn.." ".." LF Oil whirl severity FALSE")
  return false
end
--
function data_normalization_check(element, brg) -- Checks for the data normalization speeds agree across axises and pickups
  local bearing,alias,spdratio =z_get_brg_and_data_set_speed_ratio(element,brg)
  if bearing==alias then
    debugprint ('Data Normalization Check Started on pickup '..alias)
    machine_speed_data=machine_speed_data or {}
    local dup=false
    for _,i in ipairs(machine_speed_data) do
      if alias==i.mi then
        dup=true
        break
      end
    end
    if not(dup) then
      local sum,sumsqr,n=0,0,0
      for i,ds in ipairs(machine.datasets) do
        if ds.dom=='spec' and ds.typ=='normal' then
          if ds.mi==alias then
            local spd=ds.speed/g_comp_speed_ratio[g_shaft_number]
            sum=sum+spd
            sumsqr=sumsqr+(spd*spd)
            n=n+1
          end --ds.mi==alias 
        end  --ds.dom=='spec' and ds.typ=='normal'
      end -- for ds
      if n>0 then
        local avespd=sum/n
        local sdspd=0 --math.sqrt((sumsqr-(sum*sum/n))/(n-1))
        table.insert(machine_speed_data,{mi=alias,speed=avespd,sigma=sdspd})
        debugprint('Data speed - '..avespd..' sigma - '..sdspd)
        return true
      end
    end
  end -- if bearing==alias 
  return false
end -- function
--
function data_normalization_check_severity()
  local element,brg=1,1
  local bearing,alias,spdratio =z_get_brg_and_data_set_speed_ratio(element,brg)
  machine_speed_data=machine_speed_data or {}
  if machine_speed_data~={} then
    debugprint ('Data Normalization Check Severity Started')
    local clspeed=machine.speed
    local vspeed=machine.vspeed
    local sum,n,totdev,fired=0,0,0,false
    local index
    -- determine the macine average speed and total deviation
    for i,info in ipairs(machine_speed_data) do 
      if alias==info.mi then index=i end
      local puprctdev=info.sigma/info.speed*100
      totdev=totdev+puprctdev
      sum=sum+info.speed
      n=n+1
    end --for _,info
    -- Compare each pickuo to its average speed, machine average speed, and class speed allowed variation
    --for _,info in ipairs(machine_speed_data) do
    local info=machine_speed_data[index]
    local puprctdev=info.sigma/info.speed*100
    local machprctdev=math.abs(info.speed-(sum/n))/(sum/n)*100
    local spddif=math.abs(info.speed-clspeed)/clspeed*100
    debugprint('Pickup '..info.mi..' % deviation '..puprctdev..' % dev to machine '..machprctdev..' % dev to class '..spddif..' Total Dev '.. totdev )
    if puprctdev>.1 then
      --z_fault_tone_list(element,brg,'-', 1, 0, 0,puprctdev,nil,nil, "Normalization error - w/i Pickup ",'WP',info.speed,nil)
      fired=true
      --assert1()
      -- assert2(101)
      -- debugprint('Data Normalization Error Fired -- Speed deviation within Pickup')
    end
    if machprctdev>3 then -- 3% if ~100rpm/3600rpm
      --z_fault_tone_list(element,brg,'-', 1, 0, 0,machprctdev,nil,nil, "Normalization error - btwn Pickups ",'BP',info.speed,nil)
      fired=true
      --assert1()
      --assert2(102)
      --debugprint('Data Normalization Error Fired -- Speed deviation between Pickups')
    end
    if  spddif>vspeed  then
      --z_fault_tone_list(element,brg,'-', 1, 0, 0,spddif,nil,nil, "Normalization error - Speed OOR",'OOR',info.speed,nil)
      fired=true
      -- assert1()
      --assert2(103)
      -- debugprint('Data Normalization Error Fired -- Speed out of range')
    end
    if  totdev>.15 then
      --z_fault_tone_list(element,brg,'-', 1, 0, 0,totdev,nil,nil, "Normalization error - Tot Speed dev",'TD',info.speed,nil)
      fired=true
      --assert1()
      --assert2(104)
      --debugprint('Data Normalization Error Fired -- Total Speed Deviation')
    end --for _,info
    if fired then
      assert2(1)
      assert3(-1)
      return fired
    end
  end -- machine_speed_data ~= nil
  debugprint ('Data Normalization Check Severity FALSE')
  return false
end --function
--
function data_normalization_speed_out_of_range()
  local element,brg=1,1
  local bearing,alias,spdratio =z_get_brg_and_data_set_speed_ratio(element,brg)
  machine_speed_data=machine_speed_data or {}
  if machine_speed_data~={} then
    debugprint ('Data Normalization - Speed Out of Range Started')
    local clspeed=machine.speed
    local vspeed=machine.vspeed
    local sum,n,totdev,fired=0,0,0,false
    local index
    -- determine the macine average speed and total deviation
    for i,info in ipairs(machine_speed_data) do 
      if alias==info.mi then index=i end
      local puprctdev=info.sigma/info.speed*100
      totdev=totdev+puprctdev
      sum=sum+info.speed
      n=n+1
    end --for _,info
    -- Compare each pickuo to its average speed, machine average speed, and class speed allowed variation
    --for _,info in ipairs(machine_speed_data) do
    info=machine_speed_data[index]
    local puprctdev=info.sigma/info.speed*100
    local machprctdev=math.abs(info.speed-(sum/n))/(sum/n)*100
    local spddif=(info.speed-clspeed)/clspeed*100

    if  math.abs(spddif)>vspeed  then
      z_fault_tone_list(element,brg,'-', 1, 0, 0,spddif,nil,nil, "Normalization error - Speed OOR",'OOR',info.speed,nil)
      fired=true
      --assert1()
      assert2(25+((math.abs(spddif)-vspeed)/vspeed*25))
      debugprint('Data Normalization Error Fired -- Speed out of range '..(spddif)..'%')
    end  
    if not (fired) then debugprint ('Data Normalization - Speed Out of Range FALSE') end
    return fired
  end -- machine_speed_data ~= nil
  debugprint ('Data Normalization - Speed Out of Range FALSE')
  return false
end --function
--
function data_normalization_speed_between_pickups()
  local element,brg=1,1
  local bearing,alias,spdratio =z_get_brg_and_data_set_speed_ratio(element,brg)
  machine_speed_data=machine_speed_data or {}
  if machine_speed_data~={} then
    debugprint ('Data Normalization - Speed Change Started')
    local clspeed=machine.speed
    local vspeed=machine.vspeed
    local sum,n,totdev,fired=0,0,0,false
    local index
    -- determine the macine average speed and total deviation
    for i,info in ipairs(machine_speed_data) do 
      if alias==info.mi then index=i end
      local puprctdev=info.sigma/info.speed*100
      totdev=totdev+puprctdev
      sum=sum+info.speed
      n=n+1
    end --for _,info
    -- Compare each pickuo to its average speed, machine average speed, and class speed allowed variation
    --for _,info in ipairs(machine_speed_data) do
    info=machine_speed_data[index]
    local puprctdev=info.sigma/info.speed*100
    local machprctdev=math.abs(info.speed-(sum/n))/(sum/n)*100
    local spddif=math.abs(info.speed-clspeed)/clspeed*100

    if machprctdev>3 then -- 3% if ~100rpm/3600rpm
      z_fault_tone_list(element,brg,'-', 1, 0, 0,machprctdev,nil,nil, "Normalization error - btwn Pickups ",'BP',info.speed,nil)
      fired=true
      --assert1()
      assert2(25+(machprctdev*50))
      debugprint('Data Normalization Error Fired -- Speed deviation between Pickups '..(machprctdev*100)..'%')
    end 
    if not (fired) then debugprint ('Data Normalization - Speed Change FALSE') end
    return fired
  end -- machine_speed_data ~= nil
  debugprint ('Data Normalization - Speed Change FALSE')
  return false
end --function
--
function data_normalization_total_deviation()
  local element,brg=1,1
  local bearing,alias,spdratio =z_get_brg_and_data_set_speed_ratio(element,brg)
  machine_speed_data=machine_speed_data or {}
  if machine_speed_data~={} then
    debugprint ('Data Normalization - Total Deviation Started')
    local clspeed=machine.speed
    local vspeed=machine.vspeed
    local sum,n,totdev,fired=0,0,0,false
    local index
    -- determine the macine average speed and total deviation
    for i,info in ipairs(machine_speed_data) do 
      if alias==info.mi then index=i end
      local puprctdev=info.sigma/info.speed*100
      totdev=totdev+puprctdev
      sum=sum+info.speed
      n=n+1
    end --for _,info
    -- Compare each pickuo to its average speed, machine average speed, and class speed allowed variation
    --for _,info in ipairs(machine_speed_data) do
    info=machine_speed_data[index]
    local puprctdev=info.sigma/info.speed*100
    local machprctdev=math.abs(info.speed-(sum/n))/(sum/n)*100
    local spddif=math.abs(info.speed-clspeed)/clspeed*100

    if  totdev>.15 then
      z_fault_tone_list(element,brg,'-', 1, 0, 0,totdev,nil,nil, "Normalization error - Tot Speed dev",'TD',info.speed,nil)
      fired=true
      --assert1()
      --assert2(104)
      assert2(25+(totdev*20))
      debugprint('Data Normalization Error Fired -- Total Speed Deviation '..(totdev*100)..'%')
    end 
    if not (fired) then debugprint ('Data Normalization - Total Deviation FALSE') end
    return fired
  end -- machine_speed_data ~= nil
  debugprint ('Data Normalization - Total Deviation FALSE')
  return false
end --function
--
function data_check_can_analysis_proceed(element,brg) -- Checks for the presents of normal spectrum data, true if data
  return false
end --[[
  debugprint('DATA CHECK FOR ANALYSIS -- STARTED')
  local bearing,alias,spdratio =z_get_brg_and_data_set_speed_ratio(element,brg)
  local axis={'a','r','t'}
  local hasdata=false
  for _,a in ipairs(axis) do
    local ssmin,ssmax,low,high=maximum_data_range(element,brg,a)
    if low~=nil then
      hasdata=true
    end
  end
  if hasdata==false then
    debugprint ("Spectral Data found for pickup "..bearing)
    assert1()
    return true
  end
  debugprint ("No Spectral Data found for pickup "..bearing)
  return false
end --]]

function data_check_missing_data(element,brg,straxis) -- Checks for the presents of normal spectrum data, true is no data
  local bearing,alias,spdratio =z_get_brg_and_data_set_speed_ratio(element,brg)
  if bearing==alias then
    local ssmin,ssmax,low,high=maximum_data_range(element,brg,straxis)if ssmin==nil and ssmax==nil and low==nil and high==nil and not isparentrule then
      debugprint ("No Spectral Data for pickup "..bearing.. " axis "..straxis)
      z_fault_tone_list(element,brg,straxis, 1, 0, 0,0,nil,nil, "No Data ",'NoDATA',101,nil) 
      assert2(101)
      return true
    end
    debugprint ("Check for missing data at pickup "..bearing .. " axis "..straxis ..' FALSE') 
  end --   if bearing==alias
  return false
end

function data_check_missing_1x(element, brg, straxis) -- Checks for the present of a 1X tone at bearings
  local bearing,alias,spdratio =z_get_brg_and_data_set_speed_ratio(element,brg)
  if bearing==alias then
    debugprint ("Check for data at element ",element,"bearing ",brg,"axis ",straxis)
    local rF1x=analyze_by_tag( "1X", element, brg, straxis )
    local ret=false
    if rF1x.found then
      debugprint ("Data found for 1X on pickup "..bearing.." axis "..straxis)   
    else
      local sr1x 
      if sr1x==nil then
        for i,ds in ipairs (machine.datasets)  do
          if ds.dom=='spec' and ds.typ=='normal' and ds.axis==straxis and ds.mi==alias then
            sr1x=ds.speed*spdratio
            break
          end
        end 
      end
      debugprint ("No 1x for pickup "..bearing.. " axis "..straxis)
      z_fault_tone_list(element,brg,straxis, 1, 0, 0,0,nil,nil, "No 1X found ",'No1X',sr1x,nil) 
      assert2(20)
      ret=true
    end
    if ret then
      return true
    end 
    debugprint ("Check for 1X data at pickup "..bearing .. " axis "..straxis ..' FALSE') 

  end
  return false
end
--
function data_check_high_noise_level(element, brg, straxis) -- Checks for abnormally high broadband data at bearings
  local bearing,alias,spdratio =z_get_brg_and_data_set_speed_ratio(element,brg)
  local ret=false
  if bearing==alias then
    local stopf=0
    local lstart,_,lstop,maxdata=maximum_data_range(element,brg,straxis)
    if lstart~=nil and lstop~=nil and maxdata~=nil then
      if maxdata~=0 then
        stopf=maxdata*.98
      else
        stopf=lstop*.98
      end
      if stopf>lstop*.98 then  
        local lowavedata=analyze_noise_floor (lstart,lstop*.98,brg,straxis, true)
        local hiavedata=analyze_noise_floor (lstop,stopf,brg,straxis, true) 
        if lowavedata~=nil then
          if lowavedata.dif>20  then
            debugprint ('Low Range Data Noise Floor signicantly higher than Average at bearing '.. brg .. " axis "..straxis)
            z_fault_tone_list(element,brg,straxis, 2, lowavedata.sval, lowavedata.aval,lowavedata.dif,nil,nil, "Low Range High BBN Data Fault",'BD',5 ,10) 
            ret=true
          end
        end
        if hiavedata~=nil and maxdata~=nil then
          if hiavedata.dif~=nil then
            if  hiavedata.dif>20 then
              debugprint ('High Range Data Noise Floor signicantly higher than Average at bearing '.. brg .. " axis "..straxis)
              z_fault_tone_list(element,brg,straxis, 10, hiavedata.sval, hiavedata.aval,hiavedata.dif,nil,nil, "High Range High BBN Data Fault",'BD',55,100) 
              assert2(math.abs(lowavedata.dif)+math.abs(hiavedata.dif))
              ret=true
            end
          end
        end
      else
        if lstart<1 and stopf>25 then 
          lstart=1 
        elseif lstart<.3 then
          lstart=.3
        end 
        local lowavedata=analyze_noise_floor (lstart,lstop,brg,straxis)
        if lowavedata~=nil then
          if math.abs(lowavedata.dif)>20  then
            debugprint ('Data Noise Floor signicantly higher than Average at bearing '.. brg .. " axis "..straxis)
            z_fault_tone_list(element,brg,straxis, 2, lowavedata.sval, lowavedata.aval,lowavedata.dif,nil,nil, "Low Range High BBN Data Fault",'BD',5 ,10)       
            assert2(lowavedata.dif*2)
            ret=true
          end
        end
      end
    end
    if ret then
      return true
    end
    debugprint ("High BB data data check at pickup "..bearing .. " axis "..straxis ..' FALSE')
  end
  return false
end 
--
function data_check_low_noise_level(element, brg, straxis) -- Checks for abnormally low broadband data at bearings
  local bearing,alias,spdratio =z_get_brg_and_data_set_speed_ratio(element,brg)
  local ret=false
  if bearing==alias then
    local stopf=0
    local lstart,_,lstop,maxdata=maximum_data_range(element,brg,straxis)
    if lstart~=nil and lstop~=nil and maxdata~=nil then
      if maxdata~=0 then
        --if stopf> maxdata*.98 then stopf=maxdata*.98 end
        stopf=maxdata*.98
      else
        stopf=lstop*.98
      end
      if stopf>lstop*.98 then  
        local lowavedata=analyze_noise_floor (lstart,lstop*.98,brg,straxis, true)
        local hiavedata=analyze_noise_floor (lstop,stopf,brg,straxis, true) 
        if lowavedata~=nil then
          if lowavedata.dif<-20  then
            debugprint ('Low Range Data Noise Floor signicantly lower than Average at bearing '.. brg .. " axis "..straxis)
            z_fault_tone_list(element,brg,straxis, 2, lowavedata.sval, lowavedata.aval,lowavedata.dif,nil,nil, "Low Range Low BBN Data Fault",'LBBN',5 ,10) 
            ret=true
          end
        end
        if hiavedata~=nil then
          if  hiavedata.dif<-20 then
            debugprint ('High Range Data Noise Floor signicantly lower than Average at bearing '.. brg .. " axis "..straxis)
            z_fault_tone_list(element,brg,straxis, 10, hiavedata.sval, hiavedata.aval,hiavedata.dif,nil,nil, "High Range Low BBN Data Fault",'LBBN',55,100) 
            assert2(math.abs(lowavedata.dif)+math.abs(hiavedata.dif))
            ret=true
          end
        end
      else
        if lstart>stopf then 
          local _
        end
        if lstart<1 and stopf>25 then lstart=1 end 
        local lowavedata=analyze_noise_floor (lstart,stopf,brg,straxis)
        if lowavedata~=nil then 
          if math.abs(lowavedata.dif)>20  then
            debugprint ('Data Noise Floor signicantly lower than Average at bearing '.. brg .. " axis "..straxis)
            z_fault_tone_list(element,brg,straxis, 2, lowavedata.sval, lowavedata.aval,lowavedata.dif,nil,nil, "Low BBN Data Fault",'BD',5 ,10)       
            assert2(lowavedata.dif*2)
            ret=true
          end
        end
      end
    end
    if ret then
      return true
    end
    debugprint ("Low BB data data check at pickup "..bearing .. " axis "..straxis ..' FALSE')
  end
  return false
end 
--
function data_check(element, brg, straxis) -- Checks for the data at bearings
  local bearing,alias,spdratio =z_get_brg_and_data_set_speed_ratio(element,brg)
  if bearing==alias then
    --[[if straxis=='a' then
      if data_normalization_check(element, brg) then
        local a =data_normalization_check_severity()
      end
    end  ]]

    debugprint ("Check for data at element ",element,"bearing ",brg,"axis ",straxis)
    local rF1x=analyze_by_tag( "1X", element, brg, straxis )
    local ret=false
    if rF1x.found then
      debugprint ("Data found for 1X on pickup "..bearing.." axis "..straxis)   
    else
      local sr1x 
      --local bearing,alias,spdratio =z_get_brg_and_data_set_speed_ratio(element,brg)
      if sr1x==nil then
        for i,ds in ipairs (machine.datasets)  do
          if ds.dom=='spec' and ds.typ=='normal' and ds.axis==straxis and ds.mi==alias then
            sr1x=ds.speed*spdratio
            break
          end
        end 
      end
      debugprint ("No 1x for pickup "..bearing.. " axis "..straxis)
      z_fault_tone_list(element,brg,straxis, 1, 0, 0,0,nil,nil, "No 1X found ",'No1X',sr1x,nil) 
      assert2(40)
      ret=true
    end 
    local stopf=100
    local _,_,_,maxdata=round(maximum_data_range(element,brg,straxis)*.95)
    if stopf> maxdata then stopf=maxdata end
    if stopf>10 then  
      local lowavedata=analyze_noise_floor (2,9.8,brg,straxis, true)
      local hiavedata=analyze_noise_floor (10,stopf,brg,straxis, true) 
      if math.abs(lowavedata.dif)>20  then
        debugprint ('Low Range Data Noise Floor signicantly different than Average at bearing '.. brg .. " axis "..straxis)
        z_fault_tone_list(element,brg,straxis, 2, lowavedata.sval, lowavedata.aval,lowavedata.dif,nil,nil, "Low Range Possible Bad Data ",'BD',5 ,10) 
        ret=true
      end
      if hiavedata~=nil then
        if  math.abs(hiavedata.dif)>20 then
          debugprint ('High Range Data Noise Floor signicantly different than Average at bearing '.. brg .. " axis "..straxis)
          z_fault_tone_list(element,brg,straxis, 10, hiavedata.sval, hiavedata.aval,hiavedata.dif,nil,nil, "High Range Possible Bad Data ",'BD',55,100) 
          assert2(math.abs(lowavedata.dif)+math.abs(hiavedata.dif))
          ret=true
        end
      end
    else
      local lowavedata=analyze_noise_floor (.5,stopf,brg,straxis)
      if math.abs(lowavedata.dif)>20  then
        debugprint ('Data Noise Floor signicantly different than Average at bearing '.. brg .. " axis "..straxis)
        z_fault_tone_list(element,brg,straxis, 2, lowavedata.sval, lowavedata.aval,lowavedata.dif,nil,nil, "Possible Bad Data ",'BD',5 ,10)       
        assert2(math.abs(lowavedata.dif))
        ret=true
      end
    end  
    if ret then
      return true
    end
    debugprint ("Check for data at pickup "..bearing .. " axis "..straxis ..' FALSE')
  end
  return false
end 
--  **************************************************************

function find_peak_in_cpl(element,brg,straxis,bin)
  local brgmi,aliasmi,_=z_get_brg_and_data_set_speed_ratio(element,brg)
  if bin~=nil then 
    local pl=machine.elements[aliasmi].data.spec.cpl.normal[straxis]
    local starti=1
    if bin>10 then starti=binsearchpl(pl,bin,.1,'sbin') end
    for i=starti,#pl.peaks,1 do
      local pk=pl.peaks[i]
      -- for p,pk in ipairs(pl.peaks) do
      if round(pk.sbin/bin,4)==1 then
        return {found=true, mi=aliasmi, pk_index=i}
      end
    end
  end 
  return {found=false}  
end

function z_fault_tone_list(element,brg,straxis, orderlow, sval, aval,sev,dsi,bin, info, fo_info, orderfreq, orderhigh) --builds the fault tone list as tones are identified 
  local brgmi,aliasmi,_=z_get_brg_and_data_set_speed_ratio(element,brg)
  local pki=nil
  if bin==nil then
    if orderhigh==nil then -- assume this is a call to report an expected peak
      -- (forcing_order_index, forcing_order_tag, data_index, axis, dsi, bin, order, freq, sval, aval, severity_weight, description )
      assert_support( create_assert_support_peak( element,fo_info,brg,straxis,-1, -1, -1, -1, sval, aval, sev, info ))
    else
      -- (forcing_order_index, forcing_order_tag, data_index, axis, dsi, low_order, high_order, sval, aval, severity_weight, description )
      assert_support( create_assert_support_band( element,fo_info,brg,straxis,dsi, orderlow, orderhigh, sval, aval, sev, info ))
    end
  else
    -- (forcing_order_index, forcing_order_tag, data_index, axis, dsi, bin, order, freq, sval, aval, severity_weight, description )
    assert_support( create_assert_support_peak( element,fo_info,brg,straxis, dsi, bin, orderlow, orderfreq, sval, aval, sev, info ))
    if g_peak_list~=nil and g_peak_list~={} and #g_peak_list>0 then
      local pk=find_peak_in_peaklist(element,brg,straxis,bin)
      if pk.found then
        pki=pk.pk_index
        g_peak_list[pk.mia].peaks[pki].flags=add_flag(g_peak_list[pk.mia].peaks[pki].flags,'r')
      end
    end
    local cpl=find_peak_in_cpl (element,brg,straxis,bin)
    if cpl.found then
      machine.elements[cpl.mi].data.spec.cpl.normal[straxis].peaks[cpl.pk_index].flags=add_flag(machine.elements[cpl.mi].data.spec.cpl.normal[straxis].peaks[cpl.pk_index].flags,'r')
    end
  end 
  local mi, vms_index=z_get_machine_index(g_shaft,brg)
  local cn=get_this_comp_number()
  --debugprint (  aliasmi , straxis,orderlow,sval, sval-aval,info,g_fault,g_shaft, machine.elements[element].guid,machine.elements[aliasmi].guid)
  local dup=false
  local j
  if true then  -- Set to false to include duplicate tones
    for i,j in ipairs( g_fault_tones) do
      if  not (dup)  then 
        dup=(--[[j.vfa_guid==g_fault and j.vhs_guid_shaft==g_shaft  and ]] j.vmel_datasource==machine.elements[aliasmi].guid and j.axis==straxis and j.orderlow==orderlow and j.sval==sval and  j.dif==sval-aval and j.info==info and j.fo_info==fo_info and j.orderhigh==orderhigh and j.data_mi == aliasmi)-- and  j.vms_index == cn) --and j.vmel_guid==machine.elements[mi].guid) -- -- does not duplicate tones called by different mi index against the data source mi (alias)
        -- dup=(--[[j.vfa_guid==g_fault and j.vhs_guid_shaft==g_shaft  and ]] j.vmel_datasource==machine.elements[aliasmi].guid and j.axis==straxis and j.orderlow==orderlow and j.sval==sval and  j.dif==sval-aval and j.info==info and j.fo_info==fo_info and j.orderhigh==orderhigh and j.data_mi == aliasmi and  j.vms_index == cn) --and j.vmel_guid==machine.elements[mi].guid) -- Duplicates tones called by different mi index against the data source mi (alias)
        if dup then break end
      end
    end
  end
  if not (dup)  then 
    table.insert( g_fault_tones ,  {vfa_guid = g_fault , vhs_guid_shaft = g_shaft ,  vmel_guid = machine.elements[mi].guid , vmel_datasource = machine.elements[aliasmi].guid  ,  axis = straxis , orderlow = orderlow , orderhigh = orderhigh , orderfreq = orderfreq, sval = sval ,  dif = sval-aval ,sev=sev, info = info , fo_info=fo_info ,  data_mi = aliasmi , vms_index = cn ,sbin=bin, pk_index=pki }) 
  end
  dup=false--]]
  return aliasmi 
end
--
function z_flag_tone_as_found (element,brg,straxis,sbin,mi)
  local flags
  local done=false
  -- old peaklist
  for i,mia in ipairs(g_peak_list) do
    if mia.axis==straxis and mia.mi==mi then
      for p,pk in ipairs(mia.peaks) do
        flags=pk.flags or '-'
        if sbin~=nil then 
          if round(sbin/pk.sbin,3)==1 then
            done=true
            g_peak_list[i].peaks[p].flags=add_flag(flags,'f')
            break
          end
        end
      end
    end
  end
  -- new peak list
  local cpl=find_peak_in_cpl (element,brg,straxis,sbin)
  if cpl.found then
    done=true
    machine.elements[cpl.mi].data.spec.cpl.normal[straxis].peaks[cpl.pk_index].flags=add_flag(machine.elements[cpl.mi].data.spec.cpl.normal[straxis].peaks[cpl.pk_index].flags,'f')
  end
  return done
end
--


function z_tone_in_fault_tone_list(element,brg,straxis, orderlow, sval, aval,sev,bin, info, fo_info, orderfreq, orderhigh) -- returns true if a tone is already in the fault tone list
  local brgmi,aliasmi,_=z_get_brg_and_data_set_speed_ratio(element,brg)
  local mi, vms_index=z_get_machine_index(g_shaft,brg)

  -- debugprint (  aliasmi , straxis,order,sval, sval-aval,info,g_fault,g_shaft, machine.elements[element].guid,machine.elements[aliasmi].guid)
  local dup=false
  local j
  for i,j in ipairs( g_fault_tones) do
    --if  not (dup) then 
    --dup=(j.vfa_guid==g_fault and j.vhs_guid_shaft==g_shaft  and j.vmel_datasource==machine.elements[aliasmi].guid and j.axis==straxis and j.orderlow==orderlow and j.sval==sval and  j.dif==sval-aval  and j.orderhigh==orderhigh and j.data_mi == aliasmi  )--and j.vmel_guid==machine.elements[mi].guid) and j.info==info and j.fo_info==fo_info
    dup=(--[[j.vfa_guid==g_fault and j.vhs_guid_shaft==g_shaft  and ]] j.vmel_datasource==machine.elements[aliasmi].guid and j.axis==straxis and j.orderlow==orderlow and j.sval==sval and  j.dif==sval-aval  and j.orderhigh==orderhigh and j.data_mi == aliasmi  and j.vmel_guid==machine.elements[mi].guid) and j.info==info and j.fo_info==fo_info
    if dup then break end
    --end
  end
--return false -- for testing end
  return dup

end
--

--
--local function z_get_ci_from_mi(mi)
--  if mi==nil then return nil end
--  for i, cmp in ipairs(machine.components) do 
--    if cmp.comp==0 then
--      if #cmp.map>=1 then
--        for _,m in ipairs(cmp.map) do
--          if mi==m then return i end
--        end
--      end
--    end
--  end 
--end 
--
--function z_get_data_source_mi_from_ci(ci,brg)
--  local map=machine.components[ci].map[brg]
--  local ds=machine.elements[map].alias
--  if ds~=nil then
--    return ds
--  else
--    return map
--  end
--end
--
function z_get_machine_index(comp_guid , si)
  local mi=0
  local mig="" 
  for i, cmp in ipairs(machine.components) do 
    if cmp.shaft==comp_guid then
      if #cmp.map>1 then
        mi=cmp.map[si]
      else
        mi=cmp.map[1]
      end 
      return mi,i
    end
  end
end
-- ++++++++++++++++++++++++++++++++++++++++++

--function z_is_a_multiple(firstord,subject,close)
--  close=close or .01  
--  local m,r=math.modf(subject/firstord)
--  local mult=math.floor(m+round(r))
--  if mult>0 then
--    _,r=math.modf(subject/(mult*firstord))
--    if r<close or 1-r<close then
--      return true,math.abs(mult),math.min(math.abs(r),math.abs(1-r))
--    end
--  end
--  return false,0,1

--end
--

function z_format_fault_tones_to_xml(ft)
  local aa={'a','r','t'}
  local ax={}
  local mm={}
  local tn={}
  local mi={}
  local temp={}
  if #ft >0 then 
    local dup=false
    for _,r in ipairs (ft) do
      for _,m in ipairs (mm) do
        if not (dup) then
          dup=r.data_mi == m 
          if dup then break end
        end
      end
      if not(dup) then 
        table.insert(mm,r.data_mi)
      end
      dup=false
    end
    for _,m in ipairs (mm) do
      ax={}
      for _,a in ipairs (aa) do
        tn={}
        for _,r in ipairs (ft) do
          if r.data_mi == m and a == r.axis then 
            temp= {tone={vfa_guid = r.vfa_guid , vhs_guid_shaft = r.vhs_guid_shaft ,  vmel_guid = r.vmel_guid ,     orderlow = r.orderlow ,               orderhigh = r.orderhigh , orderfreq = r.orderfreq, sval = r.sval ,  dif = r.dif ,sev=r.sev, fo_info=r.fo_info, info = r.info ,  vms_index = r.vms_index ,               sbin=r.sbin, pk_index=r.pk_index }}
            table.insert(tn,temp)
          end
        end
        temp={axisdata={axis=a,{tones=tn}}}
        table.insert ( ax,temp)
      end
      temp={pickup={vmel_index= math.floor(m),  vmel_datasource= machine.elements[m].guid,{axis={ax}}}}
      table.insert(  mi,temp)
    end
    mi={faulttones=mi}
    --local luatoxml=require("luatoxml")
    local luatoxml=get_lua_to_xml()
    local xml = luatoxml.toxml(mi) 
    if trouble_shoot then debugprint(xml) end
    return xml
  end
  return ""
end

--[[
    function debugprint (p1,p2,p3,p4,p5,p6,p7,p8,p9,p10,p11,p12,p13,p14,p15) -- prints only if g_no_printing is false
      p1=p1 or ''
      p2=p2 or ''
      p3=p3 or ''
      p4=p4 or ''
      p5=p5 or ''
      p6=p6 or ''
      p7=p7 or ''
      p8=p8 or ''
      p9=p9 or ''
      p10=p10 or ''
      p11=p11 or ''
      p12=p12 or ''
      p13=p13 or ''
      p14=p14 or ''
      p15=p15 or ''
      local tbl={}
      local go=false
      table.insert(tbl,{p1,p2,p3,p4,p5,p6,p7,p8,p9,p10,p11,p12,p13,p14,p15})
      for _,t in ipairs(tbl) do
        for _,p in ipairs(t) do
          if string.len(p)>0 then
            go=true
            break
          end
        end
      end 
      if not(g_no_printing) and go then print (p1,p2,p3,p4,p5,p6,p7,p8,p9,p10,p11,p12,p13,p14,p15) end
    end  --]]
-- 
function bearingREtones(element,brg,straxis,strrotorname,threshold,svrtymult) -- Checks for non-sychronous tones with significant harmonics or sidebands
  local rn=strrotorname or ''
  debugprint (rn.." Non-sychronous bearing tone rule started on "..rn.." Rotor",element,"bearing",brg,"axis",straxis)
  increment_store_counter( "pts"..element..rn.."brgretones" )
  local thld = threshold or 108
  local smult = svrtymult or 1
  local sverity=0
  local te=0
  local tc=0
  local awsth=110
  local sevthld=0
  --debugprint (get_attribute_value("THRESHOLD",element),"<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<")
  z_countuniquecalls('bret',element,brg,straxis)
  local rF1x=analyze_by_tag( "1X", element, brg, straxis )
  increment_store_counter( "pt"..element..rn.."brgretones" )
  local ordr1x=rF1x.sord
  local sr1x=rF1x.sfreq 
  local bearing,alias,spdratio =z_get_brg_and_data_set_speed_ratio(element,brg)
  if sr1x==nil then
    for i,ds in ipairs (machine.datasets)  do
      if ds.dom=='spec' and ds.typ=='normal' and ds.axis==straxis and ds.mi==alias then
        sr1x=ds.speed*spdratio
        break
      end
    end 
  end
  local cn=get_this_comp_number()
  local shaftspeeds=get_comp_speed_ratios()
  local s1x=shaftspeeds[cn]
  local used_tones={}
  local used=false
  --
  -- Determine if there are harmonics that are not integer multiple of a shaft rate and do not have forcing frequency matches
  --
  --local harms=z_get_harmonic_groups_from_peak_list(element,brg,straxis,nil,true)
  local harms=get_harmonic_groups_from_cpl(element,brg,straxis,nil,true)

  if harms.found then
    local brgharmidx={}
    local identified=false
    for i,harm in ipairs(harms.harmonics) do  
      if #harm.harm_fundamental_pk_matches>0 then
        identified=true
      end
      local islfx,mtrissync = z_peak_is_2xLF_mult(harm.harm_sfreq,sr1x)
      if islfx and not (mtrissync) then  -- tone is multiple of line frequency and 1x not too close syncronous to tell
        identified=true
      end
      for _,spd in ipairs(shaftspeeds) do
        local pkissrharm,x,rmdr = z_is_a_multiple(spd,harm.harm_sord,.005) --math.modf(harm.harm_sord/spd)      
        x=math.modf(x+round(rmdr))       
        if pkissrharm --[[(rmdr<.02 or 1-rmdr<.02)]] then   -- is harm.sord a shaft speed multiple
          identified=true
          break
        end
      end  --for _,spd
      if not(identified) then
        table.insert(brgharmidx,i)
      end
      identified=false
    end  -- for i,harm
    if #brgharmidx>0 then
      for i,idx in ipairs (brgharmidx) do
        local dup=false
        local hstring=''
        local hgsverity=0
        local h1x=harms.harmonics[idx].harm_sord
        local f1x=harms.harmonics[idx].harm_sfreq
        local maxdif=0
        local maxsval=0
        if h1x > 2 then  -- typically bearing tone fundimentals are greater than 2x so only look there
          for _,harm in ipairs (harms.harmonics[idx].harmonic_info)  do
            if harm.dif~=nil then
              --dup=z_tone_in_fault_tone_list(element,brg,straxis, harm.sord, harm.sval, harm.aval,hsverity,harm.sbin, hord.."x harmonic of "..tostring(round(h1x,3)).. 'x on '..rn,hord.."h"..tostring(round(h1x,3))..'x', harm.sfreq) 

              if harm.dif> g_fault_tone_threshold or (harm.dif>3 and harm.sval>g_significance_threshold) then
                local ct=cross_talk(element,brg,straxis,harm.pk_index,'sord')
                if maxdif<harm.dif then maxdif=harm.dif end
                if maxsval<harm.sval then maxsval=harm.sval end
                used=false
                for _,t in ipairs (used_tones) do
                  if harm.sord== t then
                    used=true
                    break
                  end
                end
                if not (used) and not (ct) then     --  end -- if not (used)  
                  local hsverity=z_amplitude_weighted_severity(harm.dif,harm.sval,awsth)*2
                  --  if harm.sval>thld  then hsverity=hsverity+z_high_level_severity(thld,harm.sval)    end 

                  table.insert (used_tones,harm.sord)  
                  if hsverity>sevthld then
                    tc=tc+1
                    te=te+10^(harm.sval/20)
                    hgsverity=hgsverity+hsverity
                    local hord=nopointzero(tostring(round(harm.sord/h1x)))
                    --dup=z_tone_in_fault_tone_list(element,brg,straxis, harm.sord, harm.sval, harm.aval,hsverity,harm.sbin, hord.."x harmonic of "..tostring(round(h1x,3)).. 'x on '..rn,hord.."h"..tostring(round(h1x,3))..'x', harm.sfreq)
                    --if not(dup) then 
                    if hstring~="" then hstring=hstring..',' end
                    hstring=hstring..hord
                    z_fault_tone_list(element,brg,straxis, harm.sord, harm.sval, harm.aval,hsverity,harm.sdsi,harm.sbin, hord.."x harmonic of "..tostring(round(h1x,3)).. 'x on '..rn,hord.."h"..tostring(round(h1x,3))..'x', harm.sfreq) 
                  end
                  --end -- if not(dup)
                end -- if not (used)
              end -- if harm.dif >
            end -- if harm.dif~=nil
          end  -- for _,harm
        end   -- if h1x>2

        --[[if not (dup) then 
            z_fault_tone_list(element,brg,straxis, round(h1x,3),maxsval,maxsval-maxdif,hgsverity,0,0, hstring.."x harmonics of "..tostring(round(h1x,3)).. 'x on '..rn,'Mult-'.."h"..tostring(round(h1x,3))..'x', round(f1x,3))
            --end --]]
        sverity=sverity+hgsverity
      end  -- for i,idx
    end  -- if #brgharmidx
  end  -- if harms.found
  --
  -- Determine if there are sideband that are not integer multiple of a shaft rate and do not have forcing frequency matches
  --
  --local sides=z_get_sideband_groups_from_peak_list(element,brg,straxis,true)
  local sides=get_sideband_groups_from_cpl(element,brg,straxis,true)
  if sides.found then
    local brgsideidx={}
    local speedmatch
    for sbf,side in pairs(sides.sidebands) do  
      local spd
      if string.match(sbf,"LF")== nil then
        spd=tonumber(string.sub(sbf,1,string.find(sbf,"x")-1))
        if round (spd-(round(s1x,1)),3)==0 then
          speedmatch=sbf
          for g,grp in ipairs(side) do
            local pkissrharm ,x,rmdr = z_is_a_multiple(spd,grp.first_pk_sord,.005) -- math.modf(grp.first_pk_sord/spd)
            --x=math.modf(x+round(rmdr))       
            if not (pkissrharm)--[[(rmdr<.02 or 1-rmdr<.02)]] then   -- first_pk_sord is not a shaft speed multiple
              --local flag=pl[mia].peaks[sbi].flags or '-'
              --if string.match(flag,'m')==nil and string.match(flag,'l')==nil then  
              local islfx,mtrissync = z_peak_is_2xLF_mult(grp.first_pk_sfreq,sr1x)
              if not (islfx and  not (mtrissync)) then  -- tone not multiple of line frequency and 1x not too close syncronous to tell
                table.insert (brgsideidx,g)
              end-- first_pk_sfreq is not 120 hz multiple
            end-- is first_pk_sord a shaft speed multiple
          end --for g,grp
        end -- if spd==round(s1x,3)
      end -- not LF
    end  -- for sbf,side
    if #brgsideidx>0 then
      for _,idx in ipairs (brgsideidx) do

        for g,grp in ipairs (sides.sidebands[speedmatch])  do
          local firstsb=grp.first_pk_sord
          local sbcf=grp.first_pk_sfreq
          local dup=false
          local sbstring=''
          local sbgsverity=0
          local maxdif=0
          local maxsval=0
          if idx==g then

            for _,side in ipairs(grp.sideband_info) do
              if side.dif~=nil then
                --dup=z_tone_in_fault_tone_list(element,brg,straxis, side.sord, side.sval, side.aval,sbsverity,side.sbin, sord.."x("..speedmatch..") sideband of "..tostring(round(firstsb,3)).. 'x on '..rn,sord..'x('..speedmatch..")sb"..tostring(round(firstsb,3))..'x', side.sfreq) 

                if side.dif> g_fault_tone_threshold or (side.dif>3 and side.sval>g_significance_threshold) then
                  local ct=cross_talk(element,brg,straxis,side.pk_index,'sord')
                  if maxdif<side.dif then maxdif=side.dif end
                  if maxsval<side.sval then maxsval=side.sval end
                  used=false
                  for _,t in ipairs (used_tones) do
                    if side.sord== t then
                      used=true
                      break
                    end
                  end

                  if not (used) and side.sord>2.5 and not(ct) then     --  end -- if not (used) 
                    table.insert(used_tones,side.sord)
                    local sbsverity=z_amplitude_weighted_severity(side.dif,side.sval,awsth)*2
                    --if side.sval>thld then sbsverity=sbsverity+z_high_level_severity(side.sval,thld) end
                    if sbsverity>sevthld then
                      tc=tc+1
                      te=te+10^(side.sval/20)
                      sbgsverity=sbgsverity+sbsverity
                      local sord=nopointzero( tostring(round((side.sord-firstsb)/s1x)))
                      --dup=z_tone_in_fault_tone_list(element,brg,straxis, side.sord, side.sval, side.aval,sbsverity,side.sbin, sord.."x("..speedmatch..") sideband of "..tostring(round(firstsb,3)).. 'x on '..rn,sord..'x('..speedmatch..")sb"..tostring(round(firstsb,3))..'x', side.sfreq) 
                      --if not(dup) then 
                      if sbstring~="" then sbstring=sbstring..',' end
                      sbstring=sbstring..sord
                      z_fault_tone_list(element,brg,straxis, side.sord, side.sval, side.aval,sbsverity,side.sdsi,side.sbin, sord.."x("..speedmatch..") sideband of "..tostring(round(firstsb,3)).. 'x on '..rn,sord..'x('..speedmatch..")sb"..tostring(round(firstsb,3))..'x', side.sfreq) 
                    end
                    --end -- if not(dup)
                  end -- if not (used)
                end -- if side.dif >

              end -- if side.dif~=nil
            end  -- for _,side
          end -- if idx==g
          if not(dup) then 
            --z_fault_tone_list(element,brg,straxis, firstsb, maxsval, maxsval-maxdif,sbgsverity,0,0, sbstring.."x("..speedmatch..") sideband of "..tostring(round(firstsb,3)).. 'x on '..rn,'Mult-'..'x('..speedmatch..")sb"..tostring(round(firstsb,3))..'x', sbcf) 
          end -- if not(dup) 
          sverity=sverity+sbgsverity
        end  -- for g,grp

      end  -- for _,idx
    end  -- if #brgsideidx
  end --if sides.found 
  --local umtones=z_get_usual_tones_from_peak_list(element,brg,straxis)
  local umtones=get_usual_tones_from_cpl(element,brg,straxis)
  if umtones.found then
    for _,tone in ipairs (umtones.tones) do
      --local dup=z_tone_in_fault_tone_list(element,brg,straxis, tone.sord, tone.sval, tone.aval,tsverity,tone.sbin, sord.."x non-synchronous tone on "..rn,sord..'x brg', tone.sfreq)
      local islfx,mtrissync = z_peak_is_2xLF_mult(tone.sfreq,sr1x)
      if not (islfx) and not (mtrissync) then  -- tone not multiple of line frequency and 1x not too close syncronous to tell
        if tone.dif~=nil then
          if (tone.dif> g_fault_tone_threshold or (tone.dif>3 and  tone.sval >g_significance_threshold)) and tone.sord>2.8  then
            local ct=cross_talk(element,brg,straxis,tone.pk_index,'sord')
            used=false
            for _,t in ipairs (used_tones) do
              if tone.sord== t then
                used=true
                break
              end
            end
            if not (used) and not(ct) then     --  end -- if not (used)  
              table.insert(used_tones,tone.sord)
              local tsverity=z_amplitude_weighted_severity(tone.dif,tone.sval,awsth)
              -- if tone.sval>thld then tsverity=tsverity+z_high_level_severity(tone.sval,thld) end
              if tsverity>sevthld then
                tc=tc+1
                te=te+10^(tone.sval/20)
                sverity=sverity+tsverity
                local sord=tostring(round((tone.sord)/s1x,3))
                z_fault_tone_list(element,brg,straxis, tone.sord, tone.sval, tone.aval,tsverity,tone.sdsi,tone.sbin, sord.."x non-synchronous tone on "..rn,sord..'x brg', tone.sfreq) 
              end
            end -- if not (used)  
          end -- if tone.dif >
        end  -- tone not multiple of 2x line frequency
      end  -- tone.dif not nil
    end -- for _,tone
  end  -- if umtones.found
  --

  if sides.found or harms.found or umtones.found then
    local check,count = get_store_value("svrty"..element..rn.."brgretones")
    if check==true then
      count = count + sverity*smult
    else
      count = sverity*smult
    end
    if sverity~=0 then
      put_store_value("svrty"..element..rn.."brgretones",count)
      debugprint (rn.." Bearing RE non-sychronous tones fired - Severity",count,sverity)
      assert2(1)
      return true
    end  -- if sverity~=0
  end --if sides.found or harms.found

  debugprint (rn.." Bearing RE non-sychronous tones FALSE")
  return false
end  -- function bearingREtones
--

function bearingREtonesseverity(element,strrotorname) -- Calculate nonsychronous bearing tone Normalized Severity
  local rn=strrotorname or ''
  debugprint ("Normalizing Bearing RE non-sychronous tones fault severity on element "..element.." on rotor "..rn)
  local check2,points = get_store_value("pts"..element..rn.."brgretones")
  --debugprint ("pts"..element..strtag,check2,points)
  local check,count = get_store_value("pt"..element..rn.."brgretones")
  --debugprint ("pt"..element..strtag,check,count)
  count=count or points
  local _, calls = get_store_value("calls"..element..'bret')
  local cls=pairscount(calls)
  local check1,svrty = get_store_value("svrty"..element..rn.."brgretones")
  --debugprint ("svrty"..element..strtag,check1,svrty)
  svrty=svrty or 0

  --debugprint (strtag,points,count,svrty)
  if check==true then
    if count-points<0 then
      svrty= svrty*(points/count)
    end
    svrty= svrty/cls
    local fault=''
    debugprint (rn.." Bearing RE non-sychronous tones Fault Calculated Normalized Severity",count,svrty,fault)
    assert2(svrty)
    local owner=bearing_owner(element)--,brg,strrotorname)
    return true,svrty
  end
  debugprint (rn.." Bearing RE non-sychronous tones severity FALSE")
  return false,0
end  -- function bearingREtonesseverity
--
function nopointzero(str)
  if tonumber(str)==tonumber(string.sub(str,1,string.len(str)-2)) then 
    return   string.sub(str,1,string.len(str)-2)
  else
    return str
  end
end
--
--function z_get_brg_and_data_set_speed_ratio(element,brg)
--  local cn=get_this_comp_number()
--  --local brgmi, vms_index=z_get_machine_index(g_shaft,brg)
--  -- REVIEW: vms_index never used
--  --local vms_index = cn
--  local brgmi = machine.components[cn].map[brg]

--  -- REVIEW: Could use this, but now there is an easier way.
--  local dsmi=z_get_data_source_mi_from_ci(cn,brg)  --DAY
--  --local dsmi = get_element_alias(brgmi)   -- SR
--  local aliasmi=dsmi
--  if brg==1 and element==1 then
--    -- REVIEW: g_shaft_number and cn are the same value.
--    brgmi=machine.components[cn].map[1]
--  end 
--  return brgmi,aliasmi,g_comp_speed_ratio[cn]/g_comp_speed_ratio[z_get_ci_from_mi(aliasmi)]
--end
--
function z_peak_is_2xLF_mult(pk_freq,sr1x)
  sr1x=sr1x or 59
  local _
  local x,frac = math.modf((2*machine.linef)/sr1x)
  x=x+round(frac)
  _,frac=math.modf(sr1x*x/(2*machine.linef))
  local mtrissync = frac<.006 or 1-frac<.0045 -- motor shaft rate is too close to syncronous to check for multiples of 2x line frequency
  local _,rmdr = math.modf(pk_freq/(2*machine.linef))      
  if rmdr<.006 or 1-rmdr<.0045 then  -- tone is multiple of 2x line frequency
    return true,mtrissync
  else
    return false,mtrissync
  end
end
--
function z_amplitude_weighted_severity(dif,sval,threshold)
  if dif==nil then return 0 end
  threshold=threshold or 110
  local severity=0
  if sval ~= nil then
    if sval>50 and sval<=110 and dif>0 then --110 VdB threshold is GSO spec which is really close to mil-std-167 and.1 in/sec industrial rule of thumb  
      severity=(dif)*(10^(sval/40)/10^(threshold/40)) -- severity decreases 50% every 12 dB below 110 VdB 
    elseif sval>110 and dif>0 then
      severity=(dif)*(10^(sval/40)/10^(threshold/40)) -- severity doubles per 6 dB above 110 VdB
    end 
  end
  return severity
end
--
function z_high_level_severity(sval,threshold)
  sval=sval or 0
  threshold=threshold or 108
  local severity=0
  for i=0,40,6 do
    if sval>(threshold+i) then 
      severity = severity + math.abs(sval-(threshold+i))
    else
      break
    end
  end
  return severity
end
--
function z_sort_fault_severity(tobesorted,ascending)
  ascending=ascending or false
  local temp={}
  local i,j,maxval,maxcn
  local moved=true
  local stripped={}
  while moved do
    moved=false
    for i,j in pairs(tobesorted) do
      if i==1 then maxval=tobesorted[i].severity end
      if tobesorted[i+1]~=nil then
        if ascending then
          if j.severity>tobesorted[i+1].severity then
            maxval=j.severity
            maxcn=j.cn
            temp=tobesorted[i]
            tobesorted[i]=tobesorted[i+1]
            tobesorted[i+1]=temp
            moved=true
          end         
        else  
          if j.severity<tobesorted[i+1].severity then
            maxval=tobesorted[i+1].severity
            maxcn=tobesorted[i+1].cn
            temp=tobesorted[i]
            tobesorted[i]=tobesorted[i+1]
            tobesorted[i+1]=temp
            moved=true
          end
        end
      end
    end
  end
  return tobesorted, maxval,maxcn
end 
--
function get_comp_orientation(cn)
  return machine.components[cn].orient
end

--
function balance_fault_conf_severity_adjustment()  -- This function adjusts the confidence based in the ratio of the component severity and orientation compared to the maximum severity of the fault on the machine
  local maxsev,maxcn
  local cn=get_this_comp_number()
  local orient=get_comp_orientation(cn)
  local speedratios=get_comp_speed_ratios()
  local isit,faultshaft=get_fault_ex(g_fault)
  if isit then
    faultshaft, maxsev,maxcn=z_sort_fault_severity(faultshaft)
    for i,info in pairs (faultshaft) do
      debugprint(i,info.cn,info.conf,info.severity)
      if info.cn==cn and speedratios[maxcn]==speedratios[cn] then
        if orient=='h' then
          local conf
          if maxsev>info.severity then
            conf=info.severity/maxsev-1
          else 
            conf=1.1*info.conf
            if conf>1 then conf=1 end
          end
          debugprint("Confidence adjusted by asserting ".. round(info.conf,3)..' to '..round(conf,3))
          assert3(conf)
          return true
        elseif orient=='v' then
          -- Do nothing 
        end
      end
    end
  end
  return false
end
-- 
function common_fault_conf_severity_adjustment()  --This function adjusts the confidence based in the ratio of the component severity compared to the maximum severity of the fault on the machine
  local maxsev,maxcn
  local cn=get_this_comp_number()
  local orient=get_comp_orientation(cn)
  local speedratios=get_comp_speed_ratios()
  local isit,faultshaft=get_fault_ex(g_fault)
  if isit then
    faultshaft, maxsev,maxcn=z_sort_fault_severity(faultshaft)
    for i,info in pairs (faultshaft) do
      debugprint(i,info.cn,info.conf,info.severity)
      if info.cn==cn and speedratios[maxcn]==speedratios[cn] then
        local conf
        if maxsev>info.severity then
          conf=info.severity/maxsev-1
        else 
          conf=1.1*info.conf
          if conf>1 then conf=1 end
        end
        debugprint("Confidence adjusted by asserting ".. round(info.conf,3)..' to '..round(conf,3))
        assert3(conf)
        return true
      end
    end
  end
  return false
end
--
function bearing_owner(element,brg,strrotorname)  -- This function returns the component(s) that thbearings are part of
  brg=brg or 1
  local mi, vms_index=z_get_machine_index(g_shaft,brg)
  local owner={}
  for i,comp in ipairs (machine.components) do
    for j,map in ipairs (comp.map) do
      local name
      if machine.shafts[machine.components[i].shaft]~=nil then
        name=machine.shafts[machine.components[i].shaft].name 
      else
        name=machine.composites[machine.components[i].shaft].name
      end
      if mi==map and string.match(name,"BEARING")== nil then
        table.insert (owner, {cn=i,brgmi=mi,alias=machine.elements[mi].alias,shaft=machine.components[i].shaft, name=name})
      end
    end
  end 
  if #owner>1 then -- overlayed bearingd
    -- list of primary bearing owners by proirity 
    local drivers={'ENGINE','MOTOR','TURBINE'}
    local driven={'COMPRESSOR','FAN','GENERATOR','GOVERNOR','PUMP','PURIFIER'}
    local middle={'GEAR','CLUTCH','FLYWHEEL'}
    for _,o in ipairs (owner) do
      for _,M in ipairs (drivers) do
        if string.match(o.name,M)== M then
          return o
        end
      end
    end
    for _,o in ipairs (owner) do
      for _,M in ipairs (driven) do
        if string.match(o.name,M)== M then
          return o
        end
      end
    end
    for _,o in ipairs (owner) do
      for _,M in ipairs (middle) do
        if string.match(o.name,M)== M then
          return o
        end
      end
    end
  end
  return owner
end
--
function stoppoint(a,b)
  if a==b then
    a=0
  end
end
--
function get_data_ranges(element,brg,straxis)
  local bearing,alias,_=z_get_brg_and_data_set_speed_ratio(element,brg)
  local datasets={}
  local bestaveds=0
  local lastfmaxdif=0
  local lastfmax=0
  for ei,e in ipairs(machine.elements) do 
    if e.data~=nil and e.data.spec~=nil  then
      for sax,sdsis in pairs(e.data.spec.normal) do
        if ei==alias and sax==straxis then  
          for i, sdsi in pairs(sdsis) do
            for aax,adsis in pairs(e.data.spec.average) do 
              if ei==alias and aax==straxis then
                for j, adsi in pairs(adsis) do
                  if bestaveds==0 then 
                    bestaveds=adsi 
                    lastfmaxdif=math.abs(machine.datasets[adsi].fmax-machine.datasets[sdsi].fmax)
                    lastfmax=machine.datasets[adsi].fmax
                  end
                  if math.abs(machine.datasets[adsi].fmax-machine.datasets[sdsi].fmax)<=lastfmaxdif then 
                    bestaveds=adsi 
                    lastfmaxdif=math.abs(machine.datasets[adsi].fmax-machine.datasets[sdsi].fmax)
                    lastfmax=machine.datasets[adsi].fmax
                  end
                end
              end
            end
            if bestaveds==0 then
              table.insert(datasets,{mi=alias,axis=straxis,sdsi=sdsi,sfmax=machine.datasets[sdsi].fmax,somax=machine.datasets[sdsi].fmax/machine.datasets[sdsi].speed})
            else
              table.insert(datasets,{mi=alias,axis=straxis,sdsi=sdsi,adsi=bestaveds,sfmax=machine.datasets[sdsi].fmax,afmax=lastfmax,somax=machine.datasets[sdsi].fmax/machine.datasets[sdsi].speed,aomax=lastfmax/machine.datasets[bestaveds].speed})
            end
            bestaveds=0
            lastfmaxdif=0
            lastfmax=0
          end
        end
      end
    end
  end

  -- sort the datasets by range low to high
  local temp={}
  local moved=true
  while moved do
    moved=false
    for i,j in ipairs(datasets) do
      if datasets[i+1]~=nil then
        if j.sfmax>datasets[i+1].sfmax then
          temp=datasets[i]
          datasets[i]=datasets[i+1]
          datasets[i+1]=temp
          moved=true
        end
      end
    end
  end
  return datasets
end 
--
function z_get_data_ranges(element,brg,straxis)
  local bearing,alias,_=z_get_brg_and_data_set_speed_ratio(element,brg)
  local datasets={}
  local bestaveds=0
  local lastfmaxdif=0
  local lastfmax=0
  for _,i in ipairs (g_pkdata) do
    if i.mi==alias and i.axis==straxis then
      for _,j in ipairs (g_ave_pkdata) do
        if j.mi==alias and j.axis==straxis then
          if bestaveds==0 then 
            bestaveds=j.ds 
            lastfmaxdif=math.abs(j.fmax-i.fmax)
            lastfmax=j.fmax
          end
          if math.abs(j.fmax-i.fmax)<=lastfmaxdif then 
            bestaveds=j.ds 
            lastfmaxdif=math.abs(j.fmax-i.fmax)
            lastfmax=j.fmax
          end
        end
      end
      if bestaveds==0 then
        table.insert(datasets,{mi=alias,axis=straxis,sdsi=i.ds,sfmax=i.fmax,somax=i.fmax/machine.datasets[i.ds].speed})
      else
        table.insert(datasets,{mi=alias,axis=straxis,sdsi=i.ds,adsi=bestaveds,sfmax=i.fmax,afmax=lastfmax,somax=i.fmax/machine.datasets[i.ds].speed,aomax=lastfmax/machine.datasets[bestaveds].speed})
      end
      bestaveds=0
      lastfmaxdif=0
      lastfmax=0
    end
  end
  -- sort the datasets by range low to high
  local temp={}
  local moved=true
  while moved do
    moved=false
    for i,j in ipairs(datasets) do
      if datasets[i+1]~=nil then
        if j.sfmax>datasets[i+1].sfmax then
          temp=datasets[i]
          datasets[i]=datasets[i+1]
          datasets[i+1]=temp
          moved=true
        end
      end
    end
  end
  return datasets
end 
--
-- Bent or Bowed rotor Check Function
--**************************************************
--
function rotorbowed(element,brg,threshold,svrtymult) -- Bent or Bowed rotor Check Function
  threshold,svrtymult=z_get_rule_tune_info(element,threshold,svrtymult)
  debugprint ("Bent or Bowed rotor started on Rotor",element,"bearing",brg)
  local balthld = threshold or 108
  local smult = svrtymult or 1
  local sverity=0
  increment_store_counter( "bowpts" )
  z_countuniquecalls('1x','',brg,'a')
  local rFAm=z_get123orders( "1X", element, brg, "a" )
  increment_store_counter( "bowpt" )
  local datami
  if rFAm.found then 
    local dif1x=rFAm.dif1x
    --debugprint (dif1x)
    if dif1x>g_fault_tone_threshold or (dif1x>3 and rFAm.sval1x>g_significance_threshold) then
      sverity=dif1x -- not amplitude weighting
      if rFAm.sval1x >balthld then sverity=sverity+z_high_level_severity(rFAm.sval1x,balthld) end
      datami=z_fault_tone_list(element,brg,"a", rFAm.sord1x, rFAm.sval1x, rFAm.aval1x,dif1x,rFAm.dsi1x,rFAm.bin1x, "Bent or Bowed rotor",'1X', rFAm.sfreq) 
      z_flag_tone_as_found (element,brg,"a",rFAm.bin1x  ,datami)
      local dif2x=rFAm.dif2x
      local dif3x=rFAm.dif3x
      --debugprint (dif1x,dif2x,dif3x)

      if dif2x>g_fault_tone_threshold or (dif2x>3 and rFAm.sval2x>g_significance_threshold) then 
        sverity=sverity+dif2x  -- not amplitude weighting
        datami= z_fault_tone_list(element,brg,"a", rFAm.sord2x,rFAm.sval2x , rFAm.aval2x,dif2x,rFAm.dsi2x,rFAm.bin2x, "Bent or Bowed rotor",'2x(1X)', rFAm.sfreq*2)
        z_flag_tone_as_found (element,brg,"a",rFAm.bin2x ,datami)
      end
      --[[if dif3x>g_fault_tone_threshold or ( dif3x>3 and rFAm.sval3x>g_significance_threshold) then 
            sverity=sverity+dif3x -- not amplitude weighting
            z_fault_tone_list(element,brg,"a",  rFAm.sord3x, rFAm.sval3x, rFAm.aval3x,dif3x ,rFAm.dsi3x,rFAm.bin3x, "Bent or Bowed rotor",'3x(1X)', rFAm.sfreq*3) 
          end  ]]
      increment_store_counter( "bowpt" )
      local check,count = get_store_value("bowsvrty")
      if check==true then
        count = count + sverity*smult
      else
        count = sverity*smult
      end
      put_store_value("bowsvrty",count)
      debugprint ("Bent or Bowed rotor rule fired - Severity",sverity,count,"AAAAAAAAAAAAAAAAAAAAAA")
      assert2(1)
      return true
    end
  end

  debugprint ('Bent or Bowed rotor false')
  return false
end
--
function rotorbowedseverity () -- Bent or Bowed rotor severity normalization Function
  debugprint ("Bent or Bowed rotor severity started")
  local check,count = get_store_value("bowpt")
  local check2,pts = get_store_value("bowpts")
  count = count or pts
  local _, calls = get_store_value("calls"..''..'1x')
  local cls=pairscount(calls)
  local check1,svrty = get_store_value("bowsvrty")
  svrty=svrty or 0
  if check==true then
    --debugprint (check,count,check1,svrty)
    if count-pts<0 then
      svrty= svrty*(pts/count)
    end
    svrty= svrty/cls*4 -- times 4 for scaling
    debugprint ("-- Calculate Normalized Severity --",count,svrty,"Bent or Bowed rotor SSSSSSSSSSSSSSSSSSSSSSSSSSS")
    assert2(svrty)
    return true
  end
  debugprint ("Bent or Bowed rotor severity FALSE")
  return false
end
-- 
function unknownrotorbars(strtag,element,brg,straxis,strrotorname,threshold,svrtymult)
  --
  -- find 2xLF sideband series greater then 20x with positive severity that have at least one tone that is an integer multiple of shaftrate
  --
  local pl={}
  table.move(g_peak_list,1,#g_peak_list,1,pl)
  --sev_th=sev_th or 24
  --nr=nr or 20
  local rbpeaks={}
  local pksev=0
  local mia=0
  local no_error=true
  strtag=strtag or ""
  strtag=string.upper(strtag)  
  local dsi,ds,help=get_best_dataset( 1, brg, 'normal', straxis, no_error )
  for m,dsg in ipairs(pl) do
    if mia~=0 then break end
    for _,pkds in ipairs(dsg.datasets) do
      if pkds==dsi then 
        mia=m
        break
      end
    end
  end
  if mia~=0 then 
    local sbseries={}
    local sbs={}
    local cn=get_this_comp_number()
    local spratios=get_comp_speed_ratios()
    local compspeedrat=spratios[cn]
    local closesttoint={}
    --
    -- check peak list sorts for high severity 2xLF series
    --
    if #pl[mia].sorts.sb_severity >0 then
      if pl[mia].sorts.sb_severity['2xLF']~=nil then
        sbseries=pl[mia].sorts.sb_severity['2xLF']
        local sb_severity=0
        for i,pi in ipairs(sbseries) do 
          pi=tonumber(pi)
          -- get sideband severity 
          for _,tbl1 in pairs (pl[mia].peaks[pi].sb_severity) do
            for spacing,sbs in pairs( tbl1) do
              if spacing=='2xLF' then
                sb_severity=sbs
              end
            end
          end
          -- Check for significant sideband severity
          if sb_severity>3 then 
            for _,tbl1 in pairs (pl[mia].peaks[pi].sidebands) do
              for spacing,sps in pairs( tbl1) do
                if spacing=='2xLF' then
                  local closest=0
                  local minrmdr=0
                  for j,sb in ipairs (sps) do
                    sb=tonumber(sb)
                    local isitint,mult,rmdr=z_is_a_multiple(1,pl[mia].peaks[sb].sord,.0005)
                    if j==1 or (isitint and rmdr<minrmdr) then
                      minrmdr=rmdr
                      closest=sb
                    end
                  end
                  if minrmdr<.005 then 
                    for j,sb in ipairs (sps) do
                      sb=tonumber(sb)
                      if pl[mia].peaks[sb].dif~=nil then
                        if pl[mia].peaks[sb].dif>g_fault_tone_threshold  or( pl[mia].peaks[sb].sval> g_significance_threshold and  pl[mia].peaks[sb].dif>3)  then 
                          table.insert(rbpeaks,{
                              sord=pl[mia].peaks[sb].sord,
                              sval=pl[mia].peaks[sb].sval,
                              aval=pl[mia].peaks[sb].aval,
                              severity=z_amplitude_weighted_severity(pl[mia].peaks[sb].dif,pl[mia].peaks[sb].sval,108),
                              sdsi=pl[mia].peaks[sb].sdsi,
                              sbin=pl[mia].peaks[sb].sbin
                            })
                        end
                      end
                      debugprint(brg,straxis,closest,minrmdr,pl[mia].peaks[closest].sord,sb_severity)
                      local _
                    end
                  end
                end
              end
            end
          end
        end
      end
      if #rbpeaks>0 then
        return {found=true,peaks=rbpeaks}
      end
    end
  end
  return {found=false}
end
--

--[
function pulley_vibration(element,brg,straxis,strrotorname,threshold,svrtymult) -- Pulley Misalignment/Eccentricity Function
  -- 
  --This function is written specifically for bgr-pulley-pulley-brg composite.  It evaluates the vibration producted by a pulley at both bearings
  --
  threshold,svrtymult=z_get_rule_tune_info(element,threshold,svrtymult)
  --
  local thispulley,otherpulley,otherbrg=2,3,4
  if element==3 then thispulley,otherpulley,otherbrg=3,2,1 end
  --
  local otheraxis='t'
  if straxis=='t' then otheraxis='r' end
  --
  debugprint ("Pulley Eccentricity/Misalignment started on Rotor",element,"axis",straxis)
  local balthld = threshold or 108
  local smult = svrtymult or 1
  local sverity=0
  increment_store_counter( "pmepts"..straxis )
  z_countuniquecalls('1X',element,brg,straxis)

  local far1x=analyze_by_tag( "1X", thispulley, otherbrg, straxis )
  local near1x=analyze_by_tag( "1X", thispulley, brg, straxis )
  local ofar1x=analyze_by_tag( "1X", thispulley, otherbrg, otheraxis )
  local onear1x=analyze_by_tag( "1X", thispulley, brg, otheraxis )
  increment_store_counter( "pmept"..straxis )
  if near1x.found then 
    local neardif=near1x.dif or 0
    local fardif=far1x.dif or 0
    local oneardif=onear1x.dif or 0
    local ofardif=ofar1x.dif or 0
    local severity=0
    local datami
    if (neardif>3 or fardif>3)  then
      if (straxis~='a'and (neardif-3>=oneardif or fardif-3>=ofardif)) or straxis=='a' then
        if neardif>0 then 
          severity=neardif -- not amplitude weighting
          if near1x.sval>balthld then severity=severity+z_high_level_severity(near1x.sval,balthld) end
          datami= z_fault_tone_list(thispulley,brg,straxis, near1x.sord, near1x.sval,near1x.sval-near1x.dif,severity,near1x.dsi,near1x.bin, "Pulley Essentricity ",'PE',near1x.sfreq)
          z_flag_tone_as_found (thispulley,brg,straxis, near1x.bin,datami)
        end
        if fardif>0 then
          local farsev=fardif -- not amplitude weighting
          if far1x.sval>balthld then farsev=farsev+z_high_level_severity(far1x.sval,balthld) end
          severity=severity+farsev
          datami= z_fault_tone_list(thispulley,otherbrg,straxis, far1x.sord, far1x.sval,far1x.sval-far1x.dif,farsev,far1x.dsi,far1x.bin, "Pulley Essentricity ",'PE',far1x.sfreq)
          z_flag_tone_as_found (thispulley,otherbrg,straxis, far1x.bin,datami)
        end
      end
    end
    if severity>0 then
      local check,count = get_store_value("pmesvrty"..straxis)
      if check==true then
        count = count + severity*smult
      else
        count = severity*smult
      end 
      put_store_value("pmesvrty"..straxis,count)
      debugprint ("Pulley Misalignment/Eccentricity rule fired..straxis - Severity ",count,"PPPPPPPPPPPPPPPPPP")
      assert2(1)
      return true
    end
  end
  debugprint ("Pulley Misalignment/Eccentricity FALSE")
  return false
end
--
--
function pulley_vibration_severity (straxis,element) -- Parallel Misalignment/Eccentricity normalization Function
  debugprint ("Parallel Misalignment/Eccentricity normalize started")
  local check,count = get_store_value("pmept"..straxis)
  local check2,pts = get_store_value("pmepts"..straxis)
  count=count or pts
  local _, calls = get_store_value("calls"..element..'1X')
  local cls=pairscount(calls)
  local check1,svrty = get_store_value("pmesvrty"..straxis)
  svrty=svrty or 0
  if check==true then
    if count-pts<0 then
      svrty= svrty*(pts/count)
    end
    svrty= svrty/cls  
    debugprint ("-- Calculate Normalized Severity --",count,svrty,"Pulley Misalignment/Eccentricity",straxis)
    assert2(svrty)
    return true
  end
  debugprint ("Pulley Misalignment/Eccentricity FALSE Severity")
  return false
end

-- returns true if an AC motor in in the train
function fixed_speed()
  local fixedspeed=false
  local guid=categories.MOTOR.mincat.AC
  for _,shaft in pairs(machine.shafts) do
    if shaft.cat2==guid then
      fixedspeed=true
      break 
    end 
    if string.match(shaft.name,'MOTIND')=='MOTIND' then -- remove hard coded section later
      fixedspeed=true
      break 
    end
  end
  if fixedspeed then 
    debugprint('                Fixed Speed Machine == Tight Range Normalization') 
  else
    debugprint('              Variable Speed Machine == Wider Range Normalization') 
  end
  return fixedspeed
end
--
-- Missing averages fault
function missing_averages(element,brg)
  local found=true
  local axes={'a','r','t'}
  local bearing,alias,spdratio =z_get_brg_and_data_set_speed_ratio(element,brg)
  for _,ax in ipairs(axes) do
    if machine.elements[alias]==nil or machine.elements[alias].data==nil or machine.elements[alias].data.spec==nil or machine.elements[alias].data.spec.average==nil or machine.elements[alias].data.spec.average[ax]==nil or #machine.elements[alias].data.spec.average[ax]==0 then
      found=false
      break
    end
  end
  if found then
    return false
  else
    assert2(1)
    return true
  end
end

