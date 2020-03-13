-- Revision 43 2/28/2020
--
-- rev 43 2/28/2020 removed points and unique calls.  To simplify calculate average severity.
--
-- 00000000-0000-0000-0000-000000000000 MachineShaft GUID
trouble_shoot=false -- turns on printing and extra output for troubleshooting
-- Catagory guids
--
--*****************************************
--     Utility Functions
local function is_tag_and_value_not_known( compare_tag, tag, shaft_tag_index )
  return (tag==compare_tag) and (get_tag_order( tag, shaft_tag_index,-1 ).order== -1)
end

local function is_line_frequency_tag( tag )
  if string.find( tag, 'LF' ) == 1 then return true end  -- Test for LF
  if string.find( tag, '2XLF' ) == 1 then return true end -- Test for 2XLF
  return false
end
--*****************************************
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
function motor_2xLF_fundamental(element,brg,straxis,strrotorname,threshold,svrtymult)-- Checks for a tone match at 2XLF (two times line frequency)
  threshold,svrtymult=z_get_rule_tune_info(element,threshold,svrtymult)
  return z_forcingfrequencyfundamental("2XLF",element,brg,straxis,strrotorname,threshold,svrtymult)
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
  strtag = string.upper(strtag)
  debugprint (rn.." FF Fundamental rule started on "..rn.." Rotor",element,"bearing",brg,"axis",straxis,"for strtag",strtag)
  local ffthld = threshold 
  local smult = svrtymult 
  local ret_severity=0
  local close=.004
  local order=0
  local rFff={}
  local conf=0
  if strtag=='CPLGELEMS' then smult=smult/4 end


  -- If the data is aliased from a pickup on a different shaft the speed
  -- returned is adjusted to bring it into the referance frame of the origional
  -- bearing location.
  local brg_speed = get_data_shaft_speed( brg )

  increment_store_counter( "pt"..element..strtag ) -- count the times data is found

  -- ******************* MOTRTRBARS ******************************
  -- If this is motor bar analysis and the number of motor bars is not known
  -- try to determine them.

  if is_tag_and_value_not_known( 'MOTRTRBARS', strtag, element ) then
    -- Try to identify the motor bars in the data


    local rbpeaks=unknownrotorbars('MOTRTRBARS',element,brg,straxis,strrotorname,threshold,svrtymult)

    if  rbpeaks.found then
      for pk,rFff in ipairs(rbpeaks.peaks) do
        local sval=rFff.sval

        local ordr=rFff.sord
        local aval=rFff.aval or ConvertSpectrum(Unit.U_VDB , g_internal_unit  ,  constantaccelspec(g_no_ave_ff_spec,ordr))
        -- REVIEW: Should include sfreq in the return from unknownrotorbars.  Try to standardize on match return data.
        --         Currently sfreq is not returned but sdsi is.
        local shcf=rFff.sord * machine.datasets[rFff.sdsi].speed
        ret_severity=ret_severity+rFff.severity
        conf=stanford_conf(conf,.08)
        local datami=z_fault_tone_list(element,brg,straxis, ordr, sval, aval,rFff.severity,rFff.sdsi,rFff.sbin,'#'..pk.." Unk "..strtag.. ' tone on '..rn,"Unk "..strtag, shcf)
        z_flag_tone_as_found (element,brg,straxis,rFff.sfreq,datami)
      end
    end 
    -- ******************* LF and 2XLF ******************************
    -- NOTE: There is an assumption made here that analysis of Line Frequency (LF), usually 2XLF,
    --       is only performed on a motor or generator.  Identifying that the motor is running
    --       synchronously is dependent on identifying the 1X of the motor shaf, which we ask
    --       for here, assuming a motor or generator. 
  elseif is_line_frequency_tag( strtag ) then
    rFff=analyze_by_tag( strtag, element, brg, straxis )
    if rFff.found then
      local sval=rFff.sval
      local aval=rFff.aval or 0

      local ordr=rFff.sord
      local diff=rFff.dif or 0
      -- Determine if the motor is synchronous.
      local motor_is_syncronous,_,_= z_is_a_multiple(brg_speed ,machine.linef,close)

      if motor_is_syncronous==false then
        if diff > g_fault_tone_threshold  or( sval> g_significance_threshold and diff>3)  then
          conf=stanford_conf(conf,.1)
          ret_severity=z_amplitude_weighted_severity(diff,sval,109)--diff--*(sval/140)  -- not amplitude weighting just yet on wundmental
          local datami=z_fault_tone_list(element,brg,straxis, ordr, sval, aval,ret_severity,rFff.sdsi,rFff.sbin, "1x of "..strtag.. ' on '..rn,"1x("..strtag..')', rFff.sfreq)
          z_flag_tone_as_found (element,brg,straxis,rFff.sfreq,datami)
        end
      end
    end
    -- ******************* All Other Analysis ******************************
  else
    -- 1X should be the only tag to return an order of 1, tagnot1x allows analysis to continue only if the tag order is not 1
    local tagnot1x=true
    if strtag~='1X' then 
      local tago=get_tag_order( strtag, element, 1 )
      tagnot1x = tago.order~=1 
    end
    if tagnot1x then
      rFff=analyze_by_tag( strtag, element, brg, straxis )
      if rFff.found then
        local sval=rFff.sval
        local aval=rFff.aval or 0
        local diff=rFff.dif or 0
        local ordr=rFff.sord
        order=ordr
        -- If the peak match for the tag also has a match on LF or 2XLF then don't assert. 
        local is_lfx = false
        for _, m in ipairs(rFff.matches) do
          --if m.type=="F" and m.tag==tag and m.cn==ei then return m end
          if m.tag=="LF" or m.tag=="2XLF" then is_lfx=true; break end
        end

        if not is_lfx then
          if diff > g_fault_tone_threshold  or( sval> g_significance_threshold and diff>3)  then
            conf=stanford_conf(conf,.15)
            ret_severity=z_amplitude_weighted_severity(diff,sval,109)--diff--*(sval/140)  -- not amplitude weighting just yet on wundmental
            --if sval >ffthld then
            -- ret_severity=ret_severity+z_high_level_severity(sval,ffthld)
            --end
            local datami=z_fault_tone_list(element,brg,straxis, ordr, sval, aval,ret_severity,rFff.sdsi,rFff.sbin, "1x of "..strtag.. ' on '..rn,"1x("..strtag..')', rFff.sfreq)
            z_flag_tone_as_found (element,brg,straxis,rFff.sfreq,datami,true)
          end
        end
      end
    end
  end

  if ret_severity>0 then
    local tot_severity = increment_store_value("svrty"..element..strtag, ret_severity*smult )
    debugprint (strtag,"fundamental fired - Severity",tot_severity,ret_severity)
    assert2(1)
    assert3(conf)
    return true
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
function motor_2xLF_harmonics(element,brg,straxis,howmany,strrotorname,threshold,svrtymult)-- Checks for a tone match at harmonics of 2XLF
  threshold,svrtymult=z_get_rule_tune_info(element,threshold,svrtymult)
  return z_forcingfrequencyharmonics("2XLF",element,brg,straxis,howmany,strrotorname,threshold,svrtymult)
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
--

function z_forcingfrequencyharmonics(strtag,element,brg,straxis,howmany,strrotorname,threshold,svrtymult) -- checks for tone matches at harmonics of a forcing order (strtag)
  local rn=strrotorname or ''
  debugprint (rn.." FF harmonic rule started on "..rn.." Rotor",element,"bearing",brg,"axis",straxis, "for tag",strtag)
  local hm = howmany or 12
  local ffthld=threshold 
  local smult=svrtymult 
  local close=.004
  local ret_severity=0
  local conf=0
  local fford=0
  if strtag=='CPLGELEMS' then smult=smult/4 end
  if strtag=='GRTTH' and (hm>3 and hm~=10) then hm=3 end
  -- 1X should be the only tag to return an order of 1, tagnot1x allows analysis to continue only if the tag order is not 1
  local tagnot1x=true
  if strtag~='1X' then 
    local tago=get_tag_order( strtag, element, 1 )
    tagnot1x = tago.order~=1 
  end
  if tagnot1x then
    local sbt=string.upper(strtag)  
    local lookingforlf=string.match(sbt,'LF')=='LF'
    local _,alias,spdratio =z_get_brg_and_data_set_speed_ratio(element,brg)
    increment_store_counter( "pt"..element..strtag )
    local brg_speed = get_data_shaft_speed( brg )
    local motor_is_syncronous,_,_= z_is_a_multiple(brg_speed ,machine.linef,close)
    local rFff={}
    local tagord=1

    rFff=analyze_by_tag( strtag, element, brg, straxis )
    if rFff.found then 
      fford=rFff.sord
      local rHff=analyze_harmonic_by_tag_cpl(strtag,element,brg,straxis)
      if rHff.found then
        for _,mtch in ipairs(rHff.matches) do
          local islfx,_,_= z_is_a_multiple(mtch.sfreq,2*machine.linef,close)-- tone is multiple of 2x line frequency
          if lookingforlf or motor_is_syncronous or not (lookingforlf or motor_is_syncronous or islfx) then -- this suppresses multiples of 2*LF from being evaluated unless really looking for it  
            if trouble_shoot then debugprint (strtag,'harmonic matches',mtch.order,mtch.dif,'<<<<<<<<<<<<<<<<<<<<')      end
            if mtch.dif ~= nil then
              if (mtch.dif>g_fault_tone_threshold or (mtch.sval>g_significance_threshold and mtch.dif>3)) and mtch.order <= hm and mtch.order~=1 then 
                local order=nopointzero(tostring(round(mtch.order)))
                local hsverity=z_amplitude_weighted_severity(mtch.dif,mtch.sval,109)*(1*order/hm+1)  -- added wieghting to higher order harmonics 12/2/19 adjusted waiting 
                --if mtch.sval > ffthld then hsverity=hsverity+z_high_level_severity(mtch.sval,ffthld) end
                if hsverity>1 then
                  conf=stanford_conf(conf,.08)
                  ret_severity=ret_severity+hsverity
                  local linf=order.."x "..strtag.." on "..rn
                  local sinf=order.."x"..strtag
                  local datami=z_fault_tone_list(element,brg,straxis, mtch.order*fford, mtch.sval, mtch.aval,hsverity,mtch.sdsi, mtch.sbin ,linf,sinf, mtch.sord*brg_speed/spdratio)
                  z_flag_tone_as_found (element,brg,straxis, mtch.sfreq ,datami,true)
                end
              end
            end
          end
        end
        if ret_severity>0 then
          local tot_severity = increment_store_value("svrty"..element..strtag, ret_severity*smult )
          debugprint (strtag,"harmonics fired - Severity",tot_severity,ret_severity)
          assert2(2)
          return true
        end -- if rHff.found
      end -- if sverity>0
    end
  end
  debugprint (rn.." "..strtag.." FF harmonics FALSE")
  return false
end
--
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
  --function z_forcingfrequencyharmonics(strtag,element,brg,straxis,howmany,strrotorname,threshold,svrtymult) -- checks for tone matches at harmonics of a forcing order (strtag)
  local rn=strrotorname or ''
  debugprint (rn.." FF sideband rule started on "..rn.." Rotor",element,"bearing",brg,"axis",straxis, "for tag",strtag)
  local hmharm= howmany or 4
  if strtag=='GRTTH' and (hmharm>3 and hmharm~=10) then hmharm=3 end
  local hmsb=30
  local ffthld=threshold 
  local smult=svrtymult
  local close=.004
  local ret_severity=0
  local fford=0
  local conf=0
  strsbtag=strsbtag or '1X'
  -- 1X should be the only tag to return an order of 1, tagnot1x allows analysis to continue only if the tag order is not 1
  local tagnot1x=true
  if strtag~='1X' then 
    local tago=get_tag_order( strtag, element, 1 )
    tagnot1x = tago.order~=1 
  end
  if tagnot1x then
    local sbt=string.upper(strtag)  
    local lookingforlf=string.match(sbt,'LF')=='LF'
    local _,alias,spdratio =z_get_brg_and_data_set_speed_ratio(element,brg)
    increment_store_counter( "pt"..element..strtag )
    local brg_speed = get_data_shaft_speed( brg )
    local brg_speed_ratio = get_speed_ratio_to_driver( brg )
    local motor_is_syncronous,_,_= z_is_a_multiple(brg_speed ,machine.linef,close)
    local rFff={}
    local tagord=1
    rFff=analyze_by_tag( strtag, element, brg, straxis )
-- debugprint ( strtag, element, brg, straxis ,rFff.found,rFff.sord,rFff.dif)
    if rFff.found then 
      local tago=get_tag_order( strtag, element,-1 )
      if strtag=='2XLF' then
        tagord=tago
      else
        tagord=tago.order*brg_speed_ratio
      end
      if tagord>0 then
        if tagord<=4 then
          hmsb=math.min (0,hmsb)
        elseif tagord<=6 then
          hmsb=math.min (1,hmsb)
        elseif tagord<=8 then
          hmsb=math.min (2,hmsb)
        elseif tagord<=11 then
          hmsb=math.min (3,hmsb)
        elseif tagord>=16 then
          hmsb=math.min(4,hmsb)
        elseif tagord>40 then
          hmsb=math.min(round(tagord*.1),hmsb)
        end
      end
      fford=rFff.sord
      local rHff=analyze_sidebands_by_tag_cpl( strtag, strsbtag,element,brg,straxis)
      if rHff.found then 
        if strsbtag == '1X' then strsbtag=rHff.sidebandtag end
        for _,mtch in ipairs(rHff.matches) do
          if mtch.sidebands~=nil and #mtch.sidebands>0 and mtch.order<=hmharm then
            for _,sb in ipairs(mtch.sidebands) do
              if math.abs(sb.sidebandnumber)<=hmsb then
                local islfx,_,_= z_is_a_multiple(sb.sfreq,2*machine.linef,close)-- tone is multiple of 2x line frequency
                if lookingforlf or motor_is_syncronous or not (lookingforlf or motor_is_syncronous or islfx) then -- this suppresses multiples of 2*LF from being evaluated unless really looking for it  
                  if sb.dif ~= nil then
                    if (sb.dif>g_fault_tone_threshold or (sb.sval>g_significance_threshold and sb.dif>3))  then 
                      local order=nopointzero(tostring(round(sb.order)))
                      local sbsverity=z_amplitude_weighted_severity(sb.dif,sb.sval,109)*(1*order/hmharm+1)   -- added weighting to higher order harmonic sidebands

                      --if mtch.sval > ffthld then hsverity=hsverity+z_high_level_severity(mtch.sval,ffthld) end
                      if sbsverity>1 or true then
                        conf=stanford_conf(conf,.05)
                        ret_severity=ret_severity+sbsverity
                        local sinf=nopointzero(sb.sidebandnumber)..'x('..strsbtag..')sb '..nopointzero(mtch.order)..'x'..strtag
                        local linf=nopointzero(sb.sidebandnumber)..'x('..strsbtag..') sideband of '..nopointzero(mtch.order)..'x '..strtag.." on "..rn
                        debugprint (linf,sb.order,sb.dif,'<<<<<<<<<<<<<<<<<<<<')  
                        local datami=z_fault_tone_list(element,brg,straxis, sb.sord, sb.sval, sb.aval,sbsverity,sb.sdsi, sb.sbin ,linf,sinf, sb.sord*brg_speed/spdratio)
                        z_flag_tone_as_found (element,brg,straxis, sb.sfreq ,datami,true)
                      end
                    end 
                  end
                end
              end
            end
          end
        end
        if ret_severity>0 then
          local tot_severity = increment_store_value("svrty"..element..strtag, ret_severity*smult )
          debugprint (strsbtag..' sidebands '..strtag.." fired - Severity",tot_severity,ret_severity)
          assert2(2)
          assert3(conf)
          return true
        end -- if sverity>0
      end -- if rHff.found
    end -- if rFff.found
  end -- tagnot1x
  debugprint (rn.." "..strtag.." FF sidebands FALSE")
  return false
end
--
--
-- Calculate generic Forcing Function Normalized Severity
--
function rotorforcingfrequencyseverity(strtag,element,strrotorname) -- Calculate rotor Forcing Function Normalized Severity
  return z_forcingfrequencyseverity(strtag,element,strrotorname)
end
function motor_2xLF_severity(element,strrotorname) -- Calculate motor 2XLF Forcing Function Normalized Severity
  return z_forcingfrequencyseverity("2XLF",element,strrotorname)
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
  local check,count = get_store_value("pt"..element..strtag)
  local check1,svrty = get_store_value("svrty"..element..strtag)
  svrty=svrty or 0
  if check==true and svrty>1 then
    local isgear=false
    local isflexcplg=false
    local shaftguid=machine.components[get_this_comp_number()].shaft
    local shaft=machine.shafts[shaftguid]
    isgear=machine.shafts[shaftguid]~=nil and machine.shafts[shaftguid].cat1~=nil and machine.shafts[shaftguid].cat1==categories.GEAR.guid
    isflexcplg=machine.shafts[shaftguid]~=nil and machine.shafts[shaftguid].cat1~=nil and machine.shafts[shaftguid].cat1==categories.COUPLING.guid
    isflexcplg=isflexcplg and machine.shafts[shaftguid].cat2~=nil and machine.shafts[shaftguid].cat2==categories.COUPLING.mincat.FLEX
    shaft=''
    local factor=1
    if strtag=='GRTTH' and rn=='COMPRESSOR' then  
      isgear=true
    end
    if isgear then factor=get_custom_parameter('gmsevmult') or 2 end
    if isflexcplg then factor=3 end
    svrty= svrty/count*factor
    local fault=''
    if svrty>=0 then
      if isgear and strtag=='GRTTH' then 
        put_store_value("GMTNS",svrty)
      end
      debugprint (strtag,"Fault Calculated Normalized Severity",count,svrty,fault,string.gsub(strtag,strtag,fault..' '..strtag,5))
      assert2(svrty)
      return true,svrty
    end
  end
  debugprint (rn.." "..strtag.." FF severity FALSE")
  assert3(-1)
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
  threshold,svrtymult=z_get_rule_tune_info(element,threshold,svrtymult)
  local ampthresh=threshold 
  local rn=strrotorname or ''
  local rff={}
  debugprint ("Amplitube threshold balance rule started on "..rn.." Rotor",element,"bearing",brg,"axis",straxis)
  local balthld=threshold or 109
  local smult=svrtymult or 1
  local sverity=0
  local conf=0
  if strrotorname=="MOTRTRBARS" then
    local _
  end
  local rFBal=find_tag_info( "1X", element, brg, straxis )
  increment_store_counter( "ptbal" )
  if rFBal.found then
    local sval=rFBal.value
    local aval=ampthresh
    local dif=aval-sval
    local ordr=rFBal.order

    if dif>0 then
      sverity=z_amplitude_weighted_severity( dif,sval,110)
      conf=stanford_conf(conf,.5)
      local datami
      if trouble_shoot then
        datami=z_fault_tone_list(element,brg,straxis,ordr, sval, aval,sverity,rFBal.dsi,rFBal.bin, "Rotor Balance "..rn.." sord-"..rFBal.freq,"1X", rFBal.sfreq) 
      else
        datami=z_fault_tone_list(element,brg,straxis,ordr, sval, aval,sverity,rFBal.dsi,rFBal.bin, "Rotor Balance "..rn,'1X', rFBal.freq) 
      end
      z_flag_tone_as_found (element,brg,straxis, rFBal.sfreq ,datami)
      local check,count = get_store_value("balsvrty")
      if check==true then
        count = count + sverity*smult*3
      else
        count = sverity*smult
      end
      if sverity~=0 then 
        local check,axes = get_store_value("balaxes")
        if check then
          axes=axes..straxis
        else
          axes=straxis
        end
        put_store_value("balaxes",axes)

        put_store_value("balsvrty",count)
        assert2(1)
        assert3(conf)
        debugprint ("Amplitude Threshold Balance rule fired - Severity",sverity,'dif',dif,'theshold', aval,'sval', sval)
        return true
      end
    end
  end  

  debugprint ("Balance rule FALSE")

  return false
end
-- Generic Rotor Balance Check Function
--**************************************************
function rotorbalance(element,brg,straxis,strrotorname,threshold,svrtymult) -- Generic Rotor Balance Check Function
  threshold,svrtymult=z_get_rule_tune_info(element,threshold,svrtymult)
  local rn=strrotorname or ''
  local rff={}
  debugprint ("Balance rule started on "..rn.." Rotor",element,"bearing",brg,"axis",straxis)
  local balthld=threshold 
  local smult=svrtymult 
  local sverity=0
  local conf=0
  if strrotorname=="MOTRTRBARS" then
    local _
  end
  local rFBal=find_tag_info( "1X", element, brg, straxis )
  if rFBal.found then 
    increment_store_counter( "ptbal" )
    rFBal=z_get123orders( "1X", element, brg, straxis, true )
    if rFBal.found and rFBal.sval1x>0 then
      local sval=rFBal.sval1x
      local aval=rFBal.aval1x
      local dif=rFBal.dif1x
      local ordr=rFBal.sord1x
      local haveave=true
      if rFBal.aval1x==nil or aval==0  then
        balthld=tonumber(get_attribute_value("AMPTHRESH",element, 110)) 
        aval=balthld
        if sval~=0 then
          dif=sval-aval
        else
          dif=0
        end
        haveave=false
      end

      if ((dif > g_fault_tone_threshold or (dif >3  and sval>g_significance_threshold)) and haveave) or (not(haveave) and dif>0) then
        sverity=z_amplitude_weighted_severity( dif,sval,balthld)
        conf=stanford_conf(conf,.5)
        local datami
        if trouble_shoot then
          datami=z_fault_tone_list(element,brg,straxis,ordr, sval, aval,sverity,rFBal.sdsi1x,rFBal.bin1x, "Rotor Balance "..rn.." sord-"..rFBal.sfreq,"1X", rFBal.sfreq) 
        else
          datami=z_fault_tone_list(element,brg,straxis,ordr, sval, aval,sverity,rFBal.sdsi1x,rFBal.bin1x, "Rotor Balance "..rn,'1X', rFBal.sfreq) 
          --debugprint (sverity)
        end
        z_flag_tone_as_found (element,brg,straxis, rFBal.sfreq ,datami)
        local check,count = get_store_value("balsvrty")
        if check==true then
          count = count + sverity*smult
        else
          count = sverity*smult
        end
        if sverity~=0 then 

          local check,axes = get_store_value("balaxes")
          if check then
            axes=axes..straxis
          else
            axes=straxis
          end
          put_store_value("balaxes",axes)
          put_store_value("balsvrty",count)
          assert2(1)
          assert3(conf)
          debugprint ("Balance rule fired - Severity",sverity,'dif',dif,'aval', aval,'sval', sval)
          return true
        end
      end
    end  
  end
  debugprint ("Balance rule FALSE")
  return false
