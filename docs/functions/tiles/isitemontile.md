# isitemontile(itemid, tile)

Returns true if item of given ID is found on the specified tile, false otherwise.

### checks if character (ID 99) is on the current character's position
{% code lineNumbers="true" %}
```lua
local tile = gettile(selfposition())

if isitemontile(99, tile) then
  print("character found")
end
```
{% endcode %}
