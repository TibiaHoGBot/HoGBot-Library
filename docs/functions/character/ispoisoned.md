# ispoisoned()

Returns true if your character is poisoned, false otherwise.

{% code lineNumbers="true" %}
```lua
auto(200)
if ispoisoned() and mp() >= 30 then
    cast('exana pox')
    wait(100, 200)
end
```
{% endcode %}

_Each 200 milliseconds, it will check if you are poisoned and you have more than 30 of mana. If so, it will cast 'antidote' spell._