# ishasted()

Returns true if your character is hasted, false otherwise.

{% code lineNumbers="true" %}
```lua
auto(200)
if not ishasted() then
    cast('utani hur')
    wait(100, 200)
end
```
{% endcode %}

_Each 200 milliseconds, it will check if you are hasted. If not, it will cast 'haste' spell._