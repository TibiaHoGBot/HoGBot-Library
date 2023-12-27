# islectrified()

Returns true if your character is electrified, false otherwise.

{% code lineNumbers="true" %}
```lua
auto(200)
if islectrified() and mp() >= 30 and vocation() == 'druid' then
    cast('exana vis')
    wait(100, 200)
end
```
{% endcode %}

_Each 200 milliseconds, it will check if you are electrified and you are 'druid' and you have more than 30 of mana. If so, it will cast 'cure electrification' spell._