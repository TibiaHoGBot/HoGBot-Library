# saround(range)

Returns number of summons in range (player summons or game summons)

{% code lineNumbers="true" %}
```lua
auto(100)
if saround(1) >= 8 then
    cast('exevo mas san')
    wait(50, 100)
end
```
{% endcode %}

_Each 100 milliseconds, it will check if there are 8 or more summons 1 sqm around you. If yes it will use exevo mas san spell._

