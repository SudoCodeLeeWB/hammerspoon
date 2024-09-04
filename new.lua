-- new.lua

local newModule = {}

-- Function to open an application by name
function newModule.openApp(appName)
    -- Debugging: Print the application name being opened
    print("Attempting to open application:", appName)
    
    local app = hs.application.get(appName)
    
    if app then
        -- Debugging: Print whether the application is found and if it has a "New Window" option
        print("Application found:", appName)
        local menuItem = app:findMenuItem({"File", "New Window"})
        
        if menuItem then
            print("New Window menu item found:", menuItem.enabled)
        else
            print("New Window menu item not found")
        end

        if menuItem and menuItem.enabled then
            print("Opening new window for:", appName)
            app:selectMenuItem({"File", "New Window"})
        else
            print("Focusing on existing instance of:", appName)
            app:activate()
        end
    else
        print("Launching application:", appName)
        hs.execute("open -a \"" .. appName .. "\"")
    end
end

-- Function to remove duplicates from a list
function newModule.unique(tbl)
    local result = {}
    local seen = {}
    for _, v in ipairs(tbl) do
        if not seen[v] then
            table.insert(result, v)
            seen[v] = true
        end
    end
    return result
end

-- Function to search preloaded applications based on user input
function newModule.searchApps(query, allApps)
    local choices = {}
    for _, appName in ipairs(allApps) do
        if string.match(appName:lower(), query:lower()) then
            table.insert(choices, {
                ["text"] = appName,
                ["subText"] = "Launch " .. appName,
                ["uuid"] = appName,
            })
        end
    end
    return choices
end

return newModule