end
--
-- Calculate balance Normalized Severity function
--
function rotorbalanceseverity(strrotorname) -- Calculate balance Normalized Severity function
  local name=strrotorname or ""
  debugprint (name..' Balance severity normalization started')
  local check,count = get_store_value("ptbal")
  local check1,svrty = get_store_value("balsvrty")
  if check==true then
    svrty= svrty/count*4  -- normalized to one axis and multiplied times 3 for scaling
    local chax,axes = get_store_value("balaxes")
    local t,r=false,false
    if chax then
      t=string.match(axes,'t')=='t'
      r=string.match(axes,'r')=='r'      
    end
    if svrty>=0 and t and r then
      debugprint ("-- Calculate Normalized Severity --",count,svrty,name,"Rotor Balance" )
      assert2(svrty)
      return true
    end
  end
  debugprint ("Balance severity false")
  assert2(0)
  return false
end
--
-- Generic Rotor structural looseness/soft foot Check Function
--**************************************************
function rotorsoftfoot(element,brg,strrotorname, threshold, svrtymult) -- Generic Rotor structural looseness/soft foot Check Function
  threshold,svrtymult=z_get_rule_tune_info(element,threshold,svrtymult)
  local cn=get_this_comp_number()
  local orient=get_comp_orientation(cn)
  --if orient== 'v' then 
  --debugprint('Vertical component - Softfoot rule terminated')
  --return false 
  --end
  local rn=strrotorname or ''
  debugprint ("Softfoot rule started on "..rn.." Rotor",element,"bearing",brg)
  local balthld = threshold 
  local smult = svrtymult 
  local sverity=0
  local conf=0
  local rF1xt=analyze_by_tag( "1X", element, brg, "t" )
  increment_store_counter( "sfpt" )
  local rF1xr=analyze_by_tag( "1X", element, brg, "r" )
  local check,count
  if rF1xr.found and rF1xt.found then
    local tsval=rF1xt.sval
    local taval=rF1xt.aval
    local tdif=rF1xt.dif
    local rsval=rF1xr.sval
    local raval=rF1xr.aval
    local rdif=rF1xr.dif
    local trsvdif=tsval-rsval
    local travdif=taval-raval
    local trddif=tdif-rdif
    if tdif>3 and trsvdif>10 and tsval>g_significance_threshold and trddif>6 then
      sverity=z_amplitude_weighted_severity(tdif,tsval,balthld)-- tdif -- not amplitude weighted sverity
      conf=stanford_conf(conf,.5)
      local datami=z_fault_tone_list(element,brg,"t", rF1xt.sord, tsval, taval,sverity,rF1xt.sdsi,rF1xt.sbin, "Rotor Softfoot "..rn,"1X", rF1xt.sfreq)
      z_flag_tone_as_found (element,brg,"t", rF1xt.sfreq ,datami)
      increment_store_counter( "sfpt" )
      check,count = get_store_value("sfsvrty")
      if check==true then
        count = count + sverity*smult
      else
        count = sverity*smult
      end
    elseif rdif>3 and trsvdif>-10 and rsval>g_significance_threshold and trddif>-6  then  -- 2/18/2020 dy added r > t aswell
      sverity=z_amplitude_weighted_severity(rdif,rsval,balthld)
      conf=stanford_conf(conf,.5)
      local datami=z_fault_tone_list(element,brg,"r", rF1xr.sord, rsval, raval,sverity,rF1xr.sdsi,rF1xr.sbin, "Rotor Softfoot "..rn,"1X", rF1xr.sfreq)
      z_flag_tone_as_found (element,brg,"r", rF1xr.sfreq ,datami)
      increment_store_counter( "sfpt" )
      check,count = get_store_value("sfsvrty")
      if check==true then
        count = count + sverity*smult
      else
        count = sverity*smult
      end
    end
    if sverity~=0 then
      put_store_value("sfsvrty",count)
      assert2(1)
      assert3(conf)
      debugprint (rn.." softfoot rule fired - Severity",sverity)
      return true
    end

  end
  debugprint(rn.." Softfoot rule FALSE")
  return false
end
-- 
-- ***********  Soft foot severity nomalization function *****************

function rotorsoftfootseverity (strrotorname) -- Soft foot severity nomalization function 
  local rn=strrotorname or ''
  debugprint (rn.." Softfoot severity rule started")  
  local check,count = get_store_value("sfpt")
  local check1,svrty = get_store_value("sfsvrty")
  if check then
    svrty= svrty/count*3 -- times 4 for scaling
    if svrty>=0 then
      debugprint ("-- Calculate Motor Softfoot Normalized Severity --",count,svrty,rn.." Softfoot SSSSSSSSSSSSSSSSSSSSSSSSSSS")
      assert2(svrty)
      return true
    end
  end
  debugprint (rn.." Softfoot rule FALSE")
  return false
end
---- Generic Rotor overhung mass imbalance Check Function no average
--**************************************************
function rotoroverhungbalancenoave(element,brg,strrotorname, threshold, svrtymult) -- Generic Rotor overhung mass imbalance Check Function no ave
  threshold,svrtymult=z_get_rule_tune_info(element,threshold,svrtymult)
  local ampthresh=threshold
  local rn=strrotorname or ''
  debugprint ("Overhung balance rule started on "..rn.." Rotor",element,"bearing",brg)

  local balthld = threshold 
  local smult = svrtymult 
  local sverity=0
  local conf=0
  local rF1xa=find_tag_info( "1X", element, brg, "a" )
  increment_store_counter( "ptob" )
  local rF1xr=find_tag_info( "1X", element, brg, "r" )
  increment_store_counter( "ptob" )
  local rF1xt=find_tag_info( "1X", element ,brg, "t" )
  increment_store_counter( "ptob" )
  if rF1xa.found then
    local asval=rF1xa.value
    local aaval=ampthresh
    local adif=asval-aaval
    local rsval=rF1xr.value or 0
    local raval=ampthresh
    local rdif=rsval-raval
    local tsval=rF1xt.value or 0
    local taval=ampthresh
    local tdif=tsval-taval
    local datami
    --if (asval > rsval) and (asval > tsval) then
    if  adif>0 then 

      local asverity=z_amplitude_weighted_severity( adif,asval,ampthresh)
      conf=stanford_conf(conf,.4)
      sverity=sverity+asverity
      datami=z_fault_tone_list(element,brg,"a", rF1xa.order, asval, aaval,asverity,rF1xa.dsi,rF1xa.bin, "Rotor Imbalance - Overhung",'1X',rF1xa.freq) 
      z_flag_tone_as_found (element,brg,"a", rF1xa.freq ,datami)
    end
    if rdif>0 then 
      conf=stanford_conf(conf,.2)
      local rsverity=z_amplitude_weighted_severity( rdif,rsval,ampthresh)
      sverity=sverity+rsverity
      datami=z_fault_tone_list(element,brg,"r",rF1xr.order, rsval, raval,rsverity,rF1xr.dsi,rF1xr.bin, "Rotor Imbalance - Overhung",'1X',  rF1xr.freq) 
      z_flag_tone_as_found (element,brg,"r", rF1xr.freq ,datami)
    end
    if tdif>0 then 
      conf=stanford_conf(conf,.2)
      local tsverity= z_amplitude_weighted_severity( tdif,rsval,ampthresh)
      sverity=sverity+tsverity
      datami=z_fault_tone_list(element,brg,"t",rF1xt.order, tsval, taval,tsverity,rF1xt.dsi,rF1xt.bin, "Rotor Imbalance - Overhung",'1X', rF1xt.freq) 
      z_flag_tone_as_found (element,brg,"t", rF1xt.freq ,datami)
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
      assert3(conf)
      debugprint (rn.." overhung balance rule fired - Severity",sverity)
      return true
    end
    --end
  end
  debugprint(rn.." overhung balance rule FALSE")
  return false
end
-- Generic Rotor overhung mass imbalance Check Function
--**************************************************
function rotoroverhungbalance(element,brg,strrotorname, threshold, svrtymult) -- Generic Rotor overhung mass imbalance Check Function
  threshold,svrtymult=z_get_rule_tune_info(element,threshold,svrtymult)
  local rn=strrotorname or ''
  debugprint ("Overhung balance rule started on "..rn.." Rotor",element,"bearing",brg)
  local balthld = threshold 
  local smult = svrtymult 
  local sverity=0
  local conf=0
  local rF1xa=analyze_by_tag( "1X", element, brg, "a" )
  increment_store_counter( "ptob" )
  local rF1xr=analyze_by_tag( "1X", element, brg, "r" )
  increment_store_counter( "ptob" )
  local rF1xt=analyze_by_tag( "1X", element ,brg, "t" )
  increment_store_counter( "ptob" )
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
      conf=stanford_conf(conf,.4)
      local asverity= z_amplitude_weighted_severity(adif,asval,balthld)  --adif -- not amplitude weighted
      sverity=sverity+asverity
      datami=z_fault_tone_list(element,brg,"a", rF1xa.sord, asval, aaval,asverity,rF1xa.sdsi,rF1xa.sbin, "Rotor Imbalance - Overhung",'1X', rF1xa.sfreq) 
      z_flag_tone_as_found (element,brg,"a", rF1xa.sfreq ,datami)
    end
    if rdif>g_fault_tone_threshold or (rdif>3 and rsval>g_significance_threshold) then 
      conf=stanford_conf(conf,.2)
      local rsverity=z_amplitude_weighted_severity( rdif,rsval,balthld)  --rdif  -- not amplitude weighted
      sverity=sverity+rsverity
      datami=z_fault_tone_list(element,brg,"r",rF1xr.sord, rsval, raval,rsverity,rF1xr.sdsi,rF1xr.sbin, "Rotor Imbalance - Overhung",'1X',  rF1xr.sfreq) 
      z_flag_tone_as_found (element,brg,"r", rF1xr.sfreq ,datami)
    end
    if tdif>g_fault_tone_threshold or (tdif> 3 and tsval>g_significance_threshold) then 
      conf=stanford_conf(conf,.2)
      local tsverity= z_amplitude_weighted_severity( tdif,tsval,balthld)  ---tdif -- not amplitude weighted
      sverity=sverity+tsverity
      datami=z_fault_tone_list(element,brg,"t",rF1xt.sord, tsval, taval,tsverity,rF1xt.sdsi,rF1xt.sbin, "Rotor Imbalance - Overhung",'1X', rF1xt.sfreq) 
      z_flag_tone_as_found (element,brg,"t", rF1xt.sfreq ,datami)
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
      assert3(conf)
      debugprint (rn.." overhung balance rule fired - Severity",sverity)
      return true
    end
    --end
  end
  debugprint(rn.." overhung balance rule FALSE")
  return false
end
-- 
-- *********** Generic Rotor overhung mass imbalance severity nomalization function *****************

function rotoroverhungbalanceseverity (strrotorname) -- Overhung balance severity nomalization function 
  local rn=strrotorname or ''
  debugprint (rn.." overhung balance severity rule started")
  local check,count = get_store_value("ptob")
  local check1,svrty = get_store_value("obsvrty")
  if check==true then
    svrty= svrty/count*1 -- normalize to one axis and multiplied time 3 for scaling
    if svrty>=0 then
      debugprint ("-- Calculate Rotor Overhung Balance Normalized Severity --",count,svrty,rn.." overhung balance SSSSSSSSSSSSSSSSSSSSSSSSSSS")
      assert2(svrty)
      return true
    end
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
  local sn=get_this_super_shaft()
  debugprint ("Looseness rule started on ",rn," Rotor",element,"bearing",brg,"axis",straxis)
  local loosthld = threshold 
  local smult = svrtymult
  local ampwtsvth=109
  if cplg then
    ampwtsvth=100
  end
  local x=''
  local sverity=0 
  local hcount=0
  local conf=0
  local howmanyharmonics=20
  local cplgloosepresent={}
  local cplgfound,cplgval=get_store_value('cplgprt')
  if cplgfound then cplgloosepresent=cplgval end
  local rFff=find_tag_info( "1X", element, brg, straxis )
  if rFff.found then
    increment_store_counter( "ptloos")
    local startorder=3
    if rn=='PURIFIER' then
      startorder=2
      local _
    end 
    if rn=='GEAR' then
      local _
    end 
    -- REVIEW: Experimental.. needs eval
    --local rFLoos=get_harmonic_groups_from_cpl(element,brg,straxis,'1X')
    local rFLoos=analyze_harmonic_by_tag_cpl('1X',element,brg,straxis)
    --local rFLoos=z_get_harmonic_groups_from_peak_list(element,brg,straxis,'1X')-- analyze_harmonic_by_tag( "1X", element, brg, straxis ) 
    local sval, aval, dif, difs=0,0,0,0
    if rFLoos.found then 
      local mxorders=rFLoos.orders 
      local ordcount=rFLoos.count
      local ordmatches=rFLoos.matches
      local firstorder=1000
      local knownff={}
      -- preview the detected peaks for significant exceedences and forcing freqencies so known forcing frequencies are not included in looseness
      for ord,tm in pairs(ordmatches) do 
        if tm.dif== nil then break end
        local isff=false
        for _,mtch in ipairs(tm.matches) do
          local ele=0
          for i,ei in pairs(machine.components[cn].map) do
            if ei==mtch.cn then 
              ele=ei 
              break
            end
          end
          local x=string.match(string.upper(mtch.tag),'X')
          if x~='X' and not (mtch.tag=='MOTPOLES' or mtch.tag=='LF' ) --[[and ele==mtch.cn]] then
            isff=true 
            knownff[tm.order]=true
            if mtch.tag=='GRTTH' and tm.order>5 then
              local sides=round(tm.order/10)
              for s=tm.order-sides,tm.order+sides,1 do
                knownff[s]=true
              end
            end
          end
        end
        local islfx,mtrissync = z_peak_is_2XLF_mult(tm.sfreq,rFff.freq)
        if not (islfx and mtrissync) and not (isff) then  -- tone not multiple of line frequency and 1x not too close syncronous to tell or a forcing frequency (pump vanes, fan blases, etc.)
          if tm.order >= startorder and tm.order <= howmanyharmonics  then-- Only count orders 3 thru howmanyharmonics
            if firstorder==1000 then firstorder=tm.order end
            if cplg then
              local cpl=(math.fmod(tm.order,3)==0)
              if (tm.dif> g_fault_tone_threshold or (tm.dif>3 and tm.sval>g_significance_threshold)) and cpl then difs=difs+1 end
            else
              if tm.dif> g_fault_tone_threshold or (tm.dif>3 and tm.sval>g_significance_threshold) then difs=difs+1 end
            end
          end
        end
      end
      local tdif,cdif,ncdif,nc,tt,cc=0,0,0,0,0,0    
      if difs>=3 or (difs>=1 and cplg) then 
        if cplg then
          for ord,tm in pairs(ordmatches) do
            local isff=false
            local cpl=(math.fmod(tm.order,3)==0)
            for _,mtch in ipairs(tm.matches) do
              x=string.match(string.upper(mtch.tag),'X')
              if (x~='X' and not (mtch.tag=='MOTPOLES' or mtch.tag=='LF' or mtch.tag=='CPLGELEMS')) then isff=true end
            end
            if tm.order >= startorder and tm.order <= howmanyharmonics and not (isff) and firstorder<11 and not(knownff[tm.order]) then-- Only count orders 3-howmanyharmonics and not a forcing frequency

              if tm.dif> g_fault_tone_threshold or (tm.dif>3 and tm.sval>g_significance_threshold) then 
                tdif=tdif+tm.dif
                tt=tt+1
                if cpl then
                  cdif=cdif+tm.dif 
                  cc=cc+1
                else 
                  ncdif=ncdif+tm.dif 
                  nc=nc+1                
                end
              end
            end
          end
        end
        if (cdif/cc>ncdif/nc  and cplg) or cplg then
          for ord,tm in pairs(ordmatches) do 
            if tm.order >= startorder and tm.order <= howmanyharmonics then -- Only count orders 3-howmanyharmonics
              local isff=false
              for _,mtch in ipairs(tm.matches) do
                x=string.match(string.upper(mtch.tag),'X')
                if x~='X' and not (mtch.tag=='MOTPOLES' or mtch.tag=='LF' or mtch.tag=='CPLGELEMS') then isff=true end
              end
              if math.fmod(tm.order,3)==0 and not (isff) and firstorder<11 and not(knownff[tm.order]) then
                local sval=tm.sval
                local aval=tm.aval
                local dif=tm.dif
                local islfx,mtrissync = z_peak_is_2XLF_mult(tm.sfreq,rFff.freq)
                if not (islfx) or not(islfx and mtrissync) then  -- tone not multiple of line frequency and 1x not too close syncronous to tell
                  if dif> g_fault_tone_threshold or (dif>3 and tm.sval>g_significance_threshold) then
                    if tm.order==3 then
                      cplgloosepresent['cplg'..brg]=true
                      put_store_value('cplgprt',cplgloosepresent)
                    end
                    hcount=hcount+1
                    local hsverity=z_amplitude_weighted_severity(dif,sval,ampwtsvth)
                    conf=stanford_conf(conf,.2)
                    sverity=sverity+hsverity
                    debugprint ('Rotor '..tm.order..'x harmonic found in '..straxis..'axis on '..rn, sverity,dif,hsverity)
                    local datami=z_fault_tone_list(element,brg,straxis, tm.order, sval, aval,hsverity,tm.sdsi,tm.sbin,tm.order.."x(1X) Coupling Wear on "..rn,tm.order..'x(1X)', tm.sfreq) 
                    z_flag_tone_as_found (element,brg,straxis, tm.sfreq ,datami)
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
              if x~='X' and not (mtch.tag=='MOTPOLES' or mtch.tag=='LF' or mtch.tag=='BWLSPIN') then isff=true end
            end
            if tm.order >= startorder and tm.order <= howmanyharmonics and not (isff) and firstorder<11  and not(knownff[tm.order]) then -- Only count orders 3-howmanyharmonics
              local sval=tm.sval
              local aval=tm.aval
              local dif=tm.dif
              local islfx,mtrissync = z_peak_is_2XLF_mult(tm.sfreq,rFff.freq)
              if not (islfx and not (mtrissync)) or mtrissync then  -- tone not multiple of 2xLF and 1x not too close syncronous to tell
                if dif~=nil then 
                  if dif> g_fault_tone_threshold or (dif>3 and tm.sval>g_significance_threshold) then
                    hcount=hcount+1

                    local hsverity=z_amplitude_weighted_severity(dif,sval,ampwtsvth)
                    conf=stanford_conf(conf,.1)
                    sverity=sverity+hsverity
                    debugprint ('Rotor '..tm.order..'x harmonic found in '..straxis..'axis on '..rn, sval,sverity,dif,hsverity)
                    local datami=z_fault_tone_list(element,brg,straxis, tm.order, sval, aval,hsverity,tm.sdsi,tm.sbin,tm.order.."x(1X) Rotor Looseness on "..rn,tm.order..'x(1X)', tm.sfreq) 
                    z_flag_tone_as_found (element,brg,straxis, tm.sfreq ,datami)
                  end
                end
              end
            end
          end
        end
      end
    end
    if (sverity)~=0 and (difs>=3 or (difs>=1 and cplg)) then
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
      assert3(conf)
      if cplg then
        debugprint (rn.." Coupling Wear rule fired - Severity",sverity*smult," from ",howmanyharmonics,"harmonics")
      else
        debugprint (rn.." Looseness rule fired - Severity",sverity*smult," from ",howmanyharmonics,"harmonics")
      end
      return true
    end
  end
  debugprint (rn.." Looseness rule FALSE")
  return false
