# moveitemonground(position, destination, itemid, amount)

Move amount of specified objects from specified position to specified destination

{% code lineNumbers="true" %}
```lua
local selfposition = selfposition()
moveitemonground(selfposition.y + 1, selfposition.y -1, 3031, 100)
```

{% endcode %}

_Will move 100 gold coins from north sqm to sqm south from you._