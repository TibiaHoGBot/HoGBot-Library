# finditemindex(itemlist, itemid)

Retruns item index from list if found, -1 otherwise

{% code lineNumbers="true" %}
```lua
local mainbp = getcontainers()[0] 
local itemindex = finditemindex(mainbp, 3003)
```

{% endcode %}

_Will check your main bp for rope and returns its index._