end 
--
function rotorloosenessseverity(element,strrotorname) --  Rotor Looseness Severity Function
  local rn=strrotorname or ''
  local cplg=(rn=='COUPLING')
  --element=element or 2
  debugprint (rn.." Looseness severity started")
  local check,count = get_store_value("ptloos")
  local check1,svrty = get_store_value("loossvrty")
  local cplgloosepresent={}
  local cplgfound,cplgval=get_store_value('cplgprt')
  if cplgfound then cplgloosepresent=cplgval end
  local cplgcount=0
  for _,cpltrue in pairs(cplgloosepresent) do
    cplgcount=cplgcount+1 
  end
  svrty=svrty or 0
  if check==true then
    local scaling=2-- times 2.25 for looseness scaling, adjusted after comarison to historic calls by DY 2/4/2018
    if cplg then scaling=2 end
    svrty= svrty/count*scaling
    if svrty>=0 and (not(cplg) or (cplg and cplgcount==2)) then
      debugprint ("-- Calculate Normalized Severity --",count,svrty,rn," looseness LLLLLLLLLLLLLLLLLLLLLLLLLLLLL")
      assert2(svrty)
      return true
    end
  end
  debugprint ("Looseness severity FALSE")
  assert3absolute(-1)
  return false
end
--
--  ****************************************************************************

--
--  This function get the dif and sval for 1x thru 3x
function z_get123orders(strtag,element,brg,straxis,significant) --  This function gets the dif and sval for 1x thru 3x order of 1X.
  significant=significant or false
  local pct=1.5-- 1.5=3.5 dB 2=6 dB ...
  local r1X = find_tag_info( strtag, element, brg, straxis ) 
  if r1X == nil or r1X.found == false then 
    return {["found"]=false}
  end  
  local ord1val=0
  local ord1aval=0
  local ord1dif=0 
  local ord1ord=0
  local ord1freq=0
  local ord2freq=0
  local ord3freq=0
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
  -- REVIEW: Experimental.. needs eval
  --local rFHarm=get_harmonic_groups_from_cpl(element,brg,straxis,strtag) --analyze_harmonic_by_tag( , element, brg, straxis )
  local rFHarm=analyze_harmonic_by_tag_cpl(strtag,element,brg,straxis)
  if rFHarm.found == true then 
    local set=false
    for i,match in ipairs(rFHarm.matches) do
      if match.sfreq<3 then
        local _
      end
      if round (match.order) == 1 then
        if match.sfreq~=nil and ((significant and match.mpct>pct) or not(significant)) then  -- add nograss
          set=true
          ord1freq=match.sfreq
          local islfx,mtrissync = z_peak_is_2XLF_mult(match.sfreq,ord1freq)
          if match.order ~= nil then ord1ord=match.sord end
          if match.sval ~= nil then ord1val=match.sval end
          if match.aval ~= nil then ord1aval=match.aval end
          if match.dif ~= nil then ord1dif=match.dif end
          if match.sbin ~= nil then ord1bin=match.sbin end
          if match.sdsi ~= nil then ord1dsi=match.sdsi end
        end 
      end
      if round (match.order) == 2 then
        if match.sfreq~=nil and ((significant and match.mpct>pct) or not(significant)) then
          ord2freq=match.sfreq
          local islfx,mtrissync = z_peak_is_2XLF_mult(match.sfreq,ord1freq)
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
        if match.sfreq~=nil and ((significant and match.mpct>pct) or not(significant)) then
          ord3freq=match.sfreq
          local islfx,mtrissync = z_peak_is_2XLF_mult(match.sfreq,ord1freq)
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
  return { ["found"]=true, ["sval1x"] = ord1val, ["aval1x"] = ord1aval, ["dif1x"] = ord1dif, ["sval2x"] = ord2val, ["aval2x"] = ord2aval, ["dif2x"] = ord2dif, ["sval3x"] = ord3val, ["aval3x"] = ord3aval, ["dif3x"] = ord3dif , ['sord1x'] = ord1ord , ['sord2x'] = ord2ord , ['sord3x'] = ord3ord ,['sfreq']=ord1freq,['bin1x']=ord1bin,['bin2x']=ord2bin,['bin3x']=ord3bin,['dsi1x']=ord1dsi,['dsi2x']=ord2dsi,['dsi3x']=ord3dsi,['ord1freq']=ord1freq,['ord2freq']=ord2freq,['ord2freq']=ord2freq}
end
--
--
-- Coupling Angular Misalignment Check Function
--**************************************************
--
function couplingangularmisalignment(element,brg,threshold,svrtymult) -- Coupling Angular Misalignment Check Function
  threshold,svrtymult=z_get_rule_tune_info(element,threshold,svrtymult)
  debugprint ("Angular misalignment started on Rotor",element,"bearing",brg)
  local balthld = threshold
  local smult = svrtymult 
  local sverity=0
  local conf=0
  local rFAm=z_get123orders( "1X", element, brg, "a",true )
  if rFAm.found then 
    increment_store_counter( "angpt" )
    local datami
    local dif1x=rFAm.dif1x
    if rFAm.aval1x>0 then
      --debugprint (dif1x)
      if dif1x>g_fault_tone_threshold or (dif1x>3 and rFAm.sval1x>g_significance_threshold) then
        local brgsv = z_amplitude_weighted_severity( dif1x,rFAm.sval1x,balthld)
        conf=stanford_conf(conf,.3)
        sverity=brgsv
        if rFAm.sval1x >balthld then sverity=sverity+z_high_level_severity(rFAm.sval1x,balthld) end
        datami=z_fault_tone_list(element,brg,"a", rFAm.sord1x, rFAm.sval1x, rFAm.aval1x,brgsv,rFAm.dsi1x,rFAm.bin1x, "Coupling Misalignment - Angular",'1x(1X)', rFAm.sfreq) 
        z_flag_tone_as_found (element,brg,"a", rFAm.ord1freq ,datami)
        local dif2x=rFAm.dif2x
        local dif3x=rFAm.dif3x
        --debugprint (dif1x,dif2x,dif3x)

        if dif2x>g_fault_tone_threshold or (dif2x>3 and rFAm.sval2x>g_significance_threshold) then 
          brgsv= z_amplitude_weighted_severity( dif2x,rFAm.sval2x,balthld)
          sverity=sverity+brgsv
          conf=stanford_conf(conf,.1)
          datami=z_fault_tone_list(element,brg,"a", rFAm.sord2x,rFAm.sval2x , rFAm.aval2x,brgsv,rFAm.dsi2x,rFAm.bin2x, "Coupling Misalignment - Angular",'2x(1X)', rFAm.sfreq*2) 
          z_flag_tone_as_found (element,brg,"a", rFAm.ord2freq ,datami)
        end
        if dif3x>g_fault_tone_threshold or ( dif3x>3 and rFAm.sval3x>g_significance_threshold) then 
          brgsv= z_amplitude_weighted_severity( dif3x,rFAm.sval3x,balthld)
          sverity=sverity+brgsv
          conf=stanford_conf(conf,.1)
          datami=z_fault_tone_list(element,brg,"a",  rFAm.sord3x, rFAm.sval3x, rFAm.aval3x,brgsv,rFAm.dsi3x,  rFAm.bin3x, "Coupling Misalignment - Angular",'3x(1X)', rFAm.sfreq*3) 
          z_flag_tone_as_found (element,brg,"a", rFAm.ord3freq ,datami)
        end 
      end
    else
      local ampthresh=tonumber(get_attribute_value("AMPTHRESH",element, 110))
      if rFAm.sval1x>0 then 
        dif1x=rFAm.sval1x - ampthresh
      else
        dif1x=0
      end
      if dif1x>0 then
        local brgsv = z_amplitude_weighted_severity( dif1x,rFAm.sval1x,ampthresh)
        conf=stanford_conf(conf,.3)
        sverity=brgsv
        datami=z_fault_tone_list(element,brg,"a", rFAm.sord1x, rFAm.sval1x, ampthresh,brgsv,rFAm.dsi1x,rFAm.bin1x, "Coupling Misalignment - Angular",'1x(1X)', rFAm.sfreq) 
        z_flag_tone_as_found (element,brg,"a", rFAm.ord1freq ,datami)
        local dif2x=rFAm.sval2x-ampthresh  
        local dif3x=rFAm.sval3x-ampthresh  
        --debugprint (dif1x,dif2x,dif3x)

        if dif2x>0 then 
          brgsv= z_amplitude_weighted_severity( dif2x,rFAm.sval2x,ampthresh)
          conf=stanford_conf(conf,.1)
          sverity=sverity+brgsv
          --if rFAm.sval2x >balthld then sverity=sverity+z_high_level_severity(rFAm.sval2x,balthld) end
          datami=z_fault_tone_list(element,brg,"a", rFAm.sord2x,rFAm.sval2x , ampthresh,brgsv,rFAm.dsi2x,rFAm.bin2x, "Coupling Misalignment - Angular",'2x(1X)', rFAm.sfreq*2) 
          z_flag_tone_as_found (element,brg,"a", rFAm.ord2freq ,datami)
        end
        if dif3x>0 then 
          brgsv= z_amplitude_weighted_severity( dif3x,rFAm.sval3x,ampthresh)
          conf=stanford_conf(conf,.1)
          sverity=sverity+brgsv
          --if rFAm.sval3x >balthld then sverity=sverity+z_high_level_severity(rFAm.sval3x,balthld) end
          datami=z_fault_tone_list(element,brg,"a",  rFAm.sord3x, rFAm.sval3x, ampthresh,brgsv,rFAm.dsi3x,  rFAm.bin3x, "Coupling Misalignment - Angular",'3x(1X)', rFAm.sfreq*3) 
          z_flag_tone_as_found (element,brg,"a", rFAm.ord3freq ,datami)
        end
      end
    end
    if sverity>0 then
      local check,count = get_store_value("angsvrty")
      if check==true then
        count = count + sverity*smult
      else
        count = sverity*smult
      end
      put_store_value("angsvrty",count)
      debugprint ("Angular Misalignment rule fired - Severity",sverity,count,"AAAAAAAAAAAAAAAAAAAAAA")
      assert2(1)
      assert3(conf)
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
  local check1,svrty = get_store_value("angsvrty")
  svrty=svrty or 0
  if check==true then
    svrty= svrty/count*3 -- times 7.3 for scaling set by comparison to history DY 2/4/2019
    if svrty>=0 then
      debugprint ("-- Calculate Normalized Severity --",count,svrty,"Angular Misalignment SSSSSSSSSSSSSSSSSSSSSSSSSSS")
      assert2(svrty)
      return true
    end
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
  local ampthresh=threshold
  local balthld = threshold 
  local smult = svrtymult 
  local sverity=0
  local conf=0
  local rFpmr=z_get123orders( "1X", element, brg, "r",true )
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
      dif1xr=sval1xr-ampthresh
      dif2xr=sval2xr-ampthresh
      dif3xr=rFpmr.sval3x-ampthresh
      fxdth=true
      balthld=ampthresh
    end
    local datami=0
    if dif2xr>0  then
      if sval2xr>sval1xr  then
        if ((dif2xr>g_fault_tone_threshold or (dif2xr>3 and sval2xr>g_significance_threshold))and not (fxdth)) or (fxdth and dif2xr>0) then 
          local rsverity=z_amplitude_weighted_severity(dif2xr,rFpmr.sval2x,balthld)
          conf=stanford_conf(conf,.4)
          sverity=sverity+rsverity  
          datami= z_fault_tone_list(element,brg,"r", sord2xr, sval2xr, sval2xr-dif2xr,rsverity,rFpmr.dsi2x,rFpmr.bin2x, "Coupling Misalignment - Parallel",'2x(1X)',rFpmr.sfreq*2)
          z_flag_tone_as_found (element,brg,"r", rFpmr.ord2freq,datami)
        end

        if ((dif3xr>g_fault_tone_threshold or (dif3xr>3 and rFpmr.sval3x>g_significance_threshold)) and not(fxdth)) or (fxdth and dif3xr>0) then 
          local rsverity=z_amplitude_weighted_severity(dif3xr,rFpmr.sval3x,balthld)
          sverity=sverity+rsverity
          conf=stanford_conf(conf,.1)
          datami= z_fault_tone_list(element,brg,"r", rFpmr.sord3x, rFpmr.sval3x, rFpmr.sval3x-dif3xr,rsverity ,rFpmr.dsi3x,rFpmr.bin3x,"Coupling Misalignment - Parallel",'3x(1X)',rFpmr.sfreq*3)
          z_flag_tone_as_found (element,brg,"r", rFpmr.ord3freq ,datami)
        end
      end
    end
  end
  local rFpmt=z_get123orders( "1X", element, brg, "t" ,true)
  if rFpmt.found then
    increment_store_counter( "parpt" )
    local dif1xt=rFpmt.dif1x
    local dif2xt=rFpmt.dif2x
    local dif3xt=rFpmt.dif3x 
    local sval1xt=rFpmt.sval1x
    local sval2xt=rFpmt.sval2x
    local sord1xt=rFpmt.sord1x
    local sord2xt=rFpmt.sord2x
    local fxdth=false
    if rFpmt.aval==0 then
      dif1xt=sval1xt-ampthresh
      dif2xt=sval2xt-ampthresh
      dif3xt=rFpmt.sval3x-ampthresh
      fxdth=true
      balthld=ampthresh
    end
    local datami=0
    if  dif2xt>0 then
      if  sval2xt>sval1xt then
        if ((dif2xt>g_fault_tone_threshold or (dif2xt>3 and sval2xt>g_significance_threshold)) and not (fxdth)) or (fxdth and dif2xt>0) then 
          local tsverity= z_amplitude_weighted_severity(dif2xt,rFpmt.sval2x,balthld)
          conf=stanford_conf(conf,.4)
          sverity=sverity + tsverity 
          datami= z_fault_tone_list(element,brg,"t", sord2xt, sval2xt, sval2xt-dif2xt,tsverity,rFpmt.dsi2x,rFpmt.bin2x, "Coupling Misalignment - Parallel",'2x(1X)',rFpmt.sfreq*2)
          z_flag_tone_as_found (element,brg,"t",  rFpmt.ord2freq,datami)
        end
        if ((dif3xt>g_fault_tone_threshold or (dif3xt>3 and rFpmt.sval3x>g_significance_threshold))and not (fxdth)) or (fxdth and dif3xt>0) then 
          local tsverity= z_amplitude_weighted_severity(dif3xt,rFpmt.sval3x,balthld) 
          conf=stanford_conf(conf,.1)
          sverity=sverity+ tsverity
          datami= z_fault_tone_list(element,brg,"t", rFpmt.sord3x, rFpmt.sval3x, rFpmt.sval3x-dif3xt,tsverity,rFpmt.dsi3x,rFpmt.bin3x, "Coupling Misalignment - Parallel",'3x(1X)',rFpmt.sfreq*3)
          z_flag_tone_as_found (element,brg,"t", rFpmt.ord3freq ,datami)
        end 
      end
    end
  end
  if rFpmr.found or rFpmt.found then
    if sverity>0 then
      local check,count = get_store_value("parsvrty")
      if check==true then
        count = count + sverity*smult
      else
        count = sverity*smult

      end 
      put_store_value("parsvrty",count)
      debugprint ("Parallel Misalignment rule fired - Severity",count,"PPPPPPPPPPPPPPPPPP")
      assert2(1)
      assert3(conf)
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
  svrty=svrty or 0
  if check==true then
    svrty= svrty/count*5 -- time 5 for scaling set by comaprison to history DY 2/4/2019
    if svrty>=0 then
      debugprint ("-- Calculate Normalized Severity --",count,svrty,"parallel Misalignment PPPPPPPPPPPPPPPPPPPPPPPPPPPPP")
      assert2(svrty)
      return true
    end
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
function bearingLFskislopes(element,brg,straxis,strrotorname,threshold,svrtymult)-- Ski slope avaluation (ski slope is BB noise < 3x1X with the the lower frequencies > than higher frequencies)
  local bearing,alias,spdratio =z_get_brg_and_data_set_speed_ratio(element,brg)
  local stop,start=maximum_data_range(element,brg,straxis)
  local rn=strrotorname or ''
  if start==nil and stop==nil then
    debugprint (rn.." No data to analysis - Ski Slope FALSE")
    return false
  end
  if bearing==alias then
    threshold,svrtymult=z_get_rule_tune_info(element,threshold,svrtymult)
    debugprint ("Ski slope evaluation started on "..rn.." Rotor",element,"bearing",brg,"axis",straxis)
    local ssthld=threshold-10
    local smult=svrtymult*.5
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
    local avedsi=0
    if rF1x.found==false then
      if machine.elements[alias]~=nil and machine.elements[alias].data~=nil and machine.elements[alias].data.spec~=nil and machine.elements[alias].data.spec.average[straxis]~=nil and machine.elements[alias].data.spec.average[straxis][1]~=nil then
        avedsi=machine.elements[alias].data.spec.average[straxis][1]
      end
    else
      avedsi=rF1x.adsi
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
      local lastsev=0
      local up,down=0,0
      local conf=0
      local rFss
      local maxamp,maxdif, maxampfreq, lastord,firstord=0,0,0,0,0
      for i=start,stop,-1*step do
        if avedsi>0 then
          rFss = analyze_noise_floor( math.min(i, i+step),math.max(i, i+step), brg, straxis,true )
          ssdif=rFss.dif
          ssval=rFss.sval
          sdsi=rFss.sdsi
        else
          sdsi, ssval = get_avg_noise( math.min(i, i+step),math.max(i, i+step), brg, "normal", straxis, true ) 
          if ssval==nil then break end
          ssdif=ssval-constantaccelspec(g_no_ave_non_ff_spec,(i+i+step)/2)
        end

        if ssdif~=nil and  ssdif > 3 then 
          sverity=z_amplitude_weighted_severity(ssdif,ssval,109) 
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
        if i<2 then
          if ssdif~=nil and ssval~=nil and lastsval-1>ssval and ssdif<20 then
            down=down+1
            up=0
            if down>1 then
              totalsvrity=0
              sverity=0
              lastord=0
              maxamp=0
              maxdif=0
              maxampfreq=0
              conf=0
            end
          else
            up=up+1
            down=0
          end
        end
        lastsval=ssval
        if up<1 then
          lastsev=sverity*smult
        elseif up==1 then
          totalsvrity = totalsvrity + sverity*smult+lastsev
        elseif up>1 then
          totalsvrity = totalsvrity + sverity*smult
        end
        conf=stanford_conf(conf,.04)
        debugprint ( straxis..': '..round(math.min(i, i+step),1)..' - '..round(math.max(i, i+step),1)..' val: '..round(ssval) ..' dif: '..round(ssdif)..' sev: '.. round(sverity) ..' tsev: '..round(totalsvrity))
      end
      if totalsvrity>0 then
        z_fault_tone_list(element,brg,straxis, firstord, maxamp, maxamp-maxdif,totalsvrity,sdsi,nil, "High Ski Slope "..rn,'HSS',maxampfreq ,lastord)
        --z_fault_tone_list(element,brg,straxis, orderlow, sval, aval,sev,dsi,bin, info, fo_info, orderfreq, orderhigh)
        put_store_value("sssvrty"..rn,count+totalsvrity)
        debugprint ("Ski Slope rule fired- Severity "..count+totalsvrity.." on "..rn.." rotor")
        assert2(1)
        assert3(conf)
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
  local check,count = get_store_value("SSpt"..rn)
  --
  local check1,svrty = get_store_value("sssvrty"..rn)
  svrty=svrty or 0
  if check==true then
    svrty= svrty/count
    if svrty>=0 then
      debugprint ("Ski Slope Issue Calculated Normalized Severity",count,svrty)
      assert2(svrty)
      return true
    end
  end
  debugprint (rn.." ".." LF Ski Slope severity FALSE")
  return false
end
--  **************************************************************
---- Gear Broadband Noise evaluation 
function gearbroadbandnoise(element,brg,straxis,howmany,strrotorname,strtag,threshold,svrtymult) -- Gear BBN evaluates BBN at 1,2,3x gearmesh +/- 10%
  threshold,svrtymult=z_get_rule_tune_info(element,threshold,svrtymult) 
  local gmbbn=false
  local gmbbnsev=0
  local conf=0
  howmany=howmany or 3
  -- 1X should be the only tag to return an order of 1, tagnot1x allows analysis to continue only if the tag order is not 1
  local tagnot1x=true
  if strtag~='1X' then 
    local tago=get_tag_order( strtag, element, 1 )
    tagnot1x = tago.order~=1 
  end
  if tagnot1x then
    local th=threshold-20
    local sm=svrtymult 
    local bearing,alias,spdratio =z_get_brg_and_data_set_speed_ratio(element,brg)
    local rn=strrotorname..'GBBN'..element

    local _,dstart,_,dstop=maximum_data_range(element,brg,straxis)
    local tago=get_tag_order( strtag, element,-1 )
    if dstop==nil or dstart==nil or tago.order<1 or dstop<dstart or tago.order>dstop then return false,0 end
    local pm=.1*tago.order*spdratio
    local fstep= 2*pm/20
    local startf,stopf
    local dsi=0
    for h=1,howmany,1 do
      startf=h*tago.order*spdratio-pm
      stopf=h*tago.order*spdratio+pm
      if startf<dstop then
        if stopf>dstop then stopf=dstop end
        local gm,gmsev,hconf=z_broadbandnoise(element,brg,straxis,dsi,rn,startf,stopf,fstep,th,sm)
        if gm then
          gmbbn=true
          gmbbnsev=gmbbnsev+gmsev
          conf=stanford_conf(conf,hconf)
        end
      end
    end
  end
  return gmbbn , gmbbnsev,conf
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
  local th=threshold-20
  local sm=svrtymult
  local dsi=0
  return z_broadbandnoise(element,brg,straxis,dsi,rn,startf,stopf,fstep,th,sm)
