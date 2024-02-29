# cancast()

Returns true if You can cast the spell

{% code lineNumbers="true" %}
```lua
auto(100)
if hppc() < 50 and cancast("exura gran") then
    cast('exura gran')
    waitping()
end
```

{% endcode %}

_Each 100 milliseconds, it will check if you have less than 50% of health and You can cast spell. If yes it will use exura gran spell._
