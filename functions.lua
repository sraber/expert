-- functions.lua    Rev 72 3/12/19

-- This is set in the do_xxx_analysis functions and used by get_infer_solution.
local l_fault_analysis
--------------------------------------------------------------------------
--  ***************    Rule Managment  ***********************
-- REVIEW: There's more to do here.
--         Consider loading libraries as things seperate from rules bases.
--         Multiple rule bases may share the same library.
--         Buld functions to reterive a lib or rule base from these arrays.
--         Using an ID for Lib or RuleBase one package can confirm existance and
--         access another package.
--

local l_fault_rules = {}
local l_rec_rules = {}

local rm_rulebase_info = {}

-- For use with include file.  These are not needed for compiled version.
function get_fault_rules() return l_fault_rules end
function get_rec_rules() return l_rec_rules end

function load_rulebase( filename )
  local ret = false
  -- By definition, each rule base chunk puts a table called
  -- _vds_rulebase that points to itself on the global variables list.
  -- This is how we find it after loadfile is called.
  local chunk,msg = loadfile(filename)
  if chunk then
    chunk()
    _vds_rulebase.load_fault_rules(l_fault_rules)
    _vds_rulebase.load_rec_rules(l_rec_rules)
    table.insert( rm_rulebase_info, { 
        ["lib"] = _vds_rulebase,
        ["name"] = _vds_rulebase.rulebase_name, 
        ["id"] = _vds_rulebase.rulebase_id, 
        ["version"] = _vds_rulebase.rulebase_version, 
      }
    )
    _vds_rulebase = nil
    ret = true
  end
  return ret,msg
end

--******************* End Rule Management *************************
--------------------------------------------------------------------------
function do_fault_analysis( fault_table, fault_ex_table )
    l_fault_analysis = true
  -- g_faults_or_recs is used by a number of functions below.  These are functions
  -- that we want to act on either the fault table or the recommendation table
  -- in the same way.  So we coded them to act on the global variable g_fautls_or_recs
  -- and it gets set here.
  -- Some functions that work with this global are assert1(), assert2(), assert3()
  g_faults_or_recs = fault_table

  -- Copy the data quality faults to the fault table.
  if fault_table~=nil and fault_table[1]~=nil then
    local ft = fault_table[1]
    for fg,fd in pairs(machine.quality_faults) do
      ft[fg] = fd
    end
  end
  

  --

  -- This  will only be called here in the do_fault_analysis function.  We want 
  -- g_fautls to only ever point at the faults table.  Fault access functions will
  -- use it and will behave the same called from fault rules or recommendation rules.
  g_faults = fault_table

  g_infer_solution = fault_ex_table

  -- l_fault_rules - This is a table local to this file.  See the Rule Managment section.
  return l_fault_rules
end

function do_rec_analysis( rec_table, rec_ex_table )
    l_fault_analysis = false
  -- g_faults_or_recs is used by a number of functions below.  These are functions
  -- that we want to act on either the fault table or the recommendation table
  -- in the same way.  So we coded them to act on the global variable g_fautls_or_recs
  -- and it gets set here.
  -- Some functions that work with this global are assert1(), assert2(), assert3()
  g_faults_or_recs = rec_table

  -- This  will only be called here in the do_fault_analysis function.  We want 
  -- g_fautls to only ever point at the faults table.  Fault access functions will
  -- use it and will behave the same called from fault rules or recommendation rules.
  g_recs = rec_table

  g_infer_solution = nil
  g_infer_solution = rec_ex_table

  return l_rec_rules
end

function final_processing()
  debugprint( "final processing" )
--  if g_debugprinting then  --  Added to speed processing  DAY
--  writedata()
--  writenorms()
--  writefaults("a_Faults.txt",g_faults)
--  writefaults("a_Recs.txt",g_recs)
--end
  if rulebase_final_processing then
    rulebase_final_processing()
  end

  for _, rb in pairs(rm_rulebase_info) do
    if rb.lib.rulebase_final_processing then
      rb.lib.rulebase_final_processing()
    end
  end
end
--------------------------------------------------------------------------

function write(a, file)
  local out = assert( io.open(file,"w") )
  for _,value in ipairs(a) do
    out:write( value, "\n" )
  end
  out:close()
end

local function stanford_conf(c1,c2)
  if c1>0 then
    if c2>0 then
      return c1+c2-(c1*c2)
    else
      if c1 + c2 == 0.0 then return 0 end
      return (c1+c2)/(1-math.min( math.abs(c1), math.abs(c2) ) )
    end
  else
    if c2 > 0 then
      if c1 + c2 == 0.0 then return 0 end
      return (c1+c2)/(1-math.min( math.abs(c1), math.abs(c2) ) )
    else
      return c1+c2+(c1*c2)
    end
  end
end

function round(number , places)
  if number==nil then return nil end
  local mult=10^(places or 0)
  if number>=0 then 
    return math.floor(number*mult+.5)/mult
  else 
    return math.ceil(number*mult-.5)/mult 
  end
end

function z_is_a_multiple(firstord,subject,close)
  close=close or .01  
  local m,r=math.modf(subject/firstord)
  local mult=math.floor(m+round(r))
  if mult>0 then
    _,r=math.modf(subject/(mult*firstord))
    if math.abs(r)<close or math.abs(1-r)<close then
      return true,math.abs(mult),math.min(math.abs(r),math.abs(1-r))
    end
  end
  return false,0,1
end

function z_get_ci_from_mi(mi)
  if mi==nil then return nil end
  for i, cmp in ipairs(machine.components) do 
    if cmp.comp==0 then
      if #cmp.map>=1 then
        for _,m in ipairs(cmp.map) do
          if mi==m then return i end
        end
      end
    end
  end 
end

function z_get_data_source_mi_from_ci(ci,brg)
  local ei=machine.components[ci].map[brg]
  return get_machine_element_alias(ei)
end

function z_get_brg_and_data_set_speed_ratio(element,brg)
  local cn=get_this_comp_number()
  local brgmi = machine.components[cn].map[brg]
  local aliasmi = get_machine_element_alias(brgmi)

  -- REVIEW: What's the point of this?  g_shaft_number is what is output from get_this_comp_number,
  --         so same as cn here.  If brg is 1 then same result as above.
  --         element is not used.
  --if brg==1 and element==1 then
  --  brgmi=machine.components[g_shaft_number].map[1]
  --end 
  return brgmi,aliasmi,g_comp_speed_ratio[cn]/g_comp_speed_ratio[z_get_ci_from_mi(aliasmi)]
end

function ds_spline_value( ds, bin )
  return splint(bin, ds.data,ds.spline) 
end

function ds_spline_avg( ds, bin )
  return splint(bin, ds.mps,ds.splinemps) 
end

function find_component_for_index( index )
  for sn, cmp in ipairs(machine.components) do
    if machine.composites[cmp.shaft]==nil then
      for _,ei in pairs(cmp.map) do
        if index==ei then return sn end
      end
    end
  end
  error( M_PARAM_ARG("element index("..index..") not found") )
end

function create_speed_table()
  local st = {}
  for _,ds in ipairs(machine.datasets) do
    if ds.dom=="spec" and ( ds.typ=="normal" or ds.typ=="demod") and st[ds.sid]==nil then
      st[ds.sid]=ds.speed
      debugprint(ds.speed)
    end
  end
  return st
end

function get_this_comp_number()
  return g_shaft_number
end

function get_this_super_shaft()
  return machine.supershafts[g_super_shaft_number]
end

function get_comp_speed_ratios()
  return g_comp_speed_ratio
end

function debugprint (...)  -- prints only if g_no_printing is false
  if g_debugprinting then print(...) end
end 

-- 
-- get_machine_element
-- Notes:
--    Use this function to get an element given a machine element index.
--    This function will follow the input machine element's alias index to the next element.  It will handle
--    an alias pointing to another alias.  Other functions should call this function without ei_list,
--    example:
--        local ele = get_machine_element( machine_index )
--
--    The calilng signiture with the mi_list parameter is ment for use only by this function.
--
-- Input:
--    machine_index - A machine class level index.
-- Return:
--    Returns a machine element from the machine.elements table.
--
function get_machine_element( machine_index, mi_list )
  if mi_list==nil then mi_list={} end
  mi_list[machine_index]=true
  local ele = machine.elements[machine_index]
  if ele==nil then error( M_PARAM_ARG( "Element index "..machine_index.." does not exist" ) ) end
  local alias = ele.alias
  if alias~=nil and alias>0 then
    if mi_list[alias]==true then error( M_PARAM_ARG( "Machine element alias index "..alias.." points to a previous index.  Circular reference." ) ) end
    ele = get_machine_element(alias, mi_list)
  end
  return ele
end

-- get_element
-- Notes:
--    Use this function to get an element given a shaft index when you want to follow the element alias.
--    This function will follow the input shaft index to the alias element index.  It will handle
--    an alias pointing to another alias.  
--
-- Input:
--    machine_index - A machine class level index.
-- Return:
--    Returns a machine element from the machine.elements table.
--
function get_element( shaft_index )
  local s  = safe_value_1( machine.components[g_shaft_number], M_SHAFT_INDEX, g_shaft_number )
  local mi = safe_value_1( s.map[shaft_index], M_SHAFT_DATA_INDEX, shaft_index )
  return get_machine_element( mi )
end

-- 
-- get_machine_element_alias
-- Notes:
--    Use this function to get a machine index at the end of a chain of alias indexes.
--    This function will follow the input machine element's alias index to the next element.  It will handle
--    an alias pointing to another alias.  Other functions should call this function without ei_list,
--    example:
--        local ele = get_machine_element( machine_index )
--
--    The calilng signiture with the mi_list parameter is ment for use only by this function.
--
-- Input:
--    machine_index - A machine class level index.
-- Return:
--    Returns a machine element from the machine.elements table.
--
function get_machine_element_alias( mi, mi_list )
  if mi_list==nil then mi_list={} end
  mi_list[mi]=true
  local ret = mi
  local ele = machine.elements[mi]
  if ele==nil then error( M_PARAM_ARG( "Element index "..mi.." does not exist" ) ) end
  local alias = ele.alias
  if alias~=nil and alias>0 then
    if mi_list[alias]==true then error( M_PARAM_ARG( "Machine element alias index "..alias.." points to a previous index.  Circular reference." ) ) end
    ret = get_machine_element_alias(alias, mi_list)
  end
  return ret
end

local function AddElementForcingOrders( ff, elements, only_marked_use )
  for ei,_ in pairs(elements) do
    local ele = safe_value_1( machine.elements[ei], M_ELE_INDEX, ei )
    if ele.forders==nil then error(M_CORRUPT("No forder table for element "..ei)) end
    if only_marked_use then
      for tg,ord in pairs(ele.forders) do
        if ord.use ~= 0 then
          table.insert(ff,{["tag"]=tg,["en"]=ei,["order"]=ord.order})
        end
      end
    else
      for tg,ord in pairs(ele.forders) do
        table.insert(ff,{["tag"]=tg,["en"]=ei,["order"]=ord.order})
      end
    end
  end
end

local function AddComponentForcingOrders( ff, cn, only_marked_use )
  local forders = safe_value_1(machine.components[cn], M_SHAFT_INDEX, cn)["forders"]
  if forders==nil then return end
  if only_marked_use then
    for tg,ord in pairs(forders) do
      if ord.use ~= 0 then
        table.insert(ff,{["tag"]=tg,["en"]=(-cn),["order"]=ord.order})
      end
    end
  else
    for tg,ord in pairs(forders) do
      table.insert(ff,{["tag"]=tg,["en"]=(-cn),["order"]=ord.order})
    end
  end
end

function MakeForcingOrdersForSuperShafts( sups, only_if_use_true )
  local ff = {}
  for i,ss in ipairs(sups) do
    ff[i]={}
    AddElementForcingOrders( ff[i], ss.elements, only_if_use_true )
    for cn,_ in pairs(ss.components) do
      AddComponentForcingOrders( ff[i], cn, only_if_use_true )
    end
--    for _,cn in ipairs(ss.components) do
--      AddComponentForcingOrders( ff[i], cn, only_if_use_true )
--    end
  end
  return ff
end

-- AddDataGroup
-- Input:
--    dgs - an output table with hierochy
--          element index           - for each element
--             bin width            - divide data by bin width
--                timestamp         - sort the data by timestamp so that simultaneous
--                                    data stays together
--                   dataset index  - the index of the data

local function AddDataGroup( dgs, ss_element_index_list )
  for ei,_ in pairs(ss_element_index_list) do
    local ele = safe_value_1( machine.elements[ei], M_ELE_INDEX, ei )
    if ele.data.spec~=nil then
      if ele.data.spec.normal~=nil then
        local eit={}
        dgs[ei] = eit
        for _,axis_data in pairs(ele.data.spec.normal) do
          for _,di in ipairs(axis_data) do
            local data = machine.datasets[di]
            if eit[data.bw]==nil then
              eit[data.bw] = {}
            end
            local bwt=eit[data.bw]
            local key = os.time( data.timestamp )
            if bwt[key]==nil then
              bwt[key]={}
            end
            table.insert(bwt[key], di )
          end
        end
      end
    end
  end
end

local function MakeDataGroupsForSuperShafts( sups )
  local gg = {}
  for i,ss in ipairs(sups) do
    gg[i]={}
    AddDataGroup( gg[i], ss.elements )
  end
  return gg
end
------------------------------

local function make_data_match_array( matches, keysup )
  local sysmatch={}
  for _,pk in pairs(matches) do
    local kst = keysup[pk.tag]
    if kst==nil then
      debugprint( "Error: " .. pk.tag .. " not found in function make_data_match_array." )
    else
      if pk.type=='F' then
        table.insert( sysmatch, {["type"]='F', ["tag"]=kst.tag, ["cn"]=kst.cn, ["bin"]=pk.bin, ["pos"]=pk.pos } )
      elseif pk.type=='H' then
        table.insert( sysmatch, {["type"]='H', ["tag"]=kst.tag, ["cn"]=kst.cn, ["bin"]=pk.bin, ["order"]=pk.order, ["pos"]=pk.pos} )
      end
    end
  end
  return sysmatch
end

local function add_flag(flags,flag)
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

-- make_composite_peak_table
-- Input:
--    tdsi - An array of data set index.  
--
local function make_composite_peak_table( tdsi,aves,noduplicates )
  if noduplicates==nil then noduplicates = true end
-- band width sort
  local function bw_sort( idx1, idx2 )
    return machine.datasets[idx1].bw < machine.datasets[idx2].bw
  end
  -- Sort tdsi so that the data set indexs are sorted from smallest bin width to largest.
  -- The table will remain sorted for the remainder of the run.
  table.sort( tdsi, bw_sort )

  local cfmax = 0
  local cbw = 0
  local comp_peaks={}
  local idx=0
  local lastmax=0
  for d,dsi in ipairs(tdsi) do
    local ds = machine.datasets[dsi]
    -- The data is ordered by bin width, so for a normal data set each bin width will be
    -- greater than the last.  If this data set has multiple sets of data then we would see
    -- two or more data sets with the same bin width.  It would be great if the peaks in those
    -- data sets could be merged in, something along the lines of.. if there is a peak that is not too
    -- near an existing peak in the table, then add it.  But this can only be done based on Order, doing 
    -- it here, based on frequency (bin is equivilant to frequency in this regard) seems risky.
    -- The if statement below insures we're not processing data of the same bin width.

    if ds.bw > cbw then
      if ds.fmax > cfmax then
        -- Find the smallest index in the current data that is higher than the FMax
        -- in the previous data.
        local min_bin = 1.0
        if noduplicates then
          min_bin = 1.0 + (cfmax / ds.bw)
        end
        cfmax = ds.fmax
        -- ds.peaks is sorted low to high so we could find the first index past min_bin
        -- and start from there, but not sure it's worth the additional effort.
        lastmax=lastmax+ds.bw   
        -- skip one bin width above the last peak on the previous dataset to avoid duplication
        local matches={}
        local flags='-'
        local a,s,m
        for b,bin in ipairs(ds.peaks) do
          local ord,freq
          if ds.typ=='average' then
            ord=ds.bw*(bin-1)
            freq=ord*ds.speed
          else
            freq=ds.bw*(bin-1)
            ord=freq/ds.speed
          end
          if d==1 or ((d>1 and freq>lastmax and noduplicates) or (d>1 and not(noduplicates)))  then
            lastmax=freq
            if bin >= min_bin then
              idx=idx+1
              s=ds_spline_value( ds, bin )
              --s=ConvertSpectrum( g_internal_unit  , Unit.U_VDB , s )
              m=ds_spline_avg( ds, bin )
              --m=ConvertSpectrum( g_internal_unit  , Unit.U_VDB , m )
              if noduplicates then
                  table.insert( comp_peaks, {
                      sbin=bin,
                      sdsi=dsi,
                      sfreq=freq,
                      sord=ord,
                      pk_index=idx,
                      flags=flags,
                      matches={},
                      sval=s,
                      mval=m,
                      mdif=s-m ,
                      mpct=((s-m)/m), 
                      sb_severity={} , 
                      sb_energy={} , 
                      harm_energy=0 , 
                      harm_severity=0 , 
                      sidebands={} , 
                      subharmonics={} , 
                      harm_pk_index={} ,
                      elsewhere={},
                      fmax=ds.fmax ,
                      order=round(ord,2)
                      })
              else
                table.insert( comp_peaks, {
                    sbin=bin,
                    sdsi=dsi,
                    sfreq=freq,
                    sord=ord,
                    pk_index=idx,
                    sval=20*math.log(s/1e-6,10),
                    mval=20*math.log(m/1e-6,10),
                    mdif=20*math.log((s/m),10),
                    mpct=((s-m)/m), 
                    fmax=ds.fmax ,
                    order=round(ord,2)
                  })
                end
            end
              end
            end
          end
        end
  end
  local ds = machine.datasets[tdsi[1]]
  if comp_peaks[1]~=nil and noduplicates==false and ds.typ=='normal' then
    ds=comp_peaks[1].sdsi
    for pi,pk in ipairs(comp_peaks) do
      -- add harmonics to tones for harmonic energy normalization
      if pk.sdsi==ds then
        local close=.002
        local isshaftmult=false
        local haveharm=false
        local harms={}
        local henrgy=0
        for hpi,hpk in ipairs(comp_peaks) do
          local bw
          bw=machine.datasets[hpk.sdsi].bw/machine.datasets[hpk.sdsi].speed
          if hpk.sord/pk.sord>20 then close=.0008 end
          local nextiscloser=false
          local isharm,m,r=is_a_multiple(pk.sord,hpk.sord,close)
          if hpi+1<#comp_peaks then
            local nisharm,nm,nr=is_a_multiple(pk.sord,comp_peaks[hpi+1].sord,close)
            nextiscloser=nisharm and nm==m and nr<r
          end
          if isharm and pk.sord/bw>3 and m<21 and not (nextiscloser) then
            henrgy=henrgy+hpk.sval 
            table.insert(harms,hpi)
          end
        end
        if #harms>0 then
          haveharm=true
          pk['harm_pk_index']=harms
          pk['harm_energy']=henrgy
        end
      end
    end
  end
  return comp_peaks
end

local function ComputeTimeSignalCharacteristics( data )
  local rms = 0
  local n = #data
  local dn = 1/n
  local peak = -1
  for _,v in ipairs(data) do
    rms = rms + dn*v*v
    local a = math.abs(v)
    if a > peak then peak = a end
  end
  rms = math.sqrt( rms )
  local csf = peak / rms
  return rms, csf
end
--
function is_a_multiple(firstord,subject,close)
  close=close or .01  
  local m,r=math.modf(subject/firstord)
  local mult=math.floor(m+round(r))
  if mult>0 then
    _,r=math.modf(subject/(mult*firstord))
    if math.min(math.abs(r),math.abs(1-r))<close then
      return true,math.abs(mult),math.min(math.abs(r),math.abs(1-r)),r
    end
  end
  return false,math.abs(mult),math.min(math.abs(r),math.abs(1-r))
end

local function sort_pk_items(tobesorted,group_indexes,ascending)
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
            indx=tostring(j.index)
          end
        end
      end
      if #indx>0 then
        table.insert(stripped,indx)
      end
    end
  else
    for i,j in ipairs(tobesorted) do
      stripped[i]=j.index
    end
  end
  return tobesorted,stripped
end

