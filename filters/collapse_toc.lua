-- return toc element type and it's id
local function get_id(el)
  local name =  el:get_attribute "class"
  local a = el:query_selector "a" or {}
  local first = a[1]
  local href = first:get_attribute "href"
  local id = href:match("#(.+)$")
  return name, id
end

local function remove_sections(part_elements, currentpart)
  -- we need to remove toc entries from the previous part if the 
  -- current document isn't part of it
  if currentpart == false then
    for _, part in ipairs(part_elements) do
      part:remove_node()
    end
  end
end

-- remove sections from other chapters from TOC
local function toc_sections (dom)
  -- local dom = domobject.parse(s)
  -- search sectioning elements
  local titles = dom:query_selector(".partHead a, .chapterHead a, .sectionHead a")
  local section_ids = {}
  for _, x in ipairs(titles) do
    -- get their id attributes and save them in a table
    section_ids[#section_ids+1] = x:get_attribute("id")
  end
  -- we need to retrieve the first table of contents
  local toctables = dom:query_selector("nav.TOC") or {}
  -- process only when we got a TOC
  if #toctables > 0 then
    local tableofcontents = toctables[1]
    -- all toc entries are in span elements
    local toc = tableofcontents:query_selector("span")
    local currentpart = false
    local part_elements = {}
    for _, el in ipairs(toc) do
      -- get sectioning level and id of the current TOC entry
      local name, id = get_id(el)
      if name == "chapterToc" then
        remove_sections(part_elements,currentpart)
        -- resert toc list
        currentpart = false
        part_elements = {}
      else
        -- add child elements of part to table
        part_elements[#part_elements+1] = el
      end
      for _, sectid in ipairs(section_ids) do
        -- detect if the current TOC entry match some sectioning element in the current document
        if id == sectid then
          currentpart = true
          print("match", id)
        end
      end
    end
    -- remove sections from the last part
    remove_sections(part_elements,currentpart)
    -- remove unneeded br elements
    local br = tableofcontents:query_selector("br")
    for _, el in ipairs(br) do el:remove_node() end
    -- remove unneded whitespace
    for _, el in ipairs(tableofcontents:get_children()) do
      if el:is_text() then el:remove_node() end
    end
  end
  return dom
  --% return dom:serialize()
end 

return toc_sections
