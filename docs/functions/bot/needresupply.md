# needresupply(cap, ...)

Checks if cap is below number specified or if any of the items provided count is below given number

### In this example, if character's cap is below 50 or if brown mushrooms count inside camouflage backpack is below 20 or avalanches count (anywhere in the containers) is below 100, it will go to label "refill"
{% code lineNumbers="true" %}
```lua
local rules = {
  { id = 3725, count = 20, source = "camouflage backpack" }, -- brown mushrooms
  { id = 3161, count = 100 } -- avalanches
}

if needresupply(50, rules) then
  gotolabel("refill")
end
```
{% endcode %}
