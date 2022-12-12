-- Character escaping
local function escape(s, in_attribute)
  return s:gsub('[<>&"\']',
    function(x)
      if x == '<' then
        return '&lt;'
      elseif x == '>' then
        return '&gt;'
      elseif x == '&' then
        return '&amp;'
      elseif in_attribute and x == '"' then
        return '&quot;'
      elseif in_attribute and x == "'" then
        return '&#39;'
      else
        return x
      end
    end)
end

function Writer (doc, opts)
  local filter = {
    Link = function (link)
      -- external URL will open on a new tab/window
      if link.target:find("http", 1, true) == 1 then
        return pandoc.RawInline('html',
          '<a href="' .. escape(link.target,true) .. '"' ..
          ' target="_blank">' .. pandoc.utils.stringify(link.content) .. '</a>')
      end
    end,

    Quoted = function(q)
      local buff = {}
      table.insert(buff, pandoc.RawInline('html','<q>'))
      for _, inline in pairs(q.content) do
        table.insert(buff, inline)
      end
      table.insert(buff, pandoc.RawInline('html','</q>'))
      return buff
    end,

    Para = function (p)
      local content = pandoc.utils.stringify(p.content)
      if content:find("–", 1, true) == 1 then
        return pandoc.RawInline('html','<cite>' .. content:sub(5) .. '</cite>')
      end
    end,

    BlockQuote = function (bq)
      local buff = {}
      table.insert(buff, pandoc.RawInline('html','<article>'))
      table.insert(buff, pandoc.utils.blocks_to_inlines(bq.content))
      table.insert(buff, pandoc.RawInline('html','</article>'))
      return buff
    end,

    CodeBlock = function (cb)
      local buff = {}
      table.insert(buff, pandoc.RawInline('html','<pre>'))
      table.insert(buff, pandoc.utils.blocks_to_inlines(pandoc.read(cb.text).blocks))
      table.insert(buff, pandoc.RawInline('html','</pre>'))
      return buff
    end
  }

  local buffer = {}
  local function add(s)
    table.insert(buffer, s)
  end

  -- CONTENT
  body = pandoc.write(doc:walk(filter), 'html', opts)
  add(body)

  -- SUFFIX: METADATA
  if doc.meta.notes ~= nil then
    if #doc.meta.notes > 0 then
      add('<ol class="footnotes">')
      for _,note in pairs(doc.meta.notes) do
        add("<li>"..pandoc.utils.stringify(note).."</li>")
      end
      add('</ol>')
    end
  end

  return table.concat(buffer,'\n') .. '\n'
end
