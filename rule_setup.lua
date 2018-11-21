local P={}
_G['_vds_rulebase'] = P
setmetatable(P, {__index = _G})
if setfenv then
  setfenv(1,P)
else
  _ENV = P
end