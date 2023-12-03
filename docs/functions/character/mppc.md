# mppc()

Returns your character's mana percentage

{% code lineNumbers="true" %}
```lua
auto(100)
if mppc() < 50 then
    useoncreature('great mana potion', self())
    wait(50, 100)
end
```
{% endcode %}

_Each 100 milliseconds, it will check if you have less than 50% of mana. If yes it will use 'great mana potion' on yourself._