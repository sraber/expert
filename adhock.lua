function findLF()
   --print("start")
   for dsi,ds in ipairs(machine.datasets) do
      local str = ""
      --print(ds)
      if ds.matches then
         for _,m in ipairs(ds.matches) do
            --print(m)
            str = str .. " | " .. m.type .. ":" .. m.tag .. ":" .. m.cn
         end
         print( str )
      end
   end
end