# maround(monsters, range)

Returns number of monsters in range. Monsters and Range are optional

{% code lineNumbers="true" %}
```lua
auto(100)
local ueMonsters = {"Dragon Lord"}
if maround(ueMonsters, 5) >= 5 and cancast("exevo gran mas frigo") then
	cast("exevo gran mas frigo")
end
```
{% endcode %}

_Each 100 milliseconds, it will check if you have more than 5 Dragon Lords in range 5 sqms if yes it will use exevo gran mas frigo spell_

