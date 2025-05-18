--Core comparison functions that return corrected boolean responses; 1 = true, 0 = false
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
tf = function(o)
    if tonumber(o) == 1 then
        return 1
    end
    return 0
end


--Global variable functions
gvar = {}
gvar["set"] = function(name, value)
    setglobal(tostring(name), tostring(value))
end
gvar["get"] = function(name)
    return getglobal(tostring(name))
end


--File IO functions
file = {}
--Appends to file, will not clear it first
file["write"] = function(file, message)
    local file = appendto(file)
    write(file, message)
    flush(file)
    closefile(file)
end


--Logging system to log file, with config for optional timestamp, chat, and console logging
--Also can be given an override argument that will display regardless of configuration, and a debug switch
qlog = function(message, override)
    local message = tostring(message) .. "\n"
    local override = tf(override)
    if gvar.get("debugmsg") == "true" then
        message = ":DEBUG: " .. message
    end
    if gvar.get("timestamp") == "true" then
        message = "[" .. tostring(date("%Y-%m-%d-%H:%M:%S")) .. "] :: " .. message
    end
    if gvar.get("logtoconsole") == "true" or override == 1 then
        print(message)
    end
    if gvar.get("logtochat") == "true" or override == 1 then
        file.write('externalmsg.txt', message .. "\r\n")
    end
    file.write('lua.scene.log', message)
end


--Set Global Variables
gvar.set("timestamp", "false")
gvar.set("debugmsg", "false")
gvar.set("logtoconsole", "true")
gvar.set("time", tonumber(date("%H%M")))

--Detect if external message plugin is installed
local exmsg = openfile("..\\EXE\\externalmsg.dll","r")
if exmsg then
    closefile(exmsg)
    --Enable log to chat here
    gvar.set("logtochat", "true")
else
    gvar.set("logtochat", "false")
end