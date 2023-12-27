# maround(range)

Returns number of monsters in range.

{% code lineNumbers="true" %}
```lua
auto(100)
if mppc() > 20 and maround(1) <= 2 then
    cast('exori')
    wait(50, 100)
end
```
{% endcode %}

_Each 100 milliseconds, it will check if you have more than 20% of mana and if there's more than 2 monsters. If yes it will use exura gran spell._

