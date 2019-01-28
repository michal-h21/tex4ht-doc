local ufind = unicode.utf8.find
-- remove first and last <br> from code listings to reduce the white space
local function fix_code_blocks(dom)
  local remove_whitespace = function(obj)
    local text = obj:get_text()
    if ufind(text, "^%s+$") then
      obj:remove_node()
    end
  end
  local obj_process = function(obj)
    if obj:is_element() and obj:get_element_name()=="br" then
      obj:remove_node()
      -- signalize that the loop should break
      return true
    elseif obj:is_element() or obj:is_text() then
      -- remove whitespace that appears before the first linebreak
      remove_whitespace(obj)
    end
  end

  for _, listing in ipairs(dom:query_selector("pre.listings")) do

    local children = listing:get_children()
    -- remove the last pre and remove white space
    for i = #children, 1, -1 do
      local current = children[i]
      local status = obj_process(current)
      if status == true then 
        -- remove also the line break before the <br>
        local nextobj = children[i-1] 
        obj_process(nextobj)
        break 
      end
    end
    -- remove the first pre 
    for i, obj in ipairs(children) do
      local status = obj_process(obj)
      if status == true then 
        break
      end
    end
  end
  return dom
end

return fix_code_blocks
