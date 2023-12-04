# paround(range)

Return number of players around you in in given range

{% code lineNumbers="true" %}
```lua
local message = "NUMBER OF PLAYERS: " .. paround(6) .. " + ME"
talk(MESSAGE_TYPE.SAY, message)
```
{% endcode %}

_It will say on local chat **NUMBER OF PLAYERS: 1 + ME** if there is another player with you on screen._