-- Initialize Data
-- With the raw spectrum data do the following things:
--    1) Spline the data on index basis (i.e. allow fractional index values)  Store the spline fitting data for use later.
--    2) Find the shaft speed for normalizing the data.  Replace nominal speed with this updated estimate of shaft speed.
--    3) Extract and store relevent peaks for each data set.  The peak position will be given by index which may be fractional.
--    4) Identify peaks by building forcing order list of all components in machine train and using speed walking algorithm
--       to make all forcing orders reletive to current shaft of interest.  Extracted peaks are proper list addressable by integer
--       valued index into the list.  Store identified forcing orders along with other identifing information prescribed by the
--       Peak Matching algorithm reletive to the index into the Extracted Peak list.
function initialize_data( norm )
  -- normalize1 - Finds the closest peak to target speed
  -- normalize2 - Pattern match normalization
  -- normalize3 - Looks for harmonic series of all shafts that are target speed or harmonics of target speed
  norm = norm or normalize2
  -- Make a table of shaft number <- to -> dataset, organized by timestamp.  It'll make things more organized.
  -- The timestamps of the datasets are not needed here, we already have them, but we need an easy way to get at
  -- the sets of data that have been gathered simultaneously.
  -- First make this intermediate stage data structure of shaft number <- to -> element index (this is really machine index)

  if machine.speed<=0 then error( M_PARAM_ARG("Bad value for machine speed.") ) end
  if machine.ispeed<=0 then error( M_PARAM_ARG("Bad value for ispeed.") ) end

  -- Initialize a table to contain faults generate by the data_quality section.
  machine.quality_faults={}

  local sss = find_all_super_shafts()
  local sspds = compute_super_shaft_speeds(sss, machine.ispeed, machine.speed)
  local afff = MakeForcingOrdersForSuperShafts(sss, false )
  local sdgs = MakeDataGroupsForSuperShafts(sss) -- This is needed for peak matching, not just normalizing

  machine.supershafts = sss

  local comp_speed = get_component_speeds(sspds, sss)
  g_comp_speed_ratio = {}
  for cn, spd in pairs(comp_speed) do
    g_comp_speed_ratio[cn] = spd / machine.speed
  end

  -- Initialize a spline for each data set.  Currently using a cubic spline.
  for i,ds in ipairs(machine.datasets) do
    -- Spline the data vs. the data index.  Set dx (delta change in x) to 1 (index value delta is 1).

    if ds.data==nil then debugprint( "data set nil: "..i) goto continue end
    if #ds.data==0 then debugprint( "data set has no data: "..i) goto continue end
    local data_unit = GetUnitFromId( assert(ds.unit, "No unit id") )

    -- ,["dom"]="spec"
    -- ,["typ"]="normal"
    if ds.dom=="spec" then
      -- Check that the data is in the correct unit
      -- Demod data is non-dimensional.  Don't change that data.
      if ds.typ=="normal" or
      ds.typ=="average" then
        ds.data = ConvertSpectrum( data_unit, g_internal_unit, ds.data )
      end

      local y2 = spline( ds.data )
      ds["spline"] = y2

      ------------------------------
      --    Make the peak list
      --local avg_span = #ds.data / g_character_sections
      --if avg_span < 6 then avg_span = 6 end

      --local m,s=dsp.mavg(32,ds.data)
      local m,s=mean_and_stdv(32,ds.data)

      --Standard deviation captures 2/3 of the peak to peak value of 
      --pure gaussian noise.
      for k,v in ipairs(m) do
        m[k] = g_mean_multiply*v + g_std_multiply*s[k]
      end

      ds["mps"] = m
      ds["splinemps"] = spline( m )

      --local p=dsp.gpeaks(m,ds.data)        
      --table.sort(p)
      local p=get_peaks(m,ds.data) 

      -- polish the peaks by looking for a more exact peak in the data spline.
      local peaks={}
      -- There is no sense in looking for a peak between n-1 and n, so
      -- we avoid that here.
      local n = #p - 1
      for k=1,n do
        local ip = p[k]
        local v,pk = findmaxima( ip-1,ip+1,ip,ds.data,ds.spline)
        --NOTE: Remove small peaks.  This is a global control and has
        --        to be coordinated with the engineering unit of the data.
        --        Perhaps could be based on machine.scale . 
        if v > g_peak_threshold then
          --debugprint( "Polished peak: ", pk, " value at peak: ", v )
          table.insert( peaks, pk ) 
        end
      end
      ds["peaks"] = peaks
      --------------------------------
    elseif ds.dom=="time" then
      ds.data = ConvertTime( data_unit, g_internal_unit, ds.data )   
      local rms, csf = ComputeTimeSignalCharacteristics(ds.data)
      ds["rms"] = rms
      ds["csf"] = csf
    end
    ::continue::
  end

  --
  --data_quality()

