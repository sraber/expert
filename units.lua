-- Units.lua    Rev 3     5/16/19

local PI = 3.14159265359
local PI2 = 9.86960440109

UnitType =
    {	
    UT_USER_DEFINED	= 0,
    UT_ACCELERATION	= 1,
    UT_VELOCITY	    = 2,
    UT_DISPLACEMENT	= 3,
    UT_FREQUENCY	  = 4,
    UT_TIME	        = 5,
    UT_VOLTAGE	    = 6,
    UT_TEMPERATURE	= 7,
    UT_PRESSURE	    = 8,
    UT_VOLUME	      = 9,
    UT_FLOW	        = 10,
    UT_FORCE	      = 11,
    UT_TORQUE	      = 12,
    UT_ENERGY	      = 13,
    UT_POWER	      = 14,
    UT_CURRENT	    = 15,
    UT_NONE	        = 16
    }

Unit =
    {
    U_NONE	        = {id=-1,typ=UnitType.UT_NONE,base=0},
    U_USER_DEFINED	= {id=0,typ=UnitType.UT_USER_DEFINED,base=0},

    U_M	            = {id=11,typ=UnitType.UT_DISPLACEMENT,base=11}, -- This starts at 1 for a reason.
    U_CM	          = {id=12,typ=UnitType.UT_DISPLACEMENT,base=11}, -- We want to share the xxx_SEC2 table as    
    U_MM	          = {id=13,typ=UnitType.UT_DISPLACEMENT,base=11}, -- it is a superset of displacement and
    U_UM            = {id=14,typ=UnitType.UT_DISPLACEMENT,base=11},  -- velocity units.
    U_IN	          = {id=15,typ=UnitType.UT_DISPLACEMENT,base=11},
    U_MILS	        = {id=16,typ=UnitType.UT_DISPLACEMENT,base=11},
    U_FT	          = {id=17,typ=UnitType.UT_DISPLACEMENT,base=11},
    
    U_M_SEC	        = {id=21,typ=UnitType.UT_VELOCITY,base=21},    
    U_CM_SEC	      = {id=22,typ=UnitType.UT_VELOCITY,base=21},
    U_MM_SEC	      = {id=23,typ=UnitType.UT_VELOCITY,base=21},
    U_UM_SEC        = {id=24,typ=UnitType.UT_VELOCITY,base=21},
    U_IN_SEC	      = {id=25,typ=UnitType.UT_VELOCITY,base=21},
    U_MILS_SEC      = {id=26,typ=UnitType.UT_VELOCITY,base=21},
    U_FT_SEC	      = {id=27,typ=UnitType.UT_VELOCITY,base=21},
    U_VDB			      = {id=28,typ=UnitType.UT_VELOCITY,base=21},
    U_VDBS			    = {id=29,typ=UnitType.UT_VELOCITY,base=21},
    
    U_G	            = {id=30,typ=UnitType.UT_ACCELERATION,base=31},
    U_M_SEC2	      = {id=31,typ=UnitType.UT_ACCELERATION,base=31},
    U_CM_SEC2	      = {id=32,typ=UnitType.UT_ACCELERATION,base=31},
    U_MM_SEC2	      = {id=33,typ=UnitType.UT_ACCELERATION,base=31},
    U_UM_SEC2       = {id=34,typ=UnitType.UT_ACCELERATION,base=31},
    U_IN_SEC2	      = {id=35,typ=UnitType.UT_ACCELERATION,base=31},
    U_MILS_SEC2     = {id=36,typ=UnitType.UT_ACCELERATION,base=31},
    U_FT_SEC2	      = {id=37,typ=UnitType.UT_ACCELERATION,base=31},
    U_ADB			      = {id=38,typ=UnitType.UT_ACCELERATION,base=31},
    U_ADBS			    = {id=39,typ=UnitType.UT_ACCELERATION,base=31},
    
    U_HZ	          = {id=40,typ=UnitType.UT_FREQUENCY,base=40},
    U_CPM	          = {id=41,typ=UnitType.UT_FREQUENCY,base=40},
    U_RPM	          = {id=42,typ=UnitType.UT_FREQUENCY,base=40},
      
    U_DEG_C	        = {id=43,typ=UnitType.UT_TEMPERATURE,base=43},
    U_DEG_F	        = {id=44,typ=UnitType.UT_TEMPERATURE,base=43},
    U_DEG_K	        = {id=45,typ=UnitType.UT_TEMPERATURE,base=43},
      
    U_PA	          = {id=46,typ=UnitType.UT_PRESSURE,base=46},
    U_KPA	          = {id=47,typ=UnitType.UT_PRESSURE,base=46},
    U_PSI	          = {id=48,typ=UnitType.UT_PRESSURE,base=46},
    U_IN_HG	        = {id=49,typ=UnitType.UT_PRESSURE,base=46},
    
    U_S	            = {id=50,typ=UnitType.UT_TIME,base=50},
    U_MIN	          = {id=51,typ=UnitType.UT_TIME,base=50},
    U_HR	          = {id=52,typ=UnitType.UT_TIME,base=50},
    
    U_N	            = {id=60,typ=UnitType.UT_FORCE,base=60},
    U_KN	          = {id=61,typ=UnitType.UT_FORCE,base=60},
    U_LB_F	        = {id=62,typ=UnitType.UT_FORCE,base=60},
    U_OZ_F	        = {id=63,typ=UnitType.UT_FORCE,base=60},
    U_N_M	          = {id=64,typ=UnitType.UT_FORCE,base=60},
    U_FT_LB	        = {id=65,typ=UnitType.UT_FORCE,base=60},
    U_IN_LB	        = {id=66,typ=UnitType.UT_FORCE,base=60},
    
    U_KW	          = {id=70,typ=UnitType.UT_POWER,base=70},
    U_WATTS	        = {id=71,typ=UnitType.UT_POWER,base=70},
    U_HP	          = {id=72,typ=UnitType.UT_POWER,base=70},
    U_AMPS	        = {id=73,typ=UnitType.UT_POWER,base=70},
    U_MA	          = {id=74,typ=UnitType.UT_POWER,base=70},
    U_VOLTS	        = {id=75,typ=UnitType.UT_POWER,base=70},
    U_MV	          = {id=76,typ=UnitType.UT_POWER,base=70},
    U_DBV           = {id=77,typ=UnitType.UT_POWER,base=70},
    U_DBMV          = {id=78,typ=UnitType.UT_POWER,base=70}
  }
  
  local VT_G    = 0
  local VT_M    = 1
  local VT_CM   = 2
  local VT_MM   = 3
  local VT_UM   = 4
  local VT_IN   = 5
  local VT_MILS = 6
  local VT_FT   = 7
  
  local function GetBaseUnit( unit )
    local id = unit.base
    for _,u in pairs(Unit) do
      if id==u.id then return u end
    end
    assert(nil,"unit not found.  unit id="..id)
  end
  
  function GetUnitFromId( id )
    for _,u in pairs(Unit) do
      if id==u.id then return u end
    end
    assert(nil,"unit not found.  unit id="..id)
  end
  
  ------------------------------------------------------------------------------
  -- Vibration Conversion
  local vib_table = 
    {
    [VT_G]    = { [VT_G] = 1.0        , [VT_MM] = 9806.6352, [VT_CM] = 980.66352, [VT_M] = 9.8066352 , [VT_IN] = 386.0868    , [VT_FT] = 32.1739    , [VT_MILS] = 386088.0  , [VT_UM] = 9806635.2 },
    [VT_MM]   = { [VT_G] = 1.019718E-4, [VT_MM] = 1.0      , [VT_CM] = 0.1      , [VT_M] = 0.001     , [VT_IN] = 0.03937     , [VT_FT] = 0.003281   , [VT_MILS] = 39.37008  , [VT_UM] = 1.0E3     },
    [VT_CM]   = { [VT_G] = 1.019718E-3, [VT_MM] = 1.0E1    , [VT_CM] = 1.0      , [VT_M] = 0.01      , [VT_IN] = 0.3937      , [VT_FT] = 0.03281    , [VT_MILS] = 393.7008  , [VT_UM] = 1.0E4     },
    [VT_M]    = { [VT_G] = 0.101972   , [VT_MM] = 1.0E3    , [VT_CM] = 1.0E2    , [VT_M] = 1.0       , [VT_IN] = 39.370079   , [VT_FT] = 3.280883   , [VT_MILS] = 39370.08  , [VT_UM] = 1.0E6     },
    [VT_IN]   = { [VT_G] = 0.000259   , [VT_MM] = 25.4     , [VT_CM] = 2.54     , [VT_M] = 0.0254    , [VT_IN] = 1.0         , [VT_FT] = 0.083333   , [VT_MILS] = 1000.000  , [VT_UM] = 25400.0   },
    [VT_FT]   = { [VT_G] = 0.0310811  , [VT_MM] = 304.8    , [VT_CM] = 30.48    , [VT_M] = 0.3048    , [VT_IN] = 12.0        , [VT_FT] = 1.0        , [VT_MILS] = 12000.0   , [VT_UM] = 304795.995468},  
    [VT_MILS] = { [VT_G] = 0.00000259 , [VT_MM] = 0.0254   , [VT_CM] = 0.00254  , [VT_M] = 0.0000254 , [VT_IN] = 0.0010      , [VT_FT] = 0.000083   , [VT_MILS] = 1.0       , [VT_UM] = 25.4       },
    [VT_UM]   = { [VT_G] = 1.019718E-7, [VT_MM] = 1.0E-3   , [VT_CM] = 1.0E-4   , [VT_M] = 1.0E-6    , [VT_IN] = 3.9370079E-5, [VT_FT] = 3.280883E-6, [VT_MILS] = 3.937008E-2,[VT_UM] = 1.0        }
    }
  
  local function vib_convert( ct, vib_in_id, vib_out_id, val )
    local mult = ct[vib_in_id][vib_out_id]
    local strtyp = type(val)
    if strtyp=="number" then
      return val*mult
    elseif strtyp=="table" then
      local up={}
      for i,v in ipairs(val) do
        up[i] = v*mult
      end
      return up
    end
  
    assert( nil, "Type of val is not correct.")
  end
  
  local function displace_convert( ct, u_in, u_out, val )
    return vib_convert( ct, u_in.id-10, u_out.id-10, val )
  end
  
  local function velocity_convert( ct, u_in, u_out, val )
    return vib_convert( ct, u_in.id-20, u_out.id-20, val )
  end
  
  local function accel_convert( ct, u_in, u_out, val )
    return vib_convert( ct, u_in.id-30, u_out.id-30, val )
  end
  ---------------------------------------------------------------------------------------
  
  local function F_convert( u_out_id )
    if u_out_id==Unit.U_DEG_F.id then return 1.0, 0.0 end
    if u_out_id==Unit.U_DEG_C.id then return 0.5555555555555556, -17.77777777777778 end
    if u_out_id==Unit.U_DEG_K.id then return 0.5555555555555556, 255.3722222222222 end
    assert(nil,"Could not convert")
  end 
  
  local function C_convert( u_out_id )
    if u_out_id==Unit.U_DEG_F.id then return 1.8, 32.0 end
    if u_out_id==Unit.U_DEG_C.id then return 1.0, 0.0 end
    if u_out_id==Unit.U_DEG_K.id then return 1.0, 273.15 end
    assert(nil,"Could not convert")
  end 
  
  local function K_convert( u_out_id )
    if u_out_id==Unit.U_DEG_F.id then return 1.8, -459.67 end
    if u_out_id==Unit.U_DEG_C.id then return 1.0, -273.15 end
    if u_out_id==Unit.U_DEG_K.id then return 1.0, 0.0 end
    assert(nil,"Could not convert")
  end 
  
  local function temp_convert_help( c1, c2, val )
    local strtyp = type(val)
    if strtyp=="number" then
      return val*c1 + c2
    elseif strtyp=="table" then
      local up={}
      for i,v in ipairs(val) do
        up[i] = v*c1 + c2
      end
      return up
    end    
  end
  
  local function temperature_convert( _, u_in, u_out, val )
    if u_in.id==Unit.U_DEG_F.id then return temp_convert_help(F_convert(u_out.id),val) end
    --if u_in.id==Unit.U_DEG_F.id then local c1,c2 = F_convert(u_out.id) return temp_convert_help(c1,c2,val) end
    if u_in.id==Unit.U_DEG_C.id then local c1,c2 = C_convert(u_out.id) return temp_convert_help(c1,c2,val) end
    if u_in.id==Unit.U_DEG_K.id then local c1,c2 = K_convert(u_out.id) return temp_convert_help(c1,c2,val) end
    assert(nil,"Could not convert")
  end
  
  local conversion = {
    [UnitType.UT_DISPLACEMENT]  = { cvr = displace_convert, ct = vib_table },
    [UnitType.UT_VELOCITY]      = { cvr = velocity_convert, ct = vib_table },
    [UnitType.UT_ACCELERATION]  = { cvr = accel_convert, ct = vib_table },
    [UnitType.UT_TEMPERATURE]  = { cvr = temperature_convert, ct = nil }
    }

  
