#countitems()

Returns amount of items you have by id

{% code lineNumbers="true" %}
```lua
auto(200)
if countitems(15793) < 50 then
    gotolabel('refill')
    wait(50, 100)
end
```
{% endcode %}

_Each 200 milliseconds, it will check if you have less than 50 crystalline arrows. If yes it will go to label 'refill'._