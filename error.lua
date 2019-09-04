-- error.lua    Rev 4     7/13/19
-------------------------------------------------------------------------
--     Error Codes
E_SHAFT_TAG_INDEX   = 1
E_SHAFT_DATA_INDEX  = 2
E_ORDER_TAG         = 3
E_ATTR_TAG          = 4
E_ELE_INDEX         = 5
E_CORRUPT           = 6
E_DATA              = 7
E_DATA_RANGE        = 8
E_SHAFT_INDEX       = 9
E_RULE_RETURN       = 10
E_PARAMETER         = 11
E_VALUE_NIL         = 12
E_COMPOSITE_INDEX   = 13
-------------------------------------------------------------------------

function traceback(start_level)
  local level = start_level
  local line={}
  while true do
    local info = debug.getinfo(level,"Snl")
    if not info then break end
    table.insert(line, string.format("%s:%s(%d)",info.source,info.name,info.currentline) )
    level=level+1
  end
  local n=#line
  n=n-3
  local output = ""
  for i=1,n do
    output=output..line[i]
  end
  return output
end

function M_CORRUPT( msg, level )
  return {code=E_CORRUPT,data=tostring(msg),trace=traceback(level or 3)}
end

function M_SHAFT_INDEX( index, level )
  return {code=E_SHAFT_INDEX,data=tostring(index),trace=traceback(level or 3)}
end

function M_SHAFT_TAG_INDEX( index, level )
  return {code=E_SHAFT_TAG_INDEX,data=tostring(index),trace=traceback(level or 3)}
end

function M_SHAFT_DATA_INDEX( index, level )
  return {code=E_SHAFT_DATA_INDEX,data=tostring(index),trace=traceback(level or 3)}
end

function M_ATTR_TAG( tag, level )
  return {code=E_ATTR_TAG,data=tag,trace=traceback(level or 3)}
end

function M_ORDER_TAG( tag, level )
  return {code=E_ORDER_TAG,data=tag,trace=traceback(level or 3)}
end

function M_ELE_INDEX( index, level )
  return {code=E_ELE_INDEX,data=tostring(index),trace=traceback(level or 3)}
end

function  M_DATA(dom,typ,axis, level)
  return {code=E_DATA,data=dom..":"..typ..":"..axis,trace=traceback(level or 3)} 
end

function  M_DATA_RANGE(dom,typ,axis,order, level)
  return {code=E_DATA,data=dom..":"..typ..":"..axis..":order("..order..")",trace=traceback(level or 3)} 
end

function  M_DATA_RANGE_HZ(dom,typ,axis,freq, level)
  return {code=E_DATA,data=dom..":"..typ..":"..axis..":Hz("..freq..")",trace=traceback(level or 3)} 
end

function  M_PARAM_NIL(param_str, level)
  return {code=E_PARAMETER,data=tostring(param_str).."(nil)",trace=traceback(level or 3)} 
end

function  M_PARAM_ARG(msg, level)
  return {code=E_PARAMETER,data=msg,trace=traceback(level or 3)} 
end

function  M_VALUE_NIL(msg, level)
  return {code=E_VALUE_NIL,data=msg,trace=traceback(level or 3)} 
end

function M_COMPOSITE_INDEX( index, level )
  return {code=E_COMPOSITE_INDEX,data=tostring(index),trace=traceback(level or 3)}
end

function check_nil( value, param_str )
  if value==nil then error(M_PARAM_NIL(param_str,4)) end
end

function check_arg( logic, msg )
  if not logic then error(M_PARAM_ARG(msg,4)) end
end

function safe_value( test_value, error_formatter, ... )
  if test_value==nil then
    error(error_formatter(...,4))
  end
  return test_value
end

function safe_value_1( test_value, error_formatter, error_formatter_input1 )
  if test_value==nil then
    error(error_formatter(error_formatter_input1,4))
  end
  return test_value
end

function safe_value_3( test_value, error_formatter, error_formatter_input1, error_formatter_input2, error_formatter_input3 )
  if test_value==nil then
    error(error_formatter(error_formatter_input1,error_formatter_input2,error_formatter_input3,4))
  end
  return test_value
end

function safe_value_4( test_value, error_formatter, error_formatter_input1, error_formatter_input2, error_formatter_input3, error_formatter_input4 )
  if test_value==nil then
    error(error_formatter(error_formatter_input1,error_formatter_input2,error_formatter_input3,error_formatter_input4,4))
  end
  return test_value
end

function safe_spec_cpl( ele, typ, axis )
  local dom = "spec"
  local level = 3
  local function safe_key( tbl, key )
    level = level + 1
    if tbl==nil or type(tbl)~='table' then error( M_PARAM_ARG( "Key value: "..key.."not acting on a table.", level) ) end
    local val = tbl[key]
    if val == nil then
      error( M_DATA(dom,typ,axis,level) )
    end
    return val
  end
  return safe_key( safe_key( safe_key( safe_key( safe_key(ele, "data"), "spec") , "cpl"), typ), axis )
end

function safe_spec( ele, typ, axis )
  local dom = "spec"
  local level = 3
  local function safe_key( tbl, key )
    level = level + 1
    if tbl==nil or type(tbl)~='table' then error( M_PARAM_ARG( "Key value: "..key.."not acting on a table.", level) ) end
    local val = tbl[key]
    if val == nil then
      error( M_DATA(dom,typ,axis,level) )
    end
    return val
  end
  return safe_key( safe_key( safe_key( safe_key(ele, "data"), "spec") , typ), axis )
end
  
