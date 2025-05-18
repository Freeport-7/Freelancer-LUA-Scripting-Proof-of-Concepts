Heyo potential LUA scripters for Freelancer.

This is the current result of my various LUA adventures over the years. I hope that they are useful in some way. Using some of the functions I created you can make customized cutscenes in your mods. More examples will be added in the future.

### Working functions:
- iif() - an inline comparison function that returns 1=true,0=false responses to given input
- tf() - a simple true/false function that detects if a variable exists and has a value
- gvar() - a function that simplifies setting and reading global variables
- file() - a function that simplifies writing to a local file, only works in appendto mode and will not erase existing contents
- qlog() - a function that simplifies all logging into one place. It modifies output based on saved settings (gvars) and can output to console and in-game chat based on saved settings. Regardless of all settings it writes to the lua.scene.log file in the EXE folder. In-game-chat feature is automatically disabled if the External Message plugin by Adoxa is not installed.

Add these files to your DATA\SCRIPTS folder to test out. Will require the External Message plugin if you want to use the log to chat feature.

http://www.adoxa.altervista.org/freelancer/plugins.html
