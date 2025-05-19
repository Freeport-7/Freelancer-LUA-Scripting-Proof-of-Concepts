Heyo potential LUA scripters for Freelancer.

This is the current result of my various LUA adventures over the years. I hope that they are useful in some way. Using some of the functions I created you can make customized cutscenes in your mods. More examples will be added in the future. One thing that these functions attempt to correct for is Lua 3.2's abnormal handling of true/false values. This should make it much easier to script with since you can trust that the output is correct.

### Working functions:
## 
***iif()*** An inline comparison function that returns *1=true, 0=false* responses to given input.
  - iif.G(x, z) - tests if **x** is greater than **z** and returns 1 or 0
  - iif.Ge(x, z) - tests if **x** is greater than or equal to **z** and returns 1 or 0
  - iif.L(x, z) - tests if **x** is less than **z** and returns 1 or 0
  - iif.Le(x, z) - tests if **x** is less than or equal to **z** and returns 1 or 0
  - iif.S(x, z) - tests if *string* **x** is identical to *string* **z** and returns 1 or 0
  
  Usage:
  > local to_rain = iif.Le(gvar.get("time"),1425)
  > 
  **Compares the current time, set by the "time" gvar, and sees if it is less than or equal to a chosen time (1425)**

## 
***tf()*** A simple function that detects if a boolean parameter passed by a function is true or false.

  Usage:
  > qlog = function(message, override)
  > 
  > local override = **tf**(override)
  > 
  **Checks to see if the value of override is 1 or 0/nil and then returns 1 or 0, because nil values mess up a lot of things in Lua 3.2**

## 
***gvar()*** A function that simplifies setting and reading global variables.
  - gvar.get("x")
  - gvar.set("x", "z")

  Usage:
  > gvar.set("timestamp", "false")
  >
  > if gvar.get("timestamp") == "false") then
  >
  **Sets and reads global variables that are accessible throughout the entire scene script and all functions.**

## 
***file()*** An internal function that simplifies writing to a local file.
  - file.write("filename", "z")

  Usage:
  > file.write("lua.scene.log", "Play the lightning animation... now!")
  >
  **Simple.. write a new line to the specified file without overwriting anything. You can pass a relative path in the filename variable but it will otherwise output to the EXE folder by default.**

## 
***qlog()*** A function that simplifies all logging into one easy command. All lines are written to the *lua.scene.log* file in the EXE folder.
  - Parameters:
    - *message* - The line you want to send to the log
    - *override* - Ignore settings for *logtoconsole* and *logtochat* and output to those anyway
  - Additional settings:
    - *debugmsg* [true/false] - Will prefix log lines with :DEBUG:
    - *timestamp* [true/false] - Will prefix log lines with the current timestamp in long format: 2025-05-18-12:32:23
    - *logtoconsole* [true/false] - Will output to the console window if the *Console plugin* is installed by **Adoxa**
    - *logtochat* [true/false] - Will output to the in-game chat window if the *External Message plugin* is installed by **Adoxa**
  
  Usage:
  > **qlog**("Play the lightning animation... now!")
  >
  > **qlog**("Play the lightning animation... now!", 1)
  > 

## 
Add these files to your DATA\SCRIPTS folder to test out. Will require the *Console* and *External Message* plugins if you want to use the log to console/chat features.

http://www.adoxa.altervista.org/freelancer/plugins.html
