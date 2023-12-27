# moveallitemstoyourposition(position)

Move all objects from specified position to sqm you are standing

{% code lineNumbers="true" %}
```lua
local selfposition = selfposition()
getitemsontile(moveallitemstoyourposition(selfposition.y + 1))
```

{% endcode %}

_Will move all objects from north sqm under you._