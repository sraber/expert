-- test.lua    Rev 6     5/8/18 


-- Error descriptions
err_des={}
err_des[0]                  = "ERROR"
err_des[E_SHAFT_TAG_INDEX]  = "BAD TAG INDEX"
err_des[E_SHAFT_DATA_INDEX] = "BAD DATA INDEX"
err_des[E_ORDER_TAG]        = "BAD ORDER TAG"
err_des[E_ATTR_TAG]         = "BAD ATTR TAG"
err_des[E_ELE_INDEX]        = "BAD ELE INDEX"
err_des[E_CORRUPT]          = "REALLY WRONG"
err_des[E_DATA]             = "NO DATA"
err_des[E_DATA_RANGE]       = "NO DATA IN RNG"
err_des[E_SHAFT_INDEX]      = "BAD SHAFT INDEX"
err_des[E_RULE_RETURN]      = "BAD RETURN"
err_des[E_PARAMETER]        = "BAD ARG"
err_des[E_VALUE_NIL]        = "NIL VALUE"

local function round(number , places)
  if number==nil then return nil end
  local mult=10^(places or 0)
  if number>=0 then 
    return math.floor(number*mult+.5)/mult
  else 
    return math.ceil(number*mult-.5)/mult 
  end
end
--
function write(a, file)
  if not (g_debugprinting) then --mod erw 
    local out = assert( io.open(file,"w") )
    for index,value in ipairs(a) do
      out:write( value, "\n" )
    end
    out:close()
  end
end
--
function writedy(a, file,step, ds) -- added step to aid building freq column
  --debugprint (a, file,step, ds.speed) 
  if not (g_debugprinting ) then --mod erw g_no_printing
    local dsspeed=1
    local matches=nil
    local avedata 
    local avestep
    local avdb
    if ds~=nil then
      dsspeed=ds.speed
      matches=ds.matches
      if step<1 then 
        avestep=.01
      else
        avestep=.1
      end
      avedata=normaves(avestep,ds.mi,ds.axis)

    end

    if step==nil then step=1  end
    if dsspeed==nil then dsspeed=1 end
    local out = assert( io.open(file,"w") )
    local freq=0
    local db=1
    local ampl=0
    local order=0
    local lastindex=#a
    for index,value in ipairs(a) do
      db=round(20*math.log(value/.000001,10),1)
      if lastindex>490 then -- not peak list
        if index==1 then  out:write( "Freq,order,cm/s,VdB",file,"\n" ) end
        if ds.order==nil then -- not average
          out:write( round(freq,3),"  ,  ",round(freq/dsspeed,3),"  ,  ",round(value,4),"  ,  ",db,"\n" )
          freq=freq+step
        else
          out:write( round(order*dsspeed,3),"  ,  ",order,"  ,  ",round(value,3),"  ,  ",db,"\n" )
          order=order+step
        end
      else                       -- peak list

        if ds~=nil then
          local val=round(value)
          ampl=ds_spline_value (ds,value)
          if ampl==nil then ampl=1 end
          db=round (20*math.log(ampl/.000001,10),1)
          if matches==nil then 
            order=step*(value-1)
            freq=order*dsspeed
            if index==1 then out:write( "Bin,Freq,Order,cm/s,VdB",file,"\n" )        end
            out:write( round(value,3),"  ,  ",round(freq,3),'  ,  ', round(order,3), '  ,  ',round(ampl,4), '  ,  ', db,"\n" )
          else
            freq=step*(value-1)
            order=freq/dsspeed         
            local avord=0
            local amax=0
            local band=0
            if avedata~=nil then
              for aindex,aval in ipairs(avedata) do
                avord=aindex*avestep
                if avord<order+avestep*5 then 
                  avdb=20*math.log(aval/.000001,10)
                  if avord>order-avestep*2.5-order*.001 and avord<order+avestep*2.5+order*.003  then
                    if avdb>amax then amax=avdb end
                  end 
                  --debugprint (avord,order,amax,avdb)
                end
              end
              if amax==0 then amax=62 end
              amax=round(db-amax)
            end
            local shafts={}
            local shaft=""
            local pos
            for cn,comp in pairs(machine.components) do
              for guid,  name in pairs(machine.shafts) do

                if comp.shaft==guid then
                  --debugprint (cn,comp.shaft,guid,name.name,shafts)
                  pos=string.find( name.name,"-") 
                  shaft=string.sub( name.name,1,pos-1) ..'-'.. cn
                  shafts[cn]= shaft -- table.insert(shafts,1,shaft) 
                end 
              end
            end
            local lasttag=""
            local match=""
            local newmatch=""
            local ecname='' --[
            for _,mtch in ipairs(matches) do --[
              if string.find(mtch.tag,"X")~= nil then 
                ecname=string.sub(shafts[math.abs(mtch.cn)],1,5)
              else 
                local flyout=machine.elements[math.abs(mtch.cn)].attr.FLYOUT or "unk"
                ecname='FO {'..flyout..'}'
                end  --]]
                if value==mtch.bin then
                  if mtch.type=="F" then
                    --newmatch="1x"..mtch.tag
                    newmatch="1x"..mtch.tag..'-'..ecname
                  else
                    --newmatch=mtch.order..'x'..mtch.tag
                    newmatch=mtch.order..'x'..mtch.tag..'-'..ecname
                  end
                  local brg=string.match(newmatch,'BEAR')
                  if newmatch~=lasttag and brg==nil then
                    lasttag=newmatch
                    if match=="" then
                      match= ' - '..newmatch
                    else
                      match=match.." / "..newmatch
                    end
                  end
                end
              end
              local am=''
              if amax>0 then 
                am=am..' <<'..amax..'>>'
              else
                am=am..amax
              end
              order=.01*math.modf((order)*100+.5)
              if index==1 then out:write( "Bin,Freq,Order,cm/s,VdB,Dif,Matches",file,"\n" )  end
              out:write( round(value,3),"  ,  ",round(freq,3),'  ,  ', round(order,3), '  ,  ',round(ampl,4) , '  ,  ', db,' , ',am,' , ' ,match,"\n" )
            end
          end
        end
      end
      --out:write( value, "\n" )
      out:close()
    end
  end