local function IsDbUnit(u)
  return 
    (
     (u.id==Unit.U_VDBS.id) or
     (u.id==Unit.U_VDB.id) or
     (u.id==Unit.U_ADB.id) or
     (u.id==Unit.U_ADBS.id) or
     (u.id==Unit.U_DBV.id) or
     (u.id==Unit.U_DBMV.id)
    )
end

local function MakeDb( ref, val )
  local strtyp = type(val)
  if strtyp=="number" then
    if val <= 0 then 
      return 0 
    end
    return 20.0 * math.log( val / ref, 10 )
  elseif strtyp=="table" then
    local up={}
    for i,v in ipairs(val) do
      if v <= 0 then
        up[i] = 0
      else
        up[i] = 20.0 * math.log( v / ref, 10 )
      end
    end
    return up
  end      
end

local function InverseDb( ref, val )
  local strtyp = type(val)
  if strtyp=="number" then
    return ref * 10.0^(val / 20.0 )
  elseif strtyp=="table" then
    local up={}
    for i,v in ipairs(val) do
      up[i] = ref * 10.0^(v / 20.0 )
    end
    return up
  end      
end

local function GetDbRef(u)
  if     u.id==Unit.U_ADB.id  then return 0.00980694
  elseif u.id==Unit.U_ADBS.id then return 0.001        
  elseif u.id==Unit.U_VDB.id  then return 0.00000001       
  elseif u.id==Unit.U_VDBS.id then return 0.000000001       
  elseif u.id==Unit.U_DBV.id  then return 1.0         
  elseif u.id==Unit.U_DBMV.id then return 0.001         
  else assert(nil,"unit is not a dB unit.")
  end