end
--
function bearingREbroadbandnoise(element,brg,straxis,strrotorname,startf,stopf,step,threshold,svrtymult) -- An evaluation of broadband noise from above 3x(skislope) to the top of HF spectra in 20 steps.
  threshold,svrtymult=z_get_rule_tune_info(element,threshold,svrtymult)
  local _,start,_,stop=maximum_data_range(element,brg,straxis)
  startf=startf or start
  stopf=stopf or stop
  if stopf==nil or startf==nil then return false,0 end
  local rn=strrotorname..'REBN'
  if stopf<=startf then return false end
  local fstep= step or (stopf-startf)/20
  if fstep<startf/20 then return false end
  local th=threshold-20
  local sm=svrtymult
  local dsi=0
  return z_broadbandnoise(element,brg,straxis,dsi,rn,startf,stopf,fstep,th,sm)
end
--- pump canvitation Broadband Noise evaluation 
function pumpcavitiationbroadbandnoise(element,brg,straxis,strrotorname,startf,stopf,step,threshold,svrtymult) -- An evaluation of HF cavitation broadband noise from 20 to 100 orders spectra in 50 steps.
  threshold,svrtymult=z_get_rule_tune_info(element,threshold,svrtymult)
  local _,start,_,stop=maximum_data_range(element,brg,straxis)
  local rF1x=analyze_by_tag( "1X", element, brg, straxis )
  local maxord=50
  if rF1x.found then
    maxord=2000/rF1x.sfreq
  end
  startf=startf or start
  if startf<20 then startf=20 end
  stopf=stopf or stop
  if stopf>50 then stopf=maxord end
  if stopf==nil or startf==nil then return false,0 end
  local rn=element..'CAVBN'
  if stopf<=startf then return false end
  local fstep= step or (stopf-startf)/50
  if fstep<startf/20 then return false end
  local th=threshold-20
  local sm=svrtymult
  local dsi=0
  return z_broadbandnoise(element,brg,straxis,dsi,rn,startf,stopf,fstep,th,sm)
end
--
function pvcavitationbroadbandnoise(element,brg,straxis,strrotorname,strtag,threshold,svrtymult) -- Pump cavitation BBN evaluates BBN at 1,2,3x pump vanes +/- 10%
  threshold,svrtymult=z_get_rule_tune_info(element,threshold,svrtymult) 
  local pvbbn=false
  local pvbbnsev=0
  -- 1X should be the only tag to return an order of 1, tagnot1x allows analysis to continue only if the tag order is not 1
  local tagnot1x=true
  local conf=0
  if strtag~='1X' then 
    local tago=get_tag_order( strtag, element, 1 )
    tagnot1x = tago.order~=1 
  end
  if tagnot1x then
    local th=threshold-20
    local sm=svrtymult  
    local bearing,alias,spdratio =z_get_brg_and_data_set_speed_ratio(element,brg)
    local rn=element..'PVBN'
    z_countuniquecalls(strtag,element,brg,straxis)
    local _,dstart,_,dstop=maximum_data_range(element,brg,straxis)
    local tago=get_tag_order( strtag, element,-1 )
    if dstop==nil or dstart==nil or tago.order<1 or dstop<dstart or tago.order>dstop then return false,0 end
    local pm=.1*tago.order*spdratio
    local fstep= 2*pm/10
    local startf,stopf
    local dsi=0
    for h=1,3,1 do
      startf=h*tago.order*spdratio-pm
      stopf=h*tago.order*spdratio+pm
      if startf<dstop then
        if stopf>dstop then stopf=dstop end
        local pv,pvsev,pvconf=z_broadbandnoise(element,brg,straxis,dsi,rn,startf,stopf,fstep,th,sm)
        if pv then
          pvbbn=true
          pvbbnsev=pvbbnsev+pvsev/h
          conf=stanford_conf(conf,pvconf)
        end
      end
    end
  end
  return pvbbn , pvbbnsev, conf
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
      hfmax= math.min(dataranges[#dataranges].somax, dataranges[#dataranges].aomax)*.99
    end
  else
    skislopemax=dataranges[1].somax*.25
    lfmax=dataranges[1].somax
    if #dataranges>1 then
      hfmax=dataranges[#dataranges].somax*.99
    end
  end
  return skislopemin,skislopemax,lfmax,hfmax
end

function z_broadbandnoise(element,brg,straxis,dsi,strrotorname,start,stop,step,threshold,svrtymult) -- Broadband Noise evaluation function
  threshold,svrtymult=z_get_rule_tune_info(element,threshold,svrtymult)
  --if true then return false end
  local rn=string.upper(strrotorname) or ''
  local noisetype="BBN"

  if string.match(rn,'BEARING')=='BEARING' then
    local _,last=string.find(rn,'BEARING')
    noisetype=string.sub(rn,last+1)
  end
  local startf=start or 3
  local stopf=stop or 10
  local fstep= step or (stopf-startf)/20
  debugprint (startf.." - "..stopf.." order BB Noise evaluation started on "..rn.." Rotor",element,"bearing",brg,"axis",straxis)
  local bbthld=threshold-20
  local smult=svrtymult
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
  local bbsval=0
  local bbaval=0
  local lastdif=0
  local firstfreq=0
  local maxamp=0
  local maxampfreq=0
  local lastfreq=0
  local sumsval=0
  local sumaval=0
  local num=0
  local tsev=0
  local conf=0
  local steps=math.abs(stop-start)/step
  local check,count = get_store_value("BBsvrty"..rn )
  if check==false then count=0 end
  local sverity=0
  local rFbb
  stoppoint(startf,10)
  if fstep==0 then fstep=.5 end
  for i=startf,stopf-fstep,fstep do
    if rF1x.adsi~=nil and rF1x.adsi>0 then
      rFbb = analyze_noise_floor( i, i+fstep, brg, straxis, true )
      if rFbb==nil then break end
      dsi=rFbb.sdsi
      bbdif=rFbb.dif
      bbsval=rFbb.sval
      bbaval=rFbb.sval
    else 
      -- no_error is false then get_avg_noise will assert out if there is no supporting data.
      local sdsi, s = get_avg_noise( i, i+fstep, brg, "normal", straxis, true ) 
      if s==nil then break end
      local adsi, a = get_avg_noise( i, i+fstep, brg, "average", straxis, true ) 
      if a==nil then
        a = constantaccelspec(g_no_ave_non_ff_spec,(i+i+fstep)/2)
      end
      --return { ["sdsi"] = sdsi, ["sval"] = s, ["adsi"] = adsi, ["aval"] = a, ["dif"] = (s-a), ["pct"] = (s-a)/a }
      dsi=sdsi
      bbdif=s-a
      bbsval=s
      bbaval=a
    end

    if trouble_shoot then debugprint ( element, brg, straxis ,i,bbdif, bbsval) end
    if bbdif>3 and bbsval>63 then
      if firstfreq==0 then firstfreq=i end
      if bbdif>bbmaxdif then bbmaxdif=bbdif end
      sverity=z_amplitude_weighted_severity(bbdif,bbsval,bbthld)
      tsev=tsev+sverity
      conf=stanford_conf(conf,1/steps/3)
      sumsval=sumsval+ bbsval  --ConvertSpectrum( Unit.U_VDB , g_internal_unit    , rFbb.sval )
      sumaval=sumaval+ bbaval  --ConvertSpectrum( Unit.U_VDB , g_internal_unit    , rFbb.aval )
      num=num+1
      lastfreq=i+fstep
      --element,brg,straxis, orderlow, sval, aval,sev,dsi,bin, info, fo_info, orderfreq, orderhig
      --z_fault_tone_list(element,brg,straxis, i, bbval,bbval-bbdif, sverity,num,nil, "Broadband Noise "..rn,'BBN',sr1x ,i+fstep)
    end
    if bbsval >bbthld then
      --sverity=sverity+z_high_level_severity(bbval,bbthld)
    end
    if bbdif>lastdif then
      lastdif=bbdif
      maxampfreq=i
      maxamp=bbsval
    end
  end  
  if tsev>0 then
    count = count + tsev*smult
  end  
  if count>0 and num>0 then
    local _,aliasmi,_=z_get_brg_and_data_set_speed_ratio(element,brg)
    z_fault_tone_list(element,brg,straxis, firstfreq, maxamp, maxamp-lastdif,tsev,dsi,nil, "High Noise Floor "..rn,noisetype,maxampfreq ,lastfreq)
--z_fault_tone_list(element,brg,straxis, orderlow, sval, aval,dsi,bin, info, fo_info, orderfreq, orderhigh)
    put_store_value("BBsvrty"..rn,count)
    debugprint (startf.." - "..stopf.." order BB Noise rule fired- Severity "..count.." on "..rn.." rotor near "..lastfreq.." orders.")
    assert2(1)
    assert3(conf)
    return true,tsev,conf
  end
  debugprint (rn.." "..noisetype.." BB Noise FALSE")
  return false,0,0
end
function gearbroadbandnoiseseverity(element,strrotorname,startf,stopf) -- Gear BBN severity normalization
  local factor=1
  if  strrotorname=='COMPRESSOR' then  
    factor=get_custom_parameter('gmsevmult') or 1
  end
  local rn=strrotorname..'GBBN'..element
  local fired,svrty=z_broadbandnoiseseverity(rn,startf,stopf,element)
  put_store_value("GMBBN",svrty*factor)
  return fired
end
function rotorbroadbandnoiseMFseverity(strrotorname,startf,stopf) -- Middle Freq Broadband Noise normalization function default 3 to 10 orders

  local rn=strrotorname..'MF'
  return z_broadbandnoiseseverity(rn,startf,stopf)
end
function rotorbroadbandnoiseHFseverity(strrotorname,startf,stopf) -- High Freq Broadband Noise normalization function default 10 to 100 orders

  local rn=strrotorname..'HF'
  return z_broadbandnoiseseverity(rn,startf,stopf)
end
function pumpcavitationbroadbandnoiseseverity(element,strrotorname,startf,stopf) -- High Freq Broadband Noise normalization function default 20 to 100 orders

  local rn=strrotorname..'CAVBN'
  return z_broadbandnoiseseverity(rn,startf,stopf)
end
function pvcavitationbroadbandnoiseseverity(element,strrotorname,startf,stopf) -- Pump Vane BBN severity normalization

  local rn=strrotorname..'PVBN'
  return z_broadbandnoiseseverity(rn,startf,stopf)
end
function bearingREbroadbandnoiseseverity(strrotorname,startf,stopf) -- High Freq Broadband Noise normalization function default 10 to 100 orders

  local rn=strrotorname..'REBN'
  return z_broadbandnoiseseverity(rn,startf,stopf)
end
function z_broadbandnoiseseverity(strrotorname,start,stop,element) -- Broadband Noise normalization function 
  local rn= strrotorname or ''
  element=element or ''
  debugprint ("Normalizing BB Noise severity fault on rotor "..rn)
  local check,count = get_store_value("BBpt"..rn )
  --
  local check1,svrty = get_store_value("BBsvrty"..rn )
  debugprint ("BBsvrty"..rn,check2,check1,points,count,svrty)
  svrty=svrty or 0
  if check==true then
    svrty= svrty/count
    if svrty>=0 then
      debugprint (rn.." BB Noise Issue Calculated Normalized Severity",count,svrty)
      assert2(svrty)
      put_store_value("REBN",svrty)
      return true,svrty
    end
  end
  debugprint (rn.." ".." BB Noise severity FALSE")
  return false,0
end
--
-- Cocked Bearing Check Function
--**************************************************
function bearingcocked(element,brg,threshold,svrtymult) -- Cocked Bearing Check Function
  threshold,svrtymult=z_get_rule_tune_info(element,threshold,svrtymult)
  debugprint ("Cocked Bearing started on Rotor",element,"bearing",brg)
  local balthld = threshold
  local smult = svrtymult
  local sverity=0
  local conf=0
  local rFpma=z_get123orders( "1X", element, brg, "a" ,true)
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
          conf=stanford_conf(conf,.4)
          if sval2xa>balthld then x2sv=x2sv+z_high_level_severity(sval2xa,balthld) end
          sverity=sverity+x2sv
          datami= z_fault_tone_list(element,brg,"a",rFpma.sord2x, sval2xa, sval2xa-dif2xa,x2sv,rFpma.dsi3x,rFpma.bin3x,"Cocked Bearing",'2x(1X)',rFpma.sfreq*2 ) 
          z_flag_tone_as_found (element,brg,"a", rFpma.ord2freq ,datami)
        end
        if dif1xa>g_fault_tone_threshold or ( dif1xa>3 and sval1xa>g_significance_threshold) then
          local x1sv=dif1xa 
          conf=stanford_conf(conf,.1)
          if sval1xa>balthld then x1sv=x1sv+z_high_level_severity(sval1xa,balthld) end
          sverity=sverity+x1sv
          datami= z_fault_tone_list(element,brg,"a", rFpma.sord1x, sval1xa, sval1xa-dif1xa,x1sv,rFpma.dsi1x,rFpma.bin1x, "Cocked Bearing",'1x(1X)',rFpma.sfreq*1) 
          z_flag_tone_as_found (element,brg,"a", rFpma.ord1freq ,datami)
        end
        if dif3xa>g_fault_tone_threshold or ( dif3xa>3 and sval3xa>g_significance_threshold) then
          local x3sv=dif3xa 
          conf=stanford_conf(conf,.1)
          if sval3xa>balthld then x3sv=x3sv+z_high_level_severity(sval3xa,balthld) end
          sverity=sverity+x3sv
          datami= z_fault_tone_list(element,brg,"a", rFpma.sord3x, sval3xa, sval3xa-dif3xa,x3sv,rFpma.dsi3x,rFpma.bin3x, "Cocked Bearing",'3x(1X)',rFpma.sfreq*3) 
          z_flag_tone_as_found (element,brg,"a", rFpma.ord3freq ,datami)
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
        assert3(conf)
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
  local check,count = get_store_value("ptckdb")
  local check1,svrty = get_store_value("ckdsvrty")
  svrty=svrty or 0
  if check==true then
    svrty= svrty/count
    if svrty>=0 then
      debugprint ("-- Calculate Normalized Severity --",count,svrty,"Cocked Bearing CCCCCCCCCCCCCCCCCCCCCC")
      assert2(svrty)
      return true
    end
  end
  debugprint ("Cocked Bearing FALSE")
  return false
end --]
--
-- End Cocked Bearing functions
--
-- Bearing looseness 
function bearinglooseness(strtag,element,brg,straxis,suborder,howmany,strrotorname,threshold,svrtymult) -- .5x subharmonic 0-5x
  threshold,svrtymult=z_get_rule_tune_info(element,threshold,svrtymult)
  return z_subharmonics(strtag,element,brg,straxis,suborder,howmany,strrotorname,threshold,svrtymult)
end
--
function z_subharmonics(strtag,element,brg,straxis,suborder,howmany,strrotorname,threshold,svrtymult,strrule,multiplecheck) -- Function checks for subharmonic of a forcing frequency (strtag)
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
  local rF1x=analyze_by_tag( "1X", element, brg, straxis )
  local ordr1x=rF1x.sord
  local sr1x=rF1x.sfreq
  local conf=0
  if sr1x==nil then
    for i,ds in ipairs (machine.datasets)  do
      if ds.dom=='spec' and ds.typ=='normal' and ds.axis==straxis and ds.mi==alias then
        sr1x=ds.speed*spdratio
        break
      end
    end 
  end
  local sdsi=0
  if rF1x.found==false then
    if machine.elements[alias]~=nil and machine.elements[alias].data~=nil and machine.elements[alias].data.spec~=nil and machine.elements[alias].data.spec.normal[straxis]~=nil and machine.elements[alias].data.spec.normal[straxis][1]~=nil then
      sdsi=machine.elements[alias].data.spec.normal[straxis][1]
    end
  else
    sdsi=rF1x.sdsi
  end
  local bw=machine.datasets[sdsi].bw/sr1x or .01
  local hm=howmany or 5
  local ffthld=threshold-20
  local smult=svrtymult
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
        if  math.abs(math.fmod (targetorder,tagord)-1)  > 0.1 and targetorder>5*bw then  --  ~= order % tagord or >5 x BW
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
                  sbsverity=z_amplitude_weighted_severity(shdif,shval,109)
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
            if round(s2.ord,2)==round(s1.ord+suborder*tagord,2) then  -- Check for higher order sidebands 
              adjharm=true
              numharm=numharm+1
            end
          end
          if round(s2.ord,2)==round(s1.ord+tagord+suborder*tagord,2) or round(s2.ord,2)==round(s1.ord+suborder+2*tagord*tagord,2) or round(s2.ord,2)==round(s1.ord+suborder+3*tagord*tagord,2) or round(s2.ord,2)==round(s1.ord+suborder+4*tagord*tagord,2)then  -- check for neihboring subharmonics
            adjsb=true
            numsb=numsb+1
          end
        end
      end

      if (adjharm and ((numharm>0 and sublist[1].sord<=3) or (numharm>1 and sublist[1].sord>3)) and (suborder==.25 or suborder==.5)) or (adjsb and numsb>=3 and adjharm and numharm>0 ) or not (multiplecheck) then -- are there adjacent tones
        --{ord=round (targetorder,3),sev=sbsverity,dif=shdif,sval=shval,sbin=rFsbt.sbin,sfreq=rFsbt.sfreq,sdsi=rFsbt.sdsi,sord=order}
        for _,sh in ipairs (sublist) do 
          if sh.sev>1 then
            sverity=sverity+sh.sev
            conf=stanford_conf(conf,.01)
            local datami
            if strrule == nil then
              datami= z_fault_tone_list(element,brg,straxis, sh.sord, sh.sval, sh.sval-sh.dif,sh.sev,sh.sdsi ,sh.sbin, round(sh.ord/tagord,3).."x("..strtag..") Subharmonic on "..rn,round(sh.ord/tagord,3).."x("..strtag..')',sh.sfreq) 
              z_flag_tone_as_found (element,brg,straxis, sh.sfreq ,datami)
            else
              datami=  z_fault_tone_list(element,brg,straxis, sh.sord, sh.sval, sh.sval-sh.dif,sh.sev,sh.sdsi ,sh.sbin, round(sh.ord/tagord,3).."x("..strtag..') '..strrule..' on '..rn,round(sh.ord/tagord,3).."x("..strtag..')', sh.sfreq)
              z_flag_tone_as_found (element,brg,straxis, sh.sfreq ,datami)
            end
            debugprint (rn,round(sh.ord/tagord,3).." subharmonic of "..tag.." found at",sh.sord," orders",sh.dif,sh.sev)
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
        assert3(conf)
        return true, sverity
      end
    end
  end -- if rFff.found


  debugprint (rn, suborder.." of "..tag.." subharmonic FALSE")
  return false, 0
end
--

function z_subharmonicseverity (strtag,element,strrotorname) -- Subharmonic severity Function
  debugprint ("subharmonic severity normalize started")
  local t=strtag or "1X"
  local rn= strrotorname or ''
  local check,count = get_store_value("shpt"..t..element..rn)
  local check1,svrty = get_store_value("shsvrty"..t..element..rn)
  svrty=svrty or 0
  if check1==true then
    svrty= svrty/count
    if svrty >= 1 then
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
  threshold=threshold or 109
  svrtymult=svrtymult or 1
  local thrshld=tonumber(get_attribute_value("FLT_TH",element, threshold)) 
  local svrtymlt=tonumber(get_attribute_value("FLT_SM",element, svrtymult)) 
  return thrshld,svrtymlt
end
--
function rotor_rub(element,brg,straxis,suborder,howmany,strrotorname,threshold,svrtymult)  -- Looks for 1/3, 1/4, 1/5 shaft rate subharmonics
  threshold,svrtymult=z_get_rule_tune_info(element,threshold,svrtymult)
  --local harmonics=z_forcingfrequencyharmonics("1X",element,brg,straxis,howmany,strrotorname,threshold,svrtymult)
  local hm=howmany or 8
  local fifthsubharmonics=z_subharmonics("1X",element,brg,straxis,1/5,hm,strrotorname,threshold,svrtymult,'Rotor Rub',true)
  local quartersubharmonics=z_subharmonics("1X",element,brg,straxis,1/4,hm,strrotorname,threshold,svrtymult,'Rotor Rub',true)
  local thirdsubharminics=z_subharmonics("1X",element,brg,straxis,1/3,hm,strrotorname,threshold,svrtymult,'Rotor Rub',true)
  return fifthsubharmonics or quartersubharmonics or thirdsubharminics
end
--
function rotor_rubseverity(element,strrotorname)  -- Normalizes the severity of 1/3, 1/4, 1/5 shaft rate subharmonics
  --local harm,harmseverity= z_forcingfrequencyseverity("1X",element,strrotorname)
  local subharm,subharmseverity= z_subharmonicseverity ("1X",element,strrotorname)
  --harmseverity=harmseverity or 0
  subharmseverity=subharmseverity or 0
  if subharm then 
    assert2(subharmseverity*3) -- times 3 for scaling
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
  local ffthld=threshold or 109
  local smult=svrtymult or 1
  local harms={}
  local conf=0
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
        if  cntrord<maxdata*.99 then
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
                  sverty=sverty+z_amplitude_weighted_severity(tdif,center.sval,109)
                  conf=stanford_conf(conf,.1)
                end
              end
            end 
          end
          --end
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
              if sbford>1 and sbford<maxdata*.99 then
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
                          sverty=sverty+z_amplitude_weighted_severity(sb.dif,sb.sval,109)
                          sbsvrty=sbsvrty+z_amplitude_weighted_severity(sb.dif,sb.sval,109)
                          conf=stanford_conf(conf,1/(2*hm+1)/3)
                        end
                        local thldoffset=20*math.log(harm,10) 
                        sb.severity=sbsvrty 
                        table.insert(sidebandinfo,sb)
                      end
                    end
                    --else

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
          else
            center.energyratio=0
            center.sidebands={}
            center.tdif=nil -- -9999 -- dy 2/11/2020 fixed so gear analysis worka correctly
            center.sbmax=nil -- -9999 -- dy 2/11/2020 fixed so gear analysis worka correctly
            center.dif=nil -- -9999 -- dy 2/11/2020 fixed so gear analysis worka correctly
            centertoneinfo[harm]=center
          end
        end
      end
      harms[ax]={}
      harms[ax]['info']=centertoneinfo 
    end
  end
  if harms=={} then return {["found"]=false} end
  --[[if #harms==1 then
      return {['found']=true, ['harmonics']=harms,
        ['tdif']=     {harms[1].info[1].tdif ,      harms[1].info[2].tdif ,     harms[1].info[3].tdif},
        ['energy']=   {harms[1].info[1].energy ,    harms[1].info[2].energy ,   harms[1].info[3].energy},
        ['severity']= {harms[1].info[1].severity ,  harms[1].info[2].severity , harms[1].info[3].severity},
        ['dif']=      {harms[1].info[1].dif ,       harms[1].info[2].dif ,      harms[1].info[3].dif},
        ['energyratio']=  {harms[1].info[1].energyratio ,      harms[1].info[2].energyratio ,     harms[1].info[3].energyratio}}
    else ]]
  local pdif,tdif,dif,energy,sverty={},{},{},{},{}
  for a,ax in pairs (harms) do
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
        table.insert(tdif,nil) -- -9999) -- dy 2/11/2020 fixed so gear analysis worka correctly
        table.insert(energy, 0)
        table.insert(sverty,0)
        table.insert(dif,nil) -- -9999)- dy 2/11/2020 fixed so gear analysis worka correctly
        table.insert(energyratio,0)
      end
    end
    return {['found']=true, ['harmonics']=harms, ['tdif']=tdif, ['energy']=energy, ['severity']=sverty, ['dif']=dif,['energyratio']=energyratio}, conf
  end
  return {["found"]=false}
