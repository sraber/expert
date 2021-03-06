--(c)2015 Leandro T. Fonseca 
-- Modified by S. Raber 2018.  Added access function get_lua_to_xml
local M={}
local indentation="  "
function get_lua_to_xml() return M end
 --- Parse a lua value and transform it to XML 
 -- If the value is of type string it will be transformed into a tag eg <value/> 
 -- If the value is a table each of it's key value pairs will be converted like this: 
 --  * If the key is a number toxml() will be called again with the value as argument 
 --  * If the key is a string and value is a string a tag will be created with the key as XML tag element and the value as XML-value (eg <key>value</key>) 
 --  * If the key is a string and value is a table a tag will be created with the key as XML tag element and the table values as XML-attributes and nested tags (eg <key a="b"><c... </key> 
 -- @param value The value to parse 
 -- @return The value as XML 
function M.toxml(value) 
 	local xml = "" 
 	local t = type(value) 
 	if t == "string" then 
 		xml = xml .. indentation .. "<" .. value .. "/>\n" 
 	elseif t == "table" then 
 		for name,data in pairs(value) do 
 			-- if the table key is numeric it's value is parsed 
 			if type(name) == "number" then 
 				xml = xml .. M.toxml(data) 
 			else 
 				xml = xml .. indentation .. "<" .. name 
 				if type(data) == "table" then 
 					local children = {} 
 					local number_strings = {} 
 					for k,v in pairs(data) do 
 						local vtype = type(v) 
 						local ktype = type(k) 
 						if vtype == "table" then 
 							children[k] = v 
 						elseif ktype == "string" then 
 							xml = xml .. " " ..k .. '="' .. tostring(v) .. '"' 
 						elseif ktype == "number" and vtype == "string" then 
 							table.insert(number_strings, v) 
 						end 
 					end 
 
 
 					if next(children) ~= nil or #number_strings > 1 then 
 						xml = xml .. ">\n" 
 						indentation = indentation .. "\t" 
 						xml = xml .. M.toxml(children) 
 						xml = xml .. M.toxml(number_strings) 
 						indentation = indentation:sub(1,#indentation-1) 
 						xml = xml .. indentation .. "</" .. name .. ">\n" 
 					else 
 						if #number_strings == 1 then 
 							xml = xml .. ">" .. number_strings[1] .. "</" .. name .. ">\n" 
 						else 
 							xml = xml .. "/>\n" 
 						end 
 					end 
 				else 
 					xml = xml .. ">"..data.."</" .. name ..">\n" 
 				end 
 			end 
 		end 
 	end 
 	return xml 
 end 
 
 
 return M 

