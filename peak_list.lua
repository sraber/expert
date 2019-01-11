-- peak_list.lua   rev 12  12/17/2018
--

function reduced_peak_list()
  local amp
  local aveamp
  local avebin
  local pkamp
  local pkbin
  local s
  local a
  local d
  local m
  local mamp
  local aveds
  local pk_amp={}
  g_peak_list={}
  g_fault_tones={}
  g_fault_tones_xml=''
  g_peak_list_xml=''
  local peak_list, pkdata=z_composite_peak_list('normal',nil,true)  -- get normal spectru peak list x scale info
  g_pkdata=pkdata
  local comp_peak_list={}
  local pk={}
  local sds_speed=0
  local ndif=0
  local tdif=0
  local flag={}

  --
  -- add amplitudes to data peak list
  --
  for i,mia in ipairs(peak_list) do
    local ord1x=1
    if #mia.peaks>0 then
      sds_speed=machine.datasets[mia.peaks[1].ds].speed
      for j,pk in ipairs(mia.peaks) do
        local col=pk.order    
        local colis1x,x,rmdr = z_is_a_multiple(1,col,.01)--math.modf(col)      
        colis1x=colis1x and x==1
        if colis1x then 
          sds_speed=machine.datasets[pk.ds].speed
        end
      end -- for j,pk
      pk_amp={}
      ndif=0
      tdif=0
      for j,pk in ipairs(mia.peaks) do  -- add amplitudes to normal data peaks
        local avefmax=0
        local flags=pk.flags or '-'
        amp=ds_spline_value( machine.datasets[pk.ds], pk.bin )
        s=ConvertSpectrum( g_internal_unit  , Unit.U_VDB , amp )
        mamp=ds_spline_avg( machine.datasets[pk.ds], pk.bin )
        m=ConvertSpectrum( g_internal_unit  , Unit.U_VDB , mamp )
        local haveave=false
        local order=pk.order/ord1x
        local torder = math.abs(round (order)-order)
        if torder>.02 then 
          order=tostring(round(order,2))
        else
          order=tostring(round(order,1))
        end
        if  avefmax>pk.freq and haveave and false then
          --if pk.order>.1 then
          table.insert(pk_amp,{pk_index=j,sfreq=pk.freq,afreq=(pkbin-1)*machine.datasets[aveds].bw*machine.datasets[aveds].speed,sbin=pk.bin,sord=pk.order/ord1x,order=order,sval=s,aval=a,dif=s-a,aord=(pkbin-1)*machine.datasets[aveds].bw, abin=pkbin,adsi=aveds,sdsi=pk.ds, mval=m,mdif=s-m, matches=pk.matches , flags=flags, sb_severity={} , sb_energy={} , harm_energy=0 , harm_severity=0 , sidebands={} , subharmonics={} , harm_pk_index={} , rules={}})
          ndif=ndif+1
          tdif=tdif+(s-a)
          --end
        else
          table.insert(pk_amp,{pk_index=j,sfreq=pk.freq , sbin=pk.bin , sord=pk.order/ord1x ,order=order, sval=s , sdsi=pk.ds , mval=m , mdif=s-m ,flags=flags, sb_severity={} , sb_energy={} , harm_energy=0 , harm_severity=0 , sidebands={} , matches=pk.matches , subharmonics={} , harm_pk_index={} , rules={} })
        end
      end -- for j,pk in mia.peaks
      local ave_dif=0
      if ndif~=0 then ave_dif=tdif/ndif end
      table.insert(comp_peak_list,{mi=mia.mi, axis=mia.axis,ave_peaks={}, peaks=pk_amp,sorts={}, vmel_datasource = machine.elements[mia.mi].guid, ave_dif=ave_dif, datasets=mia.datasets,shaftspeed=mia.shaftspeed})
    else
      table.insert(comp_peak_list,{mi=mia.mi, axis=mia.axis, ave_peaks={}, peaks={},sorts={},vmel_datasource = machine.elements[mia.mi].guid, ave_dif=0,datasets=mia.datasets,shaftspeed=mia.shaftspeed})
    end -- if #mia.peaks>0 
  end  -- for i,mia
  --comp_peak_list=z_analyze_peaklist_for_sidebands(comp_peak_list, "2xLF")
  --comp_peak_list=z_analyze_peaklist_for_sidebands(comp_peak_list, 1)
  comp_peak_list=z_analyze_peaklist_for_harmonics(comp_peak_list,true)
  local speeds=get_comp_speed_ratios
--comp_peak_list=z_analyze_peaklist_for_sidebands(comp_peak_list, 1.14)
  comp_peak_list=z_sort_peak_info(comp_peak_list)

--comp_peak_list=z_add_rules_to_peaklist(comp_peak_list)
  return comp_peak_list