end

local function IntegrateUnitType(unit_type)
  if( unit_type==UnitType.UT_ACCELERATION   ) then return UnitType.UT_VELOCITY     end
  if( unit_type==UnitType.UT_VELOCITY       ) then return UnitType.UT_DISPLACEMENT end
  if( unit_type==UnitType.UT_FLOW           ) then return UnitType.UT_VOLUME       end
  return UnitType.UT_NONE
end

local function DifferentiateUnitType(unit_type)
  if( unit_type==UnitType.UT_VELOCITY       ) then return UnitType.UT_ACCELERATION end
  if( unit_type==UnitType.UT_DISPLACEMENT   ) then return UnitType.UT_VELOCITY     end
  if( unit_type==UnitType.UT_VOLUME         ) then return UnitType.UT_FLOW         end
  return UnitType.UT_NONE
end

local function DifferentiateUnit(eu)
  if( eu.id==Unit.U_MM_SEC.id   ) then  return Unit.U_MM_SEC2   end
  if( eu.id==Unit.U_M_SEC.id    ) then  return Unit.U_M_SEC2    end
  if( eu.id==Unit.U_UM_SEC.id   ) then  return Unit.U_UM_SEC2   end
  if( eu.id==Unit.U_IN_SEC.id   ) then  return Unit.U_IN_SEC2   end
  if( eu.id==Unit.U_FT_SEC.id   ) then  return Unit.U_FT_SEC2   end
  if( eu.id==Unit.U_MILS_SEC.id ) then  return Unit.U_MILS_SEC2 end
  if( eu.id==Unit.U_MM.id       ) then  return Unit.U_MM_SEC    end
  if( eu.id==Unit.U_M.id        ) then  return Unit.U_M_SEC     end
  if( eu.id==Unit.U_UM.id       ) then  return Unit.U_UM_SEC    end
  if( eu.id==Unit.U_IN.id       ) then  return Unit.U_IN_SEC    end
  if( eu.id==Unit.U_FT.id       ) then  return Unit.U_FT_SEC    end
  if( eu.id==Unit.U_MILS.id     ) then  return Unit.U_MILS_SEC  end
  return Unit.U_NONE
