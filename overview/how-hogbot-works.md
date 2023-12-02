# How HoGBot works?





Example of Lua code.

```lua
local containers = getcontainers()

for _, container in ipairs(containers) do
    message(MessageMode.Loot, 'container name:' .. container:name())
    local items = container:objects()
    
    for _, object in ipairs(items) do
    	message(MessageMode.Loot,  'item id:' .. object:id())
    end
    closecontainer(container:id())
    wait(500)
end
```

