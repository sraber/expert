function make_error()
  error( {message="This is an error", code=121} )
end

function good(n)
  return 5*n
end

local check, ret = pcall( make_error )
print( check )
print( type(ret) )
print( ret.message..","..ret.code )

check,ret = pcall( good, "c" )
print( check )
print( ret )

check,ret = pcall( good, 5 )
print( check )
print( ret )