end

local function IntegrateUnit(eu)
  if( eu.id==Unit.U_G.id        ) then return Unit.U_M_SEC     end
  if( eu.id==Unit.U_M_SEC2.id   ) then return Unit.U_M_SEC     end
  if( eu.id==Unit.U_MM_SEC2.id  ) then return Unit.U_MM_SEC    end
  if( eu.id==Unit.U_UM_SEC2.id  ) then return Unit.U_UM_SEC    end
  if( eu.id==Unit.U_IN_SEC2.id  ) then return Unit.U_IN_SEC    end
  if( eu.id==Unit.U_FT_SEC2.id  ) then return Unit.U_FT_SEC    end
  if( eu.id==Unit.U_MILS_SEC2.id) then return Unit.U_MILS_SEC  end
  if( eu.id==Unit.U_MM_SEC.id   ) then return Unit.U_MM        end
  if( eu.id==Unit.U_M_SEC.id    ) then return Unit.U_M         end
  if( eu.id==Unit.U_UM_SEC.id   ) then return Unit.U_UM        end
  if( eu.id==Unit.U_IN_SEC.id   ) then return Unit.U_IN        end
  if( eu.id==Unit.U_FT_SEC.id   ) then return Unit.U_FT        end
  if( eu.id==Unit.U_MILS_SEC.id ) then return Unit.U_MILS      end
  return Unit.U_NONE
