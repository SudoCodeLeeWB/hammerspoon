-- -- Load modules
-- local newModule = require("new")
-- local findModule = require("find")

-- -- Preload all applications on startup
-- local function preloadApps()
--     local appPaths = {}
--     local dirs = {"/Applications", "~/Applications", "/System/Applications"}

--     for _, dir in ipairs(dirs) do
--         local output, status = hs.execute("ls " .. dir, true)
--         if status then
--             for file in string.gmatch(output, '([^\n]+)') do
--                 if file:match("%.app$") then
--                     local appName = file:sub(1, -5) -- Remove the .app extension
--                     table.insert(appPaths, appName)
--                 end
--             end
--         end
--     end

--     local uniqueApps = newModule.unique(appPaths)
--     table.sort(uniqueApps)

--     return uniqueApps
-- end

-- -- Load the applications once and store them
-- local allApps = preloadApps()

-- -- Function to handle 'new:' command input
-- local function handleNewInput(query)
--     return newModule.searchApps(query, allApps)
-- end

-- -- Function to handle 'find:' command input
-- local function handleFindInput(query)
--     local path, filename = query:match("^(.-)%s*,%s*(.*)$")
--     if not path then
--         path = query
--     end
--     path = findModule.expandHomeDirectory(path and path ~= "" and path or os.getenv("HOME"))

--     if filename then
--         return findModule.autocompleteItems(path, filename, true)
--     else
--         return findModule.autocompleteItems(path, "", false)
--     end
-- end

-- -- Define the myChooser variable before use
-- local myChooser

-- -- Create the chooser UI
-- myChooser = hs.chooser.new(function(choice)
--     if choice then
--         local currentQuery = myChooser:query() -- Capture the current query before altering the chooser

--         if string.match(currentQuery, "^find:") then
--             local fullPath = choice.uuid
--             -- Determine if it's a directory or a file
--             if hs.fs.attributes(fullPath, "mode") == "directory" then
--                 myChooser:query("find: " .. fullPath .. "/")
--             else
--                 findModule.openFile(fullPath)
--             end
--         elseif string.match(currentQuery, "^new:") then
--             newModule.openApp(choice.text)
--         end
--     end
-- end)

-- -- Handle query changes for both `new:` and `find:`
-- myChooser:queryChangedCallback(function(query)
--     local prefix, command = query:match("^(%S+):%s*(.*)")
--     if prefix == "new" then
--         myChooser:choices(handleNewInput(command))
--     elseif prefix == "find" then
--         myChooser:choices(handleFindInput(command))
--     else
--         myChooser:choices({})
--     end
-- end)

-- -- Adjust the chooser's appearance to resemble Spotlight
-- myChooser:rows(6)
-- myChooser:width(20)
-- myChooser:bgDark(true)

-- -- Bind the chooser to Shift + Command + Space
-- hs.hotkey.bind({"shift", "cmd"}, "space", function()
--     myChooser:show()
-- end)


-- verison 2 
-- Load modules
-- local newModule = require("new")
-- local findModule = require("find")

-- -- Preload all applications on startup
-- local function preloadApps()
--     local appPaths = {}
--     local dirs = {"/Applications", "~/Applications", "/System/Applications"}

--     for _, dir in ipairs(dirs) do
--         local output, status = hs.execute("ls " .. dir, true)
--         if status then
--             for file in string.gmatch(output, '([^\n]+)') do
--                 if file:match("%.app$") then
--                     local appName = file:sub(1, -5) -- Remove the .app extension
--                     table.insert(appPaths, appName)
--                 end
--             end
--         end
--     end

--     local uniqueApps = newModule.unique(appPaths)
--     table.sort(uniqueApps)

--     return uniqueApps
-- end

-- -- Load the applications once and store them
-- local allApps = preloadApps()

-- -- Function to handle 'new:' command input
-- local function handleNewInput(query)
--     return newModule.searchApps(query, allApps)
-- end

-- -- Function to handle 'find:' command input
-- local function handleFindInput(query)
--     local path, filename = query:match("^(.-)%s*,%s*(.*)$")
--     if not path then
--         path = query
--     end
--     path = findModule.expandHomeDirectory(path and path ~= "" and path or os.getenv("HOME"))

--     if filename then
--         return findModule.autocompleteItems(path, filename, true)
--     else
--         return findModule.autocompleteItems(path, "", false)
--     end
-- end

-- -- Define the myChooser variable before use
-- local myChooser

