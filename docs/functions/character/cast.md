# cast()

Cast the spell

{% code lineNumbers="true" %}
```lua
auto(100)
if hppc() < 50 then
    cast('exura gran')
    waitping()
end
```

{% endcode %}

_Each 100 milliseconds, it will check if you have less than 50% of health. If yes it will use exura gran spell._
