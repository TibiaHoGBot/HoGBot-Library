# creatureonscreen

If there is creature on screen with given name then go to label X

{% code lineNumbers="true" %}
```lua
auto(100)
local monster = 'Demon'
local label = 'safeSpot'

if creatureonscreen(monster) then
    gotolabel(label)
end
```
{% endcode %}

_Each 100 milliseconds, it will check if you have Demon creature on screen. If yes it will move to 'safeSpot' label in waypoints._
