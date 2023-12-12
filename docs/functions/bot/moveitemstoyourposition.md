#moveitemstoyourposition(position)

Move all items from position under yourself

{% code lineNumbers="true" %}
```lua
local selfposition = position()
moveitemstoyourposition(selfposition.y + 1)
```
{% endcode %}

_Will move all objects from one sqm north from you to your position._