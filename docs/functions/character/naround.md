# naround(range, name)

Returns count of NPCs in range, if name parameter is provided it will check if NPC with given name is in range.

{% code lineNumbers="true" %}
```lua

local npc = "Frodo"

if naround(5, npc) then
    talk(MESSAGE_TYPE_SAY, "I can see " .. npc)
end
```
{% endcode %}

_This action will check if there is Frodo NPC 5 sqm away from your character._