end
--
function peak_list(sr1xs)
  local amp
  local aveamp
  local avebin
  local pkamp
  local pkbin
  local s
  local a
  local d
  local m
  local mamp
  local aveds
  local pk_amp={}
  g_peak_list={}
  g_fault_tones={}
  g_fault_tones_xml=''
  g_peak_list_xml=''
  local peak_list, pkdata=z_composite_peak_list('normal')  -- get normal spectru peak list x scale info
  g_pkdata=pkdata
  --peak_list=add_1x_place_holders_to_pl (peak_list)
  --table.move(pkdata,1,#pkdata,1,g_pkdata)
  local ave_pk_list, ave_pkdata=z_composite_peak_list('average',false)-- get average spectra peak list x scale info in ascending order
  g_ave_pkdata=ave_pkdata
  --table.move(ave_pkdata,1,#ave_pkdata,1,g_ave_pkdata)
  _, ave_pkdata=z_composite_peak_list('average',true) 
  local demode_pk_list, dmdata=z_composite_peak_list('demod') -- get demod spectra peak list x scale info
  local comp_peak_list={}
  local avefmax=0
  local pk={}
  local sds_speed=0
  local ndif=0
  local tdif=0
  local flag={}
  --
  -- add amplitudes to average peak list
  --
  local ave_pk_amp={}
  for i,mia in ipairs(ave_pk_list) do 
    for  j,pk in ipairs(mia.peaks) do
      if pk~=nil then
        aveamp=ds_spline_value( machine.datasets[pk.ds], pk.bin )
        a=ConvertSpectrum( g_internal_unit  , Unit.U_VDB , aveamp )
        mamp=ds_spline_avg( machine.datasets[pk.ds], pk.bin )
        m=ConvertSpectrum( g_internal_unit  , Unit.U_VDB , mamp )
        table.insert(pk_amp,{pk_index=j,afreq=pk.freq,abin=pk.bin,aord=pk.order,aval=a,adsi=pk.ds, mval=m,mdif=a-m})
      else
        table.insert(pk_amp,{pk_index=j,afreq=0,abin=0,aord=0,aval=0,adsi=0, mval=0,mdif=0})
      end
    end -- for  j,pk
    table.insert(ave_pk_amp,pk_amp)
    pk_amp={}
  end  -- for i,mia
  --
  -- add amplitudes to data peak list
  --
  for i,mia in ipairs(peak_list) do
    local ord1x=1
    if #mia.peaks>0 then
      sds_speed=machine.datasets[mia.peaks[1].ds].speed
      for j,pk in ipairs(mia.peaks) do
        local col=pk.order    
        local colis1x,x,rmdr = z_is_a_multiple(1,col,.01)--math.modf(col)      
        -- x=math.modf(x+round(rmdr))  
        colis1x=colis1x and x==1
        if colis1x then 
          --ord1x=col
          sds_speed=machine.datasets[pk.ds].speed
        end
      end -- for j,pk
      pk_amp={}
      ndif=0
      tdif=0
      for j,pk in ipairs(mia.peaks) do  -- add amplitudes to normal data peaks
        avefmax=0
        local flags=pk.flags or '-'
        amp=ds_spline_value( machine.datasets[pk.ds], pk.bin )
        s=ConvertSpectrum( g_internal_unit  , Unit.U_VDB , amp )
        mamp=ds_spline_avg( machine.datasets[pk.ds], pk.bin )
        m=ConvertSpectrum( g_internal_unit  , Unit.U_VDB , mamp )
        for _,dmia in ipairs(demode_pk_list) do  -- add demode flag to peaks
          if dmia~=nil then
            if dmia.mi==mia.mi then
              local closer=false
              for _,dmpk in ipairs(dmia.peaks) do
                if dmpk~=nil then
                  if round(dmpk.freq/pk.freq,1)==1 then
                    if j+1<=#mia.peaks then
                      if round(dmpk.freq/mia.peaks[j+1].freq,1)==1 then
                        local r0=math.fmod(dmpk.freq,pk.freq)
                        r0=math.min(math.abs(r0),math.abs(1-r0))
                        local r1=math.fmod(dmpk.freq,mia.peaks[j+1].freq)
                        r1=math.min(math.abs(r1),math.abs(1-r1))
                        if r0<r1 or closer then

                          if round(pk.freq/dmpk.freq,2) <=1.01 and round(pk.freq/dmpk.freq,2) >=.98 then  -- Look for demod peaks up to 7% higher freq from AQ-204 data
                            local dmamp=ds_spline_value( machine.datasets[dmpk.ds], dmpk.bin )
                            local dmmamp=ds_spline_avg( machine.datasets[dmpk.ds], dmpk.bin )
                            local sig=dmamp/dmmamp
                            if sig>1 then 
                              flags=add_flag(flags,'d')
                            end  --  if dm pk is significant
                          end  -- if freqs match
                          closer=false
                        else
                          closer=true
                        end
                      else
                        ---if round(dmpk.freq/pk.freq,2)==1 then
                        if round(pk.freq/dmpk.freq,2) <=1 and round(pk.freq/dmpk.freq,2) >=.93 then  -- Look for demod peaks up to 7% higher freq from AQ-204 data
                          local dmamp=ds_spline_value( machine.datasets[dmpk.ds], dmpk.bin )
                          local dmmamp=ds_spline_avg( machine.datasets[dmpk.ds], dmpk.bin )
                          local sig=dmamp/dmmamp
                          if sig>1 then 
                            flags=add_flag(flags,'d')
                          end  --  if dm pk is significant
                        end  -- if freqs match 
                      end  --if round(dmpk.freq/mia.peaks[j+1].freq,1)==1
                    end --if j+1>#mia.peaks
                    --end
                    if dmpk.freq > pk.freq*1.07 then break end
                  end  -- if round(dmpk.freq/pk.freq)==1
                end  -- if dmpk~=nil
              end  -- for _,dmpk
            end  -- if dmia.mi==mia.mi
          end  --if dmia~=nil
        end  -- for _,dmia
        local haveave=false
        --
        for m,ave in ipairs( ave_pkdata ) do-- add amplitudes to average data peaks
          local mi=tonumber(string.sub( ave.mia, 1,3),10)
          local axis=string.sub( ave.mia, 4)
          if mia.mi==mi and mia.axis==axis and pk.freq<ave.fmax then
            avebin=((pk.order/ord1x)/machine.datasets[ave.ds].bw+1) --*(sds_speed/ads_speed) 
            if avebin>1 and avebin < #machine.datasets[ave.ds].data - g_bin_margin - 2 then
              local ads_speed=machine.datasets[ave.ds].speed
              avefmax=ave.fmax
              aveds=ave.ds
              pkamp=ds_spline_value( machine.datasets[aveds], avebin )
              pkbin=avebin
              local bin_margin=g_bin_margin/machine.datasets[aveds].bw/100
              for bin=avebin-bin_margin,avebin+bin_margin, .1 do  
                haveave=true
                if bin>1 and bin<=#machine.datasets[aveds].data-1  then
                  aveamp=ds_spline_value( machine.datasets[aveds], bin )  -- spline amplitude
                  --aveamp=machine.datasets[aveds].data[round( bin )] -- bin amplitue
                end
                if aveamp~=nil then 
                  if aveamp > pkamp then
                    pkamp=aveamp
                    pkbin=bin
                  end
                end
              end
              a=ConvertSpectrum( g_internal_unit  , Unit.U_VDB , pkamp )
            end
          end
        end
        local order=pk.order/ord1x
        local torder = math.abs(round (order)-order)
        if torder>.02 then 
          order=tostring(round(order,2))
        else
          order=tostring(round(order,1))
        end
        if  avefmax>pk.freq and haveave then
          --if pk.order>.1 then
          table.insert(pk_amp,{pk_index=j,sfreq=pk.freq,afreq=(pkbin-1)*machine.datasets[aveds].bw*machine.datasets[aveds].speed,sbin=pk.bin,sord=pk.order/ord1x,order=order,sval=s,aval=a,dif=s-a,aord=(pkbin-1)*machine.datasets[aveds].bw, abin=pkbin,adsi=aveds,sdsi=pk.ds, mval=m,mdif=s-m, matches=pk.matches , flags=flags, sb_severity={} , sb_energy={} , harm_energy=0 , harm_severity=0 , sidebands={} , subharmonics={} , harm_pk_index={} , rules={},fmax=pk.fmax})
          ndif=ndif+1
          tdif=tdif+(s-a)
          if math.abs(s-a)>100 then
            local stop
          end
          --end
        else
          table.insert(pk_amp,{pk_index=j,sfreq=pk.freq , sbin=pk.bin , sord=pk.order/ord1x ,order=order, sval=s , sdsi=pk.ds , mval=m , mdif=s-m ,flags=flags, sb_severity={} , sb_energy={} , harm_energy=0 , harm_severity=0 , sidebands={} , matches=pk.matches , subharmonics={} , harm_pk_index={} , rules={},fmax=pk.fmax })
        end
        for indx,pa in ipairs (pk_amp) do
          pk_amp[indx].pk_index=indx
          local matches=pa.matches
          for m,mtch in ipairs (matches) do
            mtch['pk_index']=indx
            matches[m]=mtch
          end
          pk_amp[indx].matches=matches
        end  
      end -- for j,pk in mia.peaks
      local ave_dif=0
      if ndif~=0 then ave_dif=tdif/ndif end
      table.insert(comp_peak_list,{mi=mia.mi, axis=mia.axis,ave_peaks=ave_pk_amp[i], peaks=pk_amp,sorts={}, vmel_datasource = machine.elements[mia.mi].guid, ave_dif=ave_dif, datasets=mia.datasets,shaftspeed=mia.shaftspeed,shaftrpm=machine.datasets[mia.datasets[1]].speed*60})
else
  --table.insert(comp_peak_list,{mi=mia.mi, axis=mia.axis, ave_peaks={}, peaks={},sorts={},vmel_datasource = machine.elements[mia.mi].guid, ave_dif=0,datasets=mia.datasets,shaftspeed=mia.shaftspeed,shaftrpm=machine.datasets[mia.datasets[1]].speed*60})
end -- if #mia.peaks>0 
end  -- for i,mia
comp_peak_list=z_analyze_peaklist_for_sidebands(comp_peak_list, "2xLF")
comp_peak_list=z_analyze_peaklist_for_sidebands(comp_peak_list, 1)
--comp_peak_list=z_analyze_peaklist_for_sidebands(comp_peak_list, .2)
--comp_peak_list=z_analyze_peaklist_for_sidebands(comp_peak_list, .25)
--comp_peak_list=z_analyze_peaklist_for_sidebands(comp_peak_list, .333333333)
comp_peak_list=z_analyze_peaklist_for_harmonics(comp_peak_list)
local speeds=get_comp_speed_ratios
--comp_peak_list=z_analyze_peaklist_for_sidebands(comp_peak_list, 1.14)
comp_peak_list=z_sort_peak_info(comp_peak_list)
comp_peak_list=flag_normalized_peaks(comp_peak_list,sr1xs)
--comp_peak_list=z_add_rules_to_peaklist(comp_peak_list)
return comp_peak_list
end
--
function z_composite_peak_list(typ, descending,shell) -- build a composite peak list (a single list of peaks from all data for a machine index and axis
  descending=descending or false
  shell=shell or false
  local ds_speed=0
  local ds_bw=0
  local pk_freq=0
  local pk_ord=0
  local pkdata = {}
  local pk_list={}
  local peak_list={}
  local matches = {}
  local flags='-'
  local rules={}
  local mia=""
  local indx=0
  local dup=false
  local dmod=(typ=='demod')
  local fctr=1
  if dmod then
    mia=''
  end
-- catalog data to find data sets with peaks and ranges
  local t
  for i,t in ipairs(machine.datasets) do
    if t.dom=="spec" then
      if t.typ==typ then
        if dmod then
          if #t.data==800 then fctr=1.05 end
        end
        if t.peaks~=nil then
          local mi,_=math.modf(t.mi)
          local mia=string.len(mi) 
          if mia==3 then
            mia=''
          else 
            if mia == 1 then 
              mia="00"
            else
              mia="0"
            end
          end
          mia=mia..mi..t.axis-- build a sortable table that combines machine index and axis
          table.insert(pkdata,{mia=mia,ds=i,typ=typ,fmax=t.fmax,mi=mi,axis=t.axis})
        end
      end
    end
  end
  if pkdata~=nil then 
    pkdata=z_sortpkdata (pkdata, descending) -- sort datasets by fmax and mia (machine index and axis) so data comes out grouped by mia with fmax is in assending fmax order
    if pkdata~=nil then
      if #pkdata>0 then
        local dsts={}
        local lastmax=0
        local lastmia=pkdata[1].mia
        local lastaxis=""

        local mia=lastmia
        local lastdsfmax=0
        for i,p in ipairs(pkdata) do
          if lastaxis~=p.axis then lastdsfmax=0 end
          mia=p.mia
          local ds=p.ds
          table.insert(dsts,ds)
          ds_speed=machine.datasets[ds].speed
          if typ=='normal' or typ=='demod' then
            ds_bw=machine.datasets[ds].bw   
          elseif typ=='average' then
            ds_bw=machine.datasets[ds].fmax/#machine.datasets[ds].data
          end
          for _,b in ipairs (machine.datasets[ds].peaks) do
            matches={}
            rules={}
            flags='-'
            indx=0
            if b<=900  or true then  --  XXXXXX Cut the data off at the end of valid data.  This if statement is only require while VDS is processing too many lines.  XXXXXXX
              if typ=='normal' and true then
                if machine.datasets[ds].matches~=nil then
                  for _,mtch in ipairs (machine.datasets[ds].matches) do
                    if round(mtch.bin)==round(b) then
                      table.insert (matches,mtch)
                      if matches~={} then
                        dup=false
                        flags=add_flag(flags,'m')
                      end
                    end
                  end
                end
              end
              pk_freq=(b-1)*ds_bw
              if lastmax<pk_freq and pk_freq>lastdsfmax then
                if shell then 
                  --debugprint(i,p.mia,pk_freq)
                  --if i==7 then
                  -- local stop
                  --end
                  pk_ord=pk_freq/(machine.speed*g_comp_speed_ratio[ z_get_ci_from_mi(p.mi)])

                else
                  pk_ord=pk_freq/ds_speed
                end

                lastmax=pk_freq
                indx=indx+1
                table.insert(pk_list,{pk_index=indx,ds=ds , bin=b/fctr , freq=pk_freq/fctr , order=pk_ord/fctr, matches=matches, flags=flags, fmax=machine.datasets[ds].fmax})
              end
            end
          end

          lastmax=lastmax+g_bin_margin*ds_bw  -- this pads lastmax so tones are not double identified due to the change in resolution to the next higher range.
          if i+1>#pkdata or mia~=pkdata[i+1].mia then
            --local mi=p.mi--tonumber(string.sub( mia, 1,3),10)
            --local axis=string.sub( mia, 4)
            --table.insert(peak_list,{axis=axis , mi=mi , typ=typ , peaks=pk_list})

            table.insert(peak_list,{axis=p.axis , mi=p.mi , typ=typ , peaks=pk_list, datasets=dsts, shaftspeed=g_comp_speed_ratio[ z_get_ci_from_mi(p.mi)]})
            dsts={}
            lastmax=0
            pk_list={}
          end
          lastdsfmax=machine.datasets[ds].fmax
          lastaxis=p.axis
        end
      end
    end
    return peak_list, pkdata
  end
end
--
function z_sortpkdata (pkdata,descending)  -- sort datasets by fmax and mia (machine index and axis) so data comes out grouped by mia with fmax is in ascending or descending fmax order
  descending=descending or false
  local temp={}
  local i,j
  local moved=true
  while moved do
    moved=false
    for i,j in ipairs(pkdata) do
      if pkdata[i+1]~=nil then
        if descending then
          if j.fmax<pkdata[i+1].fmax then
            temp=pkdata[i]
            pkdata[i]=pkdata[i+1]
            pkdata[i+1]=temp
            moved=true
          end         
        else  
          if j.fmax>pkdata[i+1].fmax then
            temp=pkdata[i]
            pkdata[i]=pkdata[i+1]
            pkdata[i+1]=temp
            moved=true
          end
        end
      end
    end
  end
  moved=true
  while moved do
    moved=false
    for i,j in ipairs(pkdata) do
      if pkdata[i+1]~=nil then
        if j.mia>pkdata[i+1].mia then
          temp=pkdata[i]
          pkdata[i]=pkdata[i+1]
          pkdata[i+1]=temp
          moved=true
        end
      end
    end
  end
  return pkdata
end
function z_analyze_peaklist_for_harmonics(peak_list,minimize)

  minimize=minimize or false
  local harms={}

  local close=.001
  if minimize then
    close=.004
  end

  local x,rmdr
  -- build a list of shaft speeds
  local speeds={} 
  for ci,csr in pairs (g_comp_speed_ratio) do
    if #speeds==0 then 
      table.insert(speeds,csr) 
    else
      local csrfound=false
      for _,spd in ipairs (speeds) do
        if spd==csr then  csrfound=true end
      end
      if not (csrfound) then table.insert(speeds,csr) end
    end
  end
  -- 
  for a,mia in ipairs(peak_list) do
    local spdharms={}
    local freq1x=nil
    for i,column in ipairs(mia.peaks) do -- find 1x speed for more accuracy.
      local ismult,mult,prmdr=z_is_a_multiple(1,column.sord,.005)  --.012
      if ismult and mult==1 then
        freq1x=column.sfreq
      end
    end      
    local the=0
    local harmsvrty=0
    local harmindx={}
    if g_comp_speed_ratio[machine.ispeed]==nil or g_comp_speed_ratio[z_get_ci_from_mi(mia.mi)]==nil then
      local stop
    end 
    local dsspdratio=g_comp_speed_ratio[machine.ispeed]*g_comp_speed_ratio[z_get_ci_from_mi(mia.mi)]
    for i,column in ipairs(mia.peaks) do 
      local flags=column.flags or '-'
      local subharms={}
      local nosubharms=true
      freq1x=freq1x or machine.datasets[column.sdsi].speed
      local col=column.sord
      local cfreq=column.sfreq
      local cbin=column.sbin
      local cres=col/cbin
      local lfx2=false
      if cfreq<=1.02*machine.linef*16 then -- check for LF harmonics in the area for peak below 900 Hz
        x,rmdr = math.modf(cfreq/(machine.linef*2))      
        x=math.floor(x+round(rmdr)) 
        local nextiscloser=false
        if i<(#mia.peaks-1) then
          local nexti=mia.peaks[i+1].sfreq
          _,nexti= math.modf(nexti/(machine.linef*2))
          if nexti<rmdr then nextiscloser=true end
        end
        if not(nextiscloser) then 
          if  (rmdr<.01 or 1-rmdr<.005) and x>=1 then 
            local temp=spdharms['LF'] or {}
            table.insert(temp,i)
            spdharms['LF']=temp
            table.insert(subharms,'multiplier="'..tostring (round(cfreq/(machine.linef*2),2))..'" order="LF"') 
            --flags=add_flag(flags,'l')
            peak_list[a].peaks[i].flags=add_flag(peak_list[a].peaks[i].flags,'l')
            if x==2 then lfx2=true   end    
          end
        end
      end
      -- look for shaft speed harmonic and subharmonic series
      local subs={}

      if not (minimize) then
        for _,speed in ipairs (speeds) do
          if #speeds==1 then
            subs={1,.5,.33333333,.25,.2}
          elseif #speeds>1 and speed<1 then
            subs={1}
          elseif #speeds>1 and speed>=1 then
            subs={1,.5,.33333333}
          end
          for _,sbh in ipairs(subs) do
            local speed=speed/dsspdratio*sbh
            if speed>1 then
              local stop
            end 
            local colismult,mult,prmdr=z_is_a_multiple(speed,col,close)
            local colisint,imult,iprmdr=z_is_a_multiple(speed/sbh,col,close)
            if (colismult and sbh==1) or (sbh~=1 and not (colisint) and colismult and imult<10 and mult*sbh<10)  then
              local temp=spdharms[tostring(round(speed,3))] or {}
              table.insert(temp,i)
              spdharms[tostring(round(speed,3))]=temp
            end
            x=mult  
            local mt = false
            if colismult and x>=1 and speed==1 and speed>cres*2 then-- check for harmonics of 1x
              mt=true
              table.insert(subharms,'multiplier="'..tostring (x)..'" order="1"')
              peak_list[a].peaks[i].flags=add_flag(flags,'x')
            end 
            if colismult and x>=1 and speed~=1 and col/speed<100 and speed>cres*2 then -- check for harmonics of other shafts
              mt=true
              table.insert(subharms,'multiplier="'..tostring (x)..'" order="'..tostring (round(speed,3))..'"' ) 
              if x>1 then nosubharms=false end
              peak_list[a].peaks[i].flags=add_flag(flags,'x')
            end 
            --if colismult then
            --peak_list[a].peaks[i].flags=add_flag(flags,'x')
            -- end
          end -- subs
        end -- speeds
        -- look for subharmonics from lower frequency peaks
        local colisint
        colisint,x,rmdr=z_is_a_multiple(1,col,close)
        for j,row in ipairs(mia.peaks) do 
          if j<i then
            local peakisint,_,frac=z_is_a_multiple(1,row.sord,close)
            if i~=j and  (not (peakisint) and not (colisint)) and row.sord>cres*5 then -- check integer multiple of non-integer tones
              local colisrowmult
              colisrowmult,x,rmdr=z_is_a_multiple(row.sord,col,close)
              if x>1 --[[and x<=10]] and colisrowmult then
                table.insert(subharms,'multiplier="'..tostring (x)..'" order="'..tostring (round(row.sord,2))..'" pk_index="'..tostring(j)..'"') -- index and details
                nosubharms=false
              end
            end 
          end
        end  -- for j,row 
        peak_list[a].peaks[i].subharmonics=subharms 
      end -- if not (minimize)
      the=0
      harmsvrty=0
      harmindx={}
      local count=0
      local fired=0
      local shortlist=10
      for j,row in ipairs(mia.peaks) do
        if j>=i then
          count=count+1
          local isharm
          isharm,x,rmdr=z_is_a_multiple(col,row.sord,close)
          if not (minimize) or (minimize and x<=shortlist and cfreq<400 and row.sord<1000) then
            if (count==1 and x==1) or (count>1 and x~=1 ) then
              if isharm then
                if j+1<=#mia.peaks then  -- is there a next peak
                  if  math.abs(row.sord-x*col)<math.abs(mia.peaks[j+1].sord-x*col)  then -- is the next peak a better match than this peak
                    if (x>10 and fired>=3) or x<=10 then 
                      fired=fired+1
                      if row.dif~= nil and count ~=1 then
                        if row.dif>3 and (nosubharms or lfx2)  then  
                          local svrty=0
                          if row.sval~=nil and row.sval>51 and row.sval<=110 then 
                            svrty=(row.dif*(10^(row.sval/40))/(10^(110/40))) 
                          elseif row.sval~=nil and row.sval>110 then 
                            svrty=(row.dif*(10^(row.sval/20))/(10^(110/20))) 
                          end
                          --if row.sval~=nil then
                          --if row.sval>51 then svrty=row.dif*(10^(row.sval/40)/10^(108/40)) end
                          --end
                          harmsvrty=harmsvrty + svrty --z_amplitude_weighted_severity(row.dif,row.sval,130) 
                        end 
                      end
                      local hx=string.match(peak_list[a].peaks[i].flags,'hx')=='hx' 
                      if not(minimize) or (minimize and not(hx)) then  the=the + ConvertSpectrum( Unit.U_VDB , g_internal_unit    , row.sval ) end
                      if trouble_shoot then
                        if math.floor(row.sord/col)==row.sord/col then
                          table.insert (harmindx,j..'-'..math.floor (row.sord/col).."x") -- index and harmonic order
                        else
                          table.insert (harmindx,j..'-'..round(row.sord/col,2).."x") -- index and harmonic order
                        end
                      else
                        table.insert (harmindx,tostring(j)) -- just indexes
                        if minimize and j~=i then peak_list[a].peaks[j].flags=add_flag(peak_list[a].peaks[i].flags,'hx') end
                      end  --if trouble_shoot
                    end-- if (x>10 and fired>=3) or x<=10
                  end  -- if ox==x and hrm<rmdr/x
                end -- if j+1<=#mia.peaks
              end  -- if isharm
            end   -- if (count==1 and x==1) or (count>1 and x~=1
          end -- if not (minimize)
        end  -- if j>=i
      end -- for j,row
      if #harmindx>1 then
        peak_list[a].peaks[i].harm_energy=round(the)
        peak_list[a].peaks[i].harm_pk_index=harmindx
        if not (minimize) then
          peak_list[a].peaks[i].harm_severity=harmsvrty
          if harmsvrty>g_peak_group_threshold then
            peak_list[a].peaks[i].flags=add_flag(flags,'h')
          end
        end
      else
        peak_list[a].peaks[i].harm_energy=0
        peak_list[a].peaks[i].harm_pk_index={}
        peak_list[a].peaks[i].harm_severity=0
      end  -- if #harmindx>1
    end -- for i,column
    peak_list[a].shaftharms=spdharms
  end  -- for a,mia
  return peak_list
end
--
function z_analyze_peaklist_for_sidebands(peak_list, sbord)
  sbord= sbord or 1
  local close=.005
  local lf=string.match(string.upper(sbord),'LF')=='LF'
  local sbname, lfmult,st,sp
  if lf then
    if string.match(string.upper(sbord),'X') == 'X'then
      st,sp = string.find(string.upper(sbord),'X')
      if st>1 then
        lfmult= tonumber(string.sub(sbord,1,st-1),10)
      else
        lfmult=1
      end
    else
      lfmult=1
    end
    sbname=math.floor(lfmult) .."xLF"
    sbord=0
  else
    if math.floor (sbord)==sbord then
      sbname=math.floor( sbord).."x"
    else
      sbname=round(sbord,3).."x"
    end
  end
  local sbs={}
  local sideband
  local sdbds=0    
  local speeds={}    
  if lf or sbord~=1 then 
    table.insert(speeds,sbord) 
  else
    for ci,csr in pairs (g_comp_speed_ratio) do  -- build table shaft speeds
      if #speeds==0 then 
        table.insert(speeds,csr) 
      else
        local csrfound=false
        for _,spd in ipairs (speeds) do
          if spd==csr then  csrfound=true end
        end
        if not (csrfound) then table.insert(speeds,csr) end
      end
    end
  end
  for a,mia in ipairs(peak_list) do
    for _,spd in ipairs (speeds) do
      local freq1x=nil
      local tsbe
      local sbsvrty
      local dsspd=g_comp_speed_ratio[machine.ispeed]*g_comp_speed_ratio[z_get_ci_from_mi(mia.mi)]
      sbord=spd/dsspd
      if not (lf) then
        if math.floor (sbord)==sbord then
          sbname=math.floor( sbord).."x"
        else
          sbname=round(sbord,3).."x"
        end
      end
      for i,column in ipairs(mia.peaks) do
        local flags=column.flags or '-'
        local flagged=false
        freq1x= machine.datasets[column.sdsi].speed
        local col=column.sord
        if lf then
          sideband= lfmult * machine.linef/freq1x
        else
          sideband=sbord
        end
        sbs={} 
        sdbds=0
        tsbe=ConvertSpectrum( Unit.U_VDB , g_internal_unit    , column.sval )
        if column.dif~=nil then
          sbsvrty=0
          if column.sval ~= nil then
            if column.sval>51 then sbsvrty=(column.dif*(10^(column.sval/40))/(10^(108/40))) end
          end
        else
          sbsvrty= 0
        end
        if sbsvrty<0 then sbsvrty=0 end
        local maxlfsb=3

        for j,row in ipairs(mia.peaks) do
          if i~=j then
            local colisint
            local  rowisint,_,frac=z_is_a_multiple(sbord,row.sord,close)  -- row is int multiple of a shaft speed
            colisint,_,frac=z_is_a_multiple(1,col,close)  -- col is int multiple of a shaft speed
            local sbordisint
            if lf then
              sbordisint=false
            else
              sbordisint,_,frac=z_is_a_multiple(1,sbord,close)
            end
            local colismult
            colismult,_,frac=z_is_a_multiple(sbord,col,close) -- col is int multiple of sbord 
            if (not (rowisint) and not (colisint) and not(colismult)) or (col/sbord>15 and row.sord/sbord>15 and not(colismult)) or (col>10 and row.sord>10 and row.sord>2*sideband and lf) then  
              local _,sb,rmdr = z_is_a_multiple(sideband,math.abs(col-row.sord),close) --math.modf(math.abs((col-row.sord)/sideband))
              local sign=""
              if (col-row.sord)/sideband<0 then sign='-' end
              --local sb=x+round(rmdr)
              if lf then
                if col>15 then
                  close=.005
                else
                  close=.003
                end
              end
              if lf and #sbs==0 and sign=='' then maxlfsb=6 end

              if ((sb>=1 and sb<=15 and not(lf) ) or (sb>=1 and sb<=maxlfsb and lf and col>15 and row.sord>15)) and (rmdr<close or 1-rmdr<close) and not(sdbds==0 and sb>3) then
                if j+1<=#mia.peaks then  -- is there a next peak
                  if  math.abs(sb-(col-row.sord)/sideband)<math.abs(sb-(col-mia.peaks[j+1].sord)/sideband)  then -- is this peak a better match than the next peak
                    tsbe=tsbe+ConvertSpectrum( Unit.U_VDB , g_internal_unit    , row.sval )
                    if row.dif~=nil then
                      if row.dif>3 then
                        local svrty=0
                        if row.sval~=nil and row.sval>51 and row.sval<=110 then 
                          svrty=(row.dif*(10^(row.sval/40))/(10^(110/40)))/5 
                        elseif row.sval~=nil and row.sval>110 then 
                          svrty=(row.dif*(10^(row.sval/20))/(10^(110/20)))/5 
                        end
                        sbsvrty=sbsvrty + svrty
                        --z_amplitude_weighted_severity(row.dif,row.sval,130) 
                      end
                    end
                    if trouble_shoot then
                      if sdbds ==0 then 
                        sbs[i]=sign..math.floor( 0).."xSB of "..sbname.." "..round(column.sord,2) 
                      end
                      sbs[j]=sign..math.floor( sb).."xSB of "..sbname.." "..round(row.sord,2) 
                    else
                      if sdbds ==0 then  
                        table.insert (sbs,tostring (i))
                      end
                      table.insert (sbs,tostring (j))
                    end  --if trouble_shoot

                    sdbds=sdbds+1
                  end -- if  math.abs((col-row.sord)/sideband)<math.abs((col-mia.peaks[j+1].sord)/sideband)
                end --if j+1<=#mia.peaks
              end -- if ((sb>=1 and sb<=15 and not(lf)) or (sb>=1 and sb<=4 and lf and col>15 and row.sord>15)) and (rmdr<close or 1-rmdr<close) and not(sdbds==0 and sb>5)
            end --if (not (rowisint) and not (colisint) and not(colismult)) or (col/sbord>15 and row.sord/sbord>15 ) or (col>10 and row.sord>10 and row.sord>2*sideband and lf)
          end -- if i~=j
        end -- for j,row
        if sdbds>0 then
          local sb=peak_list[a].peaks[i].sidebands or {}
          table.insert(sb,{[sbname]=sbs})
          peak_list[a].peaks[i].sidebands=sb
          --
          sb=peak_list[a].peaks[i].sb_energy or {}
          table.insert(sb,{[sbname]=round(tsbe)})  
          peak_list[a].peaks[i].sb_energy=sb
          --
          sb=peak_list[a].peaks[i].sb_severity or {}
          table.insert(sb ,{[sbname]=sbsvrty}) 
          peak_list[a].peaks[i].sb_severity=sb
          if sbsvrty>g_peak_group_threshold then flagged=true end
        end
        if flagged then
          peak_list[a].peaks[i].flags=add_flag(flags,'s')
        end
      end --for i,column 
    end -- for _,spd
  end  -- for a,mia
  return peak_list
end
--
function find_peak_in_peaklist(element,brg,straxis,bin)
  local m,p
  local mi = safe_value_1( machine.components[g_shaft_number].map[brg], M_SHAFT_DATA_INDEX, brg )
  local aliasmi = get_machine_element_alias(mi)
  --old peak list
  for i,mia in ipairs(g_peak_list) do
    if mia.mi==aliasmi and mia.axis==straxis then
      for j,pk in ipairs (mia.peaks) do
        if round(pk.sbin/bin,4)==1 then
          m=i
          p=j
          goto out
        end
      end
      return {found=false}
    end
  end
  ::out::
  return {found=true, mia=m, pk_index=p}
end

function z_get_harmonic_groups_from_peak_list(element,brg,axis,strtag,remove_matches,sev_th,nr)
  remove_matches=remove_matches or false
  local pl={}
  table.move(g_peak_list,1,#g_peak_list,1,pl)
  sev_th=sev_th or 0
  nr=nr or 20
  local mia=0
  local no_error=true
  strtag=strtag or ""
  strtag=string.upper(strtag)  
  local dsi,ds,help=get_best_dataset( 1, brg, 'normal', axis, no_error )
  for m,dsg in ipairs(pl) do
    if mia~=0 then break end
    for _,pkds in ipairs(dsg.datasets) do
      if pkds==dsi then 
        mia=m
        break
      end
    end
  end
  local harm_info={}
  local out={}
  local harms={}
  local cn=get_this_comp_number()
  local spratios=get_comp_speed_ratios()
  local compspeedrat=spratios[cn]
  local result={}
  if mia~=0 then
    if strtag=="" then
      for i,indx in pairs (pl[mia].sorts.harm_severity) do
        local harm_indexes=pl[mia].peaks[indx].harm_pk_index
        local severity=pl[mia].peaks[indx].harm_severity
        if severity>=sev_th then
          for p,pk in ipairs (harm_indexes) do
            pk=tonumber(pk)
            local so=pl[mia].peaks[pk].sord
            local sv=pl[mia].peaks[pk].sval
            local  mv=pl[mia].peaks[pk].mval
            local flag=pl[mia].peaks[pk].flags or '-'
            if not((string.match(flag,'m')~=nil or string.match(flag,'l')~=nil or string.match(flag,'f')~=nil or string.match(flag,'x')~=nil ) and  remove_matches) then  
              if pl[mia].peaks[pk].aval~=nil then          
                local av=pl[mia].peaks[pk].aval
                --if sv-av>g_fault_tone_threshhold then table.insert(harm_info,{pk_index=pk,sord=so, sval=sv, dif=sv-av, aval=av, mval=mv, mdif=sv-mv, sbin=pl[mia].peaks[pk].sbin}) end
                table.insert(harm_info,{pk_index=pk,sord=so, sval=sv, dif=sv-av, aval=av, mval=mv, mdif=sv-mv, sbin=pl[mia].peaks[pk].sbin,sfreq=pl[mia].peaks[pk].sfreq})
              else
                table.insert(harm_info,{sord=so, sval=sv, mval=mv, mdif=sv-mv, sbin=pl[mia].peaks[pk].sbin,sfreq=pl[mia].peaks[pk].sfreq})
              end
            end
          end  -- for p,pk
          table.insert(harms,{harm_severity=severity or 0,harm_sord=pl[mia].peaks[tonumber(harm_indexes[1])].sord,harm_sfreq=pl[mia].peaks[tonumber(harm_indexes[1])].sfreq,harm_pk_index=indx--[[pl[mia].peaks[i].harm_pk_index]]  ,num_harmonics=#harm_indexes, harm_fundamental_pk_matches=pl[mia].peaks[tonumber(harm_indexes[1])].matches, harmonic_info=harm_info})
          harm_info={}
        end  -- if severity>=sev_th
      end  -- for i,indx
      return {found=true, harmonics=harms}
      --
    elseif string.match(strtag,'LF')=='LF' then  -- elseif LF
      local taghz
      local rFff={}
      if string.find(strtag,"X")== nil then
        taghz=machine.linef
      else
        local xpos,_=string.find(strtag,"X")
        local lfx,_=string.sub(strtag, 1,xpos-1)
        lfx=lfx or "1"
        taghz=machine.linef*tonumber(lfx)
      end
      result["found"] = true
      local ret_matches = {}
      local max_order = 0      
      for i,pk in pairs (pl[mia].peaks) do
        local x,frac=math.modf(math.abs(pk.sfreq/taghz))
        x=x+round(frac)
        local peakistag = (frac<.005 or 1-frac<.0001) and x==1 
        if peakistag then
          if #pk.harm_pk_index>0 then
            for h,harm in ipairs (pk.harm_pk_index) do
              harm=tonumber(harm)
              local order=round(pl[mia].peaks[harm].sfreq/taghz)
              if order > max_order then max_order = order end
              local s = pl[mia].peaks[harm].sval
              local m = pl[mia].peaks[harm].mval
              local a = pl[mia].peaks[harm].aval
              if a~=nil then
                table.insert( ret_matches, { 
                    ["order"] =order,
                    ["sval"] = s, 
                    ["mval"] = m, 
                    ["sord"] = pl[mia].peaks[harm].sord, 
                    ["sfreq"] = pl[mia].peaks[harm].sfreq,
                    ["sbin"] = pl[mia].peaks[harm].sbin,
                    ["sdsi"] = pl[mia].peaks[harm].sdsi,
                    ["aval"] = a, 
                    ["aord"] = pl[mia].peaks[harm].aord,
                    ["abin"] = pl[mia].peaks[harm].abin,
                    ["adsi"] = pl[mia].peaks[harm].adsi,
                    ["dif"] = (s-a), 
                    ["pct"] = (s-a)/a,
                    ["mdif"] = (s-m), 
                    ["mpct"] = (s-m)/m
                    } )
              else
                table.insert( ret_matches, { 
                    ["order"] =order,
                    ["sval"] = s, 
                    ["mval"] = m, 
                    ["sord"] = pl[mia].peaks[harm].sord, 
                    ["sfreq"] = pl[mia].peaks[harm].sfreq,
                    ["sbin"] = pl[mia].peaks[harm].sbin,
                    ["sdsi"] = pl[mia].peaks[harm].sdsi,
                    ["mdif"] = (s-m), 
                    ["mpct"] = (s-m)/m
                    } )
              end
            end   -- for h,harm
          end   -- if #harm_pk_index
        end -- if peakistag
        if #ret_matches>0 then break end
      end -- for i,pk 
      if #ret_matches>0 then
        result["found"] = true
        result["orders"] = max_order
        result["count"] = #ret_matches
        result["matches"] = ret_matches
        return result
      else
        return {found=false}
      end
    elseif strtag~='1X' then -- if strtag==""
      if tonumber(strtag)~=nil then 
        local speed=compspeedrat/pl[mia].shaftspeed
        local harms=pl[mia].shaftharms[strtag]
        local max_order = 0 
        --matchfound=true
        local ret_matches,result = {},{}
        if harms~=nil then
          if #harms>0 then 
            for h,harm in ipairs(harms) do 
              local order=round(pl[mia].peaks[tonumber(harm)].sord/speed)
              if order>=1 then
                if order> max_order then max_order = order end
                local s = pl[mia].peaks[tonumber(harm)].sval
                local m = pl[mia].peaks[tonumber(harm)].mval
                local a = pl[mia].peaks[tonumber(harm)].aval
                if a~=nil then
                  table.insert( ret_matches, { 
                      ["order"] = order,
                      ["sval"] = s, 
                      ["mval"] = m, 
                      ["sord"] = pl[mia].peaks[tonumber(harm)].sord, 
                      ["sfreq"] = pl[mia].peaks[tonumber(harm)].sfreq,
                      ["sbin"] = pl[mia].peaks[tonumber(harm)].sbin,
                      ["sdsi"] = pl[mia].peaks[tonumber(harm)].sdsi,
                      ["aval"] = a, 
                      ["aord"] = pl[mia].peaks[tonumber(harm)].aord,
                      ["abin"] = pl[mia].peaks[tonumber(harm)].abin,
                      ["adsi"] = pl[mia].peaks[tonumber(harm)].adsi,
                      ["dif"] = (s-a), 
                      ["pct"] = (s-a)/a,
                      ["mdif"] = (s-m), 
                      ["mpct"] = (s-m)/m,
                      ['matches']=pl[mia].peaks[tonumber(harm)].matches
                      } )
                else 
                  table.insert( ret_matches, { 
                      ["order"] = order,
                      ["sval"] = s, 
                      ["mval"] = m, 
                      ["sord"] = pl[mia].peaks[tonumber(harm)].sord, 
                      ["sfreq"] = pl[mia].peaks[tonumber(harm)].sfreq,
                      ["sbin"] = pl[mia].peaks[tonumber(harm)].sbin,
                      ["sdsi"] = pl[mia].peaks[tonumber(harm)].sdsi,
                      ["mdif"] = (s-m), 
                      ["mpct"] = (s-m)/m,
                      ['matches']=pl[mia].peaks[tonumber(harm)].matches
                      } ) 
                end 
              end -- if order>1
            end --- for h,harm
          end -- if #harms
        end -- if harms~=nil
        result["orders"] = max_order
        result["count"] = #ret_matches
        result["matches"] = ret_matches
        result['found']=true
        return result
      else --if tonumber(strtag)~=nil
        local tagcheck=does_order_tag_exist(strtag,element)    
        if tagcheck then
          result["found"] = true
          local ret_matches = {}
          local max_order = 0      
          for i,pk in pairs (pl[mia].peaks) do
            local matchfound=false
            if #pk.matches>0 then
              for _,mtch in ipairs (pk.matches) do
                local number
                if math.abs(mtch.cn)~=mtch.cn then
                  number=cn
                else
                  number=machine.components[cn].map[element]
                end
                if math.abs(mtch.cn)==number and mtch.tag==strtag and mtch.type=='F' then

                  matchfound=true
                  local result = {}
                  if #pk.harm_pk_index>0 then 
                    for h,harm in ipairs(pk.harm_pk_index) do 
                      local order=round(pl[mia].peaks[tonumber(harm)].sord/pl[mia].peaks[i].sord)
                      if order>=1 then
                        if order> max_order then max_order = order end
                        local s = pl[mia].peaks[tonumber(harm)].sval
                        local m = pl[mia].peaks[tonumber(harm)].mval
                        local a = pl[mia].peaks[tonumber(harm)].aval
                        if a~=nil then
                          table.insert( ret_matches, { 
                              ["order"] = order,
                              ["sval"] = s, 
                              ["mval"] = m, 
                              ["sord"] = pl[mia].peaks[tonumber(harm)].sord, 
                              ["sfreq"] = pl[mia].peaks[tonumber(harm)].sfreq,
                              ["sbin"] = pl[mia].peaks[tonumber(harm)].sbin,
                              ["sdsi"] = pl[mia].peaks[tonumber(harm)].sdsi,
                              ["aval"] = a, 
                              ["aord"] = pl[mia].peaks[tonumber(harm)].aord,
                              ["abin"] = pl[mia].peaks[tonumber(harm)].abin,
                              ["adsi"] = pl[mia].peaks[tonumber(harm)].adsi,
                              ["dif"] = (s-a), 
                              ["pct"] = (s-a)/a,
                              ["mdif"] = (s-m), 
                              ["mpct"] = (s-m)/m
                              } )
                        else
                          table.insert( ret_matches, { 
                              ["order"] = order,
                              ["sval"] = s, 
                              ["mval"] = m, 
                              ["sord"] = pl[mia].peaks[tonumber(harm)].sord, 
                              ["sfreq"] = pl[mia].peaks[tonumber(harm)].sfreq,
                              ["sbin"] = pl[mia].peaks[tonumber(harm)].sbin,
                              ["sdsi"] = pl[mia].peaks[tonumber(harm)].sdsi,
                              ["mdif"] = (s-m), 
                              ["mpct"] = (s-m)/m
                              } ) 
                        end 
                      end -- if order>1
                    end --- for h,harm
                    break
                  end -- if #pk.harm_pk_index
                end -- if mtch.cn==cn and mtch.tag==strtag and mtch.type=='F' 
              end  -- for _,m
              if matchfound then break end        
            end -- if #pk.matches>0
          end -- for i,pk 
          result["orders"] = max_order
          result["count"] = #ret_matches
          result["matches"] = ret_matches
          return result
        end --if tonumber(strtag)~=nil
      end  -- tag found
    elseif strtag=='1X' then
      local speed=compspeedrat/pl[mia].shaftspeed
      local harms=pl[mia].shaftharms[tostring(round(speed,3))]
      local max_order = 0 
      --matchfound=true
      local ret_matches,result = {},{}
      if harms~=nil then
        if #harms>0 then 
          for h,harm in ipairs(harms) do 
            local order=round(pl[mia].peaks[tonumber(harm)].sord/speed)
            if order>=1 then
              if order> max_order then max_order = order end
              local s = pl[mia].peaks[tonumber(harm)].sval
              local m = pl[mia].peaks[tonumber(harm)].mval
              local a = pl[mia].peaks[tonumber(harm)].aval
              if a~=nil then
                table.insert( ret_matches, { 
                    ["order"] = order,
                    ["sval"] = s, 
                    ["mval"] = m, 
                    ["sord"] = pl[mia].peaks[tonumber(harm)].sord, 
                    ["sfreq"] = pl[mia].peaks[tonumber(harm)].sfreq,
                    ["sbin"] = pl[mia].peaks[tonumber(harm)].sbin,
                    ["sdsi"] = pl[mia].peaks[tonumber(harm)].sdsi,
                    ["aval"] = a, 
                    ["aord"] = pl[mia].peaks[tonumber(harm)].aord,
                    ["abin"] = pl[mia].peaks[tonumber(harm)].abin,
                    ["adsi"] = pl[mia].peaks[tonumber(harm)].adsi,
                    ["dif"] = (s-a), 
                    ["pct"] = (s-a)/a,
                    ["mdif"] = (s-m), 
                    ["mpct"] = (s-m)/m,
                    ['matches']=pl[mia].peaks[tonumber(harm)].matches
                    } )
              else
                table.insert( ret_matches, { 
                    ["order"] = order,
                    ["sval"] = s, 
                    ["mval"] = m, 
                    ["sord"] = pl[mia].peaks[tonumber(harm)].sord, 
                    ["sfreq"] = pl[mia].peaks[tonumber(harm)].sfreq,
                    ["sbin"] = pl[mia].peaks[tonumber(harm)].sbin,
                    ["sdsi"] = pl[mia].peaks[tonumber(harm)].sdsi,
                    ["mdif"] = (s-m), 
                    ["mpct"] = (s-m)/m,
                    ['matches']=pl[mia].peaks[tonumber(harm)].matches
                    } ) 
              end 
            end -- if order>1
          end --- for h,harm
        end -- if #harms
      end -- if harms~=nil
      result["orders"] = max_order
      result["count"] = #ret_matches
      result["matches"] = ret_matches
      result['found']=true
      return result
    end -- if strtag==""
  end  -- if mia~=0
  return {found=false}
end
--
function z_get_usual_tones_from_peak_list(element,brg,axis,sev_th,nr,sval_th)
  local pl={}
  table.move(g_peak_list,1,#g_peak_list,1,pl)
  sval_th=sval_th or 70
  sev_th=sev_th or 108
  nr=nr or 10
  local mia=0
  local no_error=true
  local dsi,ds,help=get_best_dataset( 1, brg, 'normal', axis, no_error )
  for m,dsg in ipairs(pl) do
    if mia==0 then
      for _,pkds in ipairs(dsg.datasets) do
        if pkds==dsi then 
          mia=m 
          break
        end
      end
    else
      break
    end
  end
  local cn=get_this_comp_number()
  local dsmi=z_get_data_source_mi_from_ci(cn,brg)
  local umtones={}
  if mia~=0 then
    for i,indx in pairs (pl[mia].sorts.sval) do
      local sv=pl[mia].peaks[indx].sval
      local flag=pl[mia].peaks[indx].flags or '-'
      local sbg=pl[mia].peaks[indx].sidebands
      local lfsb=false
      if indx==23 then
        debugprint(indx)
      end
      for g,gr in ipairs (sbg) do
        if gr['2xLF']~=nil then lfsb=true end
      end
      if sv>=sval_th then
        if string.match(flag,'m')==nil and string.match(flag,'s')==nil and string.match(flag,'h')==nil and string.match(flag,'l')==nil and string.match(flag,'f')==nil and string.match(flag,'x')==nil and not(lfsb) then
          local so=pl[mia].peaks[indx].sord
          local pkis1x,x,rmdr =z_is_a_multiple(1,so,.005)
          pkis1x=pkis1x and x==1
          local  mv=pl[mia].peaks[indx].mval
          if pl[mia].peaks[indx].aval~=nil then          
            local av=pl[mia].peaks[indx].aval
            local dif=sv-av
            if  dif>3 then 
              table.insert(umtones,{pk_index=indx,sord=so, sval=sv, dif=dif, aval=av, mval=mv, mdif=sv-mv, sbin=pl[mia].peaks[indx].sbin,sfreq=pl[mia].peaks[indx].sfreq})
            end
          else
            table.insert(umtones,{sord=so, sval=sv, mval=mv, mdif=sv-mv, sbin=pl[mia].peaks[indx].sbin,sfreq=pl[mia].peaks[indx].sfreq})
          end
        end
      end  -- if sv>=sv_th
    end  -- for i,indx
    return {found=true,tones=umtones}
  else 
    return {found=false}
  end  -- if mia~=0

end
--
function z_get_sideband_groups_from_peak_list(element,brg,axis,remove_matches,sev_th,nr)
  local pl={}
  table.move(g_peak_list,1,#g_peak_list,1,pl)
  remove_matches=remove_matches or false
  sev_th=sev_th or 0
  nr=nr or 10
  local mia=0
  local no_error=true
  local dsi,ds,help=get_best_dataset( 1, brg, 'normal', axis, no_error )
  for m,dsg in ipairs(pl) do
    if mia==0 then
      for _,pkds in ipairs(dsg.datasets) do
        if pkds==dsi then 
          mia=m 
          break
        end
      end
    else
      break
    end
  end
  local sb_info={}
  local out={}
  local sbfs={}
  local maxampindex
  local maxamp
  if mia~=0 then
    for fr,grps in pairs (pl[mia].sorts.sb_severity) do
      --if string.match(fr,"LF")==nil then
      local  sb_groups={}
      for _,indx in ipairs(grps) do
        indx=tonumber(indx)
        local sb_indexes={}
        local severity=0
        for _,sbvf in ipairs (pl[mia].peaks[indx].sb_severity) do
          if sbvf[fr]~=nil then severity=sbvf[fr] end
        end
        for _,sbvf in ipairs (pl[mia].peaks[indx].sidebands) do
          for fr1,sbi in pairs (sbvf) do
            if fr==fr1 then sb_indexes=sbi  end
          end
        end
        local nsbs=#sb_indexes--+1
        --table.insert (sb_indexes,1,indx)
        sb_info={}
        maxampindex,maxamp=0,0
        --if nsbs>2 then
        for _,sbi in ipairs (sb_indexes) do
          sbi=tonumber(sbi)
          local so=pl[mia].peaks[sbi].sord
          local sv=pl[mia].peaks[sbi].sval
          if sv>maxamp then
            maxamp=sv
            maxampindex=sbi
          end
          local av=pl[mia].peaks[sbi].aval
          local  mv=pl[mia].peaks[sbi].mval
          local flag=pl[mia].peaks[sbi].flags or '-'
          if not((string.match(flag,'m')~=nil or string.match(flag,'l')~=nil or string.match(flag,'f')~=nil or string.match(flag,'x')~=nil ) and  remove_matches) then   
            if av~=nil then
              --if sv-av> g_fault_tone_threshhold then table.insert(sb_info,{sord=so, sval=sv, dif=sv-av, aval=av, mval=mv, mdif=sv-mv, sbin=pl[mia].peaks[sbi].sbin, pk_index=sbi}) end
              table.insert(sb_info,{sord=so, sval=sv, dif=sv-av, aval=av, mval=mv, mdif=sv-mv, sbin=pl[mia].peaks[sbi].sbin, pk_index=sbi,sfreq=pl[mia].peaks[sbi].sfreq})
            end
          end
        end  --  for _,sbi
        --end -- if nsbs>2

        local flag=pl[mia].peaks[maxampindex].flags or '-'
        if not((string.match(flag,'m')~=nil or string.match(flag,'l')~=nil or string.match(flag,'f')~=nil or string.match(flag,'x')~=nil) and  remove_matches) then 
          if severity>=sev_th then table.insert(sb_groups,{sb_severity=severity or 0, num_sidebands=nsbs, sideband_info=sb_info,first_pk_index=maxampindex ,first_pk_sord=pl[mia].peaks[maxampindex].sord,first_pk_sfreq=pl[mia].peaks[maxampindex].sfreq}) end
        end
      end  --  for _,indx
      sbfs[fr]=sb_groups
      --end
    end  -- for fr,grps
    return {found=true, sidebands=sbfs}
  else 
    return {found=false}
  end -- if mia~=0
end
--
function z_sort_peak_info(pk_list,num_pks)
  num_pks=num_pks or 20
  --ocal hs={}
  local function sort_items(a,b) return a.item>b.item end
  local sv={}
  local df={}
  local hs={}
  local he={}
  local sevr={}
  local sbs={}
  local sbfsord={}
  local sbfs={}
  for i,mia in ipairs (pk_list) do  --mia
    sv={}
    df={}
    hs={}
    he={}
    sbs={}
    sbfsord={}
    sbfs={}
    if #mia.peaks>0 then
      for j, pk in ipairs (mia.peaks) do
        for k, sb in ipairs (pk.sb_severity) do
          for sbf,sev in pairs(sb) do
            sbfs[sbf]=sbf
          end
        end
      end
      local it=0
      for j, pk in ipairs (mia.peaks) do   -- peaks
        if trouble_shoot then
          it='['..j..']='..round(pk.sord,2)..'x'
        else
          it=j
        end
        table.insert (sv , {index=it,item=pk.sval})
        if pk.harm_severity>0 then 
          if trouble_shoot then
            it='['..j..']='..round(pk.sord,2)..'x'
          else
            it=j
          end
          table.insert (hs , {index=it,item=pk.harm_severity}) 
        end
        if pk.harm_energy>0 then 
          if false then
            it='['..j..']='..round(pk.sord,2)..'x'
          else
            it=j
          end
          table.insert (he , {index=it,item=pk.harm_energy}) 
        end
        if pk.dif~= nil then 
          if pk.dif>0 then 
            if trouble_shoot then
              it='['..j..']='..round(pk.sord,2)..'x'
            else
              it=j
            end
            table.insert (df , {index=it,item=pk.dif}) end
          end
          for k, sb in ipairs (pk.sb_severity) do
            for sbf,sev in pairs(sb) do
              for _,sbn in pairs(sbfs) do
                if sbn==sbf and sev>0 then 
                  local temp=sbfsord[sbn] or {}
                  if trouble_shoot then
                    it='['..j..']='..round(pk.sord,2)..'x'
                  else
                    it=j
                  end
                  table.insert (temp,{index=it,item=sev})
                  sbfsord[sbn]=temp
                  temp={}
                end
              end
            end
          end  
        end
      end -- peaks
      _,hs=z_sort_items(hs)
      _,he=z_sort_items(he)
      _,sv=z_sort_items(sv)
      _,df=z_sort_items(df)
      sbfs={}
      for sbf,sev in pairs(sbfsord) do  -- sb severity sideband frequency
        sevr,sev=z_sort_items(sev, true)
        --
        -- the next section removes indicies that are included in a higher severity group
        --
        local nodups={}
        local sl={} 
        local highersbsg={}
        if #sev>0 then    -- #sev>0        
          local sgi=sev[1]
          if trouble_shoot then 
            local d,_=string.find (sev[1],"]")
            sgi=string.sub (sev[1],2,d-1)
          end
          table.insert(nodups,sgi) 

          if #sev>1 then  -- #sev>1 
            table.move(sev,2,#sev,1,sl)
            for x,sbgit in pairs (sl) do   -- sorted severity list
              highersbsg={}
              table.move(sev,1,x,1,highersbsg)
              local dup=false
              local sgit =sbgit
              if trouble_shoot then 
                local fin,_=string.find (sbgit,"]")
                sgit=string.sub (sbgit,2,fin-1)
              end
              for sbgin,sbgi in ipairs (highersbsg) do -- higher sb groups
                if dup then break end
                local sgi=sbgi
                if trouble_shoot then 
                  local d,_=string.find (sbgi,"]")
                  sgi=string.sub (sbgi,2,d-1)
                end
                for ct,sbis in ipairs (pk_list[i].peaks[tonumber(sgi)].sidebands) do  -- sidebands freq groups of index from higher group index
                  for sbgf,sbidx in pairs (sbis) do -- sb freq
                    if sbgf==sbf then -- sb freq match
                      local idx
                      for id,idx in pairs (sbidx) do  -- indexes of sidebands
                        if trouble_shoot then idx=id end
                        if tonumber(sgit)==tonumber(idx) then 
                          dup=true 
                          break
                        end  -- duplicate found
                      end   -- indexes of sidebands
                    end-- sb freq match
                  end-- sb freq
                end  -- sidebands freq groups of index from higher group index
              end  -- higher sb groups
              if not (dup) then table.insert(nodups,sgit) end  -- add to the unique index list
              dup=false
            end -- sorted severity list
            sbfs[sbf]=nodups
            nodups={}
          end  -- #sev>1 
        end  -- #sev>0
      end-- sb severity sideband frequency
      mia.sorts={harm_energy=he,harm_severity=hs,sval=sv,dif=df,sb_severity=sbfs}
      pk_list[i]=mia
    end  -- mia
    return pk_list
  end
--

  function z_sort_items(tobesorted,group_indexes,ascending)
    ascending=ascending or false
    group_indexes=group_indexes or false
    local temp={}
    local i,j
    local moved=true
    local stripped={}
    while moved do
      moved=false
      for i,j in ipairs(tobesorted) do
        if tobesorted[i+1]~=nil then
          if ascending then
            if j.item>tobesorted[i+1].item then
              temp=tobesorted[i]
              tobesorted[i]=tobesorted[i+1]
              tobesorted[i+1]=temp
              moved=true
            end         
          else  
            if j.item<tobesorted[i+1].item then
              temp=tobesorted[i]
              tobesorted[i]=tobesorted[i+1]
              tobesorted[i+1]=temp
              moved=true
            end
          end
        end
      end
    end
    local lastitem=0
    local indx  
    temp={}
    if group_indexes then
      for k,l in ipairs(tobesorted) do
        if  l.item~=lastitem then
          table.insert(temp,l.item)
          lastitem=l.item
        end
      end
      for k,l in ipairs(temp) do
        local dup=false
        indx=""
        for i,j in ipairs(tobesorted) do
          if j.item==l then
            if not(dup) then
              dup=true
              if trouble_shoot then
                indx=j.index.. '-'..round(j.item,1)
                --table.insert(indx,j.index.. '-'..round(j.item,1))
              else
                indx=tostring(j.index)
                --table.insert(indx,j.index)
              end
            end
          end
        end
        if #indx>0 then
          table.insert(stripped,indx)
          --stripped[tostring(round(l,2))]=indx
        end
      end
    else
      for i,j in ipairs(tobesorted) do
        if trouble_shoot then
          stripped[i]=j.index .. '-'..round(j.item,1)
        else
          stripped[i]=j.index
        end
      end
    end
    return tobesorted,stripped
  end
--    
  function z_format_peak_list_to_xml(pl)
    local aa={'a','r','t'}
    local st={'sb_severity','sb_energy','sidebands','subharmonics','rules','matches','harm_pk_index'}
    local ax={}
    local axis={}
    local unqmi={}
    local tn={}
    local peaks={}
    local mi={}
    local temp={}
    local temp1={}
    local temp2={}
    local temp3={}
    local temp4={}
    local sorts={}
    local shaftspeed
    local shaftrpm
    if #pl >0 then -- peak list empty
      --
      -- built list of unique machine indexes
      --    
      local dup=false
      for _,r in ipairs (pl) do  --  Row of peak list 
        if dup then break end
        for _,m in ipairs (unqmi) do  
          if not (dup)  then 
            dup=r.mi == m 
          end            
          if dup then break end
        end
        if not(dup) then 
          table.insert(unqmi,r.mi)
        end
        dup=false
      end
      --
      for _,m in ipairs (unqmi) do  -- unique machine indexes
        if trouble_shoot then debugprint ("mi",m) end
        ax={axis}
        for _,a in ipairs (aa) do  --     a,r,t
          --tn={} 
          peaks={}
          for _,r in ipairs (pl) do --  Row of peak list
            if r.mi == m and a == r.axis then -- machine index and axis match
              shaftspeed=r.shaftspeed
              shaftrpm=r.shaftrpm
              temp={}
              for pk,pkv in ipairs (r.peaks) do -- peak
                temp1={}
                if type(pkv)=="table" then
                  for pa1,pav1 in pairs (pkv) do  --peak attribute
                    temp2={}
                    if type(pav1)=="table" then
                      for pa2,pav2 in pairs (pav1) do
                        temp3={}
                        if type(pav2)=="table" then
                          for pa3,pav3 in pairs (pav2) do
                            temp4={}
                            if type(pav3)=="table" then
                              for pa4,pav4 in pairs (pav3) do  -- sideband indexes
                                temp4[pa4]={pk_index=tostring( pav4)}
                              end  -- for pa4
                              if pa1=='sidebands' then 
                                temp3['sideband'] = {band=pa3,{temp4}} -- built side band index table
                              else
                                temp3[pa3]=temp4
                              end
                            else 
                              if pa1=='sb_severity' then 
                                temp3["severity"] ={tag=pa3,value=pav3}  
                              elseif pa1=='sb_energy' then 
                                temp3["energy"] ={tag=pa3,value=pav3}
                              else
                                temp3[pa3]=pav3
                              end
                            end
                          end  -- for pa3
                          if pa1=='matches' then 
                            temp2[pa2] ={match=temp3}
                          elseif pa1=='rules' then
                            temp2[pa2] ={rule=temp3}
                          else
                            temp2[pa2]=temp3
                          end
                          temp3={}
                        else 
                          if pa1=='harm_pk_index' or pa1=='subharmonics' then 
                            temp2[pa2]={pk_index=pav2}
                          elseif pa1=='subharmonics' then
                            temp2[pa2]={info=pav2}
                          else
                            temp2[pa2]=pav2
                          end
                        end  -- if pav2 is table
                      end   -- for pa2 
                      temp1[pa1]=temp2
                    else
                      temp1[pa1]=pav1
                    end  -- if pav1 is table (peak attribute)
                    temp2={}
                  end -- pa1 
                  temp[pk]=temp1
                else
                  temp[pk]=pkv
                end  -- if pkv is table (peak)
                --temp= {peak={temp}} 
                --table.insert(tn,{peaks=temp}) 
                table.insert(peaks,{peak=temp}) 
                temp={}
              end  -- for p.peak
              tn={peaks=peaks}
              peaks={}
              if r.ave_peaks~=nil then
                for pk,pkv in ipairs (r.ave_peaks) do -- peak
                  temp1={}
                  if type(pkv)=="table" then
                    for pa1,pav1 in pairs (pkv) do  --peak attribute
                      temp2={}
                      if type(pav1)=="table" then
                        for pa2,pav2 in pairs (pav1) do
                          temp3={}
                        end   -- for pa2 
                        temp1[pa1]=temp2
                      else
                        temp1[pa1]=pav1
                      end  -- if pav1 is table (peak attribute)
                      temp2={}
                    end -- pa1 
                    temp[pk]=temp1
                  else
                    temp[pk]=pkv
                  end  -- if pkv is table (peak)
                  table.insert(peaks,{peak=temp}) 
                  temp={}
                end  -- for p.ave_peaks

                table.insert( tn,{ave_peaks=peaks})
              end -- r.ave_peaks~=nil
              peaks={}
              temp={}
              sorts={}
              for sl,slv in pairs (r.sorts) do -- sort list (sval,dif,harm_severity,sb_severity,..)
                temp1={}
                if sl~="sb_severity" then  -- single sort (just indexes)

                  for sa1,sav1 in ipairs (slv) do  -- index of single sorts
                    table.insert(temp1,{pk_index=sav1})
                  end  -- 
                  temp[sl..'_sort']=temp1  
                else  -- sideband severity
                  temp2={}
                  temp3={}
                  temp4={}
                  for sa1,sav1 in pairs (slv) do  --sb frequency
                    for sa2,sav2 in pairs (sav1) do --sb severity value groups
                      local a=0
                      --for sa3,sav3 in ipairs (sav2) do  -- indexs peaks with equal severity 
                      --temp3[sa3]={pk_index=tostring (sav3)}
                      --end                               -- indexs peaks with equal severity 
                      temp4['severity']={band=tostring (sa2),sav2} -- built table with table
                      table.insert( temp2,temp4)
                      temp3={}
                      temp4={}
                    end                               --sb severity value groups
                    temp4['sb_group']={sideband=tostring (sa1),temp2}  -- build table with table
                    table.insert( temp1,temp4)
                    temp4={}
                    temp2={}
                  end                                 --sb frequency
                  temp1={sidebands={temp1}}
                  temp[sl..'_sort']=temp1  
                end                                 -- if pk~="sb_severity"
                table.insert(sorts,temp)
                temp={}
              end  -- sort list (sval,dif,harm_energy,sb_severity,..) 
              table.insert(tn,{sorts=sorts})
              sorts={}
            end   -- machine index and axis match
          end  --  Row of peak list
          if #tn>0 then 
            temp={axisdata={axis=a,{tn}}}
            tn={}
            table.insert ( ax,temp) 
          end
        end --     a,r,t
        temp={pickup={vmel_index= m,shaftspeed=shaftspeed, shaftrpm=shaftrpm, vmel_datasource= machine.elements[m].guid,{axis={ax}}}}
        table.insert(  mi,temp)
      end -- unique machine indexes
      mi={peaklist=mi}
      --local luatoxml=require("luatoxml")
      local luatoxml=get_lua_to_xml()
      local xml = luatoxml.toxml(mi) 
      if trouble_shoot then debugprint(xml) end
      return xml
    end  -- peak list empty
    return ""
  end  --function end
--
  function z_analyze_PL_harmonics_for_1x(range)
    local percent_pattern_match=30
    local peak_quality=machine.scale
    if peak_quality==0 then peak_quality=10 end

    -- find shaft speeds using harmonic severity sorted list 
    -- i.e. find match to loudest harmonic series within the search range first
    local sss = machine.supershafts
    local speeds = compute_super_shaft_speeds(sss, machine.ispeed, 1.0 )
    local fff = MakeForcingOrdersForSuperShafts(sss, true )
    local ff={}      
    for i,sp in ipairs(fff) do
      for _,en in ipairs(sp) do
        -- if en.tag ~= '1X' then
        table.insert(ff,{speed=speeds[i],order=en.order,tag=en.tag})
        --end
      end
    end
    if #ff==0 then
      for i,sp in ipairs (speeds) do 
        table.insert(ff,{speed=sp,order=1,tag='1X'})
      end
    end
    --
    -- determine if the train is fixed speed (i.e motor drive) or variable speed (i.e. turbine drives)
    --
    local fixedspeed=fixed_speed()

    local searchrange=searchrange or machine.vspeed/100*2
    if not(fixedspeed) then  -- if the train is not fixed speed then open up the search range
      searchrange=2*searchrange
    end
    local orders={}
    local freq1x=0
    local sr1xs={}
    local sr1x={}
    --
    debugprint()
    -- Drill into peaklist
    local mi,axis
    for m,mia in ipairs(g_peak_list) do
      debugprint('Normalizing to machine speed '..round(machine.speed*60,1)..' +/-'..round(machine.speed*60*machine.vspeed/100,2) .. ' rpm     shaft speed: '..round(machine.speed*mia.shaftspeed*60,1))
      sr1x={}  
      freq1x=0
      local index
      local speedfound=false
      -- Deterimine if there are enough forcing orders to pattern match by building a table of orders to match
      local pattern={}
      if #ff>1 then 
        -- build pattern table
        for _,f in ipairs(ff) do
          local dup=false
          local ord=f.speed/mia.shaftspeed*f.order 
          if #pattern>0 then
            for _,p in ipairs(pattern) do
              dup=p==f.speed/mia.shaftspeed*f.order
              if dup then break end
            end
          end
          if not(dup) and ord>.1 then table.insert(pattern,ord) end
        end
        --local function sort(a,b) return a>b end
        table.sort(pattern,function (a,b) return a<b end)

        local dataranges={}
        for _,ds in ipairs(mia.datasets) do
          table.insert(dataranges,{dsi=ds,orders=machine.datasets[ds].fmax/(machine.speed*mia.shaftspeed)})  -- set the dataset max orders based on  machineclass nominal speed
        end
        local moved=true
        local temp={}
        while moved do
          moved=false
          for i,j in ipairs(dataranges) do
            if dataranges[i+1]~=nil then
              if j.orders>dataranges[i+1].orders then
                temp=dataranges[i]
                dataranges[i]=dataranges[i+1]
                dataranges[i+1]=temp
                moved=true
              end
            end
          end
        end
        local maxte=0
        local maxct=0
        local sord,mt,spd=0,0,0
        local minamp,maxamp,ordmin,ordmax= pk_mia_min_max(mia.mi,mia.axis)
        local dynamicrange=maxamp-minamp
        local pat={}
        --
        -- This section of code examines each peak in the peak list to determine if it is a harmonic of any shaft in the train that has the best pattern match
        --
        local lastorders=0
        local lastspeed=0
        local sbin=0

        for d,dr in ipairs(dataranges) do
          maxte=0
          maxct=0
          --  determine the part of the pattern that can be used for each dataset
          pat={}
          for _,p in ipairs(pattern) do
            local lowlimit=.05 
            if #pattern==1 and d==1 then lowlimit=0 end
            if d>1 then lowlimit=dataranges[d-1].orders*1.02/dr.orders end
            if p>lowlimit*dr.orders and p<dr.orders*.98 then
              table.insert(pat,p)
            end
          end
          if #pat==0 then
            debugprint ("No pattern to match for "..round(dr.orders)..'x range.')
            table.insert (sr1x,{sfreq=-1,dsi=dr.dsi})
          else
            for _,p in ipairs(pat) do
              debugprint(p)
            end
            spd=0
            maxte=0
            maxct=0
            freq1x=0
            for p,pk1 in ipairs (mia.peaks) do  -- subject peaks
              if pk1.sord>dr.orders then break end 
              if pk1.sord>=lastorders and pk1.sord<=dr.orders then
                for s,sp in ipairs (speeds) do  -- speeds of each shaft
                  if (dr.orders/(sp/mia.shaftspeed) < 300 and sp~=1) or sp==1 then
                    local harms=100 
                    if sp/mia.shaftspeed<.25 then harms=15 end
                    for  i=1,harms,1 do -- harmonic of interest
                      --
                      -- is subject peak 1x (peak freq/shaft speed/harmonic) in the search range of machine 1x and the same dataset
                      --
                      if (pk1.sfreq/(sp/mia.shaftspeed))/i>machine.speed*mia.shaftspeed*(1-searchrange) and (pk1.sfreq/(sp/mia.shaftspeed))/i<machine.speed*mia.shaftspeed*(1+searchrange) and pk1.sdsi==dr.dsi  then 
                        local te=0
                        local ct=0
                        for _,pt in ipairs (pat) do -- orders to normalize on
                          for j,pk2 in ipairs (mia.peaks) do 
                            if pk2.sdsi==dr.dsi then
                              if pk2.sord>=lastorders and pk2.sord<=dr.orders then
                                if pk2.sord*.99>(pk1.sord/(sp/mia.shaftspeed))/i*pt then break end
                                --
                                -- is this peak a multiple of the subject peak 1x * pattern order
                                --
                                local itismult,mult,rmdr=z_is_a_multiple((pk1.sord/(sp/mia.shaftspeed))/i*pt,pk2.sord,.001) 
                                --
                                -- is subject peak prominant and is this peak slighty significant and not the noise floor
                                --
                                if itismult and mult==1 and pk1.mdif>peak_quality and (pk2.mdif>1 and pk2.sval>minamp+(.1*dynamicrange)) then
                                  --debugprint(round(pt,3).." match at "..round(pk2.sord,3),round((pk1.sord/(sp/mia.shaftspeed)),3)..'/'..i,round(pk1.sord,3))
                                  --
                                  -- add a slight weighting to 1x in pattern for cases were the higher orders have tight side bands 
                                  --
                                  if pt==1 and #pat<3 then -- added 'and #pat<3' to remove weighting on complex drivetrains 
                                    te=te+ pk2.sval*1.5
                                  else
                                    te=te+ pk2.sval
                                  end
                                  ct=ct+1
                                end
                              end
                            end
                          end  
                        end
                        if te*ct>=maxte and ct>=maxct and ct~=0  and sp/mia.shaftspeed>=spd then
                          mt=i
                          spd=(sp/mia.shaftspeed)
                          index=p
                          sord=(pk1.sord/(sp/mia.shaftspeed))/i
                          freq1x=(pk1.sfreq/(sp/mia.shaftspeed))/i
                          sbin=pk1.sbin
                          maxte=te*ct
                          maxct=ct
                          debugprint(">>>",p,i,round((sp/mia.shaftspeed)*mia.shaftspeed,3),round(pk1.sfreq,1),round ((pk1.sfreq/(sp/mia.shaftspeed))/i,1),round ((pk1.sfreq/(sp/mia.shaftspeed))/i*60,1),round(te),ct,'mdif:'..round(pk1.mdif),round ((pk1.sfreq/(sp/mia.shaftspeed))/i*60/mia.shaftspeed,1), maxct)
                        end  -- how many matches
                      end  -- is calculated 1x in searchranges
                    end -- harmonic of interest
                  end -- speed is big enough percentage of the range
                end-- speeds of each shaft
              end -- in pk1 in dataset range
            end-- subject peaks
            --
            --  is there a pattern match
            --
            if freq1x>0 and maxct>0 and (#pat<=3 or (#pat>3 and maxct>=math.ceil (#pat*(percent_pattern_match/100)))) then
              table.insert (sr1x,{sfreq=freq1x,pk_index=index,sord=sord,speed=mia.shaftspeed,dsi=dr.dsi,sbin=sbin})
              debugprint('mi: '..mia.mi..' axis: '..mia.axis..' order: '..round(sord,2)..'x at '..round(freq1x,1)..'hz from '..round(freq1x*mt*spd,2)..'/('..mt..'*'..round(spd*mia.shaftspeed,3)..')  '..maxct..'/'..#pat.." FO pattern "..' RPM '..round(freq1x*60,1),round(dr.orders)..'x range',round(freq1x*60/mia.shaftspeed,1), mt)
              lastspeed=freq1x
              speedfound=true
            else
              table.insert (sr1x,{sfreq=-1,dsi=dr.dsi})
              debugprint ("No pattern match for "..round(dr.orders)..'x range.')
            end  -- is the pattern 
          end  -- #pat>0
          lastorders=dr.orders
        end-- data ranges
        goto nxtmia
        if speedfound then goto nxtmia end
      else
        --
        -- Harmonic energy normalization for item with only 1 item in the pattern, 1x
        -- Finds the tone in the peak list in the search range with the most highest harmonic energy
        -- on the assumtion that the shaftrate series will have the highest harmonic energy
        --
        orders={}
        --
        -- Build an info list for peaks in harmonic energy sort from peak list
        --
        if mia.sorts.harm_energy=={} then
          table.insert(orders,{pk_index=nil,  sord=nil, sfreq=nil,harms=nil, mi=mia.mi,axis=mia.axis,speed=mia.shaftspeed})
        else
          for h,he in ipairs(mia.sorts.harm_energy) do
            local harms={}
            local f1x=mia.peaks[he].sfreq
            local ord=f1x/(machine.speed*mia.shaftspeed)
            for p,pi in ipairs(mia.peaks[he].harm_pk_index) do
              table.insert (harms,{order=round(mia.peaks[tonumber(pi)].sfreq/f1x),sfreg=mia.peaks[tonumber(pi)].sfreq,pk_index=pi})
            end
            table.insert(orders,{pk_index=he,  sord=ord, harms=harms ,sfreq=mia.peaks[he].sfreq, mi=mia.mi,axis=mia.axis,speed=mia.shaftspeed})
          end
        end
        local matches={}
        local ratios={}
        -- look for the first match within vspeed% of faster speed shafts then slower speed shaft 
        for i,he in ipairs(orders) do
          speedfound=false
          mi=he.mi or 'No mi'
          axis=he.axis or 'No axis'
          if he.sord~=nil then
            if #speeds>1 then
              --for m=1,2 do
              for j,sp in ipairs(speeds) do
                local ratio=(sp/mia.shaftspeed)
                for m=1,3 do
                  -- check for match to secondary speed shaft 
                  local itis,mult,rmdr=z_is_a_multiple(ratio,he.sord,searchrange) 
                  if itis and mult==m then
                    local spd=ratio*mia.shaftspeed
                    --table.insert (sr1x,{sfreq=he.sfreq/(ratio*m),mi=he.mi,axis=he.axis,pk_index=he.pk_index,sord=he.sord/(ratio*m),speed=he.speed})
                    --debugprint('order: '..he.sord/(ratio*m)..'x at '..he.sfreq/(ratio*m)..'hz from '..he.sfreq.." secondary shaft "..he.sfreq/(ratio*m)..' RPM '..he.sfreq/(ratio*m)*60/spd,(ratio*m))
                    table.insert(matches,{freq=he.sfreq/(ratio*m),ratio=ratio,m=m,sord=he.sord/(ratio*m),speed=he.speed,pk_index=he.pk_index})
                    local dup=false
                    for _,r in ipairs(ratios) do
                      if r==ratio then
                        dup=true
                        break
                      end
                    end
                    if not (dup) then table.insert(ratios,ratio)
                    end
                    --speedfound=true
                    --goto nxtmia
                  end
                end --for m=1,3
              end -- for j,sp
            else -- if #speed>1
              for m=1,3 do
                -- primary shaft 
                local itis,mult,rmdr=z_is_a_multiple(1,he.sord,searchrange) 
                if itis and mult==m then
                  table.insert (sr1x,{sfreq=he.sfreq/m,mi=he.mi,axis=he.axis,pk_index=he.pk_index,sord=he.sord/m,speed=he.speed})
                  debugprint('order: '..he.sord/m..'x at '..he.sfreq/m..'hz from '..he.sfreq.." primary shaft "..he.sfreq/m..' RPM '..he.sfreq/m*60, m)
                  speedfound=true
                  goto nxtmia
                end
              end --for m=1,3
            end -- if #speeds>1
          end --if he.sord~=nil
        end --for i,he
        if #speeds>1 then
          for i,m1 in ipairs(matches) do
            if #matches==1 or #ratios==1 then
              table.insert (sr1x,{sfreq=m1.freq,mi=mia.mi,axis=mia.axis,pk_index=m1.pk_index,sord=m1.sord,speed=m1.speed})
              debugprint('order: '..m1.sord..'x at '..m1.freq..'hz from '..m1.freq*m1.ratio.." single shaft match "..m1.freq/m1.m..' RPM '..m1.freq*60,m1.ratio)
              speedfound=true
              goto nxtmia
            end
            for j,m2 in ipairs(matches) do
              if i~=j then
                local itis,mult,rmdr=z_is_a_multiple(m1.freq,m2.freq,.011) 
                if itis and mult==1 then--and m1.ratio~=m2.ratio then
                  table.insert (sr1x,{sfreq=(m1.freq+m2.freq)/2,pk_index=m1.pk_index,sord=m1.sord,speed=m1.speed,dsi=m1.sdsi})
                  debugprint('order: '..m1.sord..'x at '..((m1.freq+m2.freq)/2)..'hz from '..(m1.freq+m2.freq)/2*m1.ratio.." multiple shafts "..((m1.freq+m2.freq)/2)/m1.m..' RPM '..(m1.freq+m2.freq)/2*60,m1.ratio,m2.ratio)
                  speedfound=true
                  goto nxtmia
                end
              end --if i~=J 
            end --for i,m2
          end --for i,m1
        end --if #speed>1
        speedfound=false
      end
      if mi==nil or axis==nil then
        debugprint('No speed match found')
      else
        debugprint('No speed match found for '..mi..' - '..axis)
      end
      table.insert (sr1x,{speed=mia.shaftspeed})
--
      ::nxtmia::
--
      table.insert(sr1xs,{found=speedfound,mi=mia.mi,axis=mia.axis,info=sr1x,shaftspeed=mia.shaftspeed})
      local stop
    end --for m,mia
    return sr1xs,orders
  end  -- function
--
  function flag_normalized_peaks(peak_list,sr1xs)
    if sr1xs~=nil then
      for _,mia in ipairs (peak_list) do
        for _,pmia in ipairs (sr1xs) do
          if pmia.found then
            if mia.mi==pmia.mi and mia.axis==pmia.axis then
              for _,i in pairs(pmia.info) do
                if i.sbin~=nil then
                  for _,pk in ipairs (mia.peaks) do
                    if i.sbin==pk.sbin then 
                      local flags=pk.flags
                      pk.flags=add_flag(flags,'n')
                      break
                    end
                  end
                end 
              end
            end
          end
        end
      end
    end
    return peak_list
  end
--
--
  --[[function flag_normalized_peaks_in_cpl(sr1xs)
    for ei,e in ipairs(machine.elements) do 
      if e.data~=nil and e.data.spec~=nil and e.data.spec.cpl~=nil then
        for typ,axes in pairs(e.data.spec.cpl) do
          if typ=='normal' then
            for ax, pl in pairs(axes) do
              for _,mia in ipairs(sr1xs) do
                if mia.mi==ei and ax==mia.axis then
                  for _,i in pairs(mia.info) do
                    if i.sbin~=nil then
                      for _,pk in ipairs (pl.peaks) do
                        if i.sbin==pk.sbin then 
                          local flags=pk.flags
                          pk.flags=add_flag(flags,'n')
                          break
                        end
                      end
                    end
                  end
                end 
              end
            end
          end
        end
      end
    end
    return 
  end ]]
--
  function z_update_dataset_speeds(sr1xs)
    -- preview sr1xs to determine if there are different speeds for the ranges.
    local ranges=0
    local axes=#sr1xs
    local none=false
    local ave={}
    -- determine if the train is fixed speed (i.e motor drive) or variable speed (i.e. turbine drives)
    local fixedspeed=fixed_speed()

    local lastmi,mis=0,0  
    for m,mia in ipairs (sr1xs) do
      if lastmi~=mia.mi then 
        mis=mis+1
        lastmi=mia.mi
        local temp={}
        for i=1,#mia.info do
          table.insert(temp,{sum=0,sumsqr=0,n=0,sfreqs={1},speed=0})
        end
        ave[mia.mi]=temp
      end 
    end
    -- preview preview sr1xs and calc ave speed and deviation
    local hasspeed=false  
    repeat
      local sum,sumsqr,n,avespd,sigma=0,0,0,0,0
      for m,mia in ipairs (sr1xs) do
        if mia.found then
          for i,info in ipairs(mia.info) do
            if info.dsi~=nil and i==1 then ranges=ranges+1 end
            if info.sfreq>0 then
              hasspeed=true 
              n=n+1
              sum=sum+info.sfreq/mia.shaftspeed
              sumsqr=sumsqr+((info.sfreq/mia.shaftspeed)^2)
            end
          end
        end 
      end
      --remove outliers were sigma is greater than 1%  on fixed speed machines and 10% on non-fixed speed machines
      local removed=false
      local spdvar=.005
      if not (fixedspeed)  then spdvar=.1 end 
      avespd=sum/n
      if n>2 then sigma=math.sqrt((sumsqr-(sum^2/n))/(n-1)) end  
      debugprint('ave speed: '..round(avespd,1),'sigma: '..round(sigma,2),'% dev: '..round(100*sigma/avespd,2)..' allowable % dev: '..spdvar*100) 
      if sigma/avespd>spdvar  then
        if sigma/avespd>spdvar then -- if sigma > sprvar remove it
          local maxmia, maxinfo,maxdif=0,0,0
          -- find the greatest outlier
          for m,mia in ipairs (sr1xs) do
            if mia.found then
              for i,info in ipairs(mia.info) do  
                if math.abs(info.sfreq/mia.shaftspeed-avespd)>maxdif and info.sfreq>0 then
                  maxdif=math.abs(info.sfreq/mia.shaftspeed-avespd)
                  maxinfo=i
                  maxmia=m
                end
              end
            end
          end
          local info=sr1xs[maxmia].info[maxinfo]
          if math.abs(maxdif-avespd)>sigma and info.sfreq>0 then
            debugprint('Removing Outlier - mi: '..sr1xs[maxmia].mi..' axis: '..sr1xs[maxmia].axis..' range: '..maxinfo..' - '..round(info.sfreq/sr1xs[maxmia].shaftspeed,2) ..' hz '..round(info.sfreq*60/sr1xs[maxmia].shaftspeed,1)..' rpm %deviation: '..round(100*sigma/avespd))
            info.sfreq=-1
            info.sord=nil
            info.sbin=nil
            info.speed=nil
            removed=true
          end
        end
      end
    until not(removed)  -- outliers removed
    -- calculate the average speed for each range at each pickup
    for m,mia in ipairs (sr1xs) do
      if mia.found then
        for i,info in ipairs(mia.info) do
          if info.sfreq>0 then
            ave[mia.mi][i].speed=info.speed
            ave[mia.mi][i].n=ave[mia.mi][i].n+1
            ave[mia.mi][i].sum=ave[mia.mi][i].sum+info.sfreq
            ave[mia.mi][i].sfreqs[ave[mia.mi][i].n]=info.sfreq
          end
        end
      end
    end
    local updated=false
    if hasspeed then
      local count=0
      local lasti=1
      local lastmi=0
      local n,total,machave=0,0,0
      for mi,m in pairs (ave) do
        for r,rng in ipairs (m) do
          if rng.n>0 then
            total=rng.sum
            n=rng.n
            total, n, sr1xs=check_pickup_speed(total,n,mi,sr1xs,r) -- removes outliers from average and sets all axes to the range average
            if n==0 then 
              rng.avefreq=0
              rng.n=0
            else
              rng.sum=total
              rng.n=n
            end
          end
        end
      end
      machave,n=0,0  -- calculate the average for the all available pickups
      for mi,m in pairs (ave) do
        for r,rng in ipairs (m) do
          if rng.sum~=0 then
            machave=machave+(rng.sum/rng.n)/rng.speed
            n=n+1
          end
        end
      end
      machave=machave/n
      for m,mia in ipairs(sr1xs) do
        local lastspeed=0
        for i,inf in ipairs (mia.info) do
          if ave[mia.mi][i]==nil then
            ave[mia.mi][i]={sum=0,sumsqr=0,n=0,sfreqs={1},speed=0}
          end
          if ave[mia.mi][i].n==0 and lastspeed==0 then
            for i1,inf1 in ipairs (mia.info) do
              if i~=i1 and ave[mia.mi][i1].n~=0 then
                lastspeed=ave[mia.mi][i1].sum/ave[mia.mi][i1].n
                break
              end
            end 
            if lastspeed==0 then
              mia.shaftrate=machave*mia.shaftspeed
              inf.sfreq=machave*mia.shaftspeed
              none=true
            else
              mia.shaftrate=lastspeed
              inf.sfreq=lastspeed
              none=true
            end
          elseif ave[mia.mi][i].n>0  then
            mia.shaftrate=ave[mia.mi][i].sum/ave[mia.mi][i].n
            inf.sfreq=ave[mia.mi][i].sum/ave[mia.mi][i].n
            lastspeed=ave[mia.mi][i].sum/ave[mia.mi][i].n
            none=true
          elseif ave[mia.mi][i].n==0 and lastspeed~=0 then
            mia.shaftrate=lastspeed
            inf.sfreq=lastspeed
            none=true
          end
        end
      end
      local dataranges={}
      for i,mia in ipairs(g_peak_list) do  -- build a table of dataset indexs associated to the range
        dataranges[i]={range={}}
        for _,ds in ipairs(mia.datasets) do
          dataranges[i].range[machine.datasets[ds].fmax]=ds
        end 
      end
      local miaspeed
      for i,mia in ipairs(dataranges) do
        miaspeed=0
        for fm,ds in pairs(mia.range) do
          updated=false
          if sr1xs[i].info[1]~=nil then
            local sr1x=sr1xs[i]
            for _,inf in ipairs (sr1x.info) do
              if inf.sfreq~=nil then
                if inf.sfreq>0 then
                  miaspeed=inf.sfreq 
                end
              end
              if inf.dsi==ds and miaspeed>0 then
                debugprint('>Pickup: '..sr1x.mi..' Axis: '..sr1x.axis..' dsi: '..ds..' Fmax: '..round(fm)..' speed set to: '..round(miaspeed,3)..' hz '..round(miaspeed*60/sr1xs[i].shaftspeed,2))
                machine.datasets[ds].speed=miaspeed
                --add_1x_place_holders_to_ds_peaks (ds,i) 
                updated=true
              end
            end
          end
          if not (updated) and miaspeed>0 then
            debugprint('Pickup: '..sr1xs[i].mi..' Axis: '..sr1xs[i].axis..' dsi: '..ds..' Fmax: '..round(fm)..' speed set to: '..round(miaspeed,3)..' hz '..round(miaspeed*60/sr1xs[i].shaftspeed,2))
            machine.datasets[ds].speed=miaspeed
            --add_1x_place_holders_to_ds_peaks (ds,i) 
            updated=true
          end
        end
      end
    end
    return updated, sr1xs
  end
  --
  function check_pickup_speed(total,n,mi,sr1xs,infoindx)
    local ave=total/n
    local maxdif=0
    local maxaxis=""
    local a,r,t=0,0,0
    local sfreq,rng,spd
    local fmax
    if n==3 then  -- find possible outlier and remove from average
      for m,mia in ipairs (sr1xs) do
        if mia.found then
          for i,inf in ipairs(mia.info) do
            if inf.dsi~=nil then
              if mia.mi==mi and i==infoindx then
                if mia.axis=='a' then a=inf.sfreq end
                if mia.axis=='r' then r=inf.sfreq end
                if mia.axis=='t' then t=inf.sfreq end
                local dif=math.abs(ave-inf.sfreq)
                if dif>maxdif then
                  maxdif=dif
                  maxaxis=mia.axis
                  sfreq=inf.sfreq
                  rng=i
                  spd=mia.shaftspeed
                  fmax=machine.datasets[inf.dsi].fmax
                end
              end
            end
          end
        end
      end 
      -- if there is an outlier, average the range without it
      if maxdif/ave>.001 then -- 0.1%= ~3.6 rpm / 3600 rpm
        debugprint('Removing Outlier - mi: '..mi..' axis: '..maxaxis..' range: '..rng..' - '..round(sfreq,2) ..' hz '..round(sfreq*60*spd,1)..' rpm ')
        n=2
        if maxaxis=='a' then total=r+t end
        if maxaxis=='r' then total=a+t end
        if maxaxis=='t' then total=r+a end 
      end
    end
    -- change all values for the pickup range to average
    for i,mia in ipairs (sr1xs) do 
      if mia.found then
        for j,inf in ipairs(mia.info) do
          if inf.dsi~=nil then
            if mia.mi==mi and machine.datasets[inf.dsi].fmax==fmax then
              sr1xs[i].info[j].sfreq=total/n
            end
          end
        end
      end
    end
    return total,n,sr1xs
  end
--

--  
  function pk_mia_min_max(mi,axis)
    local minamp,maxamp,ordmin,ordmax=0,0,0,0
    for i,mia in ipairs(g_peak_list) do
      if mia.mi==mi and mia.axis==axis then
        local sval,sord=0,0
        for j,pk in ipairs(mia.peaks) do
          if j>1 then
            if minamp>=pk.sval then
              minamp=pk.sval
              ordmin=pk.sord
            end
            if maxamp<=pk.sval then
              maxamp=pk.sval
              ordmax=pk.sord
            end
          else
            minamp=pk.sval
          end
          sval=pk.sval
          sord=pk.sord
        end
        break
      end
    end
    return minamp,maxamp,ordmin,ordmax
  end
--

--
  function z_renormalize_peak_list(peak_list)
    for _,mia in ipairs (peak_list) do
      for _,pk in ipairs (mia.peaks) do
        local dsspeed=machine.datasets[pk.sdsi].speed
        pk.sord=pk.sfreq/dsspeed
      end
    end
    return peak_list
  end
--
  function add_flag(flags,flag)
    flags=flags or '-'
    if flag==nil then return flags end
    if string.match(flags,flag)~=flag then
      if flags~='-' then
        if string.find(flags,flag)==nil then flags=flags..','..flag end
      else 
        flags= flag
      end
    end
    return flags
  end
--

  function add_1x_place_holders_to_pl (peak_list) 
    -- this function adds a place holder peak to the peak list if a shaft does not have a 1x tone 
    -- this will allow a harmonic list to be built for each shaft
    local close=.002
    local speeds={} 
    for ci,csr in pairs (g_comp_speed_ratio) do
      if #speeds==0 then 
        table.insert(speeds,csr) 
      else
        local csrfound=false
        for _,spd in ipairs (speeds) do
          if spd==csr then  csrfound=true end
        end
        if not (csrfound) then table.insert(speeds,csr) end
      end
    end
    for _,mia in ipairs(peak_list) do

      for _,sp in ipairs(speeds) do
        local temp_pl={}
        --table.move(mia.peaks,1,#mia.peaks,1,temp_pl)
        local done=false
        local ord1x=sp/mia.shaftspeed
        for p,pk in ipairs(mia.peaks) do
          if not (done) then
            if pk.order>ord1x*.97 and pk.order<ord1x*1.03 and not (done) then -- in search range
              table.insert (temp_pl,pk)
              local is1x,mult,rmdr=z_is_a_multiple(ord1x,pk.order,close)
              if is1x and mult==1 and not (done) then -- is this peak a match
                done=true
                if mia.peaks[p+1]~=nil then
                  local nextiscloser,nmult,nrmdr=z_is_a_multiple(ord1x,mia.peaks[p+1].order,close)
                  if nextiscloser and nm==1 and nrmdr<rmdr then -- is the next peak a better match
                    done=false
                  end
                end
              end
            elseif pk.order>=ord1x*1.003 and not (done) then -- not found in range -> insert place holder
              local bw=pk.order/pk.bin
              local sr={order=ord1x,bin=(ord1x)/bw,pk_index=1,flags="x,p",matches={},fmax=pk.fmax,ds=pk.ds,freq=ord1x*(pk.freq/pk.order)}
              table.insert (temp_pl,sr)
              --add_1x_place_holders_to_ds_peaks (pk.ds,(ord1x)/bw) 
              table.insert (temp_pl,pk)
              done=true
            else -- below search range
              table.insert (temp_pl,pk)
            end
          else -- done=true
            table.insert (temp_pl,pk)
          end -- if not (done)
        end  -- pk
        mia.peaks={}
        table.move(temp_pl,1,#temp_pl,1,mia.peaks)
      end  -- sp
    end  -- mia
    return peak_list
  end -- function
--
  function add_1x_place_holders_to_ds_peaks (ds,miaindx) 
    local speeds={} 
    for ci,csr in pairs (g_comp_speed_ratio) do
      if #speeds==0 then 
        table.insert(speeds,csr) 
      else
        local csrfound=false
        for _,spd in ipairs (speeds) do
          if spd==csr then  csrfound=true end
        end
        if not (csrfound) then table.insert(speeds,csr) end
      end
    end
    for _,sp in ipairs(speeds) do
      local bin=(sp/g_peak_list[miaindx].shaftspeed)/((machine.datasets[ds].fmax/#machine.datasets[ds].data)/machine.datasets[ds].speed)+1
      local pks={}
      local last=machine.datasets[ds].peaks[#machine.datasets[ds].peaks]
      if bin>last then
        table.insert(machine.datasets[ds].peaks,bin)
      elseif bin<last then
        local inserted=false
        for _,b in ipairs(machine.datasets[ds].peaks) do
          local dif=b-bin
          local abs=math.abs(b-bin)
          if (dif>-.5 and dif<.5) then 
            table.insert(pks,b)
            inserted=true
          elseif dif>=.5  and not(inserted) then
            table.insert(pks,bin)
            table.insert(pks,b)
            inserted=true
          else
            table.insert(pks,b)
          end
        end
        machine.datasets[ds].peaks=pks
      end
    end
    return
  end