----------------------------------------------------------------------
-- Adding composite peaks.
-- Example of table structure that includes composite peaks.
--["spec"]={
-- The idea for the structure is that once we pass in cpl into a function it follows the same for as
-- the "spec" table.
-- [“cpl”]={
--  ["normal"]={
--   ["r"]={ .. composite peaks .. }
--   ["a"]={ .. composite peaks .. }
--   ["t"]={ .. composite peaks .. }
--  }
--  ["average"]={
--   ["r"]={ .. composite peaks .. }
--   ["a"]={ .. composite peaks .. }
--   ["t"]={ .. composite peaks .. }
--  }
-- ["normal"]={
--  ["r"]={
--   [1]=5
--   ,[2]=11
--  }
--  ,["a"]={
--   [1]=3
--   ,[2]=9
--  }
--  ,["t"]={
--   [1]=7
--   ,[2]=13
--  }
-- }

  for ei,e in ipairs(machine.elements) do
    if e.data~=nil and e.data.spec~=nil then
      -- determine element's component index and shaftspeed ratio
      local comp_index
      for ci, cmp in ipairs(machine.components) do 
        if cmp.comp==0 then
          if #cmp.map>=1 then
            for _,ele in ipairs(cmp.map) do
              if ei==ele then comp_index=ci end
            end
          end
        end
      end 
      e['speedratio']=g_comp_speed_ratio[comp_index]
      local composites_table = {}
      for typ,axes in pairs(e.data.spec) do
        local typ_table = {}
        if typ=="normal" or typ=="average" or typ=="demod" then -- Just some insurance we work with known tables.
          for ax, tdsi in pairs(axes) do
            if typ=="normal" then
              local aves=e.data.spec['average'][ax]
              typ_table[ax..'norm'] ={peaks= make_composite_peak_table(tdsi, aves,false )} -- build non composite (complete) peaklist for normalizing 
              -- build sorted list of normal peak list items
              local num=20
              local function sort_items(a,b) return a.item>b.item end
              local he={}
              if #typ_table[ax..'norm'].peaks>0 then
                for j, pk in ipairs (typ_table[ax..'norm'].peaks) do  
                  if pk.harm_energy~=nil and pk.harm_energy>0 then 
                    table.insert (he , {index=j,item=pk.harm_energy}) 
                  end
                end
              end 
              _,he=sort_pk_items(he)
              typ_table[ax..'norm']['sorts']={harm_energy=he}

              typ_table[ax] ={peaks= make_composite_peak_table(tdsi, aves,true)}
            else
              typ_table[ax] ={peaks= make_composite_peak_table(tdsi, {} )}
            end
          end
        end
        composites_table[typ] = typ_table
      end
      e.data.spec["cpl"] = composites_table
    end
  end

  -----------------------------------------------------------------
  local dq_warnings=data_quality()
  -----------------------------------------------------------------
  local sr1xs=norm( sdgs ) -- normalize the data
  ------------------------------------------------------------------   
-- REVIEW: What is sr1xs?  Driver speed I think.  This changed the behavior of the normalize function
--         which will break if other implementations, such as normalize0 are used.
  dq_warnings=normalization_quality(dq_warnings,sr1xs)
    ------------------------------------------------------------------

  ------------------------------------------------------------------
  -- sdgs[element index]->[bin width]->[Timestamp]-> data index
  -- 
  for i,dgtbl in pairs(sdgs) do --Data groups for super shaft i 
    local arff={}
    local arffsup={}
    for j,ff in ipairs(afff) do
      local div = sspds[j]/sspds[i]
      for _,f in pairs(ff) do
        local key = f.tag .. ":" .. f.en
        arff[key]=f.order * div
        arffsup[key]={["tag"]=f.tag,["cn"]=f.en}
      end
    end
    -- Setup the forcing order match data for all of the data sets
    for ei,etbl in pairs(dgtbl) do

      -- Inject the line frequency tag into the support table.
      -- match_peaks will compute the order of line frequency based on
      -- the speed of the data.  Data knows what element it belongs to so
      -- a key will be built on the fly to match the one we put in here
      -- in the support array.  We do this so LF can be on the match list.
      local key1 = "LF:" .. ei
      local key2 = "2XLF:" .. ei
      arffsup[key1]={["tag"]="LF",["cn"]=ei}
      arffsup[key2]={["tag"]="2XLF",["cn"]=ei}
      for bw,bwtbl in pairs(etbl) do
        for _,dg in pairs(bwtbl) do
          for _,d in ipairs(dg) do
            local data = machine.datasets[d]
            local matches = match_peaks( data, arff )
            data["matches"] = make_data_match_array( matches,arffsup)
          end
        end
      end
      local ele = machine.elements[ei]
      if ele.data.spec~=nil then
        if ele.data.spec.demod~=nil then
          for _,axis_data in pairs(ele.data.spec.demod) do
            for _,di in ipairs(axis_data) do
              local data = machine.datasets[di]
              local matches = match_peaks( data, arff )
              data["matches"] = make_data_match_array( matches,arffsup)
            end
          end
        end
      end
    end
  end

-- band width sort
  local function bw_sort( idx1, idx2 )
    return machine.datasets[idx1].bw < machine.datasets[idx2].bw
  end

  -- complete composite peak list with normalized info
  for ei,e in ipairs(machine.elements) do 
    if e.data~=nil and e.data.spec~=nil and e.data.spec.cpl~=nil then
      -- determine element's component index
      local comp_index
      for ci, cmp in ipairs(machine.components) do 
        if cmp.comp==0 then
          if #cmp.map>=1 then
            for _,ele in ipairs(cmp.map) do
              if ei==ele then comp_index=ci end
            end
          end
        end
      end 
      -- e['speedratio']=g_comp_speed_ratio[comp_index]

      -- build a list of shaft ratios
      local ratios,speeds={},{} 
      for ci,csr in pairs (g_comp_speed_ratio) do
        ratios[csr]=true
      end
      for rat,_ in pairs(ratios) do
        table.insert(speeds,rat/g_comp_speed_ratio[comp_index])
      end
      local nspeeds=#speeds

      -- Update sord and order in normal and demod peak lists, and add average info to normal peaks     
      for typ,axes in pairs(e.data.spec.cpl) do
        for ax, pl in pairs(axes) do
          if string.len(ax)>1 then
            axes[ax]=nil -- remove normalizing non-composite peaklist
          else
          pl['shaftspeed']={}
          if #pl.peaks==0 and e.data.spec.normal[ax][1]~=nil then
            pl['shaftspeed']['ave']=machine.datasets[e.data.spec.normal[ax][1]].speed
          elseif #pl.peaks==0 and e.data.spec.normal[ax][1]==nil then
            pl['shaftspeed']['ave']=machine.speed
          end
          for _,pk in ipairs(pl.peaks) do
            pl['shaftspeed']={[pk.sdsi]=machine.datasets[pk.sdsi].speed} -- save shafts speeds at the axis levels
            if typ=="normal" or typ=="demod" then  
              pk.sord=pk.sfreq/machine.datasets[pk.sdsi].speed
              pk.order=round(pk.sord,2)
            end

            -- add average amplitude info to  normal peaks
            local aves=e.data.spec['average'][ax]
            local s=pk.sval
            local a
            local haveave=false
            local avebin,abin,pkamp,afmax,avedsi,aord, afreq,sev=0,0,0,0,0,0,0,0
            if typ=='normal' and aves~=nil and #aves>0 then
              table.sort( aves, bw_sort )
              for m,ad in ipairs( aves ) do
                if haveave then break end
                local ads = machine.datasets[ad]
                avebin=((pk.sord)/ads.bw+1)
                if avebin>1 and avebin < #ads.data - g_bin_margin - 2 then
                  local ads_speed=ads.speed
                  afmax=ads.fmax
                  a=ds_spline_value( ads, avebin )
                  aord=(avebin-1)*ads.bw
                  afreq=aord*ads.speed
                  avedsi=ad 
                  local bin_margin=g_bin_margin/ads.bw/100
                  for bin=avebin-bin_margin,avebin+bin_margin, .1 do  
                    haveave=true
                    if bin>1 and bin<=#ads.data-1  then
                      local aveamp=ds_spline_value( ads, bin )  -- spline amplitude
                      if aveamp > pkamp  then 
                        pkamp=aveamp
                        avebin=bin
                      end
                    end
                  end
                  a=pkamp ---ConvertSpectrum( g_internal_unit  , Unit.U_VDB , pkamp )
                end

                if haveave then
                  local sdb=ConvertSpectrum( g_internal_unit  , Unit.U_VDB , s )
                  local adb=ConvertSpectrum( g_internal_unit  , Unit.U_VDB , a )
                  if sdb>50 and sdb>adb then 
                    -- severity doubles or halves every +/-12 dB from 110 VdB 
                    -- 110 VdB threshold is GSO spec which is really close to mil-std-167 and .1 in/sec industrial rule of thumb for ruff vibration
                    sev=(sdb-adb)*(10^(sdb/40)/10^(110/40)) 
                  end
                  pk.adsi=avedsi
                  pk.aval=a
                  pk.pct=((s-a)/a)
                  pk.dif=s-a
                  pk.aord=(avebin-1)*ads.bw
                  pk.afreq=pk.aord*ads.speed
                  pk.sev=sev
                end
              end
            end
          end -- pk
          local s,n=0,0
          if pl.shaftspeed~=nil then
            for ds,sp in pairs (pl.shaftspeed) do
              n=n+1
              s=s+sp
            end
            pl.shaftspeed['ave']=s/n
            if e.data.spec.demod[ax]~=nil then
              for _,ddsi in ipairs(e.data.spec.demod[ax]) do
                machine.datasets[ddsi].speed=s/n
              end
            end
          end
        end
      end
      end

      -- build a lists of shaft rate harmonic series     
      for typ,axes in pairs(e.data.spec.cpl) do
        for ax, pl in pairs(axes) do
          local haveharm=false
          local shaftrateharmonics,harms={},{}
          for pi,sp in ipairs(speeds) do
            local close=.002
            for pi,pk in ipairs(pl.peaks) do
              local bw
              if typ=='average' then
                bw=machine.datasets[pk.sdsi].bw
              else
                bw=machine.datasets[pk.sdsi].bw/machine.datasets[pk.sdsi].speed
              end
              if pk.sord/sp>20 then close=.0008 end
              local nextiscloser=false
              local isharm,m,r=is_a_multiple(sp,pk.sord,close)
              if pi+1<#pl.peaks then
                local nisharm,nm,nr=is_a_multiple(sp,pl.peaks[pi+1].sord,close)
                nextiscloser=nisharm and nm==m and nr<r
              end
              if isharm and sp/bw>3 and m<100 and not (nextiscloser) then
                pk.flags=add_flag(pk.flags,tostring(round(sp,3))..'x')
                if pk.subharmonics==nil then
                  pk['subharmonics']={order=round(sp,3),harm=m}
                else
                  table.insert(pk.subharmonics,{order=tostring(round(sp,3)),harm=m})
                end
                table.insert(harms,pi)
              end
            end
            if #harms>0 then
              haveharm=true
              shaftrateharmonics[tostring(round(sp,3))]=harms
            end
            harms={}
          end
          if haveharm then
            pl['harmonics']=shaftrateharmonics
          end
        end
      end

      -- indentify everywhere the same peaks exists in other normal spectra
      for typ,axes in pairs(e.data.spec.cpl) do
        if typ=='normal' then
          for ax, pl in pairs(axes) do
            local sord,sfreq={},{}
            for pi,pk in ipairs(pl.peaks) do
              if pk.elsewhere==nil then pk['elsewhere']={} end
              pk.elsewhere['sord']=elsewhere(ei,ax,pk.pk_index,pk.sord,'sord')
              pk.elsewhere['sfreq']=elsewhere(ei,ax,pk.pk_index,pk.sfreq,'sfreq')
            end
          end
        end
      end

-- build a list of line frequency harmonics     
      for typ,axes in pairs(e.data.spec.cpl) do
        for ax, pl in pairs(axes) do
          local haveharm=false
          local lfharmonics,harms={},{}
          local close=.005
          if pl.shaftspeed~=nil then
            local lford=machine.linef/pl.shaftspeed.ave
            for pi,pk in ipairs(pl.peaks) do
              local bw
              if typ=='average' then
                bw=machine.datasets[pk.sdsi].bw
              else
                bw=machine.datasets[pk.sdsi].bw/machine.datasets[pk.sdsi].speed
              end
              local nextiscloser=false
              local speedissync,_,_=is_a_multiple(machine.datasets[pk.sdsi].speed,machine.linef,.0005)
              local isharm,m,r,rr=is_a_multiple(machine.linef,pk.sfreq,close)
              if pi+1<#pl.peaks then
                local nisharm,nm,nr=is_a_multiple(machine.linef,pl.peaks[pi+1].sfreq,close)
                nextiscloser=nisharm and nm==m and nr<r
              end
              if isharm and lford/bw>3 and m<=15 and not (nextiscloser) and not(speedissync) and (rr<.005 or 1-r<.001) then
                pk.flags=add_flag(pk.flags,'l')
                if pk.subharmonics==nil then
                  pk['subharmonics']={order='LF',harm=m}
                else
                  table.insert(pk.subharmonics,{order='LF',harm=m})
                end
                table.insert(harms,pi)
              end
            end
            if #harms>0 then
              haveharm=true
              lfharmonics['LF']=harms
            end
            harms={}
          end
          if haveharm then
            if pl.harmonics==nil then
              pl['harmonics']=lfharmonics
            else
              table.insert(pl.harmonics,lfharmonics)
            end
          end
        end
      end

      -- build a lists of shaft rate subharmonic series for each shaft 
      for typ,axes in pairs(e.data.spec.cpl) do
        for ax, pl in pairs(axes) do
          local havesubs=false
          local subharmonics,harms={},{}
          for pi,sp in ipairs(speeds) do
            local subs
            for _,sp in ipairs (speeds) do
              if #speeds==1 then
                subs={.5,.33333333,.25,.2}
              elseif #speeds>1 and sp<1 and sp>.6 then
                subs={.5}
              elseif #speeds>1 and sp<=.6 then
                subs={}
              elseif #speeds>1 and sp>=1 then
                subs={.5,.33333333}
              end
              for _,sbh in ipairs(subs) do
                local close=.001
                for pi,pk in ipairs(pl.peaks) do
                  local bw
                  if typ=='average' then
                    bw=machine.datasets[pk.sdsi].bw
                  else
                    bw=machine.datasets[pk.sdsi].bw/machine.datasets[pk.sdsi].speed
                  end
                  local isspmult,sm=is_a_multiple(sp,pk.sord,close)
                  local isshaftmult=false
                  for pi,spd in ipairs(speeds) do
                    local isspd=is_a_multiple(spd,pk.sord,close)
                    if isspd then isshaftmult = true end
                  end
                  local isharm,m,r=is_a_multiple(sp*sbh,pk.sord,close)
                  local nextiscloser=false
                  if pi+1<#pl.peaks then
                    local nisharm,nm,nr=is_a_multiple(sp*sbh,pl.peaks[pi+1].sord,close)
                    nextiscloser=nisharm and nm==m and nr<r
                  end
                  if isharm and sp*sbh/bw>3 and sm<10 and not (nextiscloser) and not(isshaftmult) and not(isspmult) then
                    pk.flags=add_flag(pk.flags,'u')
                    if pk.subharmonics==nil then
                      pk['subharmonics']={suborder=tonumber(tostring(round(sbh,2))),shaftspeedratio=round(sp,3),mult=m}
                    else
                      table.insert(pk.subharmonics,{suborder=tonumber(tostring(round(sbh,2))),shaftspeedratio=round(sp,3),mult=m})
                    end
                    table.insert(harms,pi)
                  end
                end
                if #harms>0 then
                  havesubs=true
                  if subharmonics[tostring(round(sp,3))]==nil then subharmonics[tostring(round(sp,3))]={} end
                  subharmonics[tostring(round(sp,3))][tostring(round(sbh,2))]=harms
                harms={}
                end
              end 
            end
          end
          if havesubs then
            pl['subharmonics']=subharmonics
          end
        end
      end 

      -- add additional info to each peak in the normal peaklist

      -- add demod matches to normal peaklist
      for typ,axes in pairs(e.data.spec.cpl) do
        for ax, pl in pairs(axes) do
          for pi,pk in ipairs(pl.peaks) do

            -- add demode peak match flag to peak 
            if typ=="normal" then
              local closer=false
              for daxes,dmpl in pairs(e.data.spec.cpl.demod) do
                if daxes~=nil then
                  if daxes==ax then 
                    for _,dmpk in ipairs(dmpl.peaks) do
                      if dmpk~=nil then
                        if round(dmpk.sfreq/pk.sfreq,1)==1 then -- is this demod peak freq nearly equal to current peak freq
                          if pi+1<=#pl.peaks then  
                            if round(dmpk.sfreq/pl.peaks[pi+1].sfreq,1)==1 then  -- is the next peak closer to this demod peak freq
                              local r0=math.fmod(dmpk.sfreq,pk.sfreq)
                              r0=math.min(math.abs(r0),math.abs(1-r0))
                              local r1=math.fmod(dmpk.sfreq,pl.peaks[pi+1].sfreq)
                              r1=math.min(math.abs(r1),math.abs(1-r1))
                              if r0<r1 or closer then
                                if round(pk.sfreq/dmpk.sfreq,2) <=1.01 and round(pk.sfreq/dmpk.sfreq,2) >=.93 then  -- Open the search window enough to find AQ-204 demod which are up to 7% higher freq(one bin higher
                                  local dmamp=ds_spline_value( machine.datasets[dmpk.sdsi], dmpk.sbin )
                                  local dmmamp=ds_spline_avg( machine.datasets[dmpk.sdsi], dmpk.sbin )
                                  local sig=dmamp/dmmamp
                                  if sig>2 then 
                                    pk.flags=add_flag(pk.flags,'d')
                                  end  --  if dm pk is significant
                                end  -- if freqs match
                                closer=false
                              else
                                closer=true
                              end
                            else
                              if round(pk.sfreq/dmpk.sfreq,2) <=1.01 and round(pk.sfreq/dmpk.sfreq,2) >=.93 then  -- Open the search window enough to find AQ-204 demod which are up to 7% higher freq(one bin higher
                                local dmamp=ds_spline_value( machine.datasets[dmpk.sdsi], dmpk.sbin )
                                local dmmamp=ds_spline_avg( machine.datasets[dmpk.sdsi], dmpk.sbin )
                                local sig=dmamp/dmmamp
                                if sig>1 then 
                                  pk.flags=add_flag(pk.flags,'d')
                                end  
                              end  
                            end  
                          end 
                          if dmpk.sfreq > pk.sfreq*1.08 then break end
                        end  
                      end  
                    end 
                  end 
                end
              end 
            end

            -- add forcing frequency matches to peak
            local isfffund=false
            local matches={}
            if machine.datasets[pk.sdsi].matches~=nil then
              for _,mtch in ipairs (machine.datasets[pk.sdsi].matches) do
                if round(mtch.bin)==round(pk.sbin) then
                  table.insert (matches,mtch)
                  pk.flags=add_flag(pk.flags,'m')
                  if mtch.type=='F' then isfffund=true end
                end
              end
            end
            if #matches>0 then pk.matches=matches end 

            -- add harmonics to tones
            local close=.002
            local isshaftmult=false
            local shaftmult=1
            for pi,spd in ipairs(speeds) do
              local isspd,shaftmult=is_a_multiple(spd,pk.sord,close)
              if isspd then isshaftmult = true end
            end
            local haveharm=false
            local harms={}
            local hsev,henrgy=0,0
            if typ=='normal' then
              for hpi,hpk in ipairs(pl.peaks) do
                local bw
                if typ=='average' then
                  bw=machine.datasets[hpk.sdsi].bw
                else
                  bw=machine.datasets[hpk.sdsi].bw/machine.datasets[hpk.sdsi].speed
                end
                if hpk.sord/pk.sord>20 then close=.0008 end
                local nextiscloser=false
                local isharm,m,r=is_a_multiple(pk.sord,hpk.sord,close)
                if hpi+1<#pl.peaks then
                  local nisharm,nm,nr=is_a_multiple(pk.sord,pl.peaks[hpi+1].sord,close)
                  nextiscloser=nisharm and nm==m and nr<r
                end
                if isharm and pk.sord/bw>3 and m<21 and not (nextiscloser) then
                  if hpk.sev~=nil then hsev=hsev+hpk.sev end
                  henrgy=henrgy+hpk.sval 
                  if hpk.subharmonics==nil and m~=1 then
                    hpk['subharmonics']={order=round(pk.sord,3),harm=m}
                  elseif m~=1 then
                    table.insert(hpk.subharmonics,{order=round(pk.sord,3),harm=m})
                  end
                  table.insert(harms,hpi)
                end
              end
              if #harms>0 and (not(isshaftmult) or isfffund) and (pk.subharmonics==nil or #pk.subharmonics==0 or (#pk.subharmonics>0 and isfffund )) then
                haveharm=true
                pk['harm_pk_index']=harms
                pk['harm_energy']=henrgy
                if hsev>0 then pk['harm_severity']=hsev end
                if hsev>g_peak_group_threshold then
                  for _,idx in ipairs(harms) do
                    pl.peaks[idx].flags=add_flag(pl.peaks[idx].flags,'h')
                  end
                end              
              end
            end

            -- add sidebands to tones
            -- this section looks for LF sidebands on shaftrate tones > 20 orders and shaft rate sidebands on tones greater than 15 orders of shaftrate, +/- 4 sidebands each
            close=.003
            if #speeds==nspeeds then speeds[nspeeds+1]=2*machine.linef/machine.datasets[pk.sdsi].speed end
            local sb=4
            for s,spd in ipairs(speeds) do
              local sbindex=round(spd,3)..'x'
              local lf=false
              if s>nspeeds then 
                close=.0008
                sbindex='2XLF'
                lf=true
              end
              local haveside=false
              local sides={},{}
              local ssev,senrgy,sc=0,0,0
              if ( pk.sord>sb*spd*2 and not (lf)) or (pk.sfreq>10*machine.linef and lf) or not (isshaftmult) then
                for spi,spk in ipairs(pl.peaks) do
                  if spk.sord>(pk.sord+(sb*spd))*1.10 then break end
                  if spk.sord>(pk.sord-(sb*spd))*1.05 and ((spk.sfreq>10*machine.linef and lf) or not (lf)) then
                    local bw
                    if typ=='average' then
                      bw=machine.datasets[spk.sdsi].bw
                    else
                      bw=machine.datasets[spk.sdsi].bw/machine.datasets[spk.sdsi].speed
                    end
                    for sbd=-sb,sb,1 do
                      local nextiscloser=false
                      local issame,m,r=is_a_multiple(pk.sord+(spd*sbd),spk.sord,close)
                      if spi+1<#pl.peaks then
                        local nissame,nm,nr=is_a_multiple(pk.sord+(spd*sbd),pl.peaks[spi+1].sord,close)
                        nextiscloser=nissame and nm==m and nr<r
                      end
                      if issame and spd/bw>3 and m==1 and not (nextiscloser) and typ=='normal' then
                        if spk.sev~=nil then ssev=ssev+spk.sev end
                        senrgy=senrgy+  spk.sval 
                        if #sides==0 then table.insert(sides,pi) end
                        if spi~=pi then table.insert(sides,spi) end
                      end
                    end
                  end
                end
              end
              if #sides>1  then
                haveside=true
                if pk.sidebands==nil then
                  pk['sidebands']={}
                  pk['sb_energy']={}
                end
                pk.sidebands[sbindex]=sides
                pk.sb_energy[sbindex]=senrgy
                if ssev>0 then pk.sb_severity[sbindex]=ssev end
                if ssev>g_peak_group_threshold then
                  for _,idx in ipairs(sides) do
                    pl.peaks[idx].flags=add_flag(pl.peaks[idx].flags,'s')
                  end
                end   
              end
            end
          end -- peak

          -- build sorted list of normal peak list items at the axis level
          if typ=='normal' then
            local num=20
            local function sort_items(a,b) return a.item>b.item end
            local sv={}
            local df={}
            local hs={}
            local he={}
            local sevr={}
            local enrgr={}
            local sbs={}
            local sbfsev={}
            local sbfenrg={}
            local sbfs={}
            local sbfe={}
            if #pl.peaks>0 then
              for j, pk in ipairs (pl.peaks) do
                if pk.dif~=nil then
                  for sbf,sev in pairs(pk.sb_severity) do
                    sbfs[sbf]=sbf
                  end
                end
              end
              for j, pk in ipairs (pl.peaks) do   -- peaks
                table.insert (sv , {index=j,item=pk.sval})
                if pk.harm_energy~=nil and pk.harm_energy>0 then 
                  table.insert (he , {index=j,item=pk.harm_energy}) 
                end
                if pk.dif~= nil then 
                  if pk.harm_severity>0 then table.insert (hs , {index=j,item=pk.harm_severity}) end
                  if pk.dif>0 then table.insert (df , {index=j,item=pk.dif})  end
                  for sbf,sev in pairs(pk.sb_severity) do
                    for _,sbn in pairs(sbfs) do
                      if sbn==sbf and sev>0 then 
                        local temp=sbfsev[sbn] or {}
                        table.insert (temp,{index=j,item=sev})
                        sbfsev[sbn]=temp
                        temp={}
                      end
                    end
                  end 
                end
                if pk.sb_energy~=nil then
                  for sbf,sev in pairs(pk.sb_energy) do
                    for _,sbn in pairs(sbfs) do
                      if sbn==sbf then 
                        local temp=sbfenrg[sbn] or {}
                        table.insert (temp,{index=j,item=sev})
                        sbfenrg[sbn]=temp
                        temp={}
                      end
                    end
                  end
                end 
              end
            end -- peaks
            _,hs=sort_pk_items(hs)
            _,he=sort_pk_items(he)
            _,sv=sort_pk_items(sv)
            _,df=sort_pk_items(df)
            for sbf,sev in pairs(sbfsev) do  -- sb severity sideband frequency
              sevr,sev=sort_pk_items(sev, true)
              --
              -- the next section removes indicies that are included in a higher severity group
              --
              local nodups={}
              local sl={} 
              local highersbsg={}
              if #sev>0 then    -- #sev>0        
                local sgi=sev[1]
                table.insert(nodups,sgi) 
                if #sev>1 then  -- #sev>1 
                  table.move(sev,2,#sev,1,sl)
                  for x,sbgit in pairs (sl) do   -- sorted severity list
                    highersbsg={}
                    table.move(sev,1,x,1,highersbsg)
                    local dup=false
                    local sgit =sbgit
                    for sbgin,sbgi in ipairs (highersbsg) do -- higher sb groups
                      if dup then break end
                      local sgi=sbgi
                      for sbgf,sbidx in pairs (pl.peaks[tonumber(sgi)].sidebands) do  -- sidebands freq groups of index from higher group index

                        if sbgf==sbf then -- sb freq match
                          local idx
                          for id,idx in pairs (sbidx) do  -- indexes of sidebands
                            if tonumber(sgit)==tonumber(idx) then 
                              dup=true 
                              break
                            end  -- duplicate found
                          end   -- indexes of sidebands
                        end-- sb freq match
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
            for sbf,enrg in pairs(sbfenrg) do  -- sb energy sideband frequency
              enrgr,enrg=sort_pk_items(enrg, true)
              --
              -- the next section removes indicies that are included in a higher energy group
              --
              local nodups={}
              local sl={} 
              local highersbsg={}
              if #enrg>0 then    -- #enrg>0        
                local sgi=enrg[1]
                table.insert(nodups,sgi) 
                if #enrg>1 then  -- #enrg>1 
                  table.move(enrg,2,#enrg,1,sl)
                  for x,sbgit in pairs (sl) do   -- sorted energy list
                    highersbsg={}
                    table.move(enrg,1,x,1,highersbsg)
                    local dup=false
                    local sgit =sbgit
                    for sbgin,sbgi in ipairs (highersbsg) do -- higher sb groups
                      if dup then break end
                      local sgi=sbgi
                      for sbgf,sbidx in pairs (pl.peaks[tonumber(sgi)].sidebands) do  -- sidebands freq groups of index from higher group index
                        if sbgf==sbf then -- sb freq match
                          local idx
                          for id,idx in pairs (sbidx) do  -- indexes of sidebands
                            if tonumber(sgit)==tonumber(idx) then 
                              dup=true 
                              break
                            end  -- duplicate found
                          end   -- indexes of sidebands
                        end-- sb freq match
                      end  -- sidebands freq groups of index from higher group index
                    end  -- higher sb groups
                    if not (dup) then table.insert(nodups,sgit) end  -- add to the unique index list
                    dup=false
                  end -- sorted energy list
                  sbfe[sbf]=nodups
                  nodups={}
                end  -- #enrg>1 
              end  -- #enrg>0
            end-- sb energy sideband frequency
            pl['sorts']={harm_energy=he,harm_severity=hs,sval=sv,dif=df,sb_severity=sbfs,sb_energy=sbfe}
          end
        end -- pl or axis
      end
    end
  end


  for _,v in ipairs(rm_rulebase_info) do
    if v.lib.initialize then
      v.lib.initialize()
    end
  end
end

-- End Initialize Data
------------------------------

--------------------------------------------------------------
-- Use these functions together to pass values between rules.
--
-- Get a value stored in the shaft storage table.
function get_store_value( tag, cn )
  cn = cn or g_shaft_number
  local ssto = g_shaft_store[cn]
  local value = ssto[tag]
  if value==nil then
    return false, nil
  end
  return true, value  
end

function put_store_value( tag, value )
  local ssto = g_shaft_store[g_shaft_number]
  ssto[tag] = value
end

function increment_store_counter( tag )
  local check,count = get_store_value(tag)
  if check==true then
    count = count + 1
  else
    count = 1
  end
  put_store_value( tag, count )
  return count
end

function decrement_store_counter( tag )
  local check,count = get_store_value(tag)
  if check==true then
    count = count - 1
    if count < 0 then count = 0 end
  else
    count = 0
  end
  put_store_value( tag, count )
  return count
end

function increment_store_value( tag, value )
  value = value or 1
  local check,count = get_store_value(tag)
  if check==true then
    count = count + value
  else
    count = value
  end
  put_store_value( tag, count )
  return count
end

function decrement_store_value( tag, value )
  value = value or 1
  local check,count = get_store_value(tag)
  if check==true then
    count = count - value
  else
    count = -value
  end
  put_store_value( tag, count )
  return count
end
---------------------------------------------------------------
--get_comps_all
-- This function returns all the machine components in a format consistent with this section of code
local function get_comps_all()
  local comps = assert( machine.components ) 
  local res = {}
  for cn,cmp in ipairs(comps) do
    res[cn] = true
  end
  return res
end

--get_comps_at_shaft_index
-- This function will traslate the shaft index (si) to machine index (mi)
-- then search for single element components that lay on this index.
local function get_comps_at_shaft_index(si)
  local comps = assert( machine.components )
  local s  = safe_value_1( comps[g_shaft_number], M_SHAFT_INDEX, g_shaft_number )
  local mi = safe_value_1( s.map[si], M_SHAFT_INDEX, si ) 
  local res = {}
  for cn,cmp in ipairs(comps) do
    if #cmp.map==1 and cmp.map[1]==mi then
      res[cn] = true
    end
  end
  return res
end

--get_comps_have_shaft_index
-- This function will traslate the shaft index (si) to machine index (mi)
-- then search for components that include this index.
local function get_comps_have_shaft_index(si)
  local comps = assert( machine.components )
  local s  = safe_value_1( comps[g_shaft_number], M_SHAFT_INDEX, g_shaft_number )
  local mi = safe_value_1( s.map[si], M_SHAFT_INDEX, si ) 
  local res = {}
  for cn,cmp in ipairs(comps) do
    for _,i in ipairs(cmp.map) do
      if i==mi then
        res[cn] = true
        break
      end
    end
  end
  return res
end

-- This function is hardcoded to check the faults table.  This is because
-- it will be used by the Recommendation rules to check to see if a fault was
-- found.  Faults are the data for the Rec rules.
--
function fault_exists(fault)
  local f = assert( g_faults[g_shaft_number] )
  if f[fault] then
    return true
  end
  return false
end

-- get_fault
-- This function returns the fault that the currently running rule was designed for.
-- It provides a way to know the current state of the fault.
function get_fault(fault)
  fault = fault or g_fault
  local f = assert( g_faults[g_shaft_number] )
  local fs = f[fault]
  if fs then
    return true,fs
  end
  return false,nil
end

local function get_fault_rec_base( list, item, not_me, components_function )
  not_me = not_me or false
  local found = false
  local flts={}
  local comps = components_function()
    if not_me then
      if comps[g_shaft_number] then
        table.remove( comps, g_shaft_number )
      end
    end
    for cn,_ in pairs(comps) do
      local f = list[cn]
      if f then
        local fs = f[item]
        if fs then
          found = true
          table.insert( flts,{cn=cn,severity=fs.severity,conf=fs.conf, item=fs})
        end
      end
    end
    if found then
      return true,flts
    end
    return false,nil
  end

-- get_fault_ex
-- This function returns a table with component numbers that have
-- this fault along with the fault value.
  function get_fault_all(fault, not_me)
    return get_fault_rec_base( g_faults, fault, not_me, get_comps_all )
  end

-- For compatibility with old code.
  function get_fault_ex(fault)
    return get_fault_all(fault)
  end

  function get_fault_at_shaft_index(fault, shaft_index, not_me )
    return get_fault_rec_base( g_faults, fault, not_me, function() return get_comps_at_shaft_index(shaft_index) end )
  end

  function get_fault_have_shaft_index(fault, shaft_index, not_me )
    return get_fault_rec_base( g_faults, fault, not_me, function() return get_comps_have_shaft_index(shaft_index) end )
  end

-- For backward compatibility.
  function get_fault_on_shaft_line(fault, not_me )
    return get_fault_rec_base( g_faults, fault, not_me, get_comps_on_line )
  end

-- Based on name convention in filter.lua
  function get_fault_on_line(fault, not_me )
    return get_fault_rec_base( g_faults, fault, not_me, get_comps_on_line_array )
  end

  function get_fault_near(fault, not_me )
    return get_fault_rec_base( g_faults, fault, not_me, get_comps_near_array )
  end

  function get_fault_mine(fault, not_me )
    return get_fault_rec_base( g_faults, fault, not_me, get_comps_mine_array )
  end

  function get_rec(recommendation)
    recommendation = recommendation or g_fault --not a type-o
    local r = assert( g_recs[g_shaft_number] )
    local rs = r[recommendation]
    if rs then
      return true,rs
    end
    return false,nil
  end

  function get_rec_all(rec, not_me)
    return get_fault_rec_base( g_recs, rec, not_me, get_comps_all )
  end

  function get_rec_at_shaft_index(rec, shaft_index, not_me )
    return get_fault_rec_base( g_recs, rec, not_me, function() return get_comps_at_shaft_index(shaft_index) end )
  end

  function get_rec_have_shaft_index(rec, shaft_index, not_me )
    return get_fault_rec_base( g_recs, rec, not_me, function() return get_comps_have_shaft_index(shaft_index) end )
  end

  function get_rec_on_line(rec, not_me )
    return get_fault_rec_base( g_recs, rec, not_me, get_comps_on_line_array )
  end

  function get_rec_near(rec, not_me )
    return get_fault_rec_base( g_recs, rec, not_me, get_comps_near_array )
  end

  function get_rec_mine(rec, not_me )
    return get_fault_rec_base( g_recs, rec, not_me, get_comps_mine_array )
  end

--------------------------------------------------
--           assert support functions
--
-- type       1-peak / 2-band / 3-fault

-- Increment this value if the XML syntax or structure changes.
local infer_solution_version = '1'

--===================
-- These functions turn the hierarchy into XML
--

local function asn_rulebase( t, w )
  local str = '<rulebase '
  str = str .. "name" .. '=\"' .. t.name .. '\" ' 
  str = str .. "id" .. '=\"' .. t.id .. '\" '   
  str = str .. "version" .. '=\"' .. t.version .. '\" ' 
  str = str .. '/>'    
  w.xml = w.xml .. str
end

local function asn_version( w )
  local str = '<corelib '
  str = str .. "name" .. '=\"' .. vds_core_name .. '\" ' 
  str = str .. "id" .. '=\"' .. vds_core_id .. '\" '   
  str = str .. "version" .. '=\"' .. vds_core_version .. '\" ' 
  str = str .. '>'
  local ls = {xml = str}
  for _, t in ipairs(rm_rulebase_info) do
    asn_rulebase( t, ls )
  end
  ls.xml = ls.xml .. '</corelib>'
  w.xml = w.xml .. ls.xml
end

local function asn_band( lo, ho, t, w )
  local str = '<band '
  for att, val in pairs(t) do
    if    att=='forcingorderindex' 
    or att=='shaftdataindex' 
    or att=='datasourceindex' 
    or att=='dataindex' 
    then
      str = str .. att .. '=\"' ..  math.floor( val + 0.5 ) .. '\" ' 
    else
      str = str .. att .. '=\"' .. val .. '\" ' -- the space in last part is important.
    end
  end
  str = str .. '/>'
  w.xml = w.xml .. str
end

local function asn_peak( k, t, w )
  local str = '<peak '
  for att, val in pairs(t) do
    if    att=='forcingorderindex' 
    or att=='shaftdataindex' 
    or att=='datasourceindex' 
    or att=='dataindex' 
    then
      str = str .. att .. '=\"' ..  math.floor( val + 0.5 ) .. '\" ' 
    else
      str = str .. att .. '=\"' .. val .. '\" ' -- the space in last part is important.
    end
  end
  str = str .. '/>'
  w.xml = w.xml .. str
end

local function asn_xfault( k, t, w )
  local str = '<xfault '
  for att, val in pairs(t) do
    str = str .. att .. '=\"' .. val .. '\" ' -- the space in last part is important.
  end
  str = str .. '/>'
  w.xml = w.xml .. str
end

local function asn_failed_rule_info( t, w )
  local str = '<frule '
  for att, val in pairs(t) do
    local vt = type(val)
    if vt=='number' or vt=='string' then
      str = str .. att .. '=\"' .. val .. '\" ' -- the space in last part is important.
    end
  end
  str = str .. '/>'
  w.xml = w.xml .. str
end

local function asn_axis( k, t, w )
  local ls = {xml='<axis val=\"'..k..'\">'}
  if t.peaks then
    for i,v in pairs(t.peaks) do
      asn_peak(i,v,ls)   
    end
  end
  if t.bands then
    for lo,v in pairs(t.bands) do
      for ho,bd in pairs(v) do
        asn_band(lo,ho,bd,ls)
      end
    end
  end
  ls.xml = ls.xml .. '</axis>'
  w.xml = w.xml .. ls.xml
end

local function asn_data( k, t, w )
  local ls = {xml='<mel val=\"'..k..'\" guid=\"'.. machine.elements[k].guid ..'\" >' }
  for i,v in pairs(t) do
    asn_axis(i,v,ls)   
  end
  ls.xml = ls.xml .. '</mel>'
  w.xml = w.xml .. ls.xml
end

local function asn_rule( k, t, w )
  local ls = {xml='<rule guid=\"'..k..'\" name=\"'..t.name..'\" >'}
  for i,v in pairs(t.data) do
    asn_data(i,v,ls)
  end
  for i,v in pairs(t.faults) do
    asn_xfault(i,v,ls)
  end
  ls.xml = ls.xml .. '</rule>'
  w.xml = w.xml .. ls.xml
end

local function asn_fault( k, t, w )
  local ls = {xml='<fault val=\"'..k..
    '\" severity=\"'.. (t.severity or 'NAN')..
    '\" conf=\"'..(t.conf or 'NAN')..'\" >' }
  for i,v in pairs(t.data) do
    asn_data(i,v,ls)
  end
  for i,v in pairs(t.rules) do
    asn_rule(i,v,ls)
  end
  for i,v in pairs(t.faults) do
    asn_xfault(i,v,ls)
  end
  ls.xml = ls.xml .. '</fault>'
  w.xml = w.xml .. ls.xml
end

local function asn_failed_rules( k, w )
  local ls = {xml = '<error>' }
  local fr = g_infer_rules_failed[k]
  for _,r in ipairs(fr) do
    asn_failed_rule_info( r, ls )
  end
  ls.xml = ls.xml .. '</error>'
  w.xml = w.xml .. ls.xml
end

local function asn_warn_rules( k, w )
  local ls = {xml = '<warn>' }
  local fr = g_infer_rules_warn[k]
  for _,r in ipairs(fr) do
    asn_failed_rule_info( r, ls )
  end
  ls.xml = ls.xml .. '</warn>'
  w.xml = w.xml .. ls.xml
end

local function asn_rule_info(o, t, w )
  local str = '<rule order'.. '=\"' .. o .. '\" '
  for att, val in pairs(t) do
    local vt = type(val)
    if vt=='number' or vt=='string' then
      if not (att=='message' or att=='code' or att=='trace') then
         str = str .. att .. '=\"' .. val .. '\" ' -- the space in last part is important.
      end
    end
  end
  str = str .. '/>'
  w.xml = w.xml .. str
end

local function asn_fault_rule_map( k, t, w )
  local ls = {xml = '<rmfault val=\"'..k..'\" >' }
  for o,v in pairs(t) do
    asn_rule_info(o,v,ls)
  end
  ls.xml = ls.xml .. '</rmfault>'
  w.xml = w.xml .. ls.xml
end

local function asn_comp_rule_map( k, w )
  if g_rule_map==nil then return end
  local ls = {xml = '<rulemap>' }
  local crm = g_rule_map[k]
  if crm~=nil then
    for f,r in pairs(crm) do
      asn_fault_rule_map( f, r, ls )
    end
  end
  ls.xml = ls.xml .. '</rulemap>'
  w.xml = w.xml .. ls.xml
end

local function asn_comp( k, t, w )
  local ls = {xml = '<comp val=\"'..k..'\">' }
  asn_comp_rule_map( k, ls )
  asn_failed_rules( k, ls )
  asn_warn_rules( k, ls )
  for i,v in pairs(t) do
    asn_fault(i,v,ls)
  end
  ls.xml = ls.xml .. '</comp>'
  w.xml = w.xml .. ls.xml
end

-- Input
--    t - dataset
local function asn_data_peaks( t, w)
  local str = '<peaks>'
    for i, b in ipairs(t) do
      str = str .. '<peak indx=\"'..i..'\" bin=\"'..b..'\" /> '
    end
  str = str .. '</peaks>'
  w.xml = w.xml .. str     
end

local function asn_data_matches( t, w)
  local str = '<matches>'
    for _, m in ipairs(t) do
      str = str .. '<match bin=\"'..m.bin..'\" pos=\"'..m.pos..'\" tag=\"'..m.tag..'\" '..
             'type=\"'..m.type..'\" '
      if m.cn < 0 then
        str = str .. 'cn=\"'..(-m.cn)..'\" en=\"\" /> '
      else
         str = str .. 'en=\"'..m.cn..'\" cn=\"\" /> '         
      end
    end
  str = str .. '</matches>'
  w.xml = w.xml .. str     
end

local function asn_peak_matches( t, w)
  local str = '<matches>'
    for _, m in ipairs(t) do
      str = str .. '<match tag=\"'..m.tag..'\" type=\"'..m.type..'\" '
      if m.cn < 0 then
        str = str .. 'cn=\"'..(-m.cn)..'\" en=\"\" /> '
      else
         str = str .. 'en=\"'..m.cn..'\" cn=\"\" /> '         
      end
    end
  str = str .. '</matches>'
  w.xml = w.xml .. str     
end

local function asn_cpl_peak( t, w )
  local ls = {xml = '<peak ' }
  for att, val in pairs(t) do
    if (type(val) ~= "table") then
      if att=='adsi' 
      or att=='sdsi' 
      then
        ls.xml = ls.xml .. att .. '=\"' ..  math.floor( val + 0.5 ) .. '\" ' 
      else
        ls.xml = ls.xml .. att .. '=\"' .. val .. '\" ' -- the space in last part is important.
      end
    end
  end
  ls.xml = ls.xml .. '>'
  if t.matches then
    asn_peak_matches( t.matches, ls )
  end
  ls.xml = ls.xml .. '</peak>'
  w.xml = w.xml .. ls.xml
end

local function asn_cpl_axis( k, t, w )
  local ls = {xml='<axis val=\"'..k..'\">'}
  for _, pk in pairs(t.peaks) do
    asn_cpl_peak(pk, ls)      
  end 
  ls.xml = ls.xml .. '</axis>'
  w.xml = w.xml .. ls.xml
end

local function asn_cpl_domain( k, t, w )
  local ls = {xml = '<'..k..'>' }
  for ax, cpla in pairs(t) do
    asn_cpl_axis(ax, cpla, ls)      
  end  
  ls.xml = ls.xml .. '</'..k..'>'
  w.xml = w.xml .. ls.xml    
end

-- Input:
--   k -  spectrum type (demod, average, normal)
--   t - element.spec[axis]
local function asn_spec_type( k, t, w )
  local ls = {xml = '<'..k..'>' }
  local record = {}
  local rsup = {}
  for ax,tdsi in pairs(t) do -- this will be r, a, t = {indexs }
    for _,dsi in ipairs(tdsi) do
      local ds = machine.datasets[dsi]
      local rec = record[ds.sid]
      if rec==nil then rec={}; record[ds.sid] = rec; rsup[ds.sid] = {speed=ds.speed, fmax=ds.fmax} end
      rec[ax] = ds
    end
  end
  for sid, rec in pairs(record) do
    -- use sid and rsup[sid] to make record tag
    ls.xml = ls.xml .. '<record sid=\"'..sid..'\" speed=\"'..rsup[sid].speed..'\" fmax=\"'..rsup[sid].fmax..'\">'
    for ax, ds in pairs(rec) do
      ls.xml = ls.xml .. '<axis val=\"'..ax..'\">'
      asn_data_peaks(ds.peaks, ls)
      if ds.matches then
        asn_data_matches(ds.matches, ls)
      end
      ls.xml = ls.xml .. '</axis>'       
    end
    ls.xml = ls.xml .. '</record>' 
  end
  ls.xml = ls.xml .. '</'..k..'>'
  w.xml = w.xml .. ls.xml    
end

-- Input:
--   k -  spectrum type (demod, average, normal)
--   t - element.spec.cpl
local function asn_cpl_type( t, w )
  local ls = {xml = '<CPL>' }
  for key, val in pairs(t) do
    asn_cpl_domain( key, val, ls )
  end
  ls.xml = ls.xml .. '</CPL>'
  w.xml = w.xml .. ls.xml    
end

local function asn_element( k, t, w )
  local ls = {xml = '<mel val=\"'..k..'\" guid=\"'..t.guid..'\" ratio=\"'..t.speedratio..'\" >' }  
  for key, val in pairs(t.data.spec) do
    if key=="cpl" then
      asn_cpl_type( val, ls )
    elseif g_warning_level>=4 and (key=="demod" or key=="average" or key=="normal") then
      asn_spec_type( key, val, ls )
    end
  end
  ls.xml = ls.xml .. '</mel>'
  w.xml = w.xml .. ls.xml
end

local function asn_peaklist( w )
  local ls = {xml = '<pickups>' }
  for key,ele in ipairs(machine.elements) do
    if ele.data~=nil and ele.data.spec~=nil then
      asn_element( key, ele, ls )
    end
  end
  ls.xml = ls.xml .. '</pickups>'
  w.xml = w.xml .. ls.xml    
end

--  End infer solution XML output code
--===================

  local function as_get_fault_table( cn, fg )
    local ct = g_infer_solution[cn]
    local ft = ct[fg]
    if ft==nil then 
      ft={ data={},rules={},faults={}}
      ct[fg] = ft
    end
    return ft
  end

  local function as_get_rule_table( ft, rg, rn )
    rn = rn or ' '
    local rt = ft.rules[rg]
    if rt==nil then
      rt = {name=rn, data={},faults={}}
      ft.rules[rg]=rt
    end
    return rt
  end

  local function as_add_infer_output()
    for cn,_ in pairs(machine.components) do
      local f = g_faults_or_recs[cn] 
      local r = g_infer_rules_passed[cn]
      if f~=nil then
        for fg,val in pairs(f) do
          local ft = as_get_fault_table( cn, fg )
          ft.conf = val.conf
          ft.severity = val.severity
          for _,rval in ipairs(r) do
            if rval.fault==fg then
              -- This will put the rule guid into g_infer_solution
              as_get_rule_table( ft, rval.guid, rval.nmrule )
            end
          end
        end
      end
    end
  end

  local function as_add_peak_info( t, st, rei )
    local pt = t[rei]
    if pt==nil then pt = {}; t[rei]=pt end
    local at = pt[st.axis]
    if at==nil then at={}; pt[st.axis]=at end
    -- This is where the peaks node is created.
    local pkt = at.peaks
    if pkt==nil then pkt = {}; at.peaks=pkt end
    local sb = st.bin
    if pkt[sb]==nil then 
      pkt[sb]=st
    end
  end

  local function as_add_band_info( t, st, rei )
    local pt = t[rei]
    if pt==nil then pt = {}; t[rei]=pt end
    local at = pt[st.axis]
    if at==nil then at={}; pt[st.axis]=at end
    -- This is where the bands node is created.
    local bnd = at.bands
    if bnd==nil then bnd = {}; at.bands=bnd end
    local lo = bnd[st.loworder]
    if lo==nil then
      lo={}
      lo[st.highorder] = st
      bnd[st.loworder]=lo
    else
      local ho = lo[st.highorder]
      if ho==nil then
        lo[st.highorder] = st
        bnd[st.loworder]=lo   
      end
    end
  end
--  st format: 
--           ["type"] = 3, -- Fault
--           ["CompNum"]=comp_number,["fault"]=fault,
--           ["SeverityWeight"]=severity_weight,["description"]=description }  
  local function as_add_xfault_info( t, st )
    if t[st.fault]==nil then 
      t[st.fault]=st
    end
  end

  local function as_add_peak( ft, st )
    if st.shaftdataindex==nil then return end
    local cmp = machine.components[g_shaft_number]
    local dataindex = cmp.map[st.shaftdataindex]
    local rei
    if dataindex then
      rei = get_machine_element_alias(dataindex)
      st.dataguid = machine.elements[dataindex].guid
    else
      rei = 'NAN'
      dataindex = 'NAN'
      st.dataguid = 'NAN'
    end
    st.dataindex = dataindex
    --print( "as_add_peak: "..rei..","..st.dataindex )
    as_add_peak_info( ft.data, st, rei )
    as_add_peak_info( as_get_rule_table(ft, g_rule_guid, g_rule_name).data, st, rei )
  end

  local function as_add_band( ft, st )
    if st.shaftdataindex==nil then return end
    -- dataindex is relitive to the shft.  
    local cmp = machine.components[g_shaft_number]
    local dataindex = cmp.map[st.shaftdataindex]
    local rei
    if dataindex then
      rei = get_machine_element_alias(dataindex)
      st.dataguid = machine.elements[dataindex].guid
    else
      rei = 'NAN'
      dataindex = 'NAN'
      st.dataguid = 'NAN'
    end
    st.dataindex = dataindex
    as_add_band_info( ft.data, st, rei )
    as_add_band_info( as_get_rule_table(ft, g_rule_guid, g_rule_name).data, st, rei )
  end

  local function as_add_xfault( ft, st )
    if st.fault==nil then return end
    as_add_xfault_info( ft.faults, st )
    as_add_xfault_info( as_get_rule_table(ft, g_rule_guid, g_rule_name).faults, st )
  end
-- this function return the text from the string table associated with the guid
  function guid_name(guid)
    if guidnames then
      return guidnames[guid] or guid
    end
    return guid
  end

  function assert_support( support )
    local tp = support.type
    if tp==nil then return end
    local ft = as_get_fault_table( g_shaft_number, g_fault, g_fault_name )
    if tp==1 then
      as_add_peak( ft, support )
    elseif tp==2 then
      as_add_band( ft, support )    
    elseif tp==3 then
      as_add_xfault( ft, support )    
    end
  end

-- get_infer_solution
-- Notes:
--   This is the public function used to retrieve the inference solution.
  function get_infer_solution()
    as_add_infer_output()
    local w = {xml = '<root version=\"' .. infer_solution_version ..'\" >' }
    asn_version( w )
    for n, t in pairs(g_infer_solution) do
      asn_comp( n, t, w )
    end
    if l_fault_analysis then
      asn_peaklist( w )
    end

    w.xml = w.xml .. '</root>'
    return w.xml
  end

-- If any of these create_XXX functions change then change the value of infer_solution_version.
  function create_assert_support_peak(forcing_order_index, forcing_order_tag, data_index, axis, dsi, bin, order, freq, sval, aval, severity_weight, description )
    return { ["type"] = 1, -- Peak
      ["forcingorderindex"]=forcing_order_index,["shaftdataindex"]=data_index,["forcingordertag"]=forcing_order_tag,["axis"]=string.upper(axis),
      ["datasourceindex"]=dsi, ["bin"]=bin,["order"]=order,["freq"]=freq,["sval"]=sval,["aval"]=aval,["eu"]=g_unit_id,
      ["severityweight"]=severity_weight,["description"]=description }
  end

  function create_assert_support_band(forcing_order_index, forcing_order_tag, data_index, axis, dsi, low_order, high_order, sval, aval, severity_weight, description )
    return { ["type"] = 2, -- Band
      ["forcingorderindex"]=forcing_order_index,["shaftdataindex"]=data_index,["forcingordertag"]=forcing_order_tag,["axis"]=string.upper(axis),
      ["datasourceindex"]=dsi, ["loworder"]=low_order,["highorder"]=high_order,["sval"]=sval,["aval"]=aval,["eu"]=g_unit_id,
      ["severityweight"]=severity_weight,["description"]=description }
  end

  function create_assert_support_fault(comp_number, fault, severity_weight, description )
    return { ["type"] = 3, -- Fault
      ["compnum"]=comp_number,["fault"]=fault,
      ["severityweight"]=severity_weight,["description"]=description }  
  end

----------------------------------------------------

  function assert1(support)
    local f = assert( g_faults_or_recs[g_shaft_number] )
    if f[g_fault] then
      f[g_fault].conf = stanford_conf( f[g_fault].conf, g_conf )
    else
      f[g_fault]={severity=0,conf=g_conf}
    end
    if support~=nil then assert_support(support) end
    debugprint( 'Comp: '..guid_name(g_shaft), 'Rule: '..guid_name(g_fault),'Sev: '.. f[g_fault].severity,'Conf: '.. f[g_fault].conf )
  end

  function assert2(severity,support)
    local f = assert( g_faults_or_recs[g_shaft_number] )
    if f[g_fault] then
      f[g_fault].conf = stanford_conf( f[g_fault].conf, g_conf )
      f[g_fault].severity = severity
    else
      f[g_fault]={severity=0,conf=g_conf}
      f[g_fault].severity = severity
    end
    if support~=nil then assert_support(support) end
    debugprint( 'Comp: '..guid_name(g_shaft), 'Rule: '..guid_name(g_fault),'Sev: '.. f[g_fault].severity,'Conf: '.. f[g_fault].conf )
  end

  function assert2increment(severity,support)
    local f = assert( g_faults_or_recs[g_shaft_number] )
    if f[g_fault] then
      f[g_fault].conf = stanford_conf( f[g_fault].conf, g_conf )
      local current = f[g_fault].severity
      f[g_fault].severity = severity + current
    else
      f[g_fault]={severity=0,conf=g_conf}
      f[g_fault].severity = severity
    end
    if support~=nil then assert_support(support) end
    debugprint( 'Comp: '..guid_name(g_shaft), 'Rule: '..guid_name(g_fault),'Sev: '.. f[g_fault].severity,'Conf: '.. f[g_fault].conf )
  end

  function assert3(confidence,support)
    local f = assert( g_faults_or_recs[g_shaft_number] )
    if f[g_fault] then
      f[g_fault].conf = stanford_conf( f[g_fault].conf, confidence )
    else
      f[g_fault]={severity=0,conf=confidence}
    end
    if support~=nil then assert_support(support) end
    debugprint( 'Comp: '..guid_name(g_shaft), 'Rule: '..guid_name(g_fault),'Sev: '.. f[g_fault].severity,'Conf: '.. f[g_fault].conf )
  end
----------------------------------------
----------------------------------------
-- Functions to do with checking for existance of data.
-- They should be used sparingly.  The system is designed to handle this for you.
--
-- is_data
-- Notes:
--    This function determines if data is available.  It does not attempt
--    to resolve a pickup alias. Its purpose is to determine if real data is available.
--    It should always succeed.
-- REVIEW:
--     Could use an optional parameter: include_alias
--     If true then use get_machine_element function with the ei parameter to get the 
--     alias element.
-- Input:
--    shaft_data_index  : shaft index position of the data to analyse
--    typ               : the type of spectrum data [normal | average | demod]
--    axis              : data axis
-- Return:
--    boolean :
--       true : data is available
--       false: data is not available
--
  function is_data( shaft_data_index, axis, typ )
    typ = typ or "normal"
    local ei=machine.components[g_shaft_number].map[shaft_data_index]
    if ei==nil then return false end
    local spec=machine.elements[ei].data.spec
    if spec==nil then return false end
    local dom=spec[typ]
    if dom==nil then return false end
    local ai=dom[axis]
    if ai==nil then return false end
    return true
  end
----------------------------------------

-----------------------------------------------------
-- Error Managment Functions

-- check_get_order_tag_index
-- Notes:
--    This is a local function for checking the existance of a tag and returning the 
--    machine element index if it does exist.  If the tag exists look up it's position in the
--    component map to find the machine element and return that.
--    But if tag does not exist on the element it will check the component.  If found there
--    it will return the negitive of the component number.  This is the scheme that is used
--    to indicate that the index value is for a component and not an element.
--
-- Input:
--    tag              : the string value of the forcing order tag
--    shaft_tag_index  : shaft index position of the element to search for the forcing order tag.
--                       shaft_tag_index of zero indicates skip the element search, just check the component.
-- Return:
--    result   : the machine element index or the negitive of the component index.
--
-- Error:      : if the tag does not exist then raise an error and pop out of the code.
--
  local function check_get_order_tag_index( tag, shaft_tag_index, composite_shaft_index, no_error )
    shaft_tag_index = shaft_tag_index or 0
    if tag=="LF" or tag=="2XLF" then return shaft_tag_index end
    local ti
    local shaft_number = g_shaft_number
    if shaft_tag_index~=0 then
      ti = safe_value_1( machine.components[g_shaft_number].map[shaft_tag_index], M_SHAFT_TAG_INDEX, shaft_tag_index )
      local e = safe_value_1( machine.elements[ti], M_ELE_INDEX, ti )
      if e.forders[tag]~=nil then return ti end
    end

    if machine.composites[g_shaft]~=nil then 
      if composite_shaft_index~=nil then
        shaft_number = safe_value_1( machine.components[g_shaft_number].cmap[composite_shaft_index], M_COMPOSITE_INDEX, composite_shaft_index )
      elseif shaft_tag_index~=0 then
        shaft_number = find_component_for_index(ti)
      else  
        if no_error then
          return nil
        else
          error(M_ORDER_TAG(tag))
        end
      end
    end

    if machine.components[shaft_number].forders[tag]==nil  then 
      if no_error then
        return nil
      else
        error(M_ORDER_TAG(tag)) 
      end
    end
    return (-shaft_number)
  end

-- does_order_tag_exist
-- Notes:
--    This function is for checking the existance of a tag.  If the tag exists for the element
--    or the component that the element is part of it will return true.
--
-- Input:
--    tag              : the string value of the forcing order tag
--    shaft_tag_index  : shaft index position of the element to search for the forcing order tag.
--                       shaft_tag_index of zero indicates skip the element search, just check the component.
-- Return:
--    result   : true or false
--
  function does_order_tag_exist( tag, shaft_tag_index )
    shaft_tag_index = shaft_tag_index or 0
    if shaft_tag_index~=0 then
      local ti = safe_value_1( machine.components[g_shaft_number].map[shaft_tag_index], M_SHAFT_TAG_INDEX, shaft_tag_index )
      local e = safe_value_1( machine.elements[ti], M_ELE_INDEX, ti )
      if e.forders[tag]~=nil then return true end
    end
    if machine.components[g_shaft_number].forders[tag]==nil then 
      return false 
    end
    return true
  end

-- End - Error Managment Functions

-- get_attribute_value
-- Notes:
--    This function is for retrieving the value of an attribute tag.  
--
-- Input:
--    tag              : the string value of the attribute tag
--    shaft_tag_index  : shaft index position of the element to search for the attribute tag.
--                       shaft_tag_index of zero indicates skip the element search, just check the component.
--    default          : optional default value.  If supplied the function will not throw an error.
-- Return:
--    result   : the value assoiciated with the tag
--
-- Error    : If the attribute tag does not exist for the element or the component an error will be raised.
--
  function get_attribute_value( tag, shaft_tag_index, default )
    shaft_tag_index = shaft_tag_index or 0
    local ret
    if shaft_tag_index==0 then
      ret = machine.components[g_shaft_number].attr[tag]
    else
      local ti = safe_value_1( machine.components[g_shaft_number].map[shaft_tag_index], M_SHAFT_TAG_INDEX, shaft_tag_index )
      local e = safe_value_1( machine.elements[ti], M_ELE_INDEX, ti )
      ret = e.attr[tag]
    end

    if ret~=nil then 
      return ret
    else
      if default~=nil then
        return default
      else
        error(M_ATTR_TAG(tag))
      end
    end
  end

-- get_tag_order
-- Notes:
--    This function is for retrieving the value of a forcing order tag.  
--
-- Input:
--    tag              : the string value of the forcing order tag
--    shaft_tag_index  : shaft index position of the element to search for the forcing order tag.
--                       shaft_tag_index of zero indicates skip the element search, just check the component.
--    default          : optional default value.  If supplied the function will not throw an error.
-- Return:
--    result   : the order value assoiciated with the tag
--
-- Error    : If the forcing order tag does not exist for the element or the component an error will be raised.
--
  function get_tag_order( tag, shaft_tag_index, default )
    shaft_tag_index = shaft_tag_index or 0
    local ret
    if shaft_tag_index==0 then
      ret = machine.components[g_shaft_number].forders[tag]
    else
      local ti = safe_value_1( machine.components[g_shaft_number].map[shaft_tag_index], M_SHAFT_TAG_INDEX, shaft_tag_index )
      local e = safe_value_1( machine.elements[ti], M_ELE_INDEX, ti )
      ret = e.forders[tag]
      if ret==nil then
        ret = machine.components[g_shaft_number].forders[tag]
      end
    end

    if ret~=nil then 
      return ret
    else
      if default~=nil then
        return { ["order"]=default, ["use"]=0 }
      else
        error(M_ORDER_TAG(tag))
      end
    end
  end

------------------------------------------------------------------------
-- Supporting functions:
--
  local function compute_avg_data_max_order( ds )
    return ds.order
  end

  local function compute_avg_data_order( bin, ds )
    return (bin-1) * ds.bw
  end

  local function compute_avg_data_bin( order, ds )
    local bin_per_order = 1.0 / ds.bw
    local bin = (order * bin_per_order) + 1
    local rng = g_bin_margin * bin_per_order / 100.0
    local lbin = bin - rng
    local hbin = bin + rng
    if lbin < 1 then lbin = 1 end
    if hbin > #ds.data then hbin = #ds.data end
    return bin, lbin, hbin

    --return ((order / ds.bw) + 1)
  end

  local function compute_data_max_order( ds )
    return ds.fmax / ds.speed
  end

  local function compute_data_order( bin, ds )
    return (bin-1) * ds.bw / ds.speed
  end

  local function compute_data_bin( order, ds )
    local bin_per_order = ds.speed / ds.bw
    local bin = (order * bin_per_order) + 1
    local rng = g_bin_margin * bin_per_order / 100.0
    local lbin = bin - rng
    local hbin = bin + rng
    if lbin < 1 then lbin = 1 end
    if hbin > #ds.data then hbin = #ds.data end
    return bin, lbin, hbin
  end

  local function make_avg_helper_struct()
    return { max_order=compute_avg_data_max_order, order=compute_avg_data_order, bin=compute_avg_data_bin}
  end

  local function make_data_helper_struct()
    return {max_order=compute_data_max_order, order=compute_data_order, bin=compute_data_bin}
  end

  function get_best_dataset( order, shaft_data_index, typ, axis, no_error )
    no_error = no_error or false
    local s  = safe_value_1( machine.components[g_shaft_number], M_SHAFT_INDEX, g_shaft_number )
    local ei = safe_value_1( s.map[shaft_data_index], M_SHAFT_DATA_INDEX, shaft_data_index )
    local spec = safe_value_3( get_machine_element(ei).data.spec, M_DATA, "spec", typ, axis )
    local dom = safe_value_3( spec[typ], M_DATA, "spec", typ, axis )
    local ai = safe_value_3( dom[axis], M_DATA, "spec", typ, axis )

    local mdi = 0
    local lbw = 100000

    local helper
    if typ=="average" then
      helper = make_avg_helper_struct()
    else
      helper = make_data_helper_struct()
    end

    for _,di in ipairs(ai) do
      local ds = machine.datasets[di]
      local o = helper.max_order(ds)
      if o > order then
        if ds.bw < lbw then
          lbw = ds.bw
          mdi = di
        end
      end
    end
    if no_error then
      if mdi==0 then return 0,nil,helper end
    else
      if mdi==0 then error( M_DATA_RANGE("spec", typ, axis, order) ) end
    end
    local ds = machine.datasets[mdi]
    return mdi, ds, helper
  end

-- get_order_info
-- Notes:
--    This function can be passed normal spectrum or average, so no frequency information
--    can be returned.  It always succeedes (as long as there is data).
-- Input:
--    order             : the position in the spectrum given in orders
--    shaft_data_index  : shaft index position of the data to analyse
--    typ               : the type of spectrum data [normal | average | demod]
--    axis              : data axis
--    peak_polish       : [optional] Find the peak between data points using a spline
--    no_error          : [optional] if true the function will not assert if there is not supporting data
--                        it will return (0,nil).
-- Return:
--    result   : An intiialized table.  Will be reutned with the properties
--                dsi   : the data set index, use with machine.dataset
--                order : the position of the identified tag in orders of rotation
--                bin   : the position of the identified tag in bins
--                value : the amplitude of the spectrum at the order.  This will be a peak value as peak polishing was used to find the position.
--
  function  get_order_info( order, shaft_data_index, typ, axis, peak_polish, no_error )
    peak_polish = peak_polish or true 
    local dsi, ds, helper = get_best_dataset(order, shaft_data_index, typ, axis, no_error)
    if ds==nil then return nil end

    local bin, lbin, hbin = helper.bin(order, ds)

    if peak_polish then
      local val, index = findmaxima( lbin, hbin, bin, ds.data, ds.spline )
      local ord = helper.order(index, ds)
      return { ["order"]=ord, ["bin"]=index, ["dsi"]=dsi, ["value"]=ConvertSpectrum( g_internal_unit, GetUnitFromId(g_unit_id), val ) }
    else
      local val = ConvertSpectrum( g_internal_unit, GetUnitFromId(g_unit_id), ds_spline_value(ds,bin) )
      return { ["order"]=order, ["bin"]=bin, ["dsi"]=dsi, ["value"]=val }
    end
  end

  local function find_peak_in_range( bin, range, peaks )
    local lb = bin-range
    local hb = bin+range
    local ob = 0
    local cur_dif = 1000000
    for _,b in ipairs(peaks) do
      if b>=lb and b<=hb then
        local dif=math.abs(b-bin)
        if dif < cur_dif then
          cur_dif = dif
          ob = b
        end
      end
    end
    return ob
  end

-- find_order_info
-- Notes:
--    This function can be passed normal spectrum or average, so no frequency information
--    can be returned.  The function looks for the order in the peak list.
-- Input:
--    order             : the position in the spectrum given in orders
--    shaft_data_index  : shaft index position of the data to analyse
--    typ               : the type of spectrum data [normal | average | demod]
--    axis              : data axis
--    no_error          : [optional] if true the function will not assert if there is not supporting data
--                        it will return nil.
-- Return:
--    result   : An intiialized table.  Will be reutned with the properties
--                found : always returned, true or false indication if the tag was found
--                dsi   : the data set index, use with machine.dataset
--                order : the position of the identified order in orders of rotation
--                bin   : the position of the identified order in bins
--                freq  : the position of the identified order in frequency
--                value : the amplitude of the spectrum at the order.  This will be a peak value as peak polishing was used to find the position.
--                mval  : current spectra average value
--
  function find_order_info( order, shaft_data_index, typ, axis, no_error )
    local dsi, ds, helper = get_best_dataset(order, shaft_data_index, typ, axis, no_error)
    if ds==nil then return nil end
    local seed_bin, lbin, hbin = helper.bin(order, ds)
    local bin = find_peak_in_range( seed_bin, g_peak_margin, ds.peaks )
    if bin==0 then return {["found"]=false} end

    local ord = helper.order(bin, ds)
    return { ["found"]=true,["order"]=ord, ["bin"]=bin, ["dsi"]=dsi, 
      ["value"]= ConvertSpectrum( g_internal_unit, GetUnitFromId(g_unit_id), ds_spline_value(ds,bin) ), 
      ["mval"] = ConvertSpectrum( g_internal_unit, GetUnitFromId(g_unit_id), ds_spline_avg(ds,bin) ) 
    }
  end

-----------------------------------------------------------------------------------------

-- Input
  function find_bin_in_peaks( bin, peaks, tlan, min, max )
    local n = #peaks
    min = min or 1
    max = max or n
    if n > 0 then
      tlan = tlan or 1E-6
      -- Apply the binary search algorithm
      local pos
      repeat
        pos = math.floor( ((min+max)/2) + 0.5 )
        if math.abs(peaks[pos]-bin) < tlan then
          return true, pos
        elseif peaks[pos] < bin then
          min = pos + 1
        else
          max = pos - 1
        end
      until min>max
    end
    return false, max
  end

-----------------------------------------------------------------------------------------
-- get_avg_noise
-- Input:
--    from_order        : start of region of ananlysis
--    to_order          : end of region of analysis (exclusive)
--    shaft_data_index  : shaft index position of the data
--    type              : data type (average else normal)
--    axis              : data axis (r,a, or t)
--    no_error          : [optional] if true the function will not assert if there is not supporting data
--                        it will return (0,nil).
-- return:
--    dsi, nf
--    where nf = the average value of the noise floor in the range.
--
  function get_avg_noise( from_order, to_order, shaft_data_index, typ, axis, no_error )
    assert( to_order>=from_order, "from_order must be greater than or equal to to_order." )
    local dsi, ds, _ = get_best_dataset(to_order, shaft_data_index, typ, axis, no_error)
    local bins_per_order

    if ds==nil then return 0, nil end

    local range_order = to_order - from_order

    if typ=="average" then
      bins_per_order = 1 / ds.bw
    else
      bins_per_order = ds.speed / ds.bw
    end

    local order_step = 0.5 / bins_per_order
    if order_step > (range_order / 10) then
      order_step = range_order / 10
    end

    local sum = 0
    local n = 0
    for order=from_order,to_order,order_step do
      local b = order * bins_per_order
      sum = sum + ds_spline_avg( ds, b )
      n = n + 1
    end

    return dsi, ConvertSpectrum( g_internal_unit, GetUnitFromId(g_unit_id), sum/n )
  end

-- analyze_noise_floor
-- Input:
--    from_order        : start of region of ananlysis
--    to_order          : end of region of analysis (exclusive)
--    shaft_data_index  : shaft index position of the data
--    axis              : data axis (r,a, or t)
--    no_error          : [optional] if true the function will not assert if there is not supporting data
--                        it will return (0,nil).
-- Return:
--    result  - A table with the following entries:
--                sdsi - data source index
--                sval - current spectra value
--                adsi - average data source index
--                aval - average value
--                dif  - the differance
--                pct  - percent difference
--
  function analyze_noise_floor( from_order, to_order, shaft_data_index, axis, no_error )  
    -- no_error is false then get_avg_noise will assert out if there is no supporting data.
    local sdsi, s = get_avg_noise( from_order, to_order, shaft_data_index, "normal", axis, no_error ) 
    if s==nil then return nil end
    local adsi, a = get_avg_noise( from_order, to_order, shaft_data_index, "average", axis, no_error ) 
    if a==nil then return nil end
    return { ["sdsi"] = sdsi, ["sval"] = s, ["adsi"] = adsi, ["aval"] = a, ["dif"] = (s-a), ["pct"] = (s-a)/a }
  end
-----------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------
-- make_unmatched_peak_result
-- Internal function used by analyze_unmatched_peaks.
-- Input:
--    bin       : data (sval) bin
--    ord       : data order
--    dsi       : data set index
--    ds        : data set
--    sdi       : shaft data index
--    axis      : data axis (r,a, or t)
-- return:
--    A table with result data for a peak
--
  local function make_unmatched_peak_result( bin, ord, dsi, ds, sdi, axis )
    local r2 = get_order_info( ord, sdi, "average", axis, false )
    local s = ConvertSpectrum( g_internal_unit, GetUnitFromId(g_unit_id), ds_spline_value(ds,bin) )
    local m = ConvertSpectrum( g_internal_unit, GetUnitFromId(g_unit_id), ds_spline_avg(ds,bin) )
    local a = r2.value
    return {
      ["sval"] = s, 
      ["mval"] = m, 
      ["sord"] = ord, 
      ["sfreq"] = (bin-1) * ds.bw,
      ["sbin"] = bin,
      ["sdsi"] = dsi,
      ["aval"] = a, 
      ["aord"] = r2.order,
      ["abin"] = r2.bin,
      ["adsi"] = r2.dsi,
      ["dif"] = (s-a), 
      ["pct"] = ((s-a)/a),
      ["mdif"] = (s-m), 
      ["mpct"] = ((s-m)/a)
    }
  end

-- analyze_unmatched_peaks
-- Input:
--    from_order        : start of region of ananlysis
--    to_order          : end of region of analysis (inclusive)
--    shaft_data_index  : shaft index position of the data
--    axis              : data axis (r,a, or t)
--    prominence_cutoff : (peak - noise floor) must exceed this value
-- Output:
--    result  - A table with the following entries:
--    sval  : Amplitude of peak
--    mval  : Value of moving average at peak
--    sord  : Order of peak
--    sfreq : frequency of peak
--    sbin  : bin value of peak (must be used with dsi value to get the corresponding data set)
--    sdsi  : sval data set
--    aval  : Amplitude of average value peak.  Peak matching does occur.
--    aord  : Order of average peak
--    abin  : Bin of average peak (must be used with adsi value to get the corresponding data set)
--    adsi  : aval data set
--    dif   : (sval-aval), 
--    pct   : percent change of sval over aval.
--    mdif  : (sval-mval)
--    mpct  : percent change of sval over mval.
--  Notes:
--    To get all possible unmatched peaks set from_order to zero and
--    to_order to a big number.
--
  function analyze_unmatched_peaks( from_order, to_order, prominence_cutoff, shaft_data_index, axis )
    local results={}
    local _fo = from_order
    local _to = to_order
    local _o
    local some_or_all_data = false
    repeat
      -- Using get_best_dataset with trailing false parameter, this makes it return dsi of zero
      -- when there is no data rather than raising an error.
      local dsi, ds, helper = get_best_dataset(_fo, shaft_data_index, "normal", axis, false)
      if dsi==0 then break end
      some_or_all_data = true
      local pks={}
      local positions={}
      for pos,bin in pairs(ds.peaks) do
        _o = helper.order(bin, ds)
        if _o >= _fo then
          if _o <= _to then
            pks[pos]=bin
          else
            break;
          end
        end
      end
      for _,m in ipairs(ds.matches) do
        positions[m.pos]=true
      end
      for pos,_ in pairs(positions) do
        pks[pos]=nil
      end
      for _,bin in pairs(pks) do
        _o = helper.order(bin, ds)
        table.insert( results, 
          make_unmatched_peak_result(bin, _o, dsi, ds, shaft_data_index, axis) )
      end
      _fo = helper.max_order(ds)  
    until _fo >= _to
    if some_or_all_data==false then error( M_DATA_RANGE("spec", "normal", axis, from_order) ) end
    local out={}
    for _,upr in ipairs(results) do
      if upr.mdif >= prominence_cutoff then
        table.insert( out, upr )
      end
    end

    return out
  end

-----------------------------------------------------------------------------------------



--local function  get_bin_info( bin, shaft_data_index, typ, axis, ds, peak_polish )
--  peak_polish = peak_polish or true 

--  if peak_polish then
--    local lbin = bin - g_peak_margin
--    local hbin = bin + g_peak_margin
--    if lbin < 1 then lbin = 1 end
--    if hbin > #ds.data then hbin = #ds.data end
--    local val, index = findmaxima( lbin, hbin, bin, ds.data, ds.spline )
--    local ord = helper.order(index, ds)
--    return { ["order"]=ord, ["value"]=ConvertSpectrum( g_internal_unit, GetUnitFromId(g_unit_id), val ) }
--  else
--    local val = ConvertSpectrum( g_internal_unit, GetUnitFromId(g_unit_id), ds_spline_value(ds,bin) )
--    return { ["order"]=order, ["value"]=val }
--  end
--end
  function search_sidebands_hz( sidebands, hz, tol )
    for _,sb in pairs(sidebands) do
      if math.abs( sb.span.hz - hz ) <= tol then return true end
    end
    return false
  end

  function search_sidebands_order( sidebands, order, tol )
    for _,sb in pairs(sidebands) do
      if math.abs( sb.span.order - order ) <= tol then return true end
    end
    return false
  end

  function analyze_sideband_by_tag( tag, shaft_tag_index, shaft_data_index, axis, polish_data_peak, polish_avg_peak )  
    polish_data_peak = polish_data_peak or (true)
    polish_avg_peak = polish_avg_peak or (true)

    -- First see if the tag was matched with a peak.  Sometimes the tag will not have a match,
    -- but we still want to know if there are sidebands around the place where the tag peak would be.
    -- It is not as good because we can only consider the theoretical location of the tag (it's forcing order)
    -- not the exact location in this data (because it wasn't found).
    local r1 = find_tag_info( tag, shaft_tag_index, shaft_data_index, axis )
    local order
    local center_bin
    local dsi
    local ds
    local found
    local pos
    if r1.found==true then 
      found = true
      center_bin = r1.match.bin
      pos = r1.match.pos
      order = r1.order
      dsi = r1.dsi
      ds = machine.datasets[dsi]
    else
      -- The tag wasn't found, get the theoretical location.
      order = get_tag_order( tag, shaft_tag_index )
      dsi,_,_ = get_best_dataset( order, shaft_data_index, axis )
      ds = machine.datasets[dsi]
      center_bin = compute_data_bin( order, ds )
      -- This will find the mean if no peak exists.
      _, pos = find_bin_in_peaks( center_bin, ds.peaks )
      found = true
    end

    local peaks = ds.peaks
    local bin_to_order = ds.bw / ds.speed
    local n = #peaks
    local high = pos + 1
    local low
    if found then
      low = pos - 1
    else
      low = pos
    end
    local sidebands = {}
    for p=high,n,1 do
      local span = peaks[p] - center_bin
      if span > center_bin then break end
      local target = center_bin - span
      found, pos = find_bin_in_peaks( target, peaks, 1.0, 1, low )
      if found then
        debugprint( "Sideband hit: "..pos.." , "..p )
        -- REVIEW: Both these don't hit very often.  Don't know why.
        local res1 = analyze_by_order( peaks[pos] * bin_to_order,shaft_data_index, axis )
        local res2 = analyze_by_order( peaks[p] * bin_to_order,shaft_data_index, axis )
        if res1.found and res2.found then
          table.insert( sidebands, { ["span"]={bin=span, order=compute_data_order( span, ds), hz=span*ds.bw }, ["low"]=res1, ["high"]=res2 } )
        end
      end
    end
    local sbn = #sidebands
    if sbn > 0 then
      return {["found"]=true, ["count"]=sbn, ["sidebands"]=sidebands}
    end
    return {["found"]=false}
  end
-----------------------------------------------------

-- 
-- get_data_shaft_speed
-- Use this function to get the best estimate of the current shaft speed in Hz
-- based on the data.  It uses the composite data "shaftspeed.avg" of the pickup
-- location.  It considers the actual pickup location, which may be different than
-- the input pickup.
--
function get_data_shaft_speed( shaft_data_index, axis )
  local s  = safe_value_1( machine.components[g_shaft_number], M_SHAFT_INDEX, g_shaft_number )
  local ele_data_index = safe_value_1( s.map[shaft_data_index], M_SHAFT_DATA_INDEX, shaft_data_index )
  local ei = get_machine_element_alias(ele_data_index) -- Data element.  May be an alias.
  local e = machine.elements[ei]
  if e.data==nil or e.data.spec==nil or e.data.spec.cpl==nil or e.data.spec.cpl.normal==nil then
    error(M_DATA("spec","normal","composite"))
  end
  local tax = safe_value_3( e.data.spec.cpl.normal[axis], M_DATA, "spec", "normal", "composite.shaftspeed" )
  local speed = safe_value_3( tax.shaftspeed.ave, M_DATA, "spec", "normal", "composite.shaftspeed" )
  if ei~=ele_data_index then
    local assi = find_super_shaft_with_element(machine.supershafts, ei)
    if g_super_shaft_number~=assi then
      local ss = get_this_super_shaft()
      local ass = machine.supershafts[assi]
      speed = speed * ss.speed_ratio / ass.speed_ratio
    end
  end
  return speed
end

-- find_tag_in_matches
--    Input:
--      tag     : Forcing Order tag to look for.
--      ei      : element index or - component index.
--      matches : matches table
--    Return:
--      A table with the match or nil
  local function find_tag_in_matches( tag, ei, matches )
    if matches==nil then return nil end
    for _, m in ipairs(matches) do
      if m.type=="F" and m.tag==tag and m.cn==ei then return m end
    end
    return nil
  end

-- find_tag_harmonic_in_matches
--    Input:
--      tag     : Forcing Order tag to look for.
--      ei      : element index
--      matches : matches table
--    Return:
--      A table with one or more matchs or nil
  local function find_tag_harmonic_in_matches( tag, ei, matches )
    if matches==nil then return nil end
    local list={}
    local found = false
    for _, m in ipairs(matches) do
      if m.type=="H" and m.tag==tag and m.cn == ei then 
        list[m.order]=m 
        found = true
      end
    end
    if found then return list end
    return nil
  end

-- find_tag_info
-- Notes:
--    This function assumes "normal" spectrum data.  That is the only data searched for
--    forcing order matches.
-- Input:
--    tag               : a component forcing order tag
--    shaft_tag_index   : shaft index position of the component 
--    shaft_data_index  : shaft index position of the data to analyse
--    axis              : data axis
--    composite_shaft_index : [optional] use to indicate the composite shaft containing the tag
-- Return:
--    result   : An intiialized table.  Will be reutned with the properties
--                found : always returned, true or false indication if the tag was found
--                match : the tag properties
--                dsi   : the data set index, use with machine.dataset
--                order : the position of the identified tag in orders of rotation
--                freq  : the position of the identified tag in frequency
--                bin   : the position of the identified tag in bins
--                value : the amplitude of the spectrum at the order.  This will be a peak value as peak polishing was used to find the position.
--                mval  : the amplitude of the spectrum moving average (the signal noise floor).
--
function find_tag_info( tag, shaft_tag_index, shaft_data_index, axis, composite_shaft_index )
  local ei = safe_value_1( machine.components[g_shaft_number].map[shaft_data_index], M_SHAFT_DATA_INDEX, shaft_data_index ) -- The index of the element that is a data pcikup
  local ti
  local spec
  -- Example data layout
  -- spec={
  --    normal={ r={7,13},a={8,14},t={9,15} },       : The numbers are data set indexes.  
  --    average={ r={19,31}, a={20,32}, t={21,33} }  : They could be high and low range data but we do not know here.
  --    }

  if tag=="LF" or tag=="2XLF" then
    ti = get_machine_element_alias( ei )
    local ele = machine.elements[ti]
    spec = safe_value_3( ele.data.spec, M_DATA, "spec", "normal", axis )
  else
    ti = check_get_order_tag_index(tag, shaft_tag_index, composite_shaft_index )
    spec = safe_value_3( get_machine_element(ei).data.spec, M_DATA, "spec", "normal", axis )
  end

  local dom = safe_value_3( spec["normal"], M_DATA, "spec", "normal", axis )
  local ni = safe_value_3( dom[axis], M_DATA, "spec", "normal", axis )
  local mdi = 0
  local bws = 10000
  local lbw = bws
  local tag_match = nil

  -- matches format: (type, tag, ei, bin)
  --    type  - F = fundemental, H = harmonic, S = sideband
  --    tag   - Forcing Order tag
  --    ei    - machine element index
  --    bin   - bin position of peak in the data.  A real number and will be fractional.
  --    order - for type H only.  The order of the harmonic.
  mdi = 0
  for _,di in ipairs(ni) do
    local ds = machine.datasets[di]
    local m = find_tag_in_matches( tag, ti, ds.matches )
    if m~=nil then
      if ds.bw < lbw then
        lbw = ds.bw
        mdi = di
        tag_match = m
      end
    end
  end

  if mdi==0 then return {["found"]=false} end
  local ds = machine.datasets[mdi]

  --local val = ds_spline_value( ds, tag_match.bin )
  --val = ConvertSpectrum( g_internal_unit, GetUnitFromId(g_unit_id), val )
  --return { ["found"] = true, ["match"] = tag_match, ["dsi"] = mdi, ["order"] = (tag_match.bin * lbw / ds.speed), ["value"] = val }
  return { ["found"] = true, ["match"] = tag_match, ["dsi"] = mdi, ["order"] = ((tag_match.bin-1) * lbw / ds.speed), ["freq"] = (tag_match.bin-1) * lbw, ["bin"] = tag_match.bin, ["value"] = ConvertSpectrum( g_internal_unit, GetUnitFromId(g_unit_id), ds_spline_value( ds, tag_match.bin ) ), ["mval"] = ConvertSpectrum( g_internal_unit, GetUnitFromId(g_unit_id), ds_spline_avg( ds, tag_match.bin ) ) }
end

function find_tag_info_cpl( tag, shaft_tag_index, shaft_data_index, axis, composite_shaft_index )
  local ei = safe_value_1( machine.components[g_shaft_number].map[shaft_data_index], M_SHAFT_DATA_INDEX, shaft_data_index ) -- The index of the element that is a data pcikup
  local ti
  local pks
  -- Example data layout
  -- spec={
  --    normal={ r={7,13},a={8,14},t={9,15} },       : The numbers are data set indexes.  
  --    average={ r={19,31}, a={20,32}, t={21,33} }  : They could be high and low range data but we do not know here.
  --    }

  if tag=="LF" or tag=="2XLF" then
    ti = get_machine_element_alias( ei )
    pks = safe_spec_cpl( machine.elements[ti], "normal", axis )
  else
    ti = check_get_order_tag_index(tag, shaft_tag_index, composite_shaft_index )
    local ele = get_machine_element(ei)
    pks = safe_spec_cpl( ele, "normal", axis )
  end

  local peak = nil
  local tag_match = nil
  -- peak format:
  --    aval
  --    aord
  --    abin
  --    afreq
  --    adsi
  --    sval
  --    sord
  --    sbin
  --    sfreq
  --    sdsi
  --    dif    s-a
  --    pct
  --    mval
  --    mdif   s-m
  --    mpct
  --    fmax
  --    order
  --    sev
  --    matches
  --
  -- matches format: (type, tag, ei, bin)
  --    type  - F = fundemental, H = harmonic, S = sideband
  --    tag   - Forcing Order tag
  --    ei    - machine element index
  --    bin   - bin position of peak in the data.  A real number and will be fractional.
  --    order - for type H only.  The order of the harmonic.
  for _,p in ipairs(pks.peaks) do
    peak = p
    tag_match = find_tag_in_matches( tag, ti, p.matches )
    if tag_match then break end
  end
  
  if tag_match==nil then
    return {["found"]=false}
  end
  
  -- Copy all the scalar values of the composite peak
  local ret = {}
  for orig_key, orig_value in pairs(peak) do
    if type(orig_value)~='table' then
      ret[orig_key] = orig_value
    end
  end
  
  ret.sval = ConvertSpectrum( g_internal_unit, GetUnitFromId(g_unit_id), ret.sval )
  ret.mval = ConvertSpectrum( g_internal_unit, GetUnitFromId(g_unit_id), ret.mval )
  ret.mdif = ret.sval - ret.mval
  if ret.aval then
    ret.aval = ConvertSpectrum( g_internal_unit, GetUnitFromId(g_unit_id), ret.aval )
    ret.dif = ret.sval - ret.aval
  end
  
  -- Add the matches table to the return value.
  local ret_matches = {}
  for orig_key, orig_value in pairs(peak.matches) do
    ret_matches[orig_key] = orig_value
  end
  ret.matches = ret_matches
  
  ret.found = true
  return ret
end

-- find_tag_harmonic_info
-- Notes:
--    This function assumes "normal" spectrum data.  That is the only data searched for
--    forcing order matches.
-- Input:
--    tag               : a component forcing order tag
--    shaft_tag_index   : shaft index position of the component 
--    shaft_data_index  : shaft index position of the data to analyse
--    axis              : data axis
--    composite_shaft_index : [optional] use to indicate the composite shaft containing the tag
-- Return:
--    A table of tag results
--           tag result : A table with the following properties
--                found : always returned, true or false indication if the tag was found
--                match : the tag properties
--                dsi   : the data set index, use with machine.dataset
--                order : the position of the identified tag in orders of rotation
--                freq  : the position of the identified tag in frequency
--                bin   : the position of the identified tag in bins
--                value : the amplitude of the spectrum at the order.  This will be a peak value as peak polishing was used to find the position.
--                mval  : the amplitude of the spectrum moving average (the signal noise floor).

  function find_tag_harmonic_info( tag, shaft_tag_index, shaft_data_index, axis, composite_shaft_index )
    local s  = safe_value_1( machine.components[g_shaft_number], M_SHAFT_INDEX, g_shaft_number )
    local ei = safe_value_1( s.map[shaft_data_index], M_SHAFT_DATA_INDEX, shaft_data_index )
    local ti = check_get_order_tag_index(tag, shaft_tag_index, composite_shaft_index)

    -- Example data layout
    -- spec={
    --    normal={ r={7,13},a={8,14},t={9,15} },       : The numbers are data set indexes.  
    --    average={ r={19,31}, a={20,32}, t={21,33} }  : They could be high and low range data but we do not know here.
    --    }
    local spec = safe_value_3( get_machine_element(ei).data.spec, M_DATA, "spec", "normal", axis )
    local dom = safe_value_3( spec["normal"], M_DATA, "spec", "normal", axis )
    local ni = safe_value_3( dom[axis], M_DATA, "spec", "normal", axis )
    local mdi = 0
    local bws = 10000
    local lbw = bws
    local harmonics_match = nil

    -- matches format: (type, tag, ei, bin)
    --    type  - F = fundemental, H = harmonic, S = sideband
    --    tag   - Forcing Order tag
    --    ei    - element index
    --    bin   - bin position of peak in the data.  A real number and will be fractional.
    --    order - for type H only.  The order of the harmonic.
    mdi = 0
    for _,di in ipairs(ni) do
      local ds = machine.datasets[di]
      local m = find_tag_harmonic_in_matches( tag, ti, ds.matches )
      -- REVIEW: This is wrong.  We need to search for harmonics in high and low range data.
      --         search low range high res data first, then for the higher orders
      --         search high range data.
      if m~=nil then
        -- This if statement insures the results are taken from the
        -- highest resolution data.
        if ds.bw < lbw then
          lbw = ds.bw
          mdi = di
          harmonics_match = m
        end
      end
    end

    if mdi==0 then return {["found"]=false} end
    local ds = machine.datasets[mdi]
    local result = {}
    result["found"] = true
    --result["dsi"] = mdi
    local matches = {}
    for ord, tag_match in pairs(harmonics_match) do
      matches[ord] = { 
        ["match"] = tag_match, 
        ["order"] = ((tag_match.bin-1) * lbw / ds.speed), 
        ["value"] = ConvertSpectrum( g_internal_unit, GetUnitFromId(g_unit_id), ds_spline_value( ds, tag_match.bin ) ),
        ["mval"] = ConvertSpectrum( g_internal_unit, GetUnitFromId(g_unit_id), ds_spline_avg( ds, tag_match.bin ) ),
        ["freq"] = (tag_match.bin-1) * lbw,
        ["bin"] = tag_match.bin,
        ["dsi"] = mdi
      }
    end
    result["matches"] = matches
    return result
  end

------------------------------------------------------------------------------------
-- find_frequency_info
-- Input:
--    hz                : a forcing order
--    shaft_tag_index   : shaft index position of the component 
--    shaft_data_index  : shaft index position of the data to analyse
--    axis              : data axis
-- Input/Output:
--    result   : An intiialized table.  Will be reutned with the properties
--                found : always returned, true or false indication if the tag was found
--                match : the tag properties
--                dsi   : the data set index, use with machine.dataset
--                order : the position of the identified tag in orders of rotation
--                value : the amplitude of the spectrum at the order.  
--                        this will be a peak value as peak polishing was used to find the position.
-- Return:
--  Result table
--
  function find_frequency_info( hz, shaft_data_index, axis, peak_polish )
    peak_polish = peak_polish or true 
    local s  = safe_value_1( machine.components[g_shaft_number], M_SHAFT_INDEX, g_shaft_number )
    local ei = safe_value_1( s.map[shaft_data_index], M_SHAFT_DATA_INDEX, shaft_data_index )
    local spec = safe_value_3( get_machine_element(ei).data.spec, M_DATA, "spec", "normal", axis )
    local dom = safe_value_3( spec["normal"], M_DATA, "spec", "normal", axis )
    local ai = safe_value_3( dom[axis], M_DATA, "spec", "normal", axis )

    local mdi = 0
    local lbw = 100000

    for _,di in ipairs(ai) do
      local ds = machine.datasets[di]
      if ds.fmax > hz then
        if ds.bw < lbw then
          lbw = ds.bw
          mdi = di
        end
      end
    end  
    if mdi==0 then error( M_DATA_RANGE_HZ("spec", "normal", axis, hz) ) end

    local ds = machine.datasets[mdi]
    local bin = hz / ds.bw

    local found,pos = find_bin_in_peaks( bin, ds.peaks, g_peak_margin )
    if found==false then return {["found"]=false} end
    bin = ds.peaks[pos]
    if peak_polish then
      local lbin = bin - g_peak_margin
      local hbin = bin + g_peak_margin
      if lbin < 1 then lbin = 1 end
      if hbin > #ds.data then hbin = #ds.data end
      local val, index = findmaxima( lbin, hbin, bin, ds.data, ds.spline )
      return { ["found"]=true, ["freq"]=(index-1) * ds.bw, ["value"]=ConvertSpectrum( g_internal_unit, GetUnitFromId(g_unit_id), val ) }
    else
      local val = ConvertSpectrum( g_internal_unit, GetUnitFromId(g_unit_id), ds_spline_value(ds,bin) )
      return { ["found"]=true, ["freq"]=(bin-1) * ds.bw, ["value"]=val }
    end
  end
-----------------------------------------------------------------------------------------


-- analyze_by_tag
-- Input:
--    tag               : a forcing order tag
--    shaft_tag_index   : shaft index position of the tag
--    shaft_data_index  : shaft index position of the data
--    axis              : data axis (r,a, or t)
--    polish_avg_peak   : [optional] use to specify peak polish on average value
--    composite_shaft_index : [optional] use to indicate the composite shaft containing the tag
-- Return:
--    result  - A table with the following entries:
--                found : true or false.  If false no other entries in table
--                sval  : current spectra value
--                mval  : current spectra average value
--                aval  : average value
--                sord  : the position of the identified tag in orders of rotation in the signal
--                aord  : the position of the identified tag in orders of rotation in the average data
--                sfreq : the position of the identified tag in frequency in the signal
--                sdsi  : the data set index, use with machine.dataset
--                adsi  : the average data set index, use with machine.dataset
--                sbin  : the position of the identified tag in bins in the signal
--                abin  : the position of the identified tag in bins in the average
--                dif   : the differance (sval - aval)
--                pct   : percent difference between sval and aval
--                mdif  : the differance (sval - mval)
--                mpct  : percent difference between sval and mval
--
  function analyze_by_tag( tag, shaft_tag_index, shaft_data_index, axis, polish_avg_peak, composite_shaft_index )  
    -- REVIEW: polish_avg_peak is diminished.  Remove from calling signiture.
    local r1 = find_tag_info_cpl( tag, shaft_tag_index, shaft_data_index, axis, composite_shaft_index )
    if r1.found==false then return { ["found"]=false } end
    -- REVIEW: This is not deterministic.  If there is normal data but no average data
    --         AND the match is not found in the normal data then this call will succeed.
    --         BUT if a match is found, there is no average data to complete the analysis
    --         and this call will fail and call assert.
    safe_value_3( r1.aval, M_DATA, "spec", "average", axis )
    return r1
  end

-- analyze_harmonic_by_tag
-- Notes:
--    This function compares "normal" spectrum data to "average" data.  
--    It looks for the harmonics of the input tag.
-- Input:
--    tag               : a forcing order tag
--    shaft_tag_index   : shaft index position of the tag
--    shaft_data_index  : shaft index position of the data
--    axis              : data axis (r,a, or t)
-- Output:
--    result  - A table with the following entries:
--        found   : true or false.  If false no other entries in table.
--        orders  : the maximum harmonic order found, some lower orders may be missing
--        count   : the number of entries in the matches table
--        matches : a table with data about each harmonic match
--           Each entry in the matches table has the following entries:
--                sval  : current spectra value
--                mval  : current spectra moving average value
--                aval  : average value
--                sord  : the position of the identified tag in orders of rotation in the signal
--                aord  : the position of the identified tag in orders of rotation in the average data
--                sfreq : the position of the identified tag in frequency in the signal
--                sdsi  : the data set index, use with machine.dataset
--                adsi  : the average data set index, use with machine.dataset
--                sbin  : the position of the identified tag in bins in the signal
--                abin  : the position of the identified tag in bins in the average
--                dif   : the differance (sval - aval)
--                pct   : percent difference between sval and aval
--                mdif   : the differance (sval - mval)
--                mpct   : percent difference between sval and mval
--
  function analyze_harmonic_by_tag( tag, shaft_tag_index, shaft_data_index, axis, polish_avg_peak )  
    polish_avg_peak = polish_avg_peak or (true)
    local r1 = find_tag_harmonic_info( tag, shaft_tag_index, shaft_data_index, axis )
    if r1.found==false then return { ["found"]=false } end
    local result = {}
    result["found"] = true
    local ret_matches = {}
    local max_order = 0
    for ord, tm in pairs(r1.matches) do
      if ord > max_order then max_order = ord end
      local r2 = get_order_info( tm.order, shaft_data_index, "average", axis, polish_avg_peak )
      local s = tm.value
      local m = tm.mval
      local a = r2.value
      table.insert( ret_matches, { 
          ["order"] = ord,
          ["sval"] = s, 
          ["mval"] = m, 
          ["sord"] = tm.order, 
          ["sfreq"] = tm.freq,
          ["sbin"] = tm.bin,
          ["sdsi"] = tm.dsi,
          ["aval"] = a, 
          ["aord"] = r2.order,
          ["abin"] = r2.bin,
          ["adsi"] = r2.dsi,
          ["dif"] = (s-a), 
          ["pct"] = (s-a)/a,
          ["mdif"] = (s-m), 
          ["mpct"] = (s-m)/m
          } )
    end
    result["orders"] = max_order
    result["count"] = #ret_matches
    result["matches"] = ret_matches
    return result
  end


-- analyze_by_order
-- Notes:
--    This function compares "normal" spectrum data to "average" data.  
--    It analyses an order value.
-- Input:
--    order             : a forcing order
--    shaft_data_index  : shaft index position of the data
--    axis              : data axis [r | a | t]
--    no_error          : [optional] if true the function will not assert if there is not supporting data
--                        and will return nil.
-- Output:
--    result  - A table with the following entries:
--                found : true or false.  If false no other entries in table
--                sval  : current spectra value
--                aval  : average value
--                sord  : the position of the identified tag in orders of rotation in the signal
--                aord  : the position of the identified tag in orders of rotation in the average data
--                sfreq : the position of the identified tag in frequency in the signal
--                sdsi  : the data set index, use with machine.dataset
--                adsi  : the average data set index, use with machine.dataset
--                sbin  : the position of the identified tag in bins in the signal
--                abin  : the position of the identified tag in bins in the average
--                dif   : the differance (sval - aval)
--                pct   : percent difference between sval and aval
--
  function analyze_by_order( order, shaft_data_index, axis, polish_data_peak, polish_avg_peak, no_error )  
    polish_data_peak = polish_data_peak or (true)
    polish_avg_peak = polish_avg_peak or (true)
    local r1 = find_order_info( order, shaft_data_index, "normal", axis, no_error )

    if r1==nil then return nil end
    if r1.found==false then return r1 end

    local r2 = get_order_info( r1.order, shaft_data_index, "average", axis, polish_data_peak, no_error )

    local s = r1.value
    local m = r1.mval
    local bw = machine.datasets[r1.dsi].bw
    if r2==nil then
      return { ["found"]=true, 
        ["sval"] = s, ["sord"] = r1.order, ["sfreq"] = (r1.bin-1)*bw, ["sbin"] = r1.bin, ["sdsi"] = r1.dsi, 
        ['mval'] = m, ["mdif"] = (s-m), ["mpct"] = ((s-m)/m),
        ["aval"] = nil, ["aord"] = nil, ["abin"] = nil, ["adsi"] = nil, 
        ["dif"] = nil, ["pct"] = nil 
      }
    end
    local a = r2.value
    return { ["found"]=true, 
      ["sval"] = s, ["sord"] = r1.order, ["sfreq"] = (r1.bin-1)*bw, ["sbin"] = r1.bin, ["sdsi"] = r1.dsi, 
      ['mval'] = m, ["mdif"] = (s-m), ["mpct"] = ((s-m)/m),
      ["aval"] = a, ["aord"] = r2.order, ["abin"] = r2.bin, ["adsi"] = r2.dsi, 
      ["dif"] = (s-a), ["pct"] = ( (s-a)/a ) 
    }
  end
--
-- returns a list of harmonic tones and info same as analyze_harmonic_by_tag
  function get_harmonic_groups_from_cpl(element,brg,axis,strtag,remove_matches,sev_th,nr)
    remove_matches=remove_matches or false
    local bearing,alias,spdratio =z_get_brg_and_data_set_speed_ratio(element,brg)
    local pl=machine.elements[alias].data.spec.cpl.normal[axis]
    local shaftspeed=machine.elements[alias].speedratio
    sev_th=sev_th or 0
    nr=nr or 20
    local mia=0
    local no_error=true
    strtag=strtag or ""
    strtag=string.upper(strtag)  
    local harm_info={}
    local out={}
    local harms={}
    local cn=get_this_comp_number()
    local spratios=get_comp_speed_ratios()
    local compspeedrat=spratios[cn]
    local result={}
    if strtag=="" then
      for i,indx in pairs (pl.sorts.harm_severity) do
        local harm_indexes=pl.peaks[indx].harm_pk_index
        local severity=pl.peaks[indx].harm_severity
        if severity>=sev_th then
          for p,pk in ipairs (harm_indexes) do
            pk=tonumber(pk)
            local so=pl.peaks[pk].sord
            local sv=ConvertSpectrum( g_internal_unit, GetUnitFromId(g_unit_id), pl.peaks[pk].sval)
            local  mv=ConvertSpectrum( g_internal_unit, GetUnitFromId(g_unit_id), pl.peaks[pk].mval)
            local flag=pl.peaks[pk].flags or '-'
            if not((string.match(flag,'m')~=nil or string.match(flag,'l')~=nil or string.match(flag,'f')~=nil or string.match(flag,'x')~=nil ) and  remove_matches) or not(remove_matches) then  
              if pl.peaks[pk].aval~=nil then          
                local av=ConvertSpectrum( g_internal_unit, GetUnitFromId(g_unit_id), pl.peaks[pk].aval)
                table.insert(harm_info,{pk_index=pk,sord=so, sval=sv, dif=sv-av, aval=av, mval=mv, mdif=sv-mv, sbin=pl.peaks[pk].sbin,sfreq=pl.peaks[pk].sfreq,mpct=pl.peaks[pk].mpct,pct=pl.peaks[pk].pct})
              else
                table.insert(harm_info,{sord=so, sval=sv, mval=mv, mdif=sv-mv, sbin=pl.peaks[pk].sbin,sfreq=pl.peaks[pk].sfreq,mpct=pl.peaks[pk].mpct})
              end
            end
          end  -- for p,pk
          table.insert(harms,{harm_severity=severity or 0,harm_sord=pl.peaks[tonumber(harm_indexes[1])].sord,harm_sfreq=pl.peaks[tonumber(harm_indexes[1])].sfreq,harm_pk_index=indx ,num_harmonics=#harm_indexes, harm_fundamental_pk_matches=pl.peaks[tonumber(harm_indexes[1])].matches, harmonic_info=harm_info})
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
      for i,pk in pairs (pl.peaks) do
        local x,frac=math.modf(math.abs(pk.sfreq/taghz))
        x=x+round(frac)
        local peakistag = (frac<.005 or 1-frac<.0001) and x==1 
        if peakistag then
          if #pk.harm_pk_index>0 then
            for h,harm in ipairs (pk.harm_pk_index) do
              harm=tonumber(harm)
              local order=round(pl.peaks[harm].sfreq/taghz)
              if order > max_order then max_order = order end
              local s =ConvertSpectrum( g_internal_unit, GetUnitFromId(g_unit_id),  pl.peaks[harm].sval)
              local m =ConvertSpectrum( g_internal_unit, GetUnitFromId(g_unit_id), pl.peaks[harm].mval)
              if pl.peaks[harm].aval ~= nil then
              local a =ConvertSpectrum( g_internal_unit, GetUnitFromId(g_unit_id), pl.peaks[harm].aval)
                table.insert( ret_matches, { 
                    ["order"] =order,
                    ["sval"] = s, 
                    ["mval"] = m, 
                    ["sord"] = pl.peaks[harm].sord, 
                    ["sfreq"] = pl.peaks[harm].sfreq,
                    ["sbin"] = pl.peaks[harm].sbin,
                    ["sdsi"] = pl.peaks[harm].sdsi,
                    ["aval"] = a, 
                    ["aord"] = pl.peaks[harm].aord,
                    ["abin"] = pl.peaks[harm].abin,
                    ["adsi"] = pl.peaks[harm].adsi,
                    ["dif"] = (s-a), 
                    ["pct"] = pl.peaks[harm].pct,
                    ["mdif"] = (s-m), 
                    ["mpct"] = pl.peaks[harm].mpct
                    } )
              else
                table.insert( ret_matches, { 
                    ["order"] =order,
                    ["sval"] = s, 
                    ["mval"] = m, 
                    ["sord"] = pl.peaks[harm].sord, 
                    ["sfreq"] = pl.peaks[harm].sfreq,
                    ["sbin"] = pl.peaks[harm].sbin,
                    ["sdsi"] = pl.peaks[harm].sdsi,
                    ["mdif"] = (s-m), 
                    ["mpct"] = pl.peaks[harm].mpct
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
        local speed=compspeedrat/shaftspeed
        local harms=pl.shaftharms[strtag]
        local max_order = 0 
        --matchfound=true
        local ret_matches,result = {},{}
        if harms~=nil then
          if #harms>0 then 
            for h,harm in ipairs(harms) do 
              local order=round(pl.peaks[tonumber(harm)].sord/speed)
              if order>=1 then
                if order> max_order then max_order = order end
                local s =ConvertSpectrum( g_internal_unit, GetUnitFromId(g_unit_id), pl.peaks[tonumber(harm)].sval)
                local m =ConvertSpectrum( g_internal_unit, GetUnitFromId(g_unit_id), pl.peaks[tonumber(harm)].mval)
                if  pl.peaks[tonumber(harm)].aval~=nil then
                local a =ConvertSpectrum( g_internal_unit, GetUnitFromId(g_unit_id), pl.peaks[tonumber(harm)].aval)
                  table.insert( ret_matches, { 
                      ["order"] = order,
                      ["sval"] = s, 
                      ["mval"] = m, 
                      ["sord"] = pl.peaks[tonumber(harm)].sord, 
                      ["sfreq"] = pl.peaks[tonumber(harm)].sfreq,
                      ["sbin"] = pl.peaks[tonumber(harm)].sbin,
                      ["sdsi"] = pl.peaks[tonumber(harm)].sdsi,
                      ["aval"] = a, 
                      ["aord"] = pl.peaks[tonumber(harm)].aord,
                      ["abin"] = pl.peaks[tonumber(harm)].abin,
                      ["adsi"] = pl.peaks[tonumber(harm)].adsi,
                      ["dif"] = (s-a), 
                      ["pct"] = pl.peaks[tonumber(harm)].pct,
                      ["mdif"] = (s-m), 
                      ["mpct"] = pl.peaks[tonumber(harm)].mpct,
                      ['matches']=pl.peaks[tonumber(harm)].matches
                      } )
                else 
                  table.insert( ret_matches, { 
                      ["order"] = order,
                      ["sval"] = s, 
                      ["mval"] = m, 
                      ["sord"] = pl.peaks[tonumber(harm)].sord, 
                      ["sfreq"] = pl.peaks[tonumber(harm)].sfreq,
                      ["sbin"] = pl.peaks[tonumber(harm)].sbin,
                      ["sdsi"] = pl.peaks[tonumber(harm)].sdsi,
                      ["mdif"] = (s-m), 
                      ["mpct"] = pl.peaks[tonumber(harm)].mpct,
                      ['matches']=pl.peaks[tonumber(harm)].matches
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
      end

    elseif strtag=='1X' then
      local max_order = 0 
      local ret_matches,result = {},{}        
      local speed=compspeedrat/shaftspeed
      if pl.harmonics~=nil and pl.harmonics[tostring(round(speed,3))]~= nil then    
        local harms=pl.harmonics[tostring(round(speed,3))]
        if harms~=nil then
          if #harms>0 then 
            for h,harm in ipairs(harms) do 
              local order=round(pl.peaks[tonumber(harm)].sord/speed)
              if order>=1 then
                if order> max_order then max_order = order end
                local s = ConvertSpectrum( g_internal_unit, GetUnitFromId(g_unit_id),pl.peaks[tonumber(harm)].sval)
                local m = ConvertSpectrum( g_internal_unit, GetUnitFromId(g_unit_id),pl.peaks[tonumber(harm)].mval)
                if pl.peaks[tonumber(harm)].aval~=nil then
                  local a = ConvertSpectrum( g_internal_unit, GetUnitFromId(g_unit_id),pl.peaks[tonumber(harm)].aval)
                  table.insert( ret_matches, { 
                      ["order"] = order,
                      ["sval"] = s, 
                      ["mval"] = m, 
                      ["sord"] = pl.peaks[tonumber(harm)].sord, 
                      ["sfreq"] = pl.peaks[tonumber(harm)].sfreq,
                      ["sbin"] = pl.peaks[tonumber(harm)].sbin,
                      ["sdsi"] = pl.peaks[tonumber(harm)].sdsi,
                      ["aval"] = a, 
                      ["aord"] = pl.peaks[tonumber(harm)].aord,
                      ["abin"] = pl.peaks[tonumber(harm)].abin,
                      ["adsi"] = pl.peaks[tonumber(harm)].adsi,
                      ["dif"] = (s-a), 
                      ["pct"] = pl.peaks[tonumber(harm)].pct,
                      ["mdif"] = (s-m), 
                      ["mpct"] = pl.peaks[tonumber(harm)].mpct,
                      ['matches']=pl.peaks[tonumber(harm)].matches
                      } )
                else
                  table.insert( ret_matches, { 
                      ["order"] = order,
                      ["sval"] = s, 
                      ["mval"] = m, 
                      ["sord"] = pl.peaks[tonumber(harm)].sord, 
                      ["sfreq"] = pl.peaks[tonumber(harm)].sfreq,
                      ["sbin"] = pl.peaks[tonumber(harm)].sbin,
                      ["sdsi"] = pl.peaks[tonumber(harm)].sdsi,
                      ["mdif"] = (s-m), 
                      ["mpct"] = pl.peaks[tonumber(harm)].mpct,
                      ['matches']=pl.peaks[tonumber(harm)].matches
                      } ) 
                end 
              end -- if order>1
            end --- for h,harm
          end -- if #harms
        end
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
          for i,pk in pairs (pl.peaks) do
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
                      local order=round(pl.peaks[tonumber(harm)].sord/pl.peaks[i].sord)
                      if order>=1 then
                        if order> max_order then max_order = order end
                        local s = ConvertSpectrum( g_internal_unit, GetUnitFromId(g_unit_id),pl.peaks[tonumber(harm)].sval)
                        local m = ConvertSpectrum( g_internal_unit, GetUnitFromId(g_unit_id),pl.peaks[tonumber(harm)].mval)
                      if pl.peaks[tonumber(harm)].aval~=nil then 
                        local a = ConvertSpectrum( g_internal_unit, GetUnitFromId(g_unit_id),pl.peaks[tonumber(harm)].aval)
                          table.insert( ret_matches, { 
                              ["order"] = order,
                              ["sval"] = s, 
                              ["mval"] = m, 
                              ["sord"] = pl.peaks[tonumber(harm)].sord, 
                              ["sfreq"] = pl.peaks[tonumber(harm)].sfreq,
                              ["sbin"] = pl.peaks[tonumber(harm)].sbin,
                              ["sdsi"] = pl.peaks[tonumber(harm)].sdsi,
                              ["aval"] = a, 
                              ["aord"] = pl.peaks[tonumber(harm)].aord,
                              ["abin"] = pl.peaks[tonumber(harm)].abin,
                              ["adsi"] = pl.peaks[tonumber(harm)].adsi,
                              ["dif"] = (s-a), 
                              ["pct"] = pl.peaks[tonumber(harm)].pct,
                              ["mdif"] = (s-m), 
                            ["mpct"] = pl.peaks[tonumber(harm)].mpct,
                      ['matches']=pl.peaks[tonumber(harm)].matches
                              } )
                        else
                          table.insert( ret_matches, { 
                              ["order"] = order,
                              ["sval"] = s, 
                              ["mval"] = m, 
                              ["sord"] = pl.peaks[tonumber(harm)].sord, 
                              ["sfreq"] = pl.peaks[tonumber(harm)].sfreq,
                              ["sbin"] = pl.peaks[tonumber(harm)].sbin,
                              ["sdsi"] = pl.peaks[tonumber(harm)].sdsi,
                              ["mdif"] = (s-m), 
                            ["mpct"] = pl.peaks[tonumber(harm)].mpct,
                      ['matches']=pl.peaks[tonumber(harm)].matches
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
      --end --if tonumber(strtag)~=nil
      end  -- tag found
    end -- if strtag==""
    return {found=false}
  end
  
  --====================================
function get_harmonics( shaft_data_index, axis, remove_matches, severity_threshold )  
  remove_matches=remove_matches or false
  severity_threshold=severity_threshold or 0
  local pl = safe_spec_cpl( get_element(shaft_data_index), "normal", axis )
  local harm_info={}
  local harms={}

  for _,indx in pairs (pl.sorts.harm_severity) do
    local harm_indexes=pl.peaks[indx].harm_pk_index
    local severity=pl.peaks[indx].harm_severity
    if severity>=severity_threshold then
      for _,pk in ipairs (harm_indexes) do
        local so=pl.peaks[pk].sord
          local sv=ConvertSpectrum( g_internal_unit, GetUnitFromId(g_unit_id),pl.peaks[pk].sval)
          local  mv=ConvertSpectrum( g_internal_unit, GetUnitFromId(g_unit_id),pl.peaks[pk].mval)
        local flag=pl.peaks[pk].flags or '-'
        if remove_matches and string.match(flag,'m')==nil and string.match(flag,'l')==nil and string.match(flag,'f')==nil and string.match(flag,'x')==nil then  
          local av = nil
          if pl.peaks[pk].aval~=nil then
            av=ConvertSpectrum( g_internal_unit, GetUnitFromId(g_unit_id), pl.peaks[pk].aval)
          end
          local dv = nil
          if av then dv = sv-av end
          table.insert(harm_info,
                      { pk_index=pk,
                        sord=so, 
                        sval=sv, 
                        dif= dv, -- could be nil 
                        aval=av, -- could be nil
                pct=pl.peaks[pk].pct, -- could be nil
                mval=mv, 
                mdif=sv-mv,
                mpct=-pl.peaks[pk].mpct,
                        sbin=pl.peaks[pk].sbin,
                        sfreq=pl.peaks[pk].sfreq
                      })
        end
      end  -- for p,pk
      table.insert( harms,
                    { harm_severity=severity or 0, -- REVIEW: Why?  severity is gauranteed to have value
                      harm_sord=pl.peaks[tonumber(harm_indexes[1])].sord,
                      harm_sfreq=pl.peaks[tonumber(harm_indexes[1])].sfreq,
                      harm_pk_index=indx ,
                      num_harmonics=#harm_indexes, 
                      harm_fundamental_pk_matches=pl.peaks[tonumber(harm_indexes[1])].matches, 
                      harmonic_info=harm_info
                    })
      harm_info={}
    end  -- if severity>=severity_threshold
  end  -- for i,indx
  return {found=true, harmonics=harms}
end
  
  
-- analyze_harmonic_by_tag_cpl
-- Notes:
--    This function compares "normal" spectrum data to "average" data.  
--    It looks for the harmonics of the input tag.
-- Input:
--    tag               : a forcing order tag
--    shaft_tag_index   : shaft index position of the tag
--    shaft_data_index  : shaft index position of the data
--    axis              : data axis (r,a, or t)
-- Output:
--    result  - A table with the following entries:
--        found   : true or false.  If false no other entries in table.
--        orders  : the maximum harmonic order found, some lower orders may be missing
--        count   : the number of entries in the matches table
--        matches : a table with data about each harmonic match
--           Each entry in the matches table has the following entries:
--                sval  : current spectra value
--                mval  : current spectra moving average value
--                aval  : average value
--                sord  : the position of the identified tag in orders of rotation in the signal
--                aord  : the position of the identified tag in orders of rotation in the average data
--                sfreq : the position of the identified tag in frequency in the signal
--                sdsi  : the data set index, use with machine.dataset
--                adsi  : the average data set index, use with machine.dataset
--                sbin  : the position of the identified tag in bins in the signal
--                abin  : the position of the identified tag in bins in the average
--                dif   : the differance (sval - aval)
--                pct   : percent difference between sval and aval
--                mdif   : the differance (sval - mval)
--                mpct   : percent difference between sval and mval
--
function analyze_harmonic_by_tag_cpl( tag, shaft_tag_index, shaft_data_index, axis )  
  local element = shaft_tag_index
  local brg = shaft_data_index
  local strtag=string.upper(tag)
  local ele = get_element(brg)
  local pl = safe_spec_cpl( ele, "normal", axis )
  local shaftspeed=ele.speedratio
  --local harm_info={}
  local harms={}
  --local cn=get_this_comp_number()
  --local spratios=get_comp_speed_ratios()
  --local compspeedrat=spratios[cn]
  local result={}

  local ti=check_get_order_tag_index(strtag,shaft_tag_index,nil,true)   
  if not ti then
    return {found=false}
  end

  local ret_matches = {}
  local max_order = 0      
  for i,pk in pairs (pl.peaks) do
    local mtch = find_tag_in_matches( strtag, ti, pk.matches )
    if mtch then
      for h,harm in ipairs(pk.harm_pk_index) do 
        local order=round(pl.peaks[tonumber(harm)].sord/pl.peaks[i].sord)
        if order>=1 then
          if order> max_order then max_order = order end
          local sr = pl.peaks[harm].sval
          local mr = pl.peaks[harm].mval
          local s = ConvertSpectrum( g_internal_unit, GetUnitFromId(g_unit_id), sr )
          local m = ConvertSpectrum( g_internal_unit, GetUnitFromId(g_unit_id), mr )
            local ar = pl.peaks[harm].aval
            if ar~=nil then
            local a = ConvertSpectrum( g_internal_unit, GetUnitFromId(g_unit_id), ar )
            table.insert( ret_matches, { 
                ["order"] = order,
                ["sval"]  = s, 
                ["mval"]  = m, 
                ["sord"]  = pl.peaks[harm].sord, 
                ["sfreq"] = pl.peaks[harm].sfreq,
                ["sbin"]  = pl.peaks[harm].sbin,
                ["sdsi"]  = pl.peaks[harm].sdsi,
                ["aval"]  = a, 
                ["aord"]  = pl.peaks[harm].aord,
                ["abin"]  = pl.peaks[harm].abin,
                ["adsi"]  = pl.peaks[harm].adsi,
                ["dif"]   = (s-a), 
                ["pct"]   = (sr-ar)/ar,
                ["mdif"]  = (s-m), 
                ["mpct"]  = (sr-mr)/mr,
                  ['matches']=pl.peaks[harm].matches,
                  ['flags']=pl.peaks[harm].flags
                } )
          else
            table.insert( ret_matches, { 
                ["order"] = order,
                ["sval"]  = s, 
                ["mval"]  = m, 
                ["sord"]  = pl.peaks[harm].sord, 
                ["sfreq"] = pl.peaks[harm].sfreq,
                ["sbin"]  = pl.peaks[harm].sbin,
                ["sdsi"]  = pl.peaks[harm].sdsi,
                ["mdif"]  = (s-m), 
                ["mpct"]  = (s-m)/m,
                ['matches']=pl.peaks[harm].matches,
                ['flags']=pl.peaks[harm].flags
                } ) 
          end 
        end -- if order>1
      end --- for h,harm
        break
    end -- if mtch
  end -- for i,pk 

  result["orders"] = max_order
  result["count"] = #ret_matches
  result["matches"] = ret_matches
  result['found']=true
  return result
end
  
  --====================================================================
-- analyze_sidebands_by_tag_cpl
-- Notes:
--    This function compares "normal" spectrum data to "average" data.  
--    It looks for the shaftrate or LF sidebands of the input tag.
-- Input:
--    tag               : a forcing order tag
--    sbtag             : 1X or 2XLF
--    shaft_tag_index   : shaft index position of the tag
--    shaft_data_index  : shaft index position of the data
--    axis              : data axis (r,a, or t)
-- Output:
--    result  - A table with the following entries:
--        found   : true or false.  If false no other entries in table.
--        orders  : the maximum harmonic order found, some lower orders may be missing
--        count   : the number of entries in the matches table
--        matches : a table with data about each harmonic match
--           Each entry in the matches table has the following entries:
--                sval  : current spectra value
--                mval  : current spectra moving average value
--                aval  : average value
--                sord  : the position of the identified tag in orders of rotation in the signal
--                aord  : the position of the identified tag in orders of rotation in the average data
--                sfreq : the position of the identified tag in frequency in the signal
--                sdsi  : the data set index, use with machine.dataset
--                adsi  : the average data set index, use with machine.dataset
--                sbin  : the position of the identified tag in bins in the signal
--                abin  : the position of the identified tag in bins in the average
--                dif   : the differance (sval - aval)
--                pct   : percent difference between sval and aval
--                mdif   : the differance (sval - mval)
--                mpct   : percent difference between sval and mval
--                sidebands:   An output table with the above information for 1x or 2XLF sidebands of this peak
--
  function analyze_sidebands_by_tag_cpl( tag, sbtag,shaft_tag_index, shaft_data_index, axis ) 
    local element = shaft_tag_index
    local brg = shaft_data_index
    local strtag=string.upper(tag)
    local ele = get_element(brg)
    local pl = safe_spec_cpl( ele, "normal", axis )
    local shaftspeed=ele.speedratio
    local harms={}
    local result={}
    local sbt=sbtag or '1X'
    local sideord=1
    if sbt=='1X' then
      sbt=round(1/shaftspeed,3)..'x'
      sideord=1/shaftspeed
    elseif sbt=='2XLF' then
      sideord=(2*machine.linef)/pl.shaftspeed.ave
    end
    local ti=check_get_order_tag_index(strtag,shaft_tag_index,nil,true)   
    if not ti then
      return {found=false}
    end
    local ret_matches = {}
    local max_order = 0 
    for i,pk in pairs (pl.peaks) do
      local mtch = find_tag_in_matches( strtag, ti, pk.matches )
      if mtch then
        for h,harm in ipairs(pk.harm_pk_index) do 
          local sb_matches={}

          if pl.peaks[harm].sidebands~=nil and pl.peaks[harm].sidebands[sbt]~=nil then
            for s, sb in ipairs(pl.peaks[harm].sidebands[sbt]) do 
              local order1=round(pl.peaks[sb].sord/pl.peaks[harm].sord)
              local sideband=round((pl.peaks[sb].sord-pl.peaks[harm].sord)/sideord)
              if sb ~= harm then
                local sr = pl.peaks[sb].sval
                local mr = pl.peaks[sb].mval
                local s = ConvertSpectrum( g_internal_unit, GetUnitFromId(g_unit_id), sr )
                local m = ConvertSpectrum( g_internal_unit, GetUnitFromId(g_unit_id), mr )
                local ar = pl.peaks[sb].aval
                if ar~=nil then
                  local a = ConvertSpectrum( g_internal_unit, GetUnitFromId(g_unit_id), ar )
                  table.insert( sb_matches, { 
                      ["order"] = order1,
                      ['sidebandnumber']=sideband,
                      ["sval"]  = s, 
                      ["mval"]  = m, 
                      ["sord"]  = pl.peaks[sb].sord, 
                      ["sfreq"] = pl.peaks[sb].sfreq,
                      ["sbin"]  = pl.peaks[sb].sbin,
                      ["sdsi"]  = pl.peaks[sb].sdsi,
                      ["aval"]  = a, 
                      ["aord"]  = pl.peaks[sb].aord,
                      ["abin"]  = pl.peaks[sb].abin,
                      ["adsi"]  = pl.peaks[sb].adsi,
                      ["dif"]   = (s-a), 
                      ["pct"]   = (sr-ar)/ar,
                      ["mdif"]  = (s-m), 
                      ["mpct"]  = (sr-mr)/mr,
                      ['matches']=pl.peaks[sb].matches,
                      ['flags']=pl.peaks[sb].flags
                      } )
                else
                  table.insert( sb_matches, { 
                      ["order"] = order1,
                      ['sidebandnumber']=sideband,
                      ["sval"]  = s, 
                      ["mval"]  = m, 
                      ["sord"]  = pl.peaks[sb].sord, 
                      ["sfreq"] = pl.peaks[sb].sfreq,
                      ["sbin"]  = pl.peaks[sb].sbin,
                      ["sdsi"]  = pl.peaks[sb].sdsi,
                      ["mdif"]  = (s-m), 
                      ["mpct"]  = (s-m)/m,
                      ['matches']=pl.peaks[sb].matches,
                      ['flags']=pl.peaks[sb].flags
                      } ) 
                end  
              end  -- order>= 1
            end  -- ipair(.sidebands)
          end -- .sidebands~=nil
          local order=round(pl.peaks[tonumber(harm)].sord/pl.peaks[i].sord)
          -- if order>=1 then
          if order> max_order then max_order = order end
          local sr = pl.peaks[harm].sval
          local mr = pl.peaks[harm].mval
          local s = ConvertSpectrum( g_internal_unit, GetUnitFromId(g_unit_id), sr )
          local m = ConvertSpectrum( g_internal_unit, GetUnitFromId(g_unit_id), mr )
          local ar = pl.peaks[harm].aval
          if ar~=nil then
            local a = ConvertSpectrum( g_internal_unit, GetUnitFromId(g_unit_id), ar )
            table.insert( ret_matches, { 
                ["order"] = order,
                ["sval"]  = s, 
                ["mval"]  = m, 
                ["sord"]  = pl.peaks[harm].sord, 
                ["sfreq"] = pl.peaks[harm].sfreq,
                ["sbin"]  = pl.peaks[harm].sbin,
                ["sdsi"]  = pl.peaks[harm].sdsi,
                ["aval"]  = a, 
                ["aord"]  = pl.peaks[harm].aord,
                ["abin"]  = pl.peaks[harm].abin,
                ["adsi"]  = pl.peaks[harm].adsi,
                ["dif"]   = (s-a), 
                ["pct"]   = (sr-ar)/ar,
                ["mdif"]  = (s-m), 
                ["mpct"]  = (sr-mr)/mr,
                ['matches']=pl.peaks[harm].matches,
                ['flags']=pl.peaks[harm].flags,
                ['sidebands']=sb_matches
                } )
          else
            table.insert( ret_matches, { 
                ["order"] = order,
                ["sval"]  = s, 
                ["mval"]  = m, 
                ["sord"]  = pl.peaks[harm].sord, 
                ["sfreq"] = pl.peaks[harm].sfreq,
                ["sbin"]  = pl.peaks[harm].sbin,
                ["sdsi"]  = pl.peaks[harm].sdsi,
                ["mdif"]  = (s-m), 
                ["mpct"]  = (s-m)/m,
                ['matches']=pl.peaks[harm].matches,
                ['flags']=pl.peaks[harm].flags,
                ['sidebands']=sb_matches
                } ) 
          end 
          --end -- if order>1
        end --- for h,harm
        break
      end -- if mtch
    end -- for i,pk 
    result["shaftspeed"] = shaftspeed
    result["orders"] = max_order
    result["count"] = #ret_matches
    result["matches"] = ret_matches
    result['found']=true
    return result
  end
--

--====================================================================
-- this function evaluates a tone to determine is it is likely cross talks from another source
  function cross_talk(element,brg,axis,pk_index,key,ct_limit)
    ct_limit=ct_limit or 12
    if true then
      local mi = safe_value_1( machine.components[g_shaft_number].map[brg], M_SHAFT_DATA_INDEX, brg )
      local alias = get_machine_element_alias(mi)
      local pk=machine.elements[alias].data.spec.cpl.normal[axis].peaks[pk_index]
      if pk.elsewhere[key]==nil then return false,0  end
      for _,ax in ipairs(pk.elsewhere[key]) do
        if ax.mi~=alias and ax.axis==axis and ConvertSpectrum( g_internal_unit, GetUnitFromId(g_unit_id),pk.sval)<=ConvertSpectrum( g_internal_unit, GetUnitFromId(g_unit_id),ax.sval)-ct_limit then return true,ax.mi end
      end
    end
    return false,0
  end

-- This function return a lists of tones  with significant sideband groups (1X for all shafts and LF) sorted sb severity
  function get_sideband_groups_from_cpl(element,brg,axis,remove_matches,sev_th,nr)
    local mi = safe_value_1( machine.components[g_shaft_number].map[brg], M_SHAFT_DATA_INDEX, brg )
    local alias = get_machine_element_alias(mi)
    local pl=machine.elements[alias].data.spec.cpl.normal[axis]
    local shaftspeed=machine.elements[alias].speedratio
    remove_matches=remove_matches or false
    sev_th=sev_th or 0
    nr=nr or 10
    local no_error=true
    local sb_info={}
    local out={}
    local sbfs={}
    local maxampindex
    local maxamp
    for fr,grps in pairs (pl.sorts.sb_severity) do
      local  sb_groups={}
      for _,indx in ipairs(grps) do
        indx=tonumber(indx)
        local sb_indexes={}
        local severity=0
        local sbvf =pl.peaks[indx].sb_severity[fr]
        if sbvf~=nil then severity=sbvf end
        if severity>0 then 
          sb_indexes =pl.peaks[indx].sidebands[fr]
        end
        local nsbs=#sb_indexes
        sb_info={}
        maxampindex,maxamp=0,0
        for _,sbi in ipairs (sb_indexes) do
          sbi=tonumber(sbi)
          local so=pl.peaks[sbi].sord
          local sv=ConvertSpectrum( g_internal_unit, GetUnitFromId(g_unit_id),pl.peaks[sbi].sval)
          if sv>maxamp then
            maxamp=sv
            maxampindex=sbi
          end
        local av,mv
        if pl.peaks[sbi].aval~=nil then
          av=ConvertSpectrum( g_internal_unit, GetUnitFromId(g_unit_id),pl.peaks[sbi].aval)
        end
        mv=ConvertSpectrum( g_internal_unit, GetUnitFromId(g_unit_id),pl.peaks[sbi].mval)
          local flag=pl.peaks[sbi].flags or '-'
          if not((string.match(flag,'m')~=nil or string.match(flag,'l')~=nil or string.match(flag,'f')~=nil or string.match(flag,'x')~=nil ) and  remove_matches) then   
            if av~=nil then
              table.insert(sb_info,{sord=so, sval=sv, dif=sv-av, aval=av, mval=mv, mdif=sv-mv, sbin=pl.peaks[sbi].sbin, pk_index=sbi,sfreq=pl.peaks[sbi].sfreq,pct=pl.peaks[sbi].pct,mpct=pl.peaks[sbi].mpct})
            end
          end
        end  --  for _,sbi
        local flag=pl.peaks[maxampindex].flags or '-'
        if not((string.match(flag,'m')~=nil or string.match(flag,'l')~=nil or string.match(flag,'f')~=nil or string.match(flag,'x')~=nil) and  remove_matches) then 
          if severity>=sev_th then table.insert(sb_groups,{sb_severity=severity or 0, num_sidebands=nsbs, sideband_info=sb_info,first_pk_index=maxampindex ,first_pk_sord=pl.peaks[maxampindex].sord,first_pk_sfreq=pl.peaks[maxampindex].sfreq}) end
        end
      end  --  for _,indx
      sbfs[fr]=sb_groups
    end  -- for fr,grps
    return {found=true, sidebands=sbfs}
  end

-- this function returns a list of tones sorted by amplitude that are not flagged as a multiple of shaft rate or LF, part of a signiticant harmonic of sideband series, or a match 
  function get_usual_tones_from_cpl(element,brg,axis,sev_th,nr,sval_th)
    local mi = safe_value_1( machine.components[g_shaft_number].map[brg], M_SHAFT_DATA_INDEX, brg )
    local alias = get_machine_element_alias(mi)
    local pl=machine.elements[alias].data.spec.cpl.normal[axis]
    local shaftspeed=machine.elements[alias].speedratio
    --local pl={}
    sval_th=sval_th or 70
    sev_th=sev_th or 108
    nr=nr or 10
    local mia=0
    local no_error=true
    local cn=get_this_comp_number()
    local dsmi=alias
    local umtones={}
    for i,indx in pairs (pl.sorts.sval) do
      local sv=ConvertSpectrum( g_internal_unit, GetUnitFromId(g_unit_id),pl.peaks[indx].sval)
      local flag=pl.peaks[indx].flags or '-'
      local sbg=pl.peaks[indx].sidebands
      local lfsb=false
      for g,gr in ipairs (sbg) do
        if gr['2XLF']~=nil then lfsb=true end
      end
      if sv>=sval_th then
        if string.match(flag,'m')==nil and string.match(flag,'s')==nil and string.match(flag,'h')==nil and string.match(flag,'l')==nil and string.match(flag,'f')==nil and string.match(flag,'x')==nil and not(lfsb) then
          local so=pl.peaks[indx].sord
          local pkis1x,x,rmdr =z_is_a_multiple(1,so,.005)
          pkis1x=pkis1x and x==1
          local  mv=ConvertSpectrum( g_internal_unit, GetUnitFromId(g_unit_id),pl.peaks[indx].mval)
          if pl.peaks[indx].aval~=nil then          
            local av=ConvertSpectrum( g_internal_unit, GetUnitFromId(g_unit_id),pl.peaks[indx].aval)
            local dif=sv-av
            if  dif>3 then 
              table.insert(umtones,{pk_index=indx,sord=so, sval=sv, dif=dif, aval=av, mval=mv, mdif=sv-mv, sbin=pl.peaks[indx].sbin,sfreq=pl.peaks[indx].sfreq,pct=pl.peaks[indx].pct,mpct=pl.peaks[indx].mpct})
            end
          else
            table.insert(umtones,{sord=so, sval=sv, mval=mv, mdif=sv-mv, sbin=pl.peaks[indx].sbin,sfreq=pl.peaks[indx].sfreq,mpct=pl.peaks[indx].mpct})
          end
        end
      end  -- if sv>=sv_th
    end  -- for i,indx
    return {found=true,tones=umtones}
    --return {found=false}
  end
--
-- function elsewhere looks for the current peak on other axes and pickups, returns peaks matches with dif and sval
  function elsewhere(mi,axis,index,value,key)
    local ord=key=='sord'
    local ew={}
    if ord then value=value/machine.elements[mi].speedratio end
    local cnt=0    
    local svalue={}
    for ei,e in ipairs(machine.elements) do 
      if e.data~=nil and e.data.spec~=nil and e.data.spec.cpl~=nil then
        for typ,axes in pairs(e.data.spec.cpl) do
          if typ=='normal' then
            for ax, pl in pairs(axes) do
              if (mi==ei and ax~=axis) or mi~=ei then
                local starti=1
                local delta=.1
                if value>=1 or #pl.peaks>10 then starti=binsearchpl(pl,value,delta,key,e.speedratio) end
                for pi=starti,#pl.peaks,1 do
                  local pk=pl.peaks[pi]
                  local pkval=pk[key]
                  if ord then pkval=pkval/e.speedratio end
                  if pkval>(1+delta)*value then break end
                  if pkval>(1-delta)*value then
                    local nexto=false
                    local isvalue,mo,ro
                    isvalue,mo,ro=is_a_multiple(value,pkval,.01)
                    if pi+1<=#pl.peaks then
                      local isvaluen,mon,ron,npkval
                      npkval=pl.peaks[pi+1][key]
                      if ord then npkval=npkval/e.speedratio end
                      isvaluen,mon,ron=is_a_multiple(value,npkval,.01)
                      nexto=isvaluen and mon==1 and ron<ro 
                    end
                    if isvalue and mo==1 and not(nexto) then          
                      cnt=cnt+1  
                      svalue[cnt]={}
                      svalue[cnt]['axis']=ax
                      svalue[cnt]['mi']=ei
                      svalue[cnt]['pk_index']=pi
                      svalue[cnt]['sval']=pk.sval
                      break
                    end
                  end
                end 
                --if #svalue>0 then
                --if ew[key]~=nil then ew[key]={} end
                -- ew[key]=svalue
                --end
                end
              end
            end
          end
        end
      end
    --return ew
    return svalue
  end 

-- binary search for keys (sord or sfreq) in .peaks of peaklist returns an index delta percent below target
  function binsearchpl(pl,target,delta,key,speedratio)
    speedratio=speedratio or 1
    local low,hi,mid=1,#pl.peaks,0
    while low<=hi do
      mid=math.floor((low+hi)/2)
      local value=pl.peaks[mid][key]
      if key=='sord' then value=value/speedratio end
      if value<=target*(1-delta) then
        low=mid+1
      else
        hi=mid-1
      end
    end
    low=low-1
    if low==0 then low=1 end
    return low
  end
