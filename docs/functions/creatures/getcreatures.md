# getcreatures

```lua
table getcreatures()     
```

The code below will print on Local Chat names of all monsters visible on screen.

```lua
local creatures = getcreatures()

for _, c in ipairs(creatures) do
	talk(MESSAGE_TYPE.SAY, 'monster name:' .. c:name())
end
```
