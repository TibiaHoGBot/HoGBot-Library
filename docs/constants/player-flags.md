# PLAYER\_FLAGS

The following flags are available to check player status.

```lua
PLAYER_FLAGS_POISON             = 1
PLAYER_FLAGS_FIRE               = 2
PLAYER_FLAGS_ENERGY             = 4
PLAYER_FLAGS_DRUNK              = 8
PLAYER_FLAGS_MANA_SHIELD        = 16
PLAYER_FLAGS_PARALYSED          = 32
PLAYER_FLAGS_HASTE              = 64
PLAYER_FLAGS_BATTLE             = 128
PLAYER_FLAGS_DROWNING           = 256
PLAYER_FLAGS_FREEZING           = 512
PLAYER_FLAGS_DAZZLING           = 1024
PLAYER_FLAGS_CURSED             = 2048
PLAYER_FLAGS_STRENGTHENED       = 4096
PLAYER_FLAGS_RED_SWORDS         = 8192
PLAYER_FLAGS_PROTECTION_ZONE    = 16384
PLAYER_FLAGS_BLEEDING           = 32768
PLAYER_FLAGS_LESSER_HEX         = 65536
PLAYER_FLAGS_INTENSE_HEX        = 131072
PLAYER_FLAGS_GREATER_HEX        = 262144
PLAYER_FLAGS_ROOTED             = 524288
PLAYER_FLAGS_FEARED             = 1048576
PLAYER_FLAGS_GOSHNAR_1          = 2097152
PLAYER_FLAGS_GOSHNAR_2          = 4194304
PLAYER_FLAGS_GOSHNAR_3          = 8388608
PLAYER_FLAGS_GOSHNAR_4          = 16777216
PLAYER_FLAGS_GOSHNAR_5          = 33554432
PLAYER_FLAGS_MANA_SHIELD_NEW    = 67108864
```

Example code of casting `exana flam` when the player has burning condition.

```lua
auto(200)

local isburning = playerflag(PLAYER_FLAGS_FIRE)

if isburning and mp() >= 30 and vocation() == 'druid' then
	cast('exana flam') 
	wait(300, 500)
end
```