-- -- Create the chooser UI
-- myChooser = hs.chooser.new(function(choice)
--     if choice then
--         local currentQuery = myChooser:query() -- Capture the current query before altering the chooser

--         if string.match(currentQuery, "^find:") then
--             local fullPath = choice.uuid
--             -- Determine if it's a directory or a file
--             if hs.fs.attributes(fullPath, "mode") == "directory" then
--                 -- Update the chooser's query with the new directory path
--                 myChooser:query("find: " .. fullPath .. "/")
--                 myChooser:show() -- Re-show the chooser with the updated query
--             else
--                 findModule.openFile(fullPath)
--             end
--         elseif string.match(currentQuery, "^new:") then
--             newModule.openApp(choice.text)
--         end
--     end
-- end)

-- -- Handle query changes for both `new:` and `find:`
-- myChooser:queryChangedCallback(function(query)
--     local prefix, command = query:match("^(%S+):%s*(.*)")
--     if prefix == "new" then
--         myChooser:choices(handleNewInput(command))
--     elseif prefix == "find" then
--         myChooser:choices(handleFindInput(command))
--     else
--         myChooser:choices({})
--     end
-- end)

-- -- Adjust the chooser's appearance to resemble Spotlight
-- myChooser:rows(6)
-- myChooser:width(20)
-- myChooser:bgDark(true)

-- -- Bind the chooser to Shift + Command + Space
-- hs.hotkey.bind({"shift", "cmd"}, "space", function()
--     myChooser:show()
-- end)


-- version 3
-- Load modules
local newModule = require("new")
local findModule = require("find")

-- Preload all applications on startup
local function preloadApps()
    local appPaths = {}
    local dirs = {"/Applications", "~/Applications", "/System/Applications"}

    for _, dir in ipairs(dirs) do
        local output, status = hs.execute("ls " .. dir, true)
        if status then
            for file in string.gmatch(output, '([^\n]+)') do
                if file:match("%.app$") then
                    local appName = file:sub(1, -5) -- Remove the .app extension
                    table.insert(appPaths, appName)
                end
            end
        end
    end

    local uniqueApps = newModule.unique(appPaths)
    table.sort(uniqueApps)

    return uniqueApps
end

-- Load the applications once and store them
local allApps = preloadApps()

-- Function to handle 'new:' command input
local function handleNewInput(query)
    return newModule.searchApps(query, allApps)
end

-- Function to handle 'find:' command input
local function handleFindInput(query)
    local path, filename = query:match("^(.-)%s*,%s*(.*)$")
    if not path then
        path = query
    end
    path = findModule.expandHomeDirectory(path and path ~= "" and path or os.getenv("HOME"))

    if filename == "." then
        findModule.openFile(path)
        return {}
    elseif filename then
        return findModule.autocompleteItems(path, filename, true)
    else
        return findModule.autocompleteItems(path, "", false)
    end
end

-- Define the myChooser variable before use
local myChooser

-- Create the chooser UI
myChooser = hs.chooser.new(function(choice)
    if choice then
        local currentQuery = myChooser:query() -- Capture the current query before altering the chooser

        if string.match(currentQuery, "^find:") then
            local fullPath = choice.uuid
            -- Determine if it's a directory or a file
            if hs.fs.attributes(fullPath, "mode") == "directory" then
                -- Check if the user entered '.' to open the directory
                local _, filename = currentQuery:match("^(.-)%s*,%s*(.*)$")
                if filename == "." then
                    findModule.openFile(fullPath)
                else
                    -- Update the chooser's query with the new directory path
                    myChooser:query("find: " .. fullPath .. "/")
                    myChooser:show() -- Re-show the chooser with the updated query
                end
            else
                findModule.openFile(fullPath)
            end
        elseif string.match(currentQuery, "^new:") then
            newModule.openApp(choice.text)
        end
    end
end)

-- Handle query changes for both `new:` and `find:`
myChooser:queryChangedCallback(function(query)
    local prefix, command = query:match("^(%S+):%s*(.*)")
    if prefix == "new" then
        myChooser:choices(handleNewInput(command))
    elseif prefix == "find" then
        myChooser:choices(handleFindInput(command))
    else
        myChooser:choices({})
    end
end)

-- Adjust the chooser's appearance to resemble Spotlight
myChooser:rows(10)
myChooser:width(25)
myChooser:bgDark(true)
myChooser:placeholderText("Type 'new:' or 'find:' to search")


-- Bind the chooser to Shift + Command + Space
hs.hotkey.bind({"shift", "cmd"}, "space", function()
    myChooser:show()
end)