end

function CanTypeConvert( ut_from, ut_to )
  if( (ut_from==UnitType.UT_NONE) or (ut_to==UnitType.UT_NONE) ) then return false end
  if( ut_from==ut_to )                                        then return true  end
  if( ut_from==IntegrateUnitType(ut_to) )                     then return true  end
  if( ut_from==IntegrateUnitType( IntegrateUnitType(ut_to)) ) then return true  end
  if( ut_from==DifferentiateUnitType(ut_to) )                 then return true  end
  if( ut_from==DifferentiateUnitType( DifferentiateUnitType(ut_to)) ) then return true end
  return false
end

function CanUnitConvert( u_from, u_to )
  return CanTypeConvert( u_from.typ, u_to.typ )
end

function ConvertSpectrum( u_from, u_to, value, at_hz )
  at_hz = at_hz or 0
  assert( CanUnitConvert(u_from, u_to), "Units cannot convert"  )
  
  local loc_val = value
  local loc_from = u_from
  local loc_to = u_to
  local op = -3
  
  if(      u_to.typ==u_from.typ ) then op = 0 
  elseif( u_to.typ==IntegrateUnitType(u_from.typ) ) then op = 1 
  elseif( u_to.typ==DifferentiateUnitType(u_from.typ) ) then op = -1 
  elseif( u_to.typ==IntegrateUnitType( IntegrateUnitType(u_from.typ)) ) then op = 2 
  elseif( u_to.typ==DifferentiateUnitType( DifferentiateUnitType(u_from.typ)) ) then op = -2 end
  assert( op ~= -3, "From / to unit types are incompatable"  )

  if op ~= 0 then assert( at_hz > 0, "Frequency not provided or 0 hz for integration/differentiation"  ) end

  if IsDbUnit(u_from) then
    loc_val = InverseDb( GetDbRef(u_from), value)
    loc_from = GetBaseUnit(u_from)
  else
    loc_val = value
    loc_from = u_from
  end

  if IsDbUnit(u_to) then
    loc_to = GetBaseUnit(u_to)
  end
  
  if( op~=0 and loc_from.id==Unit.U_G.id ) then
    local cvt = conversion[loc_from.typ]
    loc_val = cvt.cvr( cvt.ct, loc_from, GetBaseUnit(loc_from.base), loc_val )
  end

  if(op==-2) then
    local cvt = conversion[loc_to.typ]
    loc_val = cvt.cvr( cvt.ct, DifferentiateUnit(DifferentiateUnit(loc_from)), loc_to, loc_val )
    loc_val = 4 * PI2 * at_hz * at_hz * loc_val
  elseif(op==-1) then
    local cvt = conversion[loc_to.typ]
    loc_val = cvt.cvr( cvt.ct, DifferentiateUnit(loc_from), loc_to, loc_val )
    loc_val = 2 * PI * at_hz * loc_val
  elseif(op==0) then
    local cvt = conversion[loc_to.typ]
    loc_val = cvt.cvr( cvt.ct, loc_from, loc_to, loc_val )
  elseif(op==1) then
    local cvt = conversion[loc_to.typ]
    loc_val = cvt.cvr( cvt.ct, IntegrateUnit(loc_from), loc_to, loc_val )
    loc_val = loc_val / ( 2 * PI * at_hz )
  elseif(op==2) then
    local cvt = conversion[loc_to.typ]
    loc_val = cvt.cvr( cvt.ct, IntegrateUnit(IntegrateUnit(loc_from)), loc_to, loc_val )
    loc_val = loc_val / ( 4 * PI2 * at_hz * at_hz )
  end

  if IsDbUnit(u_to) then
    loc_val = MakeDb( GetDbRef(u_to), loc_val )
  end  
  
  return loc_val
end

function ConvertTime( u_from, u_to, value )
  assert( u_from.typ==u_to.typ , "Units cannot convert"  )

  local cvrow = conversion[u_to.typ]
  local ctbl = cvrow.ct
  local cfcn = cvrow.cvr
  
  return cfcn( ctbl, u_from, u_to, value )
end
  