end

function gear_analysis(strfault,strtag,element,brg,straxis,strsbtag,howmany,strrotorname,threshold,svrtymult)  -- This function analyzes for strfault = 'TOOTH LOAD 'or'GEAR ALIGNMENT' or 'ECCENTIC GEAR' or 'GEAR WEAR' or 'GEAR BACKLASH' gear faults by analyzing gear mesh harmonic patterns if available.
  threshold,svrtymult=z_get_rule_tune_info(element,threshold,svrtymult)
  local faults={'TOOTH LOAD','GEAR ALIGNMENT','ECCENTIC GEAR','GEAR WEAR','GEAR BACKLASH'}
  strfault=strfault or ""
  if strfault=='' then return false end
  strfault=string.upper(strfault)
  local findx=0
  for fn,flt in ipairs(faults) do
    if strfault==flt then
      findx=fn
      break
    end
  end
  local rn= strrotorname or ''
  local sbt=strsbtag or "1X"
  local hm=howmany or 4
  local ffthld=threshold
  local smult=svrtymult
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
  local gt, conf= z_get123harmonicsidebands(strtag,element,brg,straxis,sbt,howmany,strrotorname,threshold,svrtymult)
  local tsev=0
  if gt.found then

    for _,s in ipairs (gt.severity) do
      tsev=tsev+s
    end
  end
  if tsev>0 and gt.dif[1]~=nil and gt.dif[2]~=nil and gt.dif[3]~=nil and  gt.harmonics[straxis]~=nil and gt.harmonics[straxis].info[1]~=nil and gt.harmonics[straxis].info[1].sval~=nil and gt.harmonics[straxis].info[2]~=nil and gt.harmonics[straxis].info[2].sval~=nil then
    local t=gt.harmonics[straxis].info
    if  gt.dif[1]>gt.dif[2] and gt.dif[1]>gt.dif[3] and gt.energyratio[1]>.3 and gt.dif[1]>0 and findx==1  then -- TOOTH LOAD
      z_fault_tone_list(element,brg,straxis, t[1].sord, t[1].sval, t[1].aval,tsev ,t[1].sbin,t[1].sdsi, "Tooth Loading",'TTH LD', t[1].sfreq )
      assert2(tsev)
      assert3(conf)
      return true 
    end 
    if  gt.dif[2]>0 and gt.energy[2]>2*gt.energy[1] and gt.energy[2]>2*gt.energy[3]and gt.tdif[2]>gt.tdif[1] and gt.tdif[2]>gt.tdif[3] and findx==2 then -- GEAR ALIGNMENT
      z_fault_tone_list(element,brg,straxis, t[2].sord, t[2].sval, t[2].aval,tsev ,t[2].sbin,t[2].sdsi, "Gear Alignment",'GR ALGNMT', t[2].sfreq )
      assert2(tsev)
      assert3(conf)
      return true 
    end 
    if gt.energy[1]>2*gt.energy[2] and gt.energy[3]>2*gt.energy[2] and (gt.severity[1]>0 or gt.severity[3]>0) then 
      if gt.tdif[1]-gt.dif[1]>gt.dif[1]  and (gt.dif[1]>0 or gt.tdif[1]-gt.dif[1]>0) and dif1x>0 and findx==3 then  -- ECCENTIC GEAR
        z_fault_tone_list(element,brg,straxis, t[1].sord, t[1].sval, t[1].aval,tsev ,t[1].sbin,t[1].sdsi, "Eccentric Gear",'ECCTRC GR', t[1].sfreq )
        assert2(tsev)
        assert3(conf)
        return true
      else if gt.tdif[1]-gt.dif[1]>gt.dif[1]  and (gt.tdif[3]>gt.tdif[1] or gt.tdif[2]>gt.tdif[1] ) and findx==4 then -- GEAR WEAR
        z_fault_tone_list(element,brg,straxis, t[2].sord, t[2].sval, t[2].aval,tsev ,t[2].sbin,t[2].sdsi, "Gear Wear",'GR WR', t[2].freq )
        assert2(tsev)
        assert3(conf)
        return true
      else -- GEAR BACKLASH
        z_fault_tone_list(element,brg,straxis, t[1].sord, t[1].sval, t[1].aval,tsev ,t[1].sbin,t[1].sdsi, "Gear Backlash",'GR BKLSH', t[1].sfreq )
        assert2(tsev)
        assert3(conf)
        return true
      end
    end
  end
-- UNSPECIFIED GEAR PROBLEM
end
return false 
end --]
--  **************************************************************
--
-- Oil whirl evaluation (Oil whirl is strong tone .38-.48x)
--
function bearingoilwhirl(element,brg,straxis,strrotorname,threshold,svrtymult) -- Oil whirl evaluation (Oil whirl is strong tone .38-.48x)
  threshold,svrtymult=z_get_rule_tune_info(element,threshold,svrtymult)
  local rn=strrotorname or ''
  debugprint ("Oil whirl evaluation started on "..rn.." Rotor",element,"bearing",brg,"axis",straxis)
  local OWthld=threshold-20
  local smult=svrtymult
  local conf=0
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
            local othershaft=false
            local ratio=get_comp_speed_ratios()[get_this_comp_number()]
            for _,r in ipairs(get_comp_speed_ratios()) do
              othershaft,x,frac=z_is_a_multiple(r,rFOW.sord*ratio,.002)
              --if othershaft then break end
            end
            if not(othershaft) then
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
        conf=stanford_conf(conf,.4)
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
        assert3(conf)
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
  local check,count = get_store_value("OWpt"..rn)
  --
  local check1,svrty = get_store_value("OWsvrty"..rn)
  svrty=svrty or 0
  if check==true then
    svrty= svrty/count
    if svrty>=0 then
      debugprint ("Oil whirl Issue Calculated Normalized Severity",count,svrty)
      assert2(svrty)
      return true
    end
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
    local ssmin,ssmax,low,high=maximum_data_range(element,brg,straxis)if ssmin==nil and ssmax==nil and low==nil and high==nil then
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
        stopf=maxdata*.99
      else
        stopf=lstop*.99
      end
      if stopf>lstop*.99 then  
        local lowavedata=analyze_noise_floor (lstart,lstop*.99,brg,straxis, true)
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
        local lowavedata=analyze_noise_floor (lstart,lstop,brg,straxis,true)
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
        --if stopf> maxdata*.99 then stopf=maxdata*.99 end
        stopf=maxdata*.99
      else
        stopf=lstop*.99
      end
      if stopf>lstop*.99 then  
        local lowavedata=analyze_noise_floor (lstart,lstop*.99,brg,straxis, true)
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
        local lowavedata=analyze_noise_floor (lstart,stopf,brg,straxis,true)
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
      local lowavedata=analyze_noise_floor (.5,stopf,brg,straxis,true)
      if lowavedata.dif~=nil and math.abs(lowavedata.dif)>20  then
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

function find_peak_in_cpl(element,brg,straxis,val,handle)
  handle=handle or 'sbin'
  local brgmi,aliasmi,_=z_get_brg_and_data_set_speed_ratio(element,brg)
  if val~=nil then 
    local pl=machine.elements[aliasmi].data.spec.cpl.normal[straxis]
    local starti=1
    if val>10 then starti=binsearchpl(pl,val,.1,handle) end
    for i=starti,#pl.peaks,1 do
      local pk=pl.peaks[i]
      -- for p,pk in ipairs(pl.peaks) do
      if round(pk[handle]/val,4)==1 then
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
    local cpl=find_peak_in_cpl (element,brg,straxis,orderfreq,'sfreq')
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
function z_flag_tone_as_found (element,brg,straxis,sfreq,mi,rulefire)
  local done=false
  -- new peak list
  local cpl=find_peak_in_cpl (element,brg,straxis,sfreq,'sfreq')
  if cpl.found then
    done=true
    machine.elements[cpl.mi].data.spec.cpl.normal[straxis].peaks[cpl.pk_index].flags=add_flag(machine.elements[cpl.mi].data.spec.cpl.normal[straxis].peaks[cpl.pk_index].flags,'f')
    if rulefire~=nil and rulefire then
      machine.elements[cpl.mi].data.spec.cpl.normal[straxis].peaks[cpl.pk_index].flags=add_flag(machine.elements[cpl.mi].data.spec.cpl.normal[straxis].peaks[cpl.pk_index].flags,'r')
    end
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
-- 
function bearingREtones_parent()
  debugprint('Non-sychronous bearing tone parent rule started')
  return true
end
function bearingREtones_parent_severity()
  debugprint('Non-sychronous bearing tone and noise parent rule severity started')
  local tones,tonesvrty = get_store_value("RETNS")
  local noise,noisesvrty = get_store_value("REBN")
  local svrty=0
  if tones then svrty=tonesvrty end
  if noise then svrty=svrty+1*noisesvrty end
  if svrty>0 then
    debugprint('Non-sychronous bearing tone and noise parent rule severity TRUE')
    assert2(svrty)
    return true
  else 
    debugprint('Non-sychronous bearing tone and noise parent rule severity FALSE')
    assert3(-1)
    return false
  end
end



function bearingREtones(element,brg,straxis,strrotorname,threshold,svrtymult) -- Checks for non-sychronous tones with significant harmonics or sidebands
  threshold,svrtymult=z_get_rule_tune_info(element,threshold,svrtymult)
  local rn=strrotorname or ''
  debugprint (rn.." Non-sychronous bearing tone rule started on "..rn.." Rotor",element,"bearing",brg,"axis",straxis)
  threshold,svrtymult=z_get_rule_tune_info(element,threshold,svrtymult)
  local thld = threshold
  local smult = svrtymult
  local sverity=0
  local te=0
  local tc=0
  local awsth=thld
  local sevthld=0
  local mpctth=.2
  -- flag potential rotorbar tones to prevent misidentification as bearing tones
  --[[local rbpeaks=unknownrotorbars('MOTRTRBARS',element,brg,straxis,strrotorname,threshold,svrtymult)
  if rbpeaks.found then
    local e=machine.elements[rbpeaks.element].data.spec.cpl.normal[straxis]
    for _,pk in ipairs(rbpeaks.peaks) do
      e.peaks[pk.pk_index].flags=add_flag(e.peaks[pk.pk_index].flags,'b')
    end
  end ]]

  --debugprint (get_attribute_value("THRESHOLD",element),"<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<")
  local rF1x=analyze_by_tag( "1X", element, brg, straxis )
  increment_store_counter( "pt"..element..rn.."brgretones" )
  local conf=0
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
  --local harms=get_harmonic_groups_from_cpl(element,brg,straxis,nil,true)
  local harms=get_harmonics(brg,straxis,true,nil,true)

  if harms.found then
    local brgharmidx={}
    local identified=false
    for i,harm in ipairs(harms.harmonics) do  
      --if #harm.harm_fundamental_pk_matches>0 then
      --identified=true
      --end
      local islfx,mtrissync = z_peak_is_2XLF_mult(harm.harm_sfreq,sr1x)
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
        if h1x > 1.5 and #harms.harmonics[idx].harmonic_info>1 then  -- typically bearing tone fundimentals are greater than 1.5x so only look there
          for _,harm in ipairs (harms.harmonics[idx].harmonic_info)  do
            if harm.dif~=nil then
              --dup=z_tone_in_fault_tone_list(element,brg,straxis, harm.sord, harm.sval, harm.aval,hsverity,harm.sbin, hord.."x harmonic of "..tostring(round(h1x,3)).. 'x on '..rn,hord.."h"..tostring(round(h1x,3))..'x', harm.sfreq) 

              if (harm.dif> g_fault_tone_threshold or (harm.dif>3 and harm.sval>g_significance_threshold)) and harm.mpct>mpctth then
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
                  local hsverity=z_amplitude_weighted_severity(harm.dif,harm.sval,awsth)
                  table.insert (used_tones,harm.sord)  
                  if hsverity>sevthld then
                    tc=tc+1
                    te=te+10^(harm.sval/20)
                    hgsverity=hgsverity+hsverity
                    conf=stanford_conf(conf,.1)
                    local hord=nopointzero(tostring(round(harm.sord/h1x)))
                    --dup=z_tone_in_fault_tone_list(element,brg,straxis, harm.sord, harm.sval, harm.aval,hsverity,harm.sbin, hord.."x harmonic of "..tostring(round(h1x,3)).. 'x on '..rn,hord.."h"..tostring(round(h1x,3))..'x', harm.sfreq)
                    --if not(dup) then 
                    if hstring~="" then hstring=hstring..',' end
                    hstring=hstring..hord
                    z_fault_tone_list(element,brg,straxis, harm.sord, harm.sval, harm.aval,hsverity,harm.sdsi,harm.sbin, hord.."x harmonic of "..tostring(round(h1x,3)).. 'x on '..rn,hord.."h"..tostring(round(h1x,3))..'x', harm.sfreq) 
                    --z_flag_tone_as_found (element,brg,straxis,harm.sfreq,mi,rulefire) -- dy 1/29/2020 removed to ensure the other/alieced bearing has the same result.
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
        sverity=sverity+hgsverity*2
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
              local islfx,mtrissync = z_peak_is_2XLF_mult(grp.first_pk_sfreq,sr1x)
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

                if( side.dif> g_fault_tone_threshold or (side.dif>3 and side.sval>g_significance_threshold)) and side.mpct>mpctth  then
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
                    local sbsverity=z_amplitude_weighted_severity(side.dif,side.sval,awsth)
                    --if side.sval>thld then sbsverity=sbsverity+z_high_level_severity(side.sval,thld) end
                    if sbsverity>sevthld then
                      tc=tc+1
                      te=te+10^(side.sval/20)
                      sbgsverity=sbgsverity+sbsverity
                      conf=stanford_conf(conf,.1)
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
          sverity=sverity+sbgsverity*1.5
        end  -- for g,grp

      end  -- for _,idx
    end  -- if #brgsideidx
  end --if sides.found 
  --local umtones=z_get_usual_tones_from_peak_list(element,brg,straxis)
  local umtones=get_unusual_tones_from_cpl(element,brg,straxis)
  if umtones.found then
    for _,tone in ipairs (umtones.tones) do
      --local dup=z_tone_in_fault_tone_list(element,brg,straxis, tone.sord, tone.sval, tone.aval,tsverity,tone.sbin, sord.."x non-synchronous tone on "..rn,sord..'x brg', tone.sfreq)
      local islfx,mtrissync = z_peak_is_2XLF_mult(tone.sfreq,sr1x)
      if not (islfx) and not (mtrissync) then  -- tone not multiple of line frequency and 1x not too close syncronous to tell
        if tone.dif~=nil then
          if (tone.dif> g_fault_tone_threshold or (tone.dif>3 and  tone.sval >g_significance_threshold)) and tone.sord>2.8  and tone.mpct>mpctth  then
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
                conf=stanford_conf(conf,.08)
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
      assert3(conf)
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

  local check,count = get_store_value("pt"..element..rn.."brgretones")
  --debugprint ("pt"..element..strtag,check,count)

  local check1,svrty = get_store_value("svrty"..element..rn.."brgretones")
  --debugprint ("svrty"..element..strtag,check1,svrty)
  svrty=svrty or 0

  --debugprint (strtag,points,count,svrty)
  if check==true then
    svrty= svrty/count
    local fault=''
    if svrty>=0 then
      debugprint (rn.." Bearing RE non-sychronous tones Fault Calculated Normalized Severity",count,svrty,fault)
      assert2(svrty)
      put_store_value("RETNS",svrty)
      local owner=bearing_owner(element)--,brg,strrotorname)
    end
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
function z_peak_is_2XLF_mult(pk_freq,sr1x)
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
function z_amplitude_weighted_severity(dif,sval,threshold) -- severity doubles or halves every 12 DB above of below threshold
  if dif==nil then return 0 end
  threshold=threshold or 109
  local severity=0
  if sval ~= nil and dif>0 then
    --if sval>50 and sval<=110 then --110 VdB threshold is GSO spec which is really close to mil-std-167 and.1 in/sec industrial rule of thumb  
    severity=(dif)*(10^(sval/40)/10^(threshold/40)) -- severity decreases 50% every 12 dB below 110 VdB 
    -- elseif sval>110then
    -- severity=(dif)*(10^(sval/40)/10^(threshold/40)) -- severity doubles per 6 dB above 110 VdB
    --end 
  end
  return severity
end
--
function z_high_level_severity(sval,threshold)
  sval=sval or 0
  threshold=threshold or 109
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
  if #owner>1 then -- overlayed bearing
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
            if e.data.spec.average~=nil then
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
            else
              lastfmax=machine.datasets[sdsi].fmax
            end

            if bestaveds==0 then
              table.insert(datasets,{mi=alias,axis=straxis,sdsi=sdsi,sfmax=machine.datasets[sdsi].fmax,somax=machine.datasets[sdsi].fmax/machine.datasets[sdsi].speed,sspeed=machine.datasets[sdsi].speed})
            else
              table.insert(datasets,{mi=alias,axis=straxis,sdsi=sdsi,adsi=bestaveds,sfmax=machine.datasets[sdsi].fmax,afmax=lastfmax,somax=machine.datasets[sdsi].fmax/machine.datasets[sdsi].speed,aomax=lastfmax/machine.datasets[bestaveds].speed,sspeed=machine.datasets[sdsi].speed,aspeed=machine.datasets[bestaveds].speed})
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
  local balthld = threshold 
  local smult = svrtymult 
  local sverity=0
  local conf=0
  local rFAm=z_get123orders( "1X", element, brg, "a",true )
  increment_store_counter( "bowpt" )
  local datami
  if rFAm.found then 
    local dif1x=rFAm.dif1x
    --debugprint (dif1x)
    if dif1x>g_fault_tone_threshold or (dif1x>3 and rFAm.sval1x>g_significance_threshold) then
      sverity=dif1x -- not amplitude weighting
      conf=stanford_conf(conf,.4)
      if rFAm.sval1x >balthld then sverity=sverity+z_high_level_severity(rFAm.sval1x,balthld) end
      datami=z_fault_tone_list(element,brg,"a", rFAm.sord1x, rFAm.sval1x, rFAm.aval1x,dif1x,rFAm.dsi1x,rFAm.bin1x, "Bent or Bowed rotor",'1X', rFAm.sfreq) 
      z_flag_tone_as_found (element,brg,"a",rFAm.ord1freq  ,datami)
      local dif2x=rFAm.dif2x
      local dif3x=rFAm.dif3x
      --debugprint (dif1x,dif2x,dif3x)

      if dif2x>g_fault_tone_threshold or (dif2x>3 and rFAm.sval2x>g_significance_threshold) then 
        sverity=sverity+dif2x  -- not amplitude weighting
        conf=stanford_conf(conf,.2)
        datami= z_fault_tone_list(element,brg,"a", rFAm.sord2x,rFAm.sval2x , rFAm.aval2x,dif2x,rFAm.dsi2x,rFAm.bin2x, "Bent or Bowed rotor",'2x(1X)', rFAm.sfreq*2)
        z_flag_tone_as_found (element,brg,"a",rFAm.ord2freq ,datami)
      end
      --[[if dif3x>g_fault_tone_threshold or ( dif3x>3 and rFAm.sval3x>g_significance_threshold) then 
            sverity=sverity+dif3x -- not amplitude weighting
            z_fault_tone_list(element,brg,"a",  rFAm.sord3x, rFAm.sval3x, rFAm.aval3x,dif3x ,rFAm.dsi3x,rFAm.bin3x, "Bent or Bowed rotor",'3x(1X)', rFAm.sfreq*3) 
          end  ]]
      local check,count = get_store_value("bowsvrty")
      if check==true then
        count = count + sverity*smult
      else
        count = sverity*smult
      end
      put_store_value("bowsvrty",count)
      debugprint ("Bent or Bowed rotor rule fired - Severity",sverity,count,"AAAAAAAAAAAAAAAAAAAAAA")
      assert2(1)
      assert3(conf)
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
  local check1,svrty = get_store_value("bowsvrty")
  svrty=svrty or 0
  if check==true then
    --debugprint (check,count,check1,svrty)
    svrty= svrty/count*2 -- times 4 for scaling
    if svrty>=0 then
      debugprint ("-- Calculate Normalized Severity --",count,svrty,"Bent or Bowed rotor SSSSSSSSSSSSSSSSSSSSSSSSSSS")
      assert2(svrty)
      return true
    end
  end
  debugprint ("Bent or Bowed rotor severity FALSE")
  return false
