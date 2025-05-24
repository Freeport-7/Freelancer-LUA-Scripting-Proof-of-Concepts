--
--LuaCore.Lua
--

--This file contains all of the core functions I feel might be useful to LUA scripters as they create their scene files.
--If you would like to see new functions added then you can contact FireFlyEx on the Freeport 7 Discord server below:
--  https://discord.gg/yHx8nMmZdg

--You can also contribute to the project on Github:
--  https://github.com/Freeport-7/Freelancer-LUA-Scripting-Proof-of-Concepts

--Core comparison functions that return corrected boolean responses; 1 = true, 0 = false
--Usage: local var = iif.Le(value1,value2)
iif = {}
iif["G"] = function(x, z) -- is X greater than Z? automatically fixes mixed inputs to number
    if type(x) == "string" then x = tonumber(x) end
    if type(z) == "string" then z = tonumber(z) end
    if x > z then
        return 1
    end
    return 0
end
iif["Ge"] = function(x, z) -- is X greater than or equal to Z? automatically fixes mixed inputs to number
    if type(x) == "string" then x = tonumber(x) end
    if type(z) == "string" then z = tonumber(z) end
    if x >= z then
        return 1
    end
    return 0
end
iif["L"] = function(x, z) -- is X less than Z? automatically fixes mixed inputs to number
    if type(x) == "string" then x = tonumber(x) end
    if type(z) == "string" then z = tonumber(z) end
    if x < z then
        return 1
    end
    return 0
end
iif["Le"] = function(x, z) -- is X less than or equal to Z? automatically fixes mixed inputs to number
    if type(x) == "string" then x = tonumber(x) end
    if type(z) == "string" then z = tonumber(z) end
    if x <= z then
        return 1
    end
    return 0
end
iif["S"] = function(x, z) -- is X identical to Z? automatically converts inputs to string
    local x = tostring(x)
    local z = tostring(z)
    if x == z then
        return 1
    end
    return 0
end

--True/False test; returns corrected boolean responses; 1 = true, everything else = false
--Usage: local var = tf(var)
tf = function(o)
    if tonumber(o) == 1 then
        return 1
    end
    return 0
end

--Global variable functions
--Usage1: gvar.set("var", "val")
--Usage2: if gvar.get("var") == "val" then
gvar = {}
gvar["set"] = function(name, value)
    setglobal(tostring(name), tostring(value))
end
gvar["get"] = function(name)
    return getglobal(tostring(name))
end

--File IO functions (WIP)
file = {}
--Appends to file, will not clear it first
--Usage: file.write("filename", message)
file["write"] = function(file, message)
    local file = appendto(file)
    write(file, message)
    flush(file)
    closefile(file)
end


--Set Global Variables
gvar.set("timestamp", "false")
gvar.set("debugmsg", "false")
gvar.set("time", tonumber(date("%H%M")))
