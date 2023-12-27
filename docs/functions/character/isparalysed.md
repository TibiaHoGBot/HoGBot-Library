# isparalysed()

Returns true if your character is paralyzed, false otherwise.

{% code lineNumbers="true" %}
```lua
auto(200)
if isparalysed() then
    cast('exura')
    wait(100, 200)
end
```
{% endcode %}

_Each 200 milliseconds, it will check if you are paralyzed. If so, it will cast 'light healing' spell._