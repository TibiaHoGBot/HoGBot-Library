#hasitem()

Returns true if you have item by id otherwise returns false

{% code lineNumbers="true" %}
```lua
if hasitem(3457) then
    gotolabel('hunt')
else
    gotolabel('buyshovel')
end
```
{% endcode %}

_It will check if you have shovel. If yes it will go to label 'hunt', if not it will go to label 'buyshovel'._