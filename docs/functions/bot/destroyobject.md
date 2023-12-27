# destroyobject(position, objectid, itemid)

Use specified item on specified object with Position

{% code lineNumbers="true" %}
```lua
local selfposition = selfposition()
destroyobject(selfposition, 2030, 3270)
```

{% endcode %}

_Will use club(3270) on goblin statue(2030) until it's destroyed._