--
  function printfo( fo )
    if fo==nil then
      debugprint( "forders is nil" )
    else
      for nm, tbl in pairs(fo) do
        debugprint( nm, tbl.order, tbl.use )
      end
    end
  end
--
  function printattr( attr )
    if attr==nil then
      debugprint( "attr is nil" )
    else
      for nm, v in pairs(attr) do
        debugprint( nm, v )
      end
    end
  end
--
  function printref( sref )
    if sref==nil then
      debugprint( "sref is nil" )
    else
      for _, v in ipairs(sref) do
        debugprint( v )
      end
    end
  end
--
  function printelements( eles )
    for i,e in pairs(eles) do
      debugprint( "--- element["..i.."].guid="..guid_name(e.guid) )
      debugprint( "--- forders ----")
      printfo( e.forders )
      debugprint("--- attr ---")
      printattr( e.attr )
      debugprint("--- sref---")
      printref( e.sref )
    end
  end
--
  function printdatadomain( dom )
    for v,t in pairs(dom) do
      print(v)
      for _,n in ipairs(t) do
        print(n)
      end
    end
  end
--
  function printdatasets( data )
    debugprint( "[n]", "bw","order/fmax","dom","typ","axis","speed")
    for i,t in pairs(data) do
      if t.typ=="average" then
        debugprint( "["..i.."] ", t.bw,t.order,t.dom,t.typ,t.mi..'_'..t.axis,t.speed)
      else
        debugprint( "["..i.."] ", t.bw,t.fmax,t.dom,t.typ,t.mi..'_'..t.axis,t.speed)
      end
    end
  end
