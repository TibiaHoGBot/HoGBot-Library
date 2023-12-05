# iscursed()

Returns true if your character is cursed, false otherwise.

{% code lineNumbers="true" %}
```lua
auto(200)
if iscursed() and vocation() == 'paladin' then
    cast('exana mort')
    wait(100, 200)
end
```
{% endcode %}

_Each 200 milliseconds, it will check if you are cursed and you are a 'paladin'. If so, it cast 'cure curse' spell._