# isdrunk()

Returns true if your character is drunk, false otherwise.

{% code lineNumbers="true" %}
```lua
auto(200)
if isdrunk() then
    equipitem('dwarven ring', 'finger')
    wait(100, 200)
end
```
{% endcode %}

_Each 200 milliseconds, it will check if you are drunk. If so, it will equip your character with a 'dwarven ring'._