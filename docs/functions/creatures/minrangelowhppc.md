# minrangelowhppc(monsters, minrange, maxrange, hppc)

Returns number of monsters in min and max range with x hppc. Monsters are optional

{% code lineNumbers="true" %}
```lua
auto(100)
local ueMonsters = {"Dragon Lord"}
if minrangelowhppc(ueMonsters, 1, 5, 40) >= 2 and cancast("exevo gran mas frigo") then
	cast("exevo gran mas frigo")
end
```
{% endcode %}

_Each 100 milliseconds, it will check if you have more than 2 Dragon Lords in min range 1 and max range 5 sqms and if hppc if below or equal to 40% if yes it will use exevo gran mas frigo spell_

