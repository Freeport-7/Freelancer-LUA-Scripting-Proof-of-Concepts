--
--LuaLoader.Lua
--

--This file is used as a universal loader for LUA support scripts. It's used similarly to the [Libraries] section of dacom.ini
--Any LUA script loaded here will be accessible from every thorn scene file in the game automatically. This file is loaded once
--per session via the intro scripts in Data\Scripts\Intro.

--This file should always go in the game's EXE folder. Support scripts can be anywhere but you probably want to put them in the
--the EXE folder as well.

--To load a script you must add the following, one per line: 
--    dofile("filename.lua")
--       OR
--    dofile("..\\relative\\path\\to\\filename.lua")

dofile("luacore.lua") -- useful common functions by FireFlyEx
dofile("QLog.lua") -- useful logging functions by FireFlyEx
