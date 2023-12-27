# hppc()

Returns your character's health percentage

{% code lineNumbers="true" %}
```lua
auto(100)
if hppc() < 50 then
    cast('exura gran')
    wait(50, 100)
end
```

{% endcode %}

_Each 100 milliseconds, it will check if you have less than 50% of health. If yes it will use exura gran spell._