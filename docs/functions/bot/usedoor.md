# usedoor(position, action)

Opens or closes a door in position given. Returns true doors have been used to it's desired state.s

### open door at position one square above current character
{% code lineNumbers="true" %}
```lua
local position = Position:new(posx(), posy() - 1, posz())
usedoor(position, "open")   
```
{% endcode %}

### close door at position one square above current character
{% code lineNumbers="true" %}
```lua
local position = Position:new(posx(), posy() - 1, posz())
usedoor(position, "close")   
```
{% endcode %}

