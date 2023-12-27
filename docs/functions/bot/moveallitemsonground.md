# moveallitemsonground(position, destination)

Move all objects from specified position to specified destination

{% code lineNumbers="true" %}
```lua
local selfposition = selfposition()
moveallitemsonground(selfposition.y + 1, selfposition.y -1)
```

{% endcode %}

_Will move all objects from north sqm to sqm south from you._