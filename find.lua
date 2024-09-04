-- find.lua

local findModule = {}

-- Function to expand the home directory shortcut (~) to the full path
function findModule.expandHomeDirectory(path)
    return path:gsub("^~", os.getenv("HOME"))
end

-- Function to autocomplete items in a directory
function findModule.autocompleteItems(path, query, isFile)
    local items = {}
    
    -- List directory contents
    for file in hs.fs.dir(path) do
        if file:sub(1, 1) ~= "." then -- Skip hidden files
            local fullPath = path .. "/" .. file
            local mode = hs.fs.attributes(fullPath, "mode")

            if isFile and mode == "file" then
                if file:lower():find(query:lower()) then
                    table.insert(items, {["text"] = file, ["uuid"] = fullPath})
                end
            elseif not isFile and mode == "directory" then
                if file:lower():find(query:lower()) then
                    table.insert(items, {["text"] = file .. "/", ["uuid"] = fullPath})
                end
            end
        end
    end

    return items
end

-- Function to open a file
function findModule.openFile(path)
    hs.execute("open " .. path)
end

return findModule

