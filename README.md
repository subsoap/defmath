# DefMath
A module with a set of math functions for Defold

## Installation
You can use DefMath in your own project by adding this project as a [Defold library dependency](http://www.defold.com/manuals/libraries/). Open your game.project file and in the dependencies field under project add:

	https://github.com/subsoap/defmath/archive/master.zip
  
Once added, you must require the main Lua module via

```
local defmath = require("defmath.defmath")
```
Then you can use the DefMath functions for example via

```
print(defmath.round_decimal(0.12345678,3))
```
