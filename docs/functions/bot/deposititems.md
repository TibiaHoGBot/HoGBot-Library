# deposititems(fromBp, stackBoxIndex, nonStackBoxIndex)

Moves all items from backpack to specified depot boxes until it reaches the last loot bp with no more loot

### In this example it closes all containers, opens a loot backpack, reaches depot and deposit all items
{% code lineNumbers="true" %}
```lua
local mainBpItem = getinventory(INVENTORY_BACKPACK)
local lootBpId = 2854 -- green backpack

reopenbps({mainBpItem.id, "back"}, { 2854, "backpack", true}) waitping()
opendepot("depot")
deposititems("green backpack", 1, 2)
```
{% endcode %}


