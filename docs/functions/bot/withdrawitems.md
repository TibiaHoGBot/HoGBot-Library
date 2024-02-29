# withdrawitems(fromContName, ...)

Moves specified items from container specified into destination containers

### In this example, the bot will take up to 20 rotten pieces of cloth into camouflage backpack and as many avalanche runes into yellow backpack till character's cap is 50 from the first depot box
{% code lineNumbers="true" %}
```lua
local rules = {
  { id = 3725, uptocount = 20, dest = "camouflage backpack" },
  { id = 3161, tocap = 50, dest = "yellow backpack", weight = 0.52 }
}
withdrawitems("depot box i", rules)
```
{% endcode %}





