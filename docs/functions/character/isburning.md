# isburning()

Returns true if your character is burning, false otherwise.

{% code lineNumbers="true" %}
```lua
auto(200)
if isburning() and mp() >= 30 and vocation() == 'druid' then
    cast('exana flam')
    wait(100, 200)
end
```
{% endcode %}

_Each 200 milliseconds, it will check if you are burning and you are 'druid' and you have more than 30 of mana. If so, it will cast 'cure burning' spell._