--
  function writedata()
    if not (g_debugprinting) or false then --mod erw g_no_printing
      for i,t in ipairs(machine.datasets) do
        if t.dom == 'spec' then
          if t.typ=="average" then
            name = t.mi..'_'..t.axis.."-"..t.typ..'_'..t.dom.."-"..round(t.bw,2).."-"..round(t.order).."_DS["..i.."].csv"
          else
            name = t.mi..'_'..t.axis.."-"..t.typ..'_'..t.dom.."-"..round(t.bw,2).."-"..round(t.fmax).."_DS["..i.."].csv"
          end
          --write( t.data,".\\output\\"..name..".csv" )
          writedy( t.data,".\\output\\"..name,t.bw,t)
          --[
          if t.matches~=nil then
            local out = assert( io.open(".\\output\\"..name.."-matches"..".csv","w") )
            out:write( "BIN,,pos,tag-element,type\n" )
            for i,m in ipairs(t.matches) do
              out:write( m.bin..","..m.pos..","..m.tag..m.cn..","..m.type, "\n" )
            end
            out:close()
            end  --]]
          end

          --write( t.peaks,".\\output\\"..name.."-peaks"..".csv" )
        end
      end
    end
--
    function writenorms()
      local bin
      local bins_per_order
      local order_step
      local count = 0
      local name, name1, name2
      local spdata = {}
      local spdatamps = {}

      for i,t in ipairs(machine.datasets) do
        if t.dom=="spec" then
          if t.typ=="average" then
            bins_per_order = 1 / t.bw
            if t.order > 50 then
              order_step = 0.1
            else
              order_step = 0.01
            end
            --name = "DS["..i.."] norms-"..t.typ.."-step-"..order_step.."-"..t.dom.."-"..t.order.."-"..t.mi..'_'..t.axis.."-"..t.bw..".csv"
            --name1 = "PK["..i.."] norms-"..t.typ.."-step-"..order_step.."-"..t.dom.."-"..t.order.."-"..t.mi..'_'..t.axis.."-"..t.bw..".csv"
            --name2 = "MS["..i.."] norms-"..t.typ.."-step-"..order_step.."-"..t.dom.."-"..t.order.."-"..t.mi..'_'..t.axis.."-"..t.bw..".csv"
            name = t.mi..'_'..t.axis.."-"..t.typ..'_'..t.dom.."-"..round(t.bw,2).."-"..round(t.order).."_DS["..i.."].csv"
            name1 = t.mi..'_'..t.axis.."-"..t.typ..'_'..t.dom.."-"..round(t.bw,2).."-"..round(t.order).."_PK["..i.."] - peaks.csv"
            name2 = t.mi..'_'..t.axis.."-"..t.typ..'_'..t.dom.."-"..round(t.bw,2).."-"..round(t.order).."_MS["..i.."].csv"
          else
            bins_per_order = t.speed / t.bw
            local nbin = #t.data
            if 100*bins_per_order <= nbin then
              order_step = 0.1
            elseif 50*bins_per_order <= nbin then
              order_step = 0.05 
            elseif 20*bins_per_order <= nbin then
              order_step = 0.02
            elseif 10*bins_per_order <= nbin then
              order_step = 0.01
            else
              order_step = nbin / bins_per_order / 1000
            end
            --if t.bw > 1 then
            --  order_step = 0.1
            --else
            --  order_step = 0.01
            --end            
            --name = "DS["..i.."]-orders-step-"..order_step.."-"..t.dom.."-"..t.fmax.."-"..t.mi..'_'..t.axis.."-"..t.bw..".csv"
            --name1 = "PK["..i.."]-orders-step-"..t.bw.."-"..t.dom.."-"..t.fmax.."-"..t.mi..'_'..t.axis.."-"..t.bw..".csv"
            --name2 = "MS["..i.."]-orders-step-"..order_step.."-"..t.dom.."-"..t.fmax.."-"..t.mi..'_'..t.axis.."-"..t.bw..".csv"
            name = t.mi..'_'..t.axis.."-"..t.typ..'_'..t.dom.."-"..round(t.bw,2).."-"..round(t.fmax).."_DS["..i.."].csv"
            name1 = t.mi..'_'..t.axis.."-"..t.typ..'_'..t.dom.."-"..round(t.bw,2).."-"..round(t.fmax).."_PK["..i.."] - peaks.csv"
            name2 = t.mi..'_'..t.axis.."-"..t.typ..'_'..t.dom.."-"..round(t.bw,2).."-"..round(t.fmax).."_MS["..i.."].csv"
          end
          --REVIEW: Something goes wrong here for Demod.  bins_per_order seems to high and drives
          --        the spline off the end of the data.
          for count=0,999 do
            bin = order_step * count * bins_per_order
            spdata[count+1] = ds_spline_value( t, bin+1 )
            spdatamps[count+1] = ds_spline_avg( t, bin+1 )
          end
          -- Array index is unit offset.  1 - 1000

          -- This fix fails if two negitive numbers in a row
          if spdata[1] <= 0 then spdata[1] = spdata[2] end
          if spdata[1000] <= 0 then spdata[1000] = spdata[999] end

          -- Here we avoid the ends.
          for n=2,999 do
            if spdata[n] <= 0 then
              spdata[n] = (spdata[n-1] + spdata[n+1])/2
            end
          end
          --write( spdata,"C:\\projects\\Vibromatic\\Vibromatic\\bin\\Debug\\"..name )
          --REVIEW: For testing only
          --local data = ConvertSpectrum( Unit.U_M_SEC, Unit.U_VDB, spdata )
          local old=false
          if old then
            -- write( spdata,".\\output\\"..name )
            write( t.peaks,".\\output\\"..name1 )
            --write( spdatamps,".\\output\\"..name2 )
          else
            -- writedy( spdata,".\\output\\"..name,order_step )
            writedy( t.peaks,".\\output\\"..name1, t.bw ,t)
            --writedy( spdatamps,".\\output\\"..name2 , order_step)  
          end
          --[[   Remove one [ at the begining of this line to print matches
      debugprint ("Fund/Harm    ,  TAG   ,     Comp #  ,     BIN   ,    pos  ,    order",name)
      if t.matches ~=nil then
        for _,index in ipairs(t.matches) do
          debugprint (index.type,",",index.tag,",",index.cn,",",index.bin,",",index.pos,",",index.order)
        end
      end--]]
        end 
      end
    end
--
--
    function normaves(step,mi,axis)
      local bin=0
      local bins_per_order
      local order_step
      local count = 0
      local spavamps = {}
      for i,t in ipairs(machine.datasets) do
        if t.dom=="spec" then
          if t.typ=="average" then
            bins_per_order = 1 / t.bw
            if t.order > 20 then
              order_step = 0.1
            else
              order_step = 0.01
            end
            --debugprint ("avesearch",order_step,step,t.mi,mi,t.axis,axis,t,bin,t.bw, t.order)
            if order_step==step then
              if t.mi==mi then
                if string.lower(t.axis)== string.lower(axis) then
                  for count=0,999 do
                    bin = order_step * count * bins_per_order
                    spavamps[count+1] = ds_spline_value( t, bin+1 )
                  end
                  --debugprint ("average found")
                  return spavamps
                end
              end
            end
          end
        end
      end
    end
    --
    function writefaults(file, lists,createfile)

      local cf=createfile or false
      local out = assert( io.open(file,"w") )
      if cf then out:write( "shaft_faults={","\n" ) end
      for sn,f in ipairs(lists) do
        out:write( "["..sn.."]={","\n" )
        debugprint( "Faults for Shaft Number "..sn )
        debugprint( string.format("%-8s %-8s %-36s", "severity", "confidence", "fault guid" ) )
        for fg,v in pairs(f) do
          if cf then out:write( "[\""..guid_name(fg).."\"]={severity="..v.severity..",conf="..v.conf.."},","\n" ) end
          debugprint( string.format("%-8.2f %-8.2f %-36s", v.severity, v.conf, guid_name(fg) ) )
        end
        if cf then out:write( "},","\n" ) end
      end
      if cf then out:write( "}","\n" ) end
      if cf then out:close() end
    end
--

    function printerrors()
      debugprint("")
      debugprint( "=============== ERRORS AND WARNINGS ================" )
      debugprint("")
      for sn,t in pairs(g_r_failed) do
        debugprint("")
        debugprint( "Shaft GUID: "..guid_name(machine.components[sn].shaft) )
        debugprint( string.format("%-18s %-14s %-16s %s","rule guid","code","message","stack trace [file name:function name( line number )]@[next stack level]") )
        for _,r in pairs(t) do
          debugprint(string.format("%-18s %-14s %-16s %s",guid_name(r.guid),err_des[r.code],r.message,r.trace))
        end
      end
    end
--
    function writefaultstones(file, lists)

      local lastmi=0
      for sn,f in ipairs(lists) do
        if f.vms_index ~= lastmi then 
          debugprint() 
          debugprint ("#        sval    dif    sev     bin     order   sfreq data.mi  axis     fo_info          Info                          "..--[[                                  vfa_guid                                vhs_guid_shaft                          vmel_guid                               vmel_datasource                    ]]"       brg.mi")
          --debugprint ("#       sval    dif     bin    order    sfreq   MI      axis    fo_info   Info                     FO                                  vfa_guid                                vhs_guid_shaft                          vmel_guid                               vmel_datasource            vms_index")  
        end
        lastmi=f.vms_index
        local of=tonumber(f.orderfreq) or 1
        local freq=0
        if f.orderlow~=nil then freq=round(f.orderlow*of,2) end
        if string.match(f.info,"BBN")==nil then
          freq=round(of,3)
        end
        if freq>=100 then 
          freq=round(freq,2) 
        elseif freq>=1000  then
          freq=round(freq,1) 
        elseif freq>=10000 then
          freq=round(freq) 
        end
        --if not (f.dif>=10 or  f.sval>=85) then break end
          if f.orderhigh==nil then
          debugprint( sn,round(f.sval,2),round(f.dif,2),round(f.sev,1),round(f.sbin,2), round(f.orderlow,1).."X",freq,f.data_mi,f.axis,f.fo_info, f.info--[[,f.vfa_guid, f.vhs_guid_shaft,  f.vmel_guid  , f.vmel_datasource ]],  f.vms_index  )
            --debugprint( sn,round(f.sval,2),round(f.dif,2),round(f.sbin,2), round(f.orderlow,3).."X",freq,f.data_mi,f.axis,f.fo_info, f.info,f.vfa_guid, f.vhs_guid_shaft,  f.vmel_guid  , f.vmel_datasource ,  f.vms_index  )
          else

            local ordlow=round(f.orderlow,1)
            local ordhi=round(f.orderhigh,1)
            if ordlow>=10 then
              ordlow=nopointzero(round(ordlow))
              ordhi=nopointzero(round(ordhi))
            end
            debugprint( sn,round(f.sval,2),round(f.dif,2),round(f.sev,1),f.fo_info..' '..ordlow..' - '.. ordhi.."X",freq,f.data_mi,f.axis,f.fo_info, f.info--[[,f.vfa_guid, f.vhs_guid_shaft,  f.vmel_guid  , f.vmel_datasource ]],  f.vms_index  )
            --debugprint( sn,round(f.sval,2),round(f.dif,2),'BBN '..ordlow..' - '.. ordhi.."X",freq,f.data_mi,f.axis,f.fo_info, f.info,f.vfa_guid, f.vhs_guid_shaft,  f.vmel_guid  , f.vmel_datasource ,  f.vms_index  )
          end



      end

    end
