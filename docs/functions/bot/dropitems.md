# dropitems(itemid, amount, position)

Drops amount of specified items on position

{% code lineNumbers="true" %}
```lua
local selfposition = selfposition()
auto(1000)
    dropitems(3031, 1, selfposition)
```

{% endcode %}

_Each one second, it will drop 1 gold coin under yourself._