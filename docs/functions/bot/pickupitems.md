# pickupitems(position, itemid, amount, containerid)

Pick up amount of specified items from position to specified container. Parameters amount and containerid are optional. Default amount = 100, default container = 0 (main backpack)

{% code lineNumbers="true" %}
```lua
--Example 1
local selfposition = selfposition()
pickupitems(selfposition, 3031)
--Example 2
pickupitems(selfposition.y+1, 3031, 69, 2867)
```

{% endcode %}

Example 1: _Will pick up 100 gold coins from under you to your main backpack._
Example 2: _Will pick up 69 gold coins from one sqm north from you to your to your red backpack._