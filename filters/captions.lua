return {
  FloatRefTarget = function(float)
    if float.type == "Figure" and float.caption_long ~= nil then
      local alphabet = 'abcdefghijklmnopqrstuvwxyz'
      local captures = pandoc.Inlines({})
      for i, inline in ipairs(float.caption_long.content) do
        captures:insert(inline)
      end
      for i, foo in ipairs(float.content) do
        -- nil-check: spring over hvis strukturen ikke matcher
        if foo.content and foo.content[2] and 
           foo.content[2].content and foo.content[2].content[1] and
           foo.content[2].content[1].content then
          captures:insert(pandoc.Space())
          captures:insert(pandoc.Str(string.format("(%s):", alphabet:sub(i, i))))
          captures:insert(pandoc.Space())
          for i, inline in ipairs(foo.content[2].content[1].content) do
            captures:insert(inline)
          end
          foo.content[2].content[1].content = pandoc.Inlines({pandoc.Str("")})
        end
      end
      if float.attributes["layout-ncol"] ~= nil then    
        float.caption_long.content = captures
      end
      return float
    end
  end
}

