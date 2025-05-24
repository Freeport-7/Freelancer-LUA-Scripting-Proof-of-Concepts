--
--QLog.lua
--

--This is a logging support script by FireFlyEx for the purposes of developing thorn scene files by making debugging easier.
--By sending lines to a log file you can track what's going on and it makes development quicker and easier.

--If you would like to see new features added then you can contact me on the Freeport 7 Discord server below:
--  https://discord.gg/yHx8nMmZdg

--You can also contribute to the project on Github:
--  https://github.com/Freeport-7/Freelancer-LUA-Scripting-Proof-of-Concepts

--Logging system to log file, with config for optional timestamp and console logging
--Also can be given an override argument that will display regardless of configuration
--Usage1: qlog("Start rain in scene")
--Usage2: qlog("Something went wrong..", 1)
qlog = function(message, override)
    local message = tostring(message) .. "\n" -- all lines have to be converted to string or Lua 3.2 will error out
    local override = tf(override) -- verify if we should override gvar settings and display log to console/chat anyway
    if gvar.get("debugmsg") == "true" then -- prefix the line with :DEBUG: 
        message = ":DEBUG: " .. message
    end
    if gvar.get("timestamp") == "true" then -- prefix the line with a timestamp
        message = "[" .. tostring(date("%Y-%m-%d-%H:%M:%S")) .. "] :: " .. message
    end
    if gvar.get("logtoconsole") == "true" or override == 1 then -- output to console if the plugin is installed
        print(message)
    end
    if gvar.get("logtochat") == "true" or override == 1 then -- output to in-game chat if the plugin is installed
        file.write("externalmsg.txt", message .. "\r\n")
    end
    file.write("lua.scene.log", message) -- save to log file regardless
end

--Detect if console plugin is installed
local conmsg = openfile("console.dll","r")
if conmsg then
    flush(conmsg)
    closefile(conmsg)
    conmsg = nil
    gvar.set("logtoconsole", "true") -- disable log to console by changing this line to false
else
    gvar.set("logtoconsole", "false")
end

--Detect if external message plugin is installed
local exmsg = openfile("externalmsg.dll","r")
if exmsg then
    flush(exmsg)
    closefile(exmsg)
    exmsg = nil
    gvar.set("logtochat", "true") -- disable log to chat by changing this line to false
else
    gvar.set("logtochat", "false")
end
