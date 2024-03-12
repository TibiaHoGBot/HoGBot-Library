# windowcount()

Returns amount of windows opened or true if backpacks names written

{% code lineNumbers="true" %}
```lua
if windowcount() > 3 then
  gotolabel("ToExp")
end
```
```lua
if windowcount("Moon Backpack","Red Backpack") then
  gotolabel("ToExp")
end
```
{% endcode %}
