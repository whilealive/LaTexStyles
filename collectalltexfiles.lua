-- ==================================================================
-- FILE     collectalltexfiles.lua
-- INFO     recurses down a directory tree and inputs all the tex-files found
--          https://tex.stackexchange.com/questions/7653/how-to-iterate-through-the-name-of-files-in-a-folder
--
--          use as follows (luacode-package required!):
--          \begin{luacode}
--            require("collectalltexfiles.lua")
--            CollectAllTexFiles(lfs.currentdir() .. "/DL-GESO-Aufgaben/")
--          \end{luacode}
--
-- DATE     12.06.2018
-- OWNER    Bischofberger
-- ==================================================================

-- dirtree iterator:
-- to be found at: http://lua-users.org/wiki/DirTreeIterator
function dirtree(dir)
  if string.sub(dir, -1) == "/" then
    dir=string.sub(dir, 1, -2)
  end

  local function yieldtree(dir)
    for entry in lfs.dir(dir) do
      if not entry:match("^%.") then
        entry=dir.."/"..entry
          if lfs.isdir(entry) then
            yieldtree(entry)
          else
            coroutine.yield(entry)
          end
      end
    end
  end

  return coroutine.wrap(function() yieldtree(dir) end)
end


function GetFileExtension(filename)
  return filename:match("^.+(%..+)$")
end


function isValidTexFile(filename)
  if filename:match("_QuickCompile") then
    return false
  end
  if GetFileExtension(filename) ~= ".tex" then
    return false
  end
  return true
end


function CollectAllTexFiles(dir)
  -- Lua doesn't guarantee any iteration order for the associative part of the table!
  -- Therefore, we must order the entries manually
  local filenames = {}

  for i in dirtree(dir) do
    local filename = i:gsub(".*/([^/]+)$","%1")
    if isValidTexFile(filename) then
      table.insert(filenames, filename)
    end
  end

  table.sort(filenames)

  for i = 1, #filenames do
    tex.sprint("[" .. filenames[i] .. "]\\BZ" .. "\\input " .. dir .. filenames[i] .. " " .. "\\clearpage\\par")
    --tex.sprint(dir .. filenames[i] .. "\\BZ")  -- debugging
  end
end