end
-- 
function unknownrotorbars(strtag,element,brg,straxis,strrotorname,threshold,svrtymult)
  --
  -- find 2XLF sideband series greater then 20x with positive severity that have at least one tone that is an integer multiple of shaftrate
  --
  --local pl={}
  --table.move(g_peak_list,1,#g_peak_list,1,pl)
  --sev_th=sev_th or 24
  --nr=nr or 20
  local ele=machine.elements
  local rbpeaks={}
  local pksev=0
  local ei=0
  local no_error=true
  strtag=strtag or ""
  strtag=string.upper(strtag)  
  local dsi,ds,help=get_best_dataset( 1, brg, 'normal', straxis, no_error )
  --for m,dsg in ipairs(pl) do
  for e,inf in ipairs(ele) do
    if inf.data~=nil and inf.data ~={} and inf.data.spec~=nil and inf.data.spec.normal~=nil then 
      if ei~=0 then break end
      for _,pkds in ipairs(inf.data.spec.normal[straxis]) do
        if pkds==dsi then 
          ei=e
          break
        end
      end
    end
  end
  if ei~=0 then 
    local sbseries={}
    local sbs={}
    local cn=get_this_comp_number()
    local spratios=get_comp_speed_ratios()
    local compspeedrat=spratios[cn]
    local closesttoint={}
    local pl=ele[ei].data.spec.cpl.normal[straxis]
    --
    -- check peak list sorts for high severity 2XLF series
    --
    if pl.sorts~=nil and pl.sorts.sb_severity~={} then
      if pl.sorts.sb_severity['2XLF']~=nil then
        sbseries=pl.sorts.sb_severity['2XLF']
        local sb_severity=0
        if is_table(sbseries) then
          for i,pi in ipairs(sbseries) do 
            pi=tonumber(pi)
            -- get sideband severity 
            for spacing,sbs in pairs (pl.peaks[pi].sb_severity) do
              if spacing=='2XLF' then
                sb_severity=sbs
              end
            end
            -- Check for significant sideband severity
            if sb_severity>3 then 
              for spacing,sps in pairs (pl.peaks[pi].sidebands) do
                if spacing=='2XLF' then
                  --for _,sps in ipairs( tbl1) do
                  local closest=0
                  local minrmdr=0
                  for j,sb in ipairs (sps) do
                    sb=tonumber(sb)
                    local isitint,mult,rmdr=z_is_a_multiple(1,pl.peaks[sb].sord,.002)
                    if j==1 or (isitint and rmdr<minrmdr) then
                      minrmdr=rmdr
                      closest=sb
                    end
                  end
                  if minrmdr<.005 then 
                    debugprint(brg,straxis,closest,round(pl.peaks[closest].sord,4),round(minrmdr,4),round(sb_severity,2))
                    for j,sb in ipairs (sps) do
                      sb=tonumber(sb)
                      if pl.peaks[sb].dif~=nil then
                        local aval=ConvertSpectrum( g_internal_unit  , Unit.U_VDB , pl.peaks[sb].aval )
                        local sval=ConvertSpectrum( g_internal_unit  , Unit.U_VDB , pl.peaks[sb].sval )
                        local dif=sval-aval
                        debugprint(brg,straxis,sb,round(pl.peaks[sb].sord,4),round(dif,2),round(sval,2))

                        if dif>g_fault_tone_threshold  or( sval> g_significance_threshold and  dif>3)  then 
                          table.insert(rbpeaks,{
                              sord=pl.peaks[sb].sord,
                              sval=sval,
                              aval=aval,
                              dif=dif,
                              severity=z_amplitude_weighted_severity(dif,sval,threshold),
                              sdsi=pl.peaks[sb].sdsi,
                              sbin=pl.peaks[sb].sbin,
                              sfreq=pl.peaks[sb].sfreq,
                              pk_index=pl.peaks[sb].pk_index
                            })
                        end
                      end
                      local _
                    end
                  end
                end
                -- end
              end
            end
          end
        end
      end
      if #rbpeaks>0 then
        return {found=true,peaks=rbpeaks,element=ei}
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

  local driver=string.lower( get_attribute_value("Driver/Driven",element, 'stop'))
  if string.match(strrotorname,driver)~=driver then return false end

  threshold,svrtymult=z_get_rule_tune_info(element,threshold,svrtymult)
  --
  local otherbrg
  if brg==1 then otherbrg=3 end
  if brg==3 then otherbrg=1 end
  --
  debugprint ("Pulley Eccentricity/Misalignment fault started on Rotor",element,brg,"axis",straxis)
  local balthld = threshold 
  local smult = svrtymult 
  local sverity=0
  local conf=0

  local near1x=analyze_by_tag( "1X", element, brg, straxis,nil)

  increment_store_counter( "pmept"..straxis..strrotorname )
  if near1x.found then 
    local neardif=near1x.dif or 0
    local severity=0
    local datami
    local info=string.upper(driver).." Pulley Essentricity/Misalignment "

    if neardif>3 then 
      severity=z_amplitude_weighted_severity(neardif,near1x.sval,balthld)
      conf=stanford_conf(conf,.4)
      datami= z_fault_tone_list(element,brg,straxis, near1x.sord, near1x.sval,near1x.sval-near1x.dif,severity,near1x.dsi,near1x.sbin, info,'PE',near1x.sfreq)
      debugprint ('near '..element,brg,straxis, near1x.sord, near1x.sval,near1x.sval-near1x.dif,severity,near1x.dsi,near1x.sbin, info,'PE',near1x.sfreq)
      z_flag_tone_as_found (element,brg,straxis, near1x.sfreq,datami,true)
    end

    if severity>0 then
      if straxis~='a' then straxis='r' end
      local check,count = get_store_value("pmesvrty"..straxis..strrotorname)
      if check==true then
        count = count + severity*smult
      else
        count = severity*smult
      end 
      put_store_value("pmesvrty"..straxis..strrotorname,count)
      debugprint ("Pulley Misalignment/Eccentricity rule fired..straxis - Severity ",count,"PPPPPPPPPPPPPPPPPP")
      assert2(1)
      assert3(conf)
      return true
    end
  end
  debugprint ("Pulley Misalignment/Eccentricity FALSE")
  return false
end
--
--
function pulley_vibration_severity (straxis,element,strrotorname) -- Parallel Misalignment/Eccentricity normalization Function
  debugprint ("Pulley Eccentricity/Misalignment fault  normalize started")
  local check,count = get_store_value("pmept"..straxis..strrotorname)
  if check then
    local check1,svrty = get_store_value("pmesvrty"..straxis..strrotorname)
    svrty=svrty or 0
    svrty= svrty/count*1 -- times 2 for scaling
    if svrty>=0 then
      debugprint ("-- Calculated Normalized Severity --",count,svrty,"Pulley Misalignment/Eccentricity",straxis)
      assert2(svrty)
      return true
    end

  end
  debugprint ("Pulley Misalignment/Eccentricity FALSE Severity")
  return false
end

--[[ returns true if an AC motor in in the train
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
end ]]
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
--
function getspeed(element,brg)
  local axes={'a','r','t'}

  --local bearing,alias,spdratio =z_get_brg_and_data_set_speed_ratio(element,brg)

  local shaftspeed= get_data_shaft_speed( brg ) 
  local spdratio=get_speed_ratio_to_driver( brg )
  local component=0
  if machine.shafts[g_shaft]~=nil and machine.shafts[g_shaft].cat1~=nil then -- g_shaft is not a composite
    spdratio=g_comp_speed_ratio[component]
  else                                 -- g_shaft is  a composite
    spdratio=get_speed_ratio_to_driver( brg )
  end
  return shaftspeed,spdratio
end

function slipfault(element,brg)
  local found, spdinfo=get_store_value("spdinfo")

  if not(found) then spdinfo={} end
  local speed=get_data_shaft_speed( brg )
  local ratio=get_speed_ratio_to_driver( brg )
  debugprint('Slip Fault data collection on ',element,brg, ' speed ', speed/ratio ) 
  table.insert(spdinfo,{speed,ratio})
  put_store_value("spdinfo",spdinfo)
  return true
end
--
function slipfaultseverity(percentslip)
  local magcoupling=false
  debugprint('Slip Fault evaluation started') 
  local guid1=categories.COUPLING
  local guid2=categories.COUPLING.mincat.MAGNETIC
  local shaft=''
  if machine.shafts[g_shaft]~=nil then -- g_shaft is not a composite
    shaft=machine.shafts[g_shaft]
  else                                 -- g_shaft is  a composite
    for _,comp in ipairs(machine.components) do
      if comp.shaft==g_shaft then
        shaft=machine.shafts[machine.components[comp.cmap[1]].shaft]
        break
      end
    end
  end
  magcoupling= shaft.cat1==guid1 and shaft.cat2==guid2 
  if magcoupling then
    percentslip=percentslip or .02
  else
    percentslip=percentslip or 0
  end
  local found ,spdinfo=get_store_value("spdinfo")
  local fired=false
  local sev1,sev2=0,0
  if #spdinfo==2 then
    local dif= math.abs(spdinfo[1][1]/spdinfo[1][2]-spdinfo[2][1]/spdinfo[2][2])
    local max= math.max(spdinfo[1][1]/spdinfo[1][2],spdinfo[2][1]/spdinfo[2][2])
    local min= math.min(spdinfo[1][1]/spdinfo[1][2],spdinfo[2][1]/spdinfo[2][2])
    local speed=machine.speed
    local vspeed=machine.vspeed/100
    if dif/max>percentslip then 
      fired=true
      sev1=(dif/max-percentslip)*100
    end
    if (speed-min)/speed>vspeed then
      fired=true
      sev2=((speed-min)/speed-vspeed)*100
    end
    if fired and sev1+sev2>=0 then
      debugprint('Slip Fault evaluation returned TRUE severity '..sev1+sev2) 
      assert2(sev1+sev2)
      assert3(.6)
      return true
    end    
  end
  debugprint('Slip Fault evaluation returned FALSE') 
  return false
end
--
-- Ghost Tone Fault - Ghost tones are tone produce from manufacturing defects on the face of the teeth.  We are looking for dominant tones that are undefined tone that are in the range of teeth plus 6 to 3.5*teeth that are harmonics of shaft rate.
--
function gearghosttones_parent()
  return true
end

function gearghosttones(element,brg,straxis,strrotorname,threshold,svrtymult) -- Checks for gear ghost tones shaft rate harmonic teeth+6 through 3.5*teeth that are sidebands of gear mesh or harmonics
  threshold,svrtymult=z_get_rule_tune_info(element,threshold,svrtymult)
  local rn=strrotorname or ''
  debugprint (rn.." Gear ghost tone rule started on "..rn.." Rotor",element,"bearing",brg,"axis",straxis)
  local thld = threshold
  local smult = svrtymult
  local sverity=0
  local conf=0
  local te=0
  local tc=0
  local awsth=110
  local sevthld=0
  local mpctth=.2
  local tago=get_tag_order( 'GRTTH', element, 1 )
  local teeth= tago.order
  local rF1x=analyze_by_tag( "1X", element, brg, straxis )
  increment_store_counter( "pt"..'1'..rn.."grghsttones" )
  local ordr1x=rF1x.sord
  local sr1x=rF1x.sfreq 
  local bearing,alias,spdratio =z_get_brg_and_data_set_speed_ratio(element,brg)
  local speed=get_speed_ratio_to_driver( brg )
  if sr1x==nil then
    for i,ds in ipairs (machine.datasets)  do
      if ds.dom=='spec' and ds.typ=='normal' and ds.axis==straxis and ds.mi==alias then
        sr1x=ds.speed*spdratio
        break
      end
    end 
  end
  local used_tones={}
  local used=false
  --
  local umtones=get_unusual_tones_from_cpl(element,brg,straxis,nil,nil,nil,true)
  if umtones.found then
    for _,tone in ipairs (umtones.tones) do
      debugprint(tone.sord,tone.gord,tone.dif,teeth)
    end 
    local _
    for _,tone in ipairs (umtones.tones) do
      if tone.dif~=nil  and round(tone.sord)==round(tone.sord,1) then
        if (tone.dif> g_fault_tone_threshold or (tone.dif>3 and  tone.sval >g_significance_threshold)) and tone.sord>teeth*1.1 and tone.sord<3.5*teeth  then
          local tsverity=z_amplitude_weighted_severity(tone.dif,tone.sval,awsth)
          if tsverity>sevthld then
            sverity=sverity+tsverity
            conf=stanford_conf(conf,.3)
            local sord=tostring(round((tone.gord),3))
            local inf=nopointzero(round(tone.sord))..'x('..tostring(round(speed,3))..'x)shft GT'
            local info=nopointzero(round(tone.sord))..'x('..tostring(round(speed,3))..'x) gear ghost tone on '..tostring(round(speed,3))..'x '..rn
            z_fault_tone_list(element,brg,straxis, tone.gord, tone.sval, tone.aval,tsverity,tone.sdsi,tone.sbin, info,inf, tone.sfreq) 
          end
        end -- if tone.dif >
      end  -- tone.dif not nil
    end -- for _,tone
  end  -- if umtones.found
  --
  if  umtones.found then
    local check,count = get_store_value("svrty"..'1'..rn.."grghsttones")
    if check==true then
      count = count + sverity*smult
    else
      count = sverity*smult
    end
    if sverity~=0 then
      put_store_value("svrty"..'1'..rn.."grghsttones",count)
      debugprint (rn.." Gear ghost tone fired - Severity",count,sverity)
      assert2(1)
      assert3(conf)
      return true
    end  
  end 

  debugprint (rn.." Gear ghost tone FALSE")
  return false
end  
--

function gearghosttonesseverity(element,strrotorname) -- Calculate nonsychronous bearing tone Normalized Severity
  element='1'
  local rn=strrotorname or ''
  debugprint ("Normalizing Gear ghost tone fault severity on element "..element.." on rotor "..rn)
  local check,count = get_store_value("pt"..element..rn.."grghsttones")
  local check1,svrty = get_store_value("svrty"..element..rn.."grghsttones")
  svrty=svrty or 0
  if check==true then
    svrty= svrty/count
    local fault=''
    if svrty>=0 then
      debugprint (rn.." Gear ghost tones Fault Calculated Normalized Severity",count,svrty,fault)
      assert2(svrty)
      put_store_value("grghsttones",svrty)
      return true
    end
  end
  debugprint (rn.." Gear ghost tones severity FALSE")
  assert3(-1)
  return false,0
end  -- function be

function gearmesh_parent()
  debugprint('Gearmesh fault tone and noise parent rule started')
  return true
end
function gearmesh_parent_severity()
  debugprint('Gearmesh fault tone and noise parent rule severity started')
  local tones,tonesvrty = get_store_value("GMTNS")
  local noise,noisesvrty = get_store_value("GMBBN")
  local svrty=0
  if tones then svrty=.6*tonesvrty end
  if noise then svrty=svrty+.2*noisesvrty end
  if svrty>0 then
    assert2(svrty)
    debugprint('Gearmesh fault tone and noise parent rule severity TRUE')
    return true
  else
    debugprint('Gearmesh fault tone and noise parent rule severity FALSE')
    assert3(-1)
    return false
  end
end
--
function fault_cleanup()
  for s,fault in ipairs(g_faults) do
    if fault~=nil then
      for guid,info in pairs (fault) do
        if info.conf<=0 or info.severity<1 then fault[guid]=nil end
      end
    end
  end
end
--
function demodtonematch(element,brg,straxis,strrotorname,threshold,svrtymult) -- Checks for tones in the demod spectra that match tones in the normal spectra
  threshold,svrtymult=z_get_rule_tune_info(element,threshold,svrtymult)
  local rn=strrotorname or ''
  debugprint (rn.." Demod tone nmatch rule started on "..rn.." Rotor",element,"bearing",brg,"axis",straxis, 'shaft',g_shaft_number)
  local thld = threshold
  local smult = svrtymult
  local sverity=0
  local conf=0
  local mi = safe_value_1( machine.components[g_shaft_number].map[brg], M_SHAFT_DATA_INDEX, brg )
  local alias = get_machine_element_alias(mi)
  if machine.elements[alias].data.spec~=nil and machine.elements[alias].data.spec.cpl~=nil and machine.elements[alias].data.spec.cpl.normal~=nil and machine.elements[alias].data.spec.cpl.normal[straxis] ~=nil then
    local pl=machine.elements[alias].data.spec.cpl.normal[straxis]
    if pl~=nil and pl.peaks~=nil and #pl.peaks>0 then

      increment_store_counter( "pt"..'1'..rn.."demod" )

      for _,p in ipairs(pl.peaks) do
        if string.match(p.flags,'d')~=nil then 
          if p.sev>0 then
            sverity=sverity+p.sev 
            conf=stanford_conf(conf,.2)
            local s=ConvertSpectrum( g_internal_unit  , Unit.U_VDB , p.sval )
            local a=ConvertSpectrum( g_internal_unit  , Unit.U_VDB , p.aval )
            local datami=z_fault_tone_list(element,brg,straxis,p.sord, s, a,p.sev,p.sdsi,p.sbin, 'Normal spec tone matched demod',"DEMOD", p.sfreq) 
            --z_flag_tone_as_found (element,brg,straxis, p.sfreq ,datami)
          end
        end
      end
      --
      if  sverity>0 then
        local check,count = get_store_value("svrty"..'1'..rn.."demod")
        if check==true then
          count = count + sverity*smult
        else
          count = sverity*smult
        end
        if sverity~=0 then
          put_store_value("svrty"..'1'..rn.."demod",count)
          debugprint (rn.." Demod match rule fired - Severity",count,sverity)
          assert2(1)
          assert3(conf)
          return true
        end  
      end 
    end
  end
  debugprint (rn.." Demod match rule FALSE")
  return false
end  
--

function demodtonematchseverity(element,strrotorname) -- Calculate demod mtone match Normalized Severity
  local rn=strrotorname or ''
  debugprint ("Normalizing demode tone match severity on element "..element.." on rotor "..rn)
  --local check2,points = get_store_value("pts"..element..rn.."demod")
  local check,count = get_store_value("pt"..element..rn.."demod")
  local check1,svrty = get_store_value("svrty"..element..rn.."demod")
  svrty=svrty or 0
  if check==true then
    svrty= svrty/count*2
    local fault=''
    if svrty>=0 then
      debugprint (rn.." demod tone match Fault Calculated Normalized Severity",count,svrty,fault)
      assert2(svrty)
      put_store_value("demod",svrty)
      return true
    end
  end
  debugprint (rn.." demod tone match severity FALSE")
  assert3(-1)
  return false,0
end  -- function 

function fixedspecparameter()
  local tab=get_custom_parameter()
  if tab==nil then return end
  local spec={}
  for para,val in pairs(tab) do
    if string.match(para,'SPEC')=='SPEC' then
      val=load('return '..val)()
      table.insert(spec,val)
    end
  end
  return spec
end
-- Fixed Specification Check Function
-- Specification amplitude, units, applicable tag and start and stop frequency are saved as a table in the machineclass custom parameters 
-- example: spec[1]={spec=1,startfreq=40,stoptfreq=65,unit='U_MILS',tag='1X'};spec[2]={spec=1.5,startfreq=10,stoptfreq=40,unit='U_MILS',tag='1X'}
-- If startfreq and stopfreq are nil then the spec has no frequency constraints
--**************************************************
function fixedspec(element,brg,straxis,strrotorname,threshold,svrtymult) -- Generic Rotor Balance Check Function
  threshold,svrtymult=z_get_rule_tune_info(element,threshold,svrtymult)
  local spec=fixedspecparameter() 
  local rn=strrotorname or ''
  debugprint ("Fixed specification started on "..rn.." Rotor",element,"bearing",brg,"axis",straxis)
  if spec~=nil and #spec>0 then

    local rff={}
    local balthld=threshold
    local smult=svrtymult
    local sverity=0
    local conf=0
    for _,sp in ipairs(spec) do
      local tag=sp.tag
      local spec=sp.spec
      local to_rms = 1
      if string.sub(sp.unit,3)=='MILS' then to_rms=2*math.sqrt(2) end
      local rFtag=analyze_by_tag( tag, element, brg, straxis )
      if rFtag.found then 
        increment_store_counter( "ptfix" )
        if rFtag.found and rFtag.sval>0 then
          local sval=rFtag.sval
          local ordr=rFtag.sord
          local freq=rFtag.sfreq
          local aval=ConvertSpectrum(Unit[sp.unit],GetUnitFromId(g_unit_id),spec/to_rms,freq)
          --local aval=20*math.log(freq*spec,10)+75
          if (sp.startfreq==nil or freq>=sp.startfreq) and (sp.stopfreq==nil or freq<sp.stopfreq) then

            local dif=sval-aval
            if dif >0  then
              sverity=z_amplitude_weighted_severity( dif,sval,threshold)*4
              conf=stanford_conf(conf,.3)
              local exc=round(ConvertSpectrum(GetUnitFromId(g_unit_id),Unit[sp.unit],sval,freq)*to_rms,2)
              local datami
              if trouble_shoot then
                datami=z_fault_tone_list(element,brg,straxis,ordr, sval, aval,sverity,rFtag.sdsi,rFtag.sbin, spec..' '..string.sub(sp.unit,3).." Fixed spec "..rn.." exceeded, "..exc..' '..string.sub(sp.unit,3)..' at '..round(freq,1)..' Hz',tag, freq) 
              else
                datami=z_fault_tone_list(element,brg,straxis,ordr, sval, aval,sverity,rFtag.sdsi,rFtag.sbin,  spec..' '..string.sub(sp.unit,3).." Fixed spec "..rn.." exceeded, "..exc..' '..string.sub(sp.unit,3)..' at '..round(freq,1)..' Hz',tag,freq) 
                --debugprint (sverity)
              end
              z_flag_tone_as_found (element,brg,straxis, freq ,datami)
              local check,count = get_store_value("fixsvrty")
              if check==true then
                count = count + sverity*smult
              else
                count = sverity*smult
              end
              if sverity~=0 then 
                put_store_value("fixsvrty",count)
                assert2(1)
                assert3(conf)
                debugprint ("Fixed spec rule fired - Severity",sverity,'dif',dif,'aval', aval,'sval', sval)
                return true
              end
            end
            break
          end
        end
      end
    end
  end
  debugprint ("Fixed spec rule FALSE")
  return false
end
--
-- Calculate balance Normalized Severity function
--
function fixedspecseverity(strrotorname) -- Calculate balance Normalized Severity function
  local name=strrotorname or ""
  debugprint (name..' Fixed spec normalization started')
  local check,count = get_store_value("ptfix")
  local check1,svrty = get_store_value("fixsvrty")
  if check==true then
    svrty= svrty/count*5  -- normalized to one axis and multiplied times 3 for scaling
    if svrty>=0 then
      debugprint ("-- Fixed spec Calculate Normalized Severity --",count,svrty,name,"Rotor Balance" )
      assert2(svrty)
      return true
    end
  end
  debugprint ("Balance severity false")
  return false
end
-- Sheave problem - looks at 1x and 2x of near sheave 
function sheaveproblem(element,brg,straxis,threshold,svrtymult) -- sheave problem - looks at 1x and 2x of near sheave 
  threshold,svrtymult=z_get_rule_tune_info(element,threshold,svrtymult)
  debugprint ("Sheave Problem started on Rotor",element,"bearing",brg,'axis',straxis )
  local ampthresh=threshold
  local smult = svrtymult
  local sverity=0
  local conf=0
  local rFpm=z_get123orders( "1X", element, brg, straxis ,true)
  if rFpm.found then 
    increment_store_counter( "sppt" )
    local dif1x=rFpm.dif1x
    local dif2x=rFpm.dif2x
    local dif3x=rFpm.dif3x
    local sval1x=rFpm.sval1x
    local sval2x=rFpm.sval2x
    local sord1x=rFpm.sord1x
    local sord2x=rFpm.sord2x
    if rFpm.aval==0 then
      dif1x=sval1x-ampthresh
      dif2x=sval2x-ampthresh
    end
    local datami=0
    if dif1x>0  then
      if (dif1x>g_fault_tone_threshold or (dif1x>3 and sval1x>g_significance_threshold)) then 
        local sverity1x=z_amplitude_weighted_severity(dif1x,sval1x,ampthresh)
        sverity=sverity+sverity1x  
        conf=stanford_conf(conf,.4)
        datami= z_fault_tone_list(element,brg,straxis, sord1x, sval1x, sval1x-dif1x,sverity1x,rFpm.dsi1x,rFpm.bin1x, "Sheave Problem",'1X',rFpm.sfreq)
        z_flag_tone_as_found (element,brg,straxis, rFpm.ord1freq,datami)
      end
    end
    if dif2x>0  then
      if (dif2x>g_fault_tone_threshold or (dif2x>3 and sval2x>g_significance_threshold)) then 
        local sverity2x=z_amplitude_weighted_severity(dif2x,sval2x,ampthresh)
        sverity=sverity+sverity2x  
        conf=stanford_conf(conf,.2)
        datami= z_fault_tone_list(element,brg,straxis, sord2x, sval2x, sval2x-dif2x,sverity2x,rFpm.dsi2x,rFpm.bin2x, "Sheave Problem",'2X',rFpm.sfreq*2)
        z_flag_tone_as_found (element,brg,straxis, rFpm.ord2freq,datami)
      end
    end

    if sverity>0 then
      local check,count = get_store_value("spsvrty")
      if check==true then
        count = count + sverity*smult
      else
        count = sverity*smult

      end 
      put_store_value("spsvrty",count)
      debugprint ("Sheave problem rule fired - Severity",count,"PPPPPPPPPPPPPPPPPP")
      assert2(1)
      assert3(conf)
      return true
    end
  end


  debugprint ("Sheave problem FALSE")
  return false
end
--
--
function sheaveproblemseverity () -- sheave problem normalization Function

  debugprint ("Sheave problem normalize started")
  local check,count = get_store_value("sppt")
  local check1,svrty = get_store_value("spsvrty")
  svrty=svrty or 0
  if check==true then
    svrty= svrty/count*2 -- timeS 3 for scaling
    if svrty>=0 then
      debugprint ("-- Calculate Normalized Severity --",count,svrty,"Sheave problem ")
      assert2(svrty)
      return true
    end
  end
  debugprint ("Sheave problem FALSE")
  return false
end

-- pulley belt rate fault
function beltrate(element,brg,straxis,strrotorname,threshold,svrtymult) -- Looks for tones at the calculated belt rate
  --
  -- EA shows belt rate as forcing order BR with nothing listed in the VTAG so it is determined imperically. 
  --
  -- To calculation for belt rate you need belt length or center specing of sheaves, which we rarely have, so we determine everything from what we do know BR and speed ratios.
  --
  -- belt length BL=(Pi*Dr)/BR were Dr=Pitch Dia. of sheave on reference shaft and BR=belt rate in orders of reference shaft
  --
  -- BL is also = 2C + Pi(D1 + D2)/2 + ((D1-D2)^2)/4C where C is sheave center distance, and D1 and D2 are the sheave pitch diamenters.
  --
  -- In most cases 2C + Pi(D1 + D2)/2 is close enough, the last term is small for center distances C/(D1+D2) ratios.
  --
  -- therefore C=((Pi*Dr)/BR - Pi(D1 + D2)/2)/2 which can be entered into PULLEYCENTERDIST attribute of the Pulleys composie
  --
  threshold,svrtymult=z_get_rule_tune_info(element,threshold,svrtymult)
  local rn=strrotorname or ''
  debugprint ("Belt rate evaluation started on "..rn.." Rotor",element,"bearing",brg,"axis",straxis)
  local BRthld=threshold 
  local smult=svrtymult
  local c=get_attribute_value( "PULLEYCENTERDIST", 0, 0 )
  local d1=get_attribute_value( "PULDIA", 2, 0 )
  local d2=get_attribute_value( "PULDIA", 4, 0 )
  local br=get_attribute_value( "PULLEYBELTRATE", 0, 0 )
  if (c==0 and d1==0 and d2==0) or br==0 then  
    debugprint (rn.." Belt rate failed due to not enough demensions available")
    return false
  end 

  local rF1x=analyze_by_tag( "1X", element, brg, straxis )
  if rF1x.found then
    increment_store_counter( "BRpt"..rn )
    local sr1x=rF1x.sfreq 
    local bearing,alias,spdratio =z_get_brg_and_data_set_speed_ratio(element,brg)
    local br1xord
    local dia=get_attribute_value( "PULDIA", element, 0 ) 
    if br==0  then
      local bl=(2*c)+((math.pi/2)*(d1+d2))+(math.abs(d1-d2)^2/(4*c))
      br1xord=(rF1x.sord*dia*math.pi)/bl
    else
      br1xord=br/spdratio*rF1x.sord
    end
    if sr1x==nil then
      for i,ds in ipairs (machine.datasets)  do
        if ds.dom=='spec' and ds.typ=='normal' and ds.axis==straxis and ds.mi==alias then
          sr1x=ds.speed*spdratio
          break
        end
      end 
    end
    local sval1x=rF1x.sval
    local check,count = get_store_value("BRsvrty"..rn)
    if check==false then count=0 end
    local step=.02
    local totalsvrity=0
    local sverity=0
    local conf=0
    local rFBR=0 
    local BRdif=0
    local BRval=0
    local BRord=0
    local BRmdif=0
    local BRbin=0
    local BRsfreq=0 
    local lastsval=0
    local lastdif=0
    local lastord=0
    local lastmdif=0
    local lastbin=0
    local lastsfreq=0
    local foundone=false
    for harm=1,4,1 do
      if foundone and harm<=3 then
        br1xord=lastord/(harm-1)
        foundone=false
      end
      lastsval=0
      lastdif=0
      local start=br1xord*harm-(.1*br1xord)
      local stop=br1xord*harm+(.1*br1xord)
      if stop-start>0 then
        for i=start,stop,(stop-start)/10 do
          rFBR = analyze_by_order( i, brg, straxis ,true,true,true )
          if rFBR~=nil and rFBR.found and rFBR.dif~=nil then
            local istarget,x,frac=z_is_a_multiple(i,rFBR.sord,.01) 
            istarget=istarget and x==1
            if istarget--[[frac<.015 or 1-frac<.015]] then
              local othershaft=false
              local ratio=get_comp_speed_ratios()[get_this_comp_number()]
              BRdif=rFBR.dif
              BRval=rFBR.sval
              BRord=rFBR.sord  
              BRmdif=rFBR.mdif
              BRbin=rFBR.sbin
              BRsfreq=rFBR.sfreq
              if BRval>lastsval then
                lastsval=BRval
                lastdif=BRdif
                lastord=BRord
                lastmdif=BRmdif
                lastbin=BRbin
                lastsfreq=BRsfreq
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
      local brsverity
      if not (othershaft) then
        if lastdif > g_fault_tone_threshold or (lastdif >3 and lastsval>g_significance_threshold) then 
          foundone=true
          brsverity=z_amplitude_weighted_severity(lastdif,lastsval,BRthld)
          sverity=sverity+brsverity
          conf=stanford_conf(conf,.4)
          z_fault_tone_list(element,brg,straxis, lastord, lastsval, lastsval-lastdif,brsverity ,rFBR.sbin,lastbin, harm.."x Belt rate Fault",harm..'x belt rate', lastord/spdratio*sr1x ) 
          z_flag_tone_as_found (element,brg,straxis,BRsfreq,bearing,true)
          debugprint( harm..'x Belt rate found at '..round(lastord,3)..'x on '..brg, straxis ,lastsval,brsverity, sverity) 
        end
      end

    end
    sverity = sverity*smult
    if sverity>0 then
      put_store_value("BRsvrty"..rn,count+sverity)
      debugprint ("Belt rate rule fired- Severity "..count+sverity.." on "..rn.." rotor")
      assert2(1)
      assert3(conf)
      return true
    end
    debugprint (rn.." Belt rate FALSE")
  else
    debugprint (rn.." Belt rate failed due to no 1X found")
  end

  return false
end
--
function beltrateseverity(strrotorname)-- Belt Rate normalization function
  local rn=strrotorname or ''
  debugprint ("Normalizing Belt rate severity fault on rotor "..rn)
  local check,count = get_store_value("BRpt"..rn)
  local check1,svrty = get_store_value("BRsvrty"..rn)
  svrty=svrty or 0
  if check==true then
    svrty= svrty/count*2
    if svrty>=0 then
      debugprint ("Belt rate Issue Calculated Normalized Severity",count,svrty)
      assert2(svrty)
      return true
    end
  end
  debugprint (rn.." ".." Belt rate severity FALSE")
  return false
end
-- 
function analyze_waveform_for_transcients( element, brg, straxis,rn,creshthreshhold ) 
  creshthreshhold=creshthreshhold or 4
  local ele = get_element(brg)
  local pl = safe_spec_cpl( ele, "normal", straxis )
  local dataspeed=ele.speedratio
  local shaftspeeds=get_comp_speed_ratios()
  local brgspeed=shaftspeeds[get_this_comp_number()]
  local speed={}
  for _,sp in ipairs (shaftspeeds) do
    speed[tostring(sp)]=true
  end
  local speeds={}
  for sp,_ in pairs(speed) do
    table.insert(speeds, tonumber(sp))
  end
  local ord1x=brgspeed/dataspeed
  local wfdsi=ele.data.time.normal[straxis]
  --Rocky Cannot Process it Nill Data
  if wfdsi==nil then  
    return false, 0
  end

  local fired=false
  local hits=0
  local bins={}
  local freq1x
  local tot,nt,maxv=0,0,0
  local pf=2  -- parcing factor
  local sr=1  -- sum range
  local dsi
  for _,dsi in ipairs(wfdsi) do
    local wave=machine.datasets[dsi].data
    local bw=machine.datasets[dsi].bw
    freq1x=machine.datasets[dsi].speed*ord1x
    local rms,min,max=rms(wave)
    local cresh=math.max(math.abs(max),math.abs(min))/rms
    if cresh>creshthreshhold then  -- Does the waveform have spikes
      local absdif={}
      for i,p in ipairs(wave) do
        local val=0
        if i<#wave-sr and i>sr then        
          for j=-sr,sr,1 do
            val=val+math.abs(p-wave[i+j])
          end
        end 
        -- parce the data and enter max of the data in the parce range
        local d,r=math.modf(i/pf)
        if r==0 and pf~=1 then  
          maxv=math.max(maxv,val)
          tot=tot+maxv
          nt=nt+1
          table.insert(absdif,maxv)
          maxv=0
        elseif  pf==1 then
          tot=tot+val
          nt=nt+1
          table.insert(absdif,val)
        else
          maxv=math.max(maxv,val)
        end
      end
      local ds={}
      ds['data']=absdif
      local y2 = spline( ds.data )
      ds["spline"] = y2

      ------------------------------
      --    Make the peak list

      local m,s=mean_and_stdv(12,ds.data)

      --Standard deviation captures 2/3 of the peak to peak value of 
      --pure gaussian noise.
      for k,v in ipairs(m) do
        m[k] = 1*v
      end

      ds["mps"] = m
      ds["splinemps"] = spline( m )

      local p=get_peaks(m,ds.data) 

      -- polish the peaks by looking for a more exact peak in the data spline.
      local peaks={}
      -- There is no sense in looking for a peak between n-1 and n, so
      -- we avoid that here.
      local n = #p - 1
      for k=1,n do
        local ip = p[k]
        local mv=ds.mps[ip] 
        local v,pk = findmaxima( ip-1,ip+1,ip,ds.data,ds.spline)
        --NOTE: Remove small peaks.  This is a global control and has
        --        to be coordinated with the engineering unit of the data.
        --        Perhaps could be based on machine.scale . 
        if (v-mv)/mv>.5 and v>tot/nt*2 then
          --debugprint( "Polished peak: ", pk, " value at peak: ", v )
          table.insert( peaks, {bin=pk,v=v,pvm=(v-mv)/mv,per=v/(tot/nt)}) 
        end
      end

      ds["peaks"] = peaks
      --local bins={}
      --for i=1,100,1 do
      --bins[i]=0
      -- end
      for i,pk1 in ipairs(peaks) do
        if i<#peaks then
          local n=0
          for j=i+1,#peaks,1 do

            local pk2=peaks[j]
            local bin1x=freq1x/(bw*pf)
            local bindif=pk2.bin-pk1.bin
            if bindif>bin1x*1.05 then break end
            local freqdif=round((1/(bindif*bw*pf)/1),0)
            if bins[freqdif]==nil then
              bins[freqdif]={t=(pk1.v+pk2.v)/2,n=1,val=(pk1.v+pk2.v)/2}
            else
              bins[freqdif]={t=bins[freqdif].t+(pk1.v+pk2.v)/2,n=bins[freqdif].n+1,val=(bins[freqdif].t+(pk1.v+pk2.v)/2)/(bins[freqdif].n+1)}
            end
          end
        end
      end
    end
  end
  local pks={}
  for i,b in pairs(bins) do
    local cat='val'
    local val=b[cat]

    local amp, ord=0,0
    if b.n>2 and bins[i-1]~=nil and bins[i+1]~=nil and b.n>bins[i-1].n and b.n>bins[i+1].n then -- dud
      amp=round(bins[i-1][cat]+val+bins[i+1][cat],2)
      ord=round((bins[i-1][cat]*(i-1)+val*i+bins[i+1][cat]*(i+1))/(bins[i-1][cat]+val+bins[i+1][cat])/freq1x,2)

    elseif b.n>1 and bins[i-1]==nil and bins[i+1]~=nil and (b.n>bins[i+1].n or (bins[i+2]==nil and b.n<bins[i+1].n)) then  -- nud or ndun
      amp=round(val+bins[i+1][cat],2)
      ord=round((val*i+bins[i+1][cat]*(i+1))/(val+bins[i+1][cat])/freq1x,2)

    elseif b.n>1 and bins[i-1]~=nil and bins[i+1]~=nil and bins[i+2]~=nil and b.n>bins[i-1].n and b.n==bins[i+1].n and b.n>bins[i+2].n then  -- deed
      amp=round(bins[i-1][cat]+val+bins[i+1][cat],2)
      ord=round((bins[i-1][cat]*(i-1)+val*i+bins[i+1][cat]*(i+1))/(bins[i-1][cat]+val+bins[i+1][cat]+bins[i+2][cat])/freq1x,2)

    elseif b.n>1 and bins[i-1]==nil and bins[i+1]~=nil and bins[i+2]~=nil and b.n==bins[i+1].n and b.n>bins[i+2].n then  -- need
      amp=round(val+bins[i+1][cat]+bins[i+2][cat],2)
      ord=round((val*i+bins[i+1][cat]*(i+1)+bins[i+2][cat]*(i+2))/(val+bins[i+1][cat]+bins[i+2][cat])/freq1x,2)

    elseif b.n>1 and bins[i-1]==nil and bins[i+1]~=nil and bins[i+2]==nil and b.n==bins[i+1].n then  -- neen
      amp=round(val+bins[i+1][cat],2)
      ord=round(((i+i+1)/2)/freq1x,2)

    elseif (b.n>1 or (val>0 and i/freq1x>.95 and i/freq1x<1.05)) and bins[i-1]==nil and bins[i+1]==nil then --nun
      ord =round(i/freq1x,2) 
      amp=val
    end
    if ord>0 then
      local ismult,m,r=z_is_a_multiple(1,ord,.06)
      if ismult and m<=10 then
        ismult=z_is_a_multiple(m,ord,.06/m)
      else
        ismult=false
      end
      local isother =false
      if ismult and #speeds>1 and m>2 then
        for _,sp in ipairs(speeds) do
          if round(sp,3)~= round(ord1x*dataspeed,3) then
            local ismulto,m,r=z_is_a_multiple(sp/dataspeed,ord,.06)
            if m>=2 then
              ismulto=z_is_a_multiple(m*sp/dataspeed,ord,.06/m)
            end
            if ismulto then isother=true end
          end
        end
      end
      if isother then ismult=false end

      pks[ord]={val=amp/3,harm=ismult}
    end
  end
  for ord,amp in pairs(pks) do
    local sev=0
    if (amp.harm and amp.val>tot/nt*2) then 
      sev=amp.val*10
    end
    if sev>0 then
      z_fault_tone_list(element,brg,straxis, ord, sev, (tot/nt) ,sev,dsi,1,'Impacting in waveform on '..rn, "WF Impct",ord*freq1x )
--z_fault_tone_list(element,brg,straxis, orderlow, sval, aval,sev,dsi,bin, info, fo_info, orderfreq, orderhigh)

      fired=true
      hits=hits+sev
    end

    local _
  end
  local _
  --end
  --end 
  return fired, hits
end

--
function impactingfault(element,brg,straxis,strrotorname,threshold,svrtymult) -- Checks for indications of repetitive impacting in waveform data
  threshold,svrtymult=z_get_rule_tune_info(element,threshold,svrtymult)
  local rn=strrotorname or ''
  local imptyp='Impact'
  if rn=='PUMP' then imptyp="Cavitation Impulse" end
  debugprint (rn..imptyp.." rule started on "..rn.." Rotor",element,"bearing",brg,"axis",straxis)
  local thld = threshold
  local smult = svrtymult
  local sverity=0
  local fired,hits=analyze_waveform_for_transcients( element, brg, straxis,rn,3) 
  increment_store_counter( "pt"..element..rn.."impact" )
  if fired then sverity=sverity+(hits) end
  --
  if  sverity>0 then
    local check,count = get_store_value("svrty"..element..rn.."impact")
    if check==true then
      count = count + sverity*smult
    else
      count = sverity*smult
    end
    if sverity~=0 then
      put_store_value("svrty"..element..rn.."impact",count)
      debugprint (rn.." impact fault fired - Severity",count,sverity)
      assert2(1)
      assert3(.2)
      --put_store_value(element.."CAVIMP",sverity)
      --if rn~='PUMP' then
      return true
      --else

      --end
    end  
  end 

  debugprint (rn.." impact fault FALSE")
  return false
end  
--

function impactingfaultseverity(element,strrotorname) -- Calculate impact fault match Normalized Severity
  local rn=strrotorname or ''
  debugprint ("Normalizing impact fault severity on element "..element.." on rotor "..rn)
  local check,count = get_store_value("pt"..element..rn.."impact")
  local check1,svrty = get_store_value("svrty"..element..rn.."impact")
  svrty=svrty or 0
  if check==true then
    svrty= svrty/count
    local fault=''
    if svrty>=0 then
      debugprint (rn.." impact fault Calculated Normalized Severity",count,svrty,fault)
      assert2(svrty)
      put_store_value("impact",svrty)
      put_store_value(element.."CAVIMP",svrty)
      return true
    end
  end
  debugprint (rn.." impact fault severity FALSE")
  assert3(-1)
  return false,0
end  -- function 
--
--[[ moved to functions.lua
function constantaccelspec(refval,order,reford,min) -- calculates a 6 dB per octave applitude reduction for a without average specification m
  reford=reford or 1
  min=min or 60
  local val=refval-10
  if order>reford*.95 then
    val= 20*math.log(reford/order,10)+refval
  end
  if val<min then val=min end
  return val
end ]]
--
function pump_cavitation_parent(element)
  debugprint('Pump cavitation parent rule started on element '..element)
  return true
end
function pump_cavitation_severity(element)
  debugprint('Pump Cavitation parent rule severity started')
  local imp,impsvrty = get_store_value(element.."CAVIMP")
  local pvnoise,pvnoisesvrty = get_store_value('BBsvrty'..element.."PVBN")
  local noise,noisesvrty = get_store_value('BBsvrty'..element.."CAVBN")
  local svrty=0
  if imp then svrty=.3*impsvrty end
  if pvnoise then svrty=svrty+.1*pvnoisesvrty end
  if noise then svrty=svrty+.1*noisesvrty end
  if svrty>0 then
    debugprint('Pump Cavitation parent rule severity TRUE')
    assert2(svrty)
    return true
  else 
    debugprint('Pump Cavitation parent rule severity FALSE')
    assert3(-1)
    return false
  end
end
-- TRAIN RATE RULE
function trainrate(element,brg,straxis,strrotorname,threshold,svrtymult) -- Looks for sideband series between .34x and .61x that is not .5x
  threshold,svrtymult=z_get_rule_tune_info(element,threshold,svrtymult)
  local rn=strrotorname or ''
  local rff={}
  debugprint ("Train Rate rule started on "..rn.." Rotor",element,"bearing",brg,"axis",straxis)
  local balthld=threshold
  local smult=svrtymult
  local sverity=0
  local conf=0
  local rFBal=find_tag_info( "1X", element, brg, straxis )
  if rFBal.found then
    local sub1x=get_sub1xrepeats_from_cpl(element,brg,straxis) 
    increment_store_counter( "pttr" )
    if sub1x~={} then
      local bearing,alias,spdratio =z_get_brg_and_data_set_speed_ratio(element,brg)
      local shaftspeeds=get_comp_speed_ratios()
      local ratios,speeds={},{}
      for ci,csr in pairs (g_comp_speed_ratio) do
        ratios[csr]=true
      end    
      for rat,_ in pairs(ratios) do
        table.insert(speeds,rat/spdratio)
      end
      local isa1x,istrainrate=false,false
      for fr,val in pairs(sub1x) do
        for _,sp in ipairs(speeds) do
          local ismult,m,r=is_a_multiple(sp,fr,.003)
          if ismult --[[and m==1]] and not(isa1x) then isa1x=true end
        end

        if not(isa1x) and fr/spdratio>.34 and fr/spdratio<.48 then 
          istrainrate=true
          if istrainrate and val.sev~=nil and val.sev>10 and val.hits>3  then
            sverity=sverity+val.sev
            conf=stanford_conf(conf,.3)
            local datami

            datami=z_fault_tone_list(element,brg,straxis,fr, val.hits,0,val.sev,rFBal.dsi,rFBal.bin, "Bearing Train Rate "..rn,"1X", machine.datasets[rFBal.dsi].speed*fr/spdratio)

            --z_flag_tone_as_found (element,brg,straxis, rFBal.sfreq ,datami)
            local check,count = get_store_value("trsvrty")
            if check==true then
              count = count + sverity*smult
            else
              count = sverity*smult
            end


            if sverity~=0 then 
              put_store_value("trsvrty",count)
              assert2(1)
              assert3(conf)
              debugprint ("Train Rate rule fired - Severity",sverity,' hits',val.hits,'sev', val.sev,'ord',fr,'shaft order',fr/spdratio)
            end
          end 
        end
      end
      if sverity~=0 then return true end
    end  
  end
  debugprint ("Train Rate rule FALSE")
  return false
end
--
-- Calculate Train Rate Normalized Severity function
--
function trainrateseverity(strrotorname) -- Calculate Train Rate Normalized Severity function
  local name=strrotorname or ""
  debugprint (name..' Train Rate severity normalization started')
  local check,count = get_store_value("pttr")
  local check1,svrty = get_store_value("trsvrty")
  if check==true then
    svrty= svrty/count*1   -- normalized to one axis and multiplied times 8 for scaling
    if svrty>=0 then
      debugprint ("-- Calculate Normalized Severity --",count,svrty,name,"Train Rate" )
      assert2(svrty)
      return true
    end
  end
  debugprint ("Train Rate severity false")
  return false
end
function get_sub1xrepeats_from_cpl(element,brg,axis,sev_th,nr,sval_th,ghost)
  local mi = safe_value_1( machine.components[g_shaft_number].map[brg], M_SHAFT_DATA_INDEX, brg )
  local alias = get_machine_element_alias(mi)
  local pl=machine.elements[alias].data.spec.cpl.normal[axis]
  local shaftspeed=machine.elements[alias].speedratio
  local cn=get_this_comp_number()
  local shaftspeeds=get_comp_speed_ratios()
  local ss1x=shaftspeeds[machine.ispeed]
  local s1x=shaftspeeds[cn]
  local brgspeed=s1x/shaftspeed
  local srat=get_speed_ratio_to_driver( brg )
  local harmonics={}
  for fr,v in pairs(pl.sub1x_spacing) do
    fr=tostring(fr)
    if pl.harmonics[fr]~=nil then
      harmonics[fr]={}
      local temp={}
      for _,pi in ipairs(pl.harmonics[fr]) do
        --temp=
        table.insert(harmonics[fr],pl.peaks[pi])
      end
    end
  end


  return pl.sub1x_spacing,harmonics
end 
-- Bearing RE broken Cage
function brokencage(element,brg,straxis,strrotorname,threshold,svrtymult) -- Looks for train rate harmonic .(34x and .48x)
  threshold,svrtymult=z_get_rule_tune_info(element,threshold,svrtymult)
  local rn=strrotorname or ''
  local rff={}
  debugprint ("Broken Cage rule started on "..rn.." Rotor",element,"bearing",brg,"axis",straxis)
  local balthld=threshold
  local smult=svrtymult
  local sverity,sver=0
  local conf=0
  local rFBal=find_tag_info( "1X", element, brg, straxis )
  if rFBal.found then
    local order1x=rFBal.order
    local sub1x,harmonics=get_sub1xrepeats_from_cpl(element,brg,straxis) 
    increment_store_counter( "ptbc" )
    if sub1x~={} then
      local bearing,alias,_,spdratio =z_get_brg_and_data_set_speed_ratio(element,brg)
      local shaftspeeds=get_comp_speed_ratios()
      local ratios,speeds={},{}
      for ci,csr in pairs (g_comp_speed_ratio) do
        ratios[csr]=true
      end    
      for rat,_ in pairs(ratios) do
        table.insert(speeds,rat/spdratio)
      end
      local isa1x,istrainrate=false,false
      for fr,val in pairs(sub1x) do
        for _,sp in ipairs(speeds) do
          local ismult,m,r=is_a_multiple(sp,fr,.003)
          if ismult --[[and m==1]] and not(isa1x) then isa1x=true end
        end

        if not(isa1x) and fr/order1x>.34 and fr/order1x<.48 then 
          istrainrate=true
          if istrainrate and val.sev~=nil and val.sev>10 and val.hits>3  then
            if harmonics[tostring(fr)]~=nil and #harmonics[tostring(fr)]>0 then
              for _,pk in ipairs(harmonics[tostring(fr)]) do
                local isshaftmult=false
                for _,sp in ipairs(speeds) do
                  local ismult,m,r=is_a_multiple(sp,pk.sord,.003)
                  if ismult then  isshaftmult=true end
                end
                if true or not (isshaftmult) --[[and pk.sord/fr<8]] then
                  local aval=ConvertSpectrum( g_internal_unit  , Unit.U_VDB , pk.aval )
                  local sval=ConvertSpectrum( g_internal_unit  , Unit.U_VDB , pk.sval )
                  local dif=sval-aval

                  if ((dif > g_fault_tone_threshold or (dif >3  and sval>g_significance_threshold)))then
                    sver=z_amplitude_weighted_severity( dif,sval,balthld)
                    sverity=sverity+sver
                    conf=stanford_conf(conf,.2)
                    local datami
                    debugprint(nopointzero(round(pk.sord/fr))..'x Cage Rate Tone at '..round(pk.sord,3)..' orders '..round(pk.sfreq,2)..' Hz '..round(sver,1)..' severity')
                    datami=z_fault_tone_list(element,brg,straxis,pk.sord, sval, aval,sver,pk.sdsi,pk.sbin, nopointzero(round(pk.sord/fr))..'x('..fr..') Cage Rate Harmonic '..rn,nopointzero(round(pk.sord/fr))..'x('..fr..')Cage', pk.sfreq) 

                    --z_flag_tone_as_found (element,brg,straxis, rFBal.sfreq ,datami)
                  end
                end
              end
            end
            local check,count = get_store_value("bcsvrty")
            if check==true then
              count = count + sverity*smult
            else
              count = sverity*smult
            end


            if sverity~=0 then 
              put_store_value("bcsvrty",count)
              assert2(1)
              assert3(conf)
              debugprint ("Broken Cage rule fired - Severity",sverity,'ord',fr,'shaft order',fr/spdratio)
            end
          end 
        end
      end
      if sverity~=0 then return true end
    end  
  end
  debugprint ("Broken Cage rule FALSE")
  return false
end
--
-- Calculate Train Rate Normalized Severity function
--
function brokencageseverity(strrotorname) -- Calculate Broken Cage Normalized Severity function
  local name=strrotorname or ""
  debugprint (name..' Broken Cage severity normalization started')
  local check,count = get_store_value("ptbc")
  local check1,svrty = get_store_value("bcsvrty")
  if check==true then
    svrty= svrty/count*3   -- normalized to one axis and multiplied times 8 for scaling
    if svrty>=0 then
      debugprint ("-- Calculate Normalized Severity --",count,svrty,name,"Broken Cage" )
      assert2(svrty)
      return true
    end
  end
  debugprint ("Broken Cage severity false")
  return false
end
function mixedpickups()
  local result={}
  local maxgrtr=0
  local maxless=0
  local ret=false
  local sev,goods,avedif,pu,isoks=0,0,0,0,0
  local louddata=false
  local dupdata=get_fault_all('e20f8da1-d8f7-4153-99fa-f1482b7d80b9') -- search for duplicate data fault firing in quality.
  if not (dupdata) then
    for e1,e in ipairs(machine.elements) do 
      if e.data~=nil and e.data.spec~=nil and e.data.spec.cpl~=nil then
        for typ,axes in pairs(e.data.spec.cpl) do
          if typ=='normal' then
            for ax, pl in pairs(axes) do
              if ax=='a' and pl.aveavecomp~=nil then
                result[e1]={}
                result[e1].data={}
                for e2,inf in pairs(pl.aveavecomp) do
                  result[e1].data[e2]={}
                  result[e1].data[e2].ac=pl.aveavecomp[e2]
                  result[e1].data[e2].pfrat=pl.aveavecomp[e1].percentfound/pl.aveavecomp[e2].percentfound
                  if machine.elements[e2].data.spec.cpl.normal.a~=nil then 
                    result[e1].data[e2].avesameas=machine.elements[e2].data.spec.cpl.normal.a.avetoave.avesameas
                    if e1==e2 then
                      result[e1].data[e2].isok= inf.percentgreater<=25 and inf.percentless<=50 and math.abs(inf.dbgreater-inf.dbless)<=25 --and (inf.hftotal<10 or (inf.hftotal>=10 and inf.hfpercentfound>=10))
                    else
                      result[e1].data[e2].better=(pl.aveavecomp[e1].percentgreater+pl.aveavecomp[e1].percentless)>inf.percentgreater+inf.percentless and inf.percentgreater<=15 and inf.percentless<=30 and math.abs(inf.dbgreater-inf.dbless)<=10
                      result[e1].data[e2].worse=  inf.percentgreater>30 or inf.percentless>60 or math.abs(inf.dbgreater-inf.dbless)>30

                    end
                  end
                  maxgrtr=math.max(maxgrtr,inf.percentgreater)
                  maxless=math.max(maxless,inf.percentless)
                end
              end
            end
          end
        end
      end
    end
    for e1,inf in pairs(result) do
      pu=pu+1
      local lc,c=0,0
      local itsok=inf.data[e1].isok
      local dupave={}
      if inf.data[e1].avesameas~=nil and inf.data[e1].avesameas then
        for i,v in ipairs(inf.data[e1].avesameas) do
          --dupave[i]=v
          dupave[v]=true
        end
      end
      for e2,data in pairs (inf.data) do
        local good=0
        local cpl=machine.elements[e1].data.spec.cpl
        local sigdif=false
        if cpl['normal']~=nil and cpl['normal']['a']~=nil and cpl['normal']['a']['avetoave']~=nil and cpl['normal']['a']['avetoave'][e2]~=nil then 
          local avetoave=cpl['normal']['a']['avetoave'][e2]
          local lopct=0
          if avetoave.matches>0 then lopct=avetoave.less/avetoave.matches end
          local hipct=0 
          if avetoave.matches>0 then hipct=avetoave.greater/avetoave.matches end
          if ((hipct>=1/4 or lopct>=1/4) and avetoave.matches>6) or hipct>=.5 or lopct>=.5 or math.abs(avetoave.dbgreater+avetoave.dbless)>=20 then 
            sigdif=true
            avedif=avedif+1
          else
            avedif=avedif-1
          end
        end
        c=c+1
        if data.ac.percentgreater>=50 then
          lc=lc+1
        end

        if e1==e2  then
          if data.isok then
            isoks=isoks+1 
            good=good+1
          end
          if  data.ac.hftotal>=10 and (data.ac.hfpercentfound>60 or data.ac.hftotal*data.ac.hfpercentfound/100>12)  then  -- real1y good hf match to average
            good=good+1
          end 
          if  data.ac.hftotal>=5 and data.ac.hfpercentfound>=20 then  -- ok hf match to average
            good=good+1
          end 
          if data.ac.hftotal>=10 and data.ac.hfpercentfound<=5 then -- real1y bad hf match to average
            good=good-1
          end
          goods=goods+good
        else if e1~=e2 and sigdif and not(dupave~=nil and dupave[e2]~=nil and dupave[e2]) then
          if data.avesameas~=nil and data.avesameas then
            for i,v in ipairs(data.avesameas) do
              --dupave[i]=v
              dupave[v]=true
            end
          end
          --if data.ac.prctgreaterabs<40 then
          if  data.ac.hftotal>=10 and (data.ac.hfpercentfound>60 or data.ac.hftotal*data.ac.hfpercentfound/100>12)  then  -- real1y good hf match to other average
            good=good-1
          end
          if data.ac.hftotal>=5 and data.ac.hfpercentfound>=20  then  -- ok hf match to other average
            good=good-1
          end
          --end
          if data.ac.hftotal>=10 and data.ac.hfpercentfound<=5  then -- real1y bad hf match to other average
            good=good+1
          end
          if  data.better   then -- data is significantly closer to +10/-23 dB band of other average then this average
            good=good-1
          end
          if data.worse   then -- data is significantly closer to +10/-23 dB band of this other average then other average
            good=good+1
          end
          goods=goods+good
        end
        local _
      end
    end

    if lc==c then 
      louddata=true
    end
  end
  sev=maxgrtr

  if goods<0 and not(louddata) and sev>20 and avedif>=0 and pu>1 and not (isoks>=pu-1 and pu>2) then
    assert2(sev)
    return true
  end
end
return false
end

-- Calibration check
function calcheck(element,brg,straxis,threshold,svrtymult) -- Coupling Angular Misalignment Check Function
  threshold,svrtymult=z_get_rule_tune_info(element,threshold,svrtymult)
  debugprint ("Calibration check on ",straxis)
  local useave=false
  local balthld = threshold
  local smult = svrtymult
  local sverity=0
  local conf=0
  local rFAm=z_get123orders( "1X", element, brg, straxis,true )
  if rFAm.found then 
    increment_store_counter( "calpt" )
    local datami
    local dif1x=math.abs(rFAm.dif1x)
    if rFAm.aval1x>0 and useave then
      if math.abs(rFAm.dif1x)>3 then  --or rFAm.dif2x>6 or FAm.dif3x>6 then
        conf=stanford_conf(conf,.3)
        local calsvty=6*math.abs(rFAm.dif1x)
        sverity=calsvty
        datami=z_fault_tone_list(element,brg,straxis, rFAm.sord1x, rFAm.sval1x, rFAm.aval1x,calsvty,rFAm.dsi1x,rFAm.bin1x, "Accelerometer Cal 1X",'Cal 1X', rFAm.sfreq) 
        z_flag_tone_as_found (element,brg,straxis, rFAm.ord1freq ,datami)
      end
      if math.abs(rFAm.dif2x)>6 then 
        conf=stanford_conf(conf,.1)
        local calsvty=6*math.abs(rFAm.dif2x)
        sverity=sverity+calsvty
        datami=z_fault_tone_list(element,brg,straxis, rFAm.sord2x, rFAm.sval2x, rFAm.aval2x,calsvty,rFAm.dsi2x,rFAm.bin2x, "Accelerometer Cal 2X",'Cal 2X', rFAm.ord2freq) 
        z_flag_tone_as_found (element,brg,straxis, rFAm.ord2freq ,datami)
      end
      if math.abs(rFAm.dif3x)>6 then 
        conf=stanford_conf(conf,.1)
        local calsvty=6*math.abs(rFAm.dif3x)
        sverity=sverity+calsvty
        datami=z_fault_tone_list(element,brg,straxis, rFAm.sord3x, rFAm.sval3x, rFAm.aval3x,calsvty,rFAm.dsi3x,rFAm.bin3x, "Accelerometer Cal 2X",'Cal 2X', rFAm.ord3freq) 
        z_flag_tone_as_found (element,brg,str, rFAm.ord2freq ,datami)
      end


    else
      local ampthresh=tonumber(get_attribute_value("AMPTHRESH",element, 112))
      if rFAm.sval1x>0 then 
        dif1x=math.abs(rFAm.sval1x - ampthresh)
      else
        dif1x=0
      end
      if dif1x>3 then
        local calsv = dif1x*10
        conf=stanford_conf(conf,.3)
        sverity=calsv
        datami=z_fault_tone_list(element,brg,straxis, rFAm.sord1x, rFAm.sval1x, ampthresh,calsv,rFAm.dsi1x,rFAm.bin1x, "Accelerometer Cal 1X",'Cal 1X', rFAm.sfreq) 
        z_flag_tone_as_found (element,brg,straxis, rFAm.ord1freq ,datami)
      end
    end
    if sverity>0 then
      local check,count = get_store_value("calsvrty")
      if check==true then
        count = count + sverity*smult
      else
        count = sverity*smult
      end
      put_store_value("calsvrty",count)
      debugprint ("Cal Check rule fired",sverity,count,"AAAAAAAAAAAAAAAAAAAAAA")
      assert2(1)
      assert3(conf)
      return true
    end
  else
    --datami=z_fault_tone_list(element,brg,straxis, rFAm.sord1x, rFAm.sval1x, ampthresh,calsv,rFAm.dsi1x,rFAm.bin1x, "Coupling Misalignment - Angular",'1x(1X)', rFAm.sfreq) 
    --z_flag_tone_as_found (element,brg,straxis, rFAm.ord1freq ,datami)
    increment_store_counter( "calpt" )
    local check,count = get_store_value("calsvrty")
    if check==true then
      count = count + 100
    else
      count = 100
    end
    put_store_value("calsvrty",count)
    debugprint ("Cal Check rule fired",sverity,count,"AAAAAAAAAAAAAAAAAAAAAA")
    assert2(1)
    assert3(conf)
    return true
  end

  debugprint ('Cal Check false')
  return false
end
--
function calcheckseverity () -- Calibration Check Severity
  debugprint ("Cal Check severity started")

  local check,count = get_store_value("calpt")
  local check1,svrty = get_store_value("calsvrty")
  svrty=svrty or 0
  if check==true then
    svrty= svrty/count*3 -- times 3 for scaling
    if svrty>=0 then
      debugprint ("-- Calculate Normalized Severity --",count,svrty,"Calibration Check")
      assert2(svrty)
      return true
    end
  end
  debugprint ("Calibration Check severity FALSE")
  return false
end

