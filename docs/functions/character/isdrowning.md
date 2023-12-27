# isdrowning()

Returns true if your character is drowning (underwater), false otherwise.

{% code lineNumbers="true" %}
```lua
auto(200)
if isdrowning() then
    equipitem('helmet of the deep', 'head')
end
```
{% endcode %}

_Each 200 milliseconds, it will check if you are drowning. If so, it will equip your character with a 'helmet of the deep'._