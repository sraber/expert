-- testdy.lua    Rev 1     8/21/17

require 'functions'

function hello()
   print("hello Lua")
end

--function write(a, file)
function write(a, file,rng, bb) -- added rng to aid building freq column
  if rng==nil then
    rng=1 
  end
  local out = assert( io.open(file,"w") )
  local freq=1
  local db=1
  lastindex=0
  for index,value in ipairs(a) do -- finding the total number of values
    lastindex=lastindex+1
  end  
  for index,value in ipairs(a) do
     --print (">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>",index,rng,lastindex)
    if lastindex>490 then -- spec or ave
      freq=math.modf(index*rng/lastindex*100+.5)
      freq=freq/100
      db=math.modf(20*math.log(value*2.54/.000001,10)*10+.5)
      db=db/10
      out:write( freq,"  ,  ",value,"  ,  ",db,"\n" )
    else                       -- peak list
     freq=math.modf(rng*value*100+.5)
      freq=freq/100
      db=math.modf(value+.5)
      --db=db/10
      local ampl=bb[db]
      
      if ampl==nil then ampl=1 end
      db=math.modf(20*math.log(ampl*2.54/.000001,10)*10+.5)
      db=db/10
      out:write( value,"  ,  ",freq, '  ,  ',ampl, '  ,  ', db,"\n" )
    end
    --out:write( value, "\n" )
  end
  out:close()
end

function printfo( fo )
   if fo==nil then
      print( "forders is nil" )
   else
      for nm, tbl in pairs(fo) do
         print( nm, tbl.order, tbl.use )
      end
   end
end

function printattr( attr )
   if attr==nil then
      print( "attr is nil" )
   else
      for nm, v in pairs(attr) do
         print( nm, v )
      end
   end
end

function printsref( sref )
   if sref==nil then
      print( "sref is nil" )
   else
      for _, v in ipairs(sref) do
         print( v )
      end
   end
end

function printelements( eles )
   for i,e in pairs(eles) do
      print( "--- element["..i.."].guid="..e.guid )
      print( "--- forders ----")
      printfo( e.forders )
      print("--- attr ---")
      printattr( e.attr )
      print("--- sref---")
      printsref( e.sref )
   end
end

function printdatadomain( dom )
   for v,t in pairs(dom) do
      print(v)
      for _,n in ipairs(t) do
         print(n)
      end
   end
end

function printdatasets( data )
  print( "[n]", "bw","order/fmax","dom","typ","axis","speed")
  for i,t in pairs(data) do
      if t.fmax==nil then
        print( "["..i.."] ", t.bw,t.order,t.dom,t.typ,t.axis)
      else
        print( "["..i.."] ", t.bw,t.fmax,t.dom,t.typ,t.axis,t.speed)
      end
    end
end

function writedata()
   local rng=1
   for i,t in ipairs(machine.datasets) do
      if t.fmax==nil then
         name = "DS["..i.."]"..t.typ.."-"..t.dom.."-"..t.order.."-"..t.axis.."-"..t.bw..".csv"
         rng=t.order
      else
         name = "DS["..i.."]"..t.typ.."-"..t.dom.."-"..t.fmax.."-"..t.axis.."-"..t.bw..".csv"
         rng=t.fmax
      end
      write( t.data,name,rng)
   end
end

function writenorms()
  local bin
  local bins_per_order
  local order_step
  local count = 0
  local name, name1
  local spdata = {}
  local spdatamps = {}

  for i,t in ipairs(machine.datasets) do
    local rng
      if t.dom=="spec" then
        if t.fmax==nil then
          bins_per_order = 1 / t.bw
          if t.order > 50 then
            order_step = 0.1
          else
            order_step = 0.01
          end
           name = "DS["..i.."]"..t.typ.."-"..t.dom.."-"..t.order.."-"..t.axis.."-"..t.bw..".csv"
           name1 = "PK["..i.."]"..t.typ.."-"..t.dom.."-"..t.order.."-"..t.axis.."-"..t.bw..".csv"
           name2 = "MS["..i.."]"..t.typ.."-"..t.dom.."-"..t.order.."-"..t.axis.."-"..t.bw..".csv"
           rng=t.order
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
            name = "DS["..i.."]"..t.typ.."-"..t.dom.."-"..t.fmax.."-"..t.axis.."-"..t.bw..".csv"
            name1 = "PK["..i.."]"..t.typ.."-"..t.dom.."-"..t.fmax.."-"..t.axis.."-"..t.bw..".csv"
            name2 = "MS["..i.."]"..t.typ.."-"..t.dom.."-"..t.fmax.."-"..t.axis.."-"..t.bw..".csv"
            rng=t.fmax
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
         --print("range",rng)
       write( spdata,".\\output\\"..name,rng, spdata)
       write( spdatamps,".\\output\\"..name2,rng,spdatamps )
       rng=t.bw
       --print (spdata)
       write( t.peaks,".\\output\\"..name1,rng,t.data)
          --write( spdata,".\\output\\"..name )
          --write( t.peaks,".\\output\\"..name1 )
          --write( spdatamps,".\\output\\"..name2 )
        --[[
        print ("Fund/Harm    ,  TAG   ,     Comp #  ,     BIN   ,    pos  ,    order",name)
        if t.matches ~=nil then
        for _,index in ipairs(t.matches) do
          print (index.type,",",index.tag,",",index.cn,",",index.bin,",",index.pos,",",index.order)
        end
        end --]]
      end
   end
end

function writefaults(file)
  local out = assert( io.open(file,"w") )

  out:write( "shaft_faults={","\n" )
  for sn,f in ipairs(g_faults) do
    out:write( "["..sn.."]={","\n" )
    print( "Shaft Number "..sn )
    for fg,v in pairs(f) do
      out:write( "[\""..fg.."\"]={severity="..v.severity..",conf="..v.conf.."},","\n" )
      print( fg, v.severity, v.conf )
    end
    out:write( "},","\n" )
  end
  out:write( "}","\n" )
  out:close()
end


