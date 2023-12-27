# ismanashielded()

Returns true if your character is protected by mana shield, false otherwise.

{% code lineNumbers="true" %}
```lua
auto(200)
if not ismanashielded() then
    cast('utamo vita')
    wait(100, 200)
end
```
{% endcode %}

_Each 200 milliseconds, it will check if you are mana shielded. If not, it will cast 'magic shield' spell._