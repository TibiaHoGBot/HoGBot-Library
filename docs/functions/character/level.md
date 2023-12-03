# level()

Returns your character's current level.

{% code lineNumbers="true" %}
```lua
auto(200)
if level >= 8 then
    gotolabel('gotomainland')
end
```
{% endcode %}

Each 200 milliseconds, it will check if you level is greater or equal 8. If so, it will change label and go to Mainland.
