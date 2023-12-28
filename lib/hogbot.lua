--[[
    This file is part of the Tibia HoGBot (https://github.com/TibiaHoGBot/HoGBot-Library).
    Copyright (c) 2023 TIBIAHOGBOT LLC.

    This program is free software: you can redistribute it and/or modify  
    it under the terms of the GNU General Public License as published by  
    the Free Software Foundation, version 3.

    This program is distributed in the hope that it will be useful, but 
    WITHOUT ANY WARRANTY; without even the implied warranty of 
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU 
    General Public License for more details.

    You should have received a copy of the GNU General Public License 
    along with this program. If not, see <http://www.gnu.org/licenses/>.
--]] --[[
        Constants
--]] CREATURE_TYPE_PLAYER = 0
CREATURE_TYPE_MONSTER = 1
CREATURE_TYPE_NPC = 2
CREATURE_TYPE_PLAYER_SUMMON = 3
CREATURE_TYPE_OTHER_SUMMON = 4

DIRECTION_NORTH = 0
DIRECTION_EAST = 1
DIRECTION_SOUTH = 2
DIRECTION_WEST = 3

INVENTORY_HELMET = 1
INVENTORY_NECKLACE = 2
INVENTORY_BACKPACK = 3
INVENTORY_ARMOR = 4
INVENTORY_SHIELD = 5
INVENTORY_WEAPON = 6
INVENTORY_LEGS = 7
INVENTORY_SHOES = 8
INVENTORY_RING = 9
INVENTORY_TRINKET = 10

ITEM_BANK = 1
ITEM_CLIP = 2
ITEM_BOTTOM = 3
ITEM_TOP = 4
ITEM_CONTAINER = 5
ITEM_CUMULATIVE = 6
ITEM_USABLE = 7
ITEM_FORCEUSE = 8
ITEM_MULTIUSE = 9
ITEM_LIQUIDPOOL = 12
ITEM_UNPASS = 13
ITEM_UNMOVE = 14
ITEM_UNSIGHT = 15
ITEM_AVOID = 16
ITEM_NO_MOVE_ANIMATION = 17
ITEM_TAKE = 18
ITEM_LIQUID_CONTAINER = 19
ITEM_HANG = 20
ITEM_HOOK = 21
ITEM_ROTATE = 22
ITEM_LIGHT = 23
ITEM_DONT_HIDE = 24
ITEM_TRANSLUCENT = 25
ITEM_SHIFT = 26
ITEM_HEIGHT = 27
ITEM_LYING_OBJECT = 28
ITEM_ANIMATE_ALWAYS = 29
ITEM_AUTOMAP = 30
ITEM_LENS_HELP = 31
ITEM_FULLBANK = 32
ITEM_IGNORE_LOOK = 33
ITEM_CLOTHES = 34
ITEM_DEFAULT_ACTION = 35
ITEM_MARKET = 36
ITEM_WRAP = 37
ITEM_UNWRAP = 38
ITEM_TOP_EFFECT = 39
ITEM_NPC_SALE_DATA = 40
ITEM_CHANGED_TO_EXPIRE = 41
ITEM_CORPSE = 42
ITEM_PLAYER_CORPSE = 43
ITEM_CYCLOPEDIA_ITEM = 44
ITEM_AMMO = 45
ITEM_SHOW_OFF_SOCKET = 46
ITEM_REPORTABLE = 47
ITEM_UPGRADE_CLASSIFICATION = 48
ITEM_REVERSE_ADDONS_EAST = 49
ITEM_REVERSE_ADDONS_WEST = 50
ITEM_REVERSE_ADDONS_SOUTH = 51
ITEM_REVERSE_ADDONS_NORTH = 52
ITEM_WEAROUT = 53
ITEM_CLOCK_EXPIRE = 54
ITEM_EXPIRE = 55
ITEM_EXPIRE_STOP = 56
ITEM_DECO_ITEM_KIT = 57

MESSAGE_TYPE_SAY = 1
MESSAGE_TYPE_WHISPER = 2
MESSAGE_TYPE_YELL = 3
MESSAGE_TYPE_NPC_TO = 12
MESSAGE_TYPE_LOOK = 22
MESSAGE_TYPE_STATUS = 30
MESSAGE_TYPE_LOOT = 31

PLAYER_FLAGS_POISON = 1
PLAYER_FLAGS_FIRE = 2
PLAYER_FLAGS_ENERGY = 4
PLAYER_FLAGS_DRUNK = 8
PLAYER_FLAGS_MANA_SHIELD = 16
PLAYER_FLAGS_PARALYSED = 32
PLAYER_FLAGS_HASTE = 64
PLAYER_FLAGS_BATTLE = 128
PLAYER_FLAGS_DROWNING = 256
PLAYER_FLAGS_FREEZING = 512
PLAYER_FLAGS_DAZZLING = 1024
PLAYER_FLAGS_CURSED = 2048
PLAYER_FLAGS_STRENGTHENED = 4096
PLAYER_FLAGS_RED_SWORDS = 8192
PLAYER_FLAGS_PROTECTION_ZONE = 16384
PLAYER_FLAGS_BLEEDING = 32768
PLAYER_FLAGS_LESSER_HEX = 65536
PLAYER_FLAGS_INTENSE_HEX = 131072
PLAYER_FLAGS_GREATER_HEX = 262144
PLAYER_FLAGS_ROOTED = 524288
PLAYER_FLAGS_FEARED = 1048576
PLAYER_FLAGS_GOSHNAR_1 = 2097152
PLAYER_FLAGS_GOSHNAR_2 = 4194304
PLAYER_FLAGS_GOSHNAR_3 = 8388608
PLAYER_FLAGS_GOSHNAR_4 = 16777216
PLAYER_FLAGS_GOSHNAR_5 = 33554432
PLAYER_FLAGS_MANA_SHIELD_NEW = 67108864

STEP_DIRECTION_EAST = 1
STEP_DIRECTION_NORTH_EAST = 2
STEP_DIRECTION_NORTH = 3
STEP_DIRECTION_NORTH_WEST = 4
STEP_DIRECTION_WEST = 5
STEP_DIRECTION_SOUTH_WEST = 6
STEP_DIRECTION_SOUTH = 7
STEP_DIRECTION_SOUTH_EAST = 8

TILE_DEPOT_SWITCH = 31501

--[[
        User functions
--]]
-- @name    hppc
-- @desc    amount of current health percent
-- @author  Dworak
-- @returns number

function hppc()
    local currentHP = hp()
    local maxHP = maxhp()

    if currentHP > 0 and maxHP > 0 then
        local percentage = (currentHP / maxHP) * 100
        return percentage
    else
        return 0
    end
end

-- @name    mppc
-- @desc    amount of current mana percent
-- @author  Dworak
-- @returns number

function mppc()
    local currentMP = mp()
    local maxMP = maxmp()

    if currentMP > 0 and maxMP > 0 then
        local percentage = (currentMP / maxMP) * 100
        return percentage
    else
        return 0
    end
end

-- @name    hasitem
-- @desc    check if player has any item by id
-- @author  dulec
-- @returns boolean

function hasitem(itemid)
    if type(itemid) ~= "number" then error("itemid must be number") end

    local containers = getcontainers()

    for _, container in ipairs(containers) do
        for _, item in ipairs(container.items) do
            if item.id == itemid then return true end
        end
    end
    return false
end

-- @name    getitemsontile
-- @desc    get all items on specific tile
-- @author  dulec
-- @returns table

function getitemsontile(position)
    -- if getmetatable(position) ~= Position then
    --    error("position must be Position")
    -- end

    local tiles = gettiles()
    for _, tile in ipairs(tiles) do
        if tile.position.x == position.x and tile.position.y == position.y then
            return tile.items
        end
    end
end

-- @name    moveallitemsonground
-- @desc    move all items from position to destination
-- @author  dulec
-- @returns nil

function moveallitemsonground(position, destination)
    -- if getmetatable(position) ~= Position or getmetatable(destination) ~= Position then
    --    error("All arguments must be Positions")
    -- end

    local itemsToMove = getitemsontile(position)

    -- TODO: refactor and use itempropety(itemId, ITEM_IS_MOVABLE) to skip
    -- non-movable items
    table.remove(itemsToMove, 1)

    for i = 1, #itemsToMove, 1 do
        local itemToRemove = itemsToMove[i]
        local count = itemToRemove.count

        if itemToRemove.count == 0 then count = 1 end

        moveobject(position, itemToRemove.id, 1, destination, count)
        waitping()
    end
end

-- @name    moveallitemstoyourposition
-- @desc    move all items from position to your position
-- @author  dulec
-- @returns nil

function moveallitemstoyourposition(position)
    return moveallitemsonground(position, selfposition())
end

-- @name    getitemstackpos
-- @desc    get stackpost of item from the tile
-- @author  szulak
-- @returns stack pos of item

function getitemstackpos(tile, itemid)
    for i = 1, #tile.items, 1 do
        if tile.items[i].id == itemid then return i - 1 end
    end

    return 0
end

-- @name    moveitemonground
-- @desc    move items from position to destination
-- @author  dulec
-- @returns nil

function moveitemonground(position, destination, itemid, amount)
    if type(itemid) ~= "number" or type(amount) ~= "number" then
        error("itemid and amount must be numbers")
    end

    -- if getmetatable(position) ~= Position or getmetatable(destination) ~= Position then
    --    error("position and destination arguments must be Positions")
    -- end

    -- TODO: add check if there are enough items on position tile

    local tile = gettile(position)
    local stackpos = getitemstackpos(tile, itemid)

    while amount > 0 do
        if amount >= 100 then
            moveobject(position, itemid, stackpos, destination, 100)
            amount = amount - 100
        else
            moveobject(position, itemid, stackpos, destination, amount)
            amount = 0
        end
        waitping()
    end
end

-- @name    countitems
-- @desc    amount of items in cointainers by id
-- @author  dulec
-- @returns number

function countitems(itemid)
    if type(itemid) ~= "number" then error("All arguments must be numbers") end

    local containers = getcontainers()
    local count = 0

    for _, container in ipairs(containers) do
        for _, item in ipairs(container.items) do
            if item.id == itemid then
                if item.count == 0 then
                    count = count + 1
                else
                    count = count + item.count
                end
            end
        end
    end
    return count
end

-- @name    getitempositionfromcontainers
-- @desc    search all your containers until find first item with itemid and returns its position
-- @author  dulec
-- @returns Position

function getitempositionfromcontainers(itemid)
    if type(itemid) ~= "number" then error("All arguments must be numbers") end

    local containers = getcontainers()
    for _, container in ipairs(containers) do
        for j, item in ipairs(container.items) do
            if item.id == itemid then
                return Position:new(0xffff, 0x40 + container.id, j - 1)
            end
        end
    end
end

-- @name    dropitems
-- @desc    drop specific items on floor, position optional(if nil will drop on self)
-- @author  dulec
-- @returns nil

function dropitems(itemid, amount, position)
    if type(itemid) ~= "number" or type(amount) ~= "number" and type(amount) ~=
        nil then error("All arguments must be numbers") end

    if position == nil then position = selfposition() end

    local itemscount = countitems(itemid)
    if itemscount < amount then amount = itemscount end

    while amount > 0 do
        local itemposition = getitempositionfromcontainers(itemid)

        if (itemposition == nil) then return end

        if amount >= 100 then
            moveobject(itemposition, itemid, itemposition.z, position, 100)
            amount = amount - 100
        else
            moveobject(itemposition, itemid, itemposition.z, position, amount)
            amount = 0
        end
        waitping()
    end
end

-- @name    selfposition
-- @desc    return self position
-- @author  dulec
-- @returns Position

function selfposition() return Position:new(posx(), posy(), posz()) end

-- @name    buyitemsupto
-- @desc    buy specific items up to amount
-- @author  dulec
-- @returns nil

function buyitemsupto(itemid, amount, ignorecap, withbackpacks)
    if type(itemid) ~= "number" or type(amount) ~= "number" then
        error("All arguments must be numbers")
    end

    ignorecap = ignorecap or false
    withbackpacks = withbackpacks or false
    buyobject(itemid, amount - countitems(itemid), ignorecap, withbackpacks)
    waitping()
end

-- @name    destroyobject
-- @desc    use itemid on objectid until it exists in position
-- @author  dulec
-- @returns nil
function destroyobject(position, objectid, itemid)
    if type(itemid) ~= "number" or type(objectid) ~= "number" then
        error("itemid and objectid must be numbers")
    end
    -- if getmetatable(position) ~= Position then
    --    error("position must be Position")
    -- end

    local toolposition = getitempositionfromcontainers(itemid)
    if toolposition == nil then error("You don't have specified tool") end

    local tile = getitemsontile(position)
    local objectindex = finditemindex(tile, objectid)

    while objectindex ~= -1 do
        usetwoobjects(toolposition, itemid, toolposition.z, position, objectid,
                      objectindex)
        tile = getitemsontile(position)
        objectindex = finditemindex(tile, objectid)
        waitping()
    end
end

-- @name    topitem
-- @desc    top item id on tile
-- @author  szulak
-- @returns userdata

function topitem(position)
    local tile = gettile(position)
    local checkflags = {ITEM_BANK, ITEM_CLIP, ITEM_BOTTOM, ITEM_TOP}

    for i = 1, #tile.items, 1 do
        local itemid = tile.items[i].id

        skipitem = false
        for j = 1, #checkflags, 1 do
            if (itemproperty(itemid, checkflags[j])) then
                skipitem = true
            end
        end

        if skipitem == false then return tile.items[i] end
    end

    return tile.items[#tile.items]
end

-- @name    useitemonground
-- @desc    use itemid on object on ground
-- @author  dulec
-- @returns nil

function useitemonground(itemid, position)
    if type(itemid) ~= "number" then error("itemid must be number") end

    -- if getmetatable(position) ~= Position then
    --    error("position must be Position")
    -- end

    local itempos = getitempositionfromcontainers(itemid)
    if itempos == nil then error("You don't have specified item") end

    items = getitemsontile(position)
    for i = 1, #items, 1 do print("item id: " .. items[i].id) end

    usetwoobjects(itempos, itemid, itempos.z, position, items[1].id, 0)
end

-- @name    pickupitems
-- @desc    pickup amount of specified items from position to your backpack
-- @author  dulec
-- @returns nil

function pickupitems(position, itemid, amount, containerid)
    if type(itemid) ~= "number" or type(amount) ~= "number" then
        error("itemid and amount must be numbers")
    end
    -- if getmetatable(position) ~= Position then
    --    error("position must be Position")
    -- end

    containerid = containerid or 0
    amount = amount or 100

    local itemindex = finditemindex(getitemsontile(position), itemid)
    if itemindex == -1 then return end

    local containers = getcontainers()
    for i, container in ipairs(containers) do
        if container.id == containerid then
            for j, slot in ipairs(container.items) do
                if not itemproperty(slot.id, ITEM_CONTAINER) then
                    moveobject(position, itemid, itemindex,
                               Position:new(0xffff, 0x40 + container.id, j - 1),
                               amount)
                    waitping()
                end
            end
        end
    end
end

-- @name    knowspell
-- @desc    check if character know spell by id
-- @author  dulec
-- @returns boolean

function knowspell(spellid)
    if type(spellid) ~= "number" then error("itemid must be number") end

    spells = knownspells()
    for _, spell in ipairs(spells) do
        if spellid == spell.id then return true end
    end
    return false
end

-- @name    levitate
-- @desc    cast spell levitate until floor index changes
-- @author  dulec
-- @returns nil

function levitate(spell)
    if type(spell) ~= "string" then error("spell must be string") end

    if mp() > 50 and level() >= 12 and knownspells(81) then
        local currentz = posz()
        while currentz == posz() do
            talk(MESSAGE_TYPE_SAY, spell)
            wait(1000)
        end
    end
end

-- @name    reachgrounditem
-- @desc    reach itemid on ground
-- @author  dulec
-- @returns boolean

function reachgrounditem(itemid, avoid)
    if type(itemid) ~= "number" or type(avoid) ~= "number" and type(avoid) ~=
        nil then error("itemid must be number") end

    avoid = avoid or 0
    local tiles = gettiles()
    for _, tile in ipairs(tiles) do
        if finditemindex(tile.items, avoid) == -1 then
            for _, item in ipairs(tile.items) do
                if item.id == itemid then
                    reachlocation(tile.position.x, tile.position.y,
                                  tile.position.z)
                    return true
                end
            end
        end
    end
    return false
end

-- @name    reachdp
-- @desc    reaches nearest available depot
-- @author  dulec
-- @returns boolean

function reachdp()
    local creatureid = 99

    -- TODO: this needs to be a lil bit more fancy - as the depot
    -- can be taken while the character is moving

    return reachgrounditem(TILE_DEPOT_SWITCH, creatureid)
end

-- @name    openholeandwalkin
-- @desc    keep trying to open hole and walk in until floor changes
-- @author  dulec
-- @returns boolean
function openholeandwalkin(direction, shovelid)
    if type(direction) ~= "string" then error("direction must be string") end

    local diginposition = selfposition
    direction = string.lower(direction)
    if string.find(direction, "north") then
        diginposition.y = diginposition.y + 1
    end
    if string.find(direction, "east") then
        diginposition.x = diginposition.x + 1
    end
    if string.find(direction, "south") then
        diginposition.y = diginposition.y - 1
    end
    if string.find(direction, "west") then
        diginposition.x = diginposition.x - 1
    end

    -- TODO: this is tricky, since changing floor up/down offsets player
    -- .x and .y positon by +1 or -1 - thus, second reachlocation won't work

    -- local originpos = selfposition()
    -- while originpos.z == selfposition().z do
    --    reachlocation(originpos.x, originpos.y, originpos.z)
    --    useitemonground(shovelid, diginposition)
    --    reachlocation(diginposition.x - 1, diginposition.y - 1, diginposition.z)
    --    waitping()
    -- end
end

-- @name    move
-- @desc    move your's character with choosen amount of steps
-- @author  Dworak
-- @returns nil

function move(direction, stepsAmount)
    local dir = nil
    stepsAmount = stepsAmount or 1

    if direction:lower() == "n" or direction:lower() == "north" then
        dir = STEP_DIRECTION_NORTH
    elseif direction:lower() == "ne" or direction:lower() == "north-east" or
        direction:lower() == "northeast" then
        dir = STEP_DIRECTION_NORTH_EAST
    elseif direction:lower() == "e" or direction:lower() == "east" then
        dir = STEP_DIRECTION_EAST
    elseif direction:lower() == "se" or direction:lower() == "south-east" or
        direction:lower() == "southeast" then
        dir = STEP_DIRECTION_SOUTH_EAST
    elseif direction:lower() == "s" or direction:lower() == "south" then
        dir = STEP_DIRECTION_SOUTH
    elseif direction:lower() == "sw" or direction:lower() == "south-west" or
        direction:lower() == "southwest" then
        dir = STEP_DIRECTION_SOUTH_WEST
    elseif direction:lower() == "w" or direction:lower() == "west" then
        dir = STEP_DIRECTION_WEST
    elseif direction:lower() == "nw" or direction:lower() == "north-west" or
        direction:lower() == "northwest" then
        dir = STEP_DIRECTION_NORTH_WEST
    else
        return
    end

    for i = 1, stepsAmount do
        step(dir)
        waitping()
    end
end

-- @name    turn
-- @desc    turn your's character with choosen direction
-- @author  Dworak
-- @returns nil

function turn(direction)
    local dir = nil

    if direction:lower() == "n" or direction:lower() == "north" then
        dir = DIRECTION_NORTH
    elseif direction:lower() == "e" or direction:lower() == "east" then
        dir = DIRECTION_EAST
    elseif direction:lower() == "s" or direction:lower() == "south" then
        dir = DIRECTION_SOUTH
    elseif direction:lower() == "w" or direction:lower() == "west" then
        dir = DIRECTION_WEST
    else
        return
    end

    rotate(dir)
end

-- @name    ispoisoned
-- @desc    returns true if your character is poisoned
-- @author  Dworak
-- @returns boolean

function ispoisoned() return playerflag(PLAYER_FLAGS_POISON) end

-- @name    isburning
-- @desc    returns true if your character is burning
-- @author  Dworak
-- @returns boolean

function isburning() return playerflag(PLAYER_FLAGS_FIRE) end

-- @name    iselectrified
-- @desc    returns true if your character is electrified
-- @author  Dworak
-- @returns boolean

function iselectrified() return playerflag(PLAYER_FLAGS_ENERGY) end

-- @name    isdrunk
-- @desc    returns true if your character is drunk
-- @author  Dworak
-- @returns boolean

function isdrunk() return playerflag(PLAYER_FLAGS_DRUNK) end

-- @name    ismanashielded
-- @desc    returns true if your character is manashielded
-- @author  Dworak
-- @returns boolean

function ismanashielded()
    return playerflag(PLAYER_FLAGS_MANA_SHIELD) or
               playerflag(PLAYER_FLAGS_MANA_SHIELD_NEW)
end

-- @name    isparalysed
-- @desc    returns true if your character is paralysed
-- @author  Dworak
-- @returns boolean

function isparalysed() return playerflag(PLAYER_FLAGS_PARALYSED) end

-- @name    ishasted
-- @desc    returns true if your character is hasted
-- @author  Dworak
-- @returns boolean

function ishasted() return playerflag(PLAYER_FLAGS_HASTE) end

-- @name    isbattlesigned
-- @desc    returns true if your character is battlesigned
-- @author  Dworak
-- @returns boolean

function isbattlesigned() return playerflag(PLAYER_FLAGS_BATTLE) end

-- @name    isdrowning
-- @desc    returns true if your character is drowning
-- @author  Dworak
-- @returns boolean

function isdrowning() return playerflag(PLAYER_FLAGS_DROWNING) end

-- @name    isfreezing
-- @desc    returns true if your character is freezing
-- @author  Dworak
-- @returns boolean

function isfreezing() return playerflag(PLAYER_FLAGS_FREEZING) end

-- @name    isdazzled
-- @desc    returns true if your character is dazzled
-- @author  Dworak
-- @returns boolean

function isdazzled() return playerflag(PLAYER_FLAGS_DAZZLING) end

-- @name    iscursed
-- @desc    returns true if your character is cursed
-- @author  Dworak
-- @returns boolean

function iscursed() return playerflag(PLAYER_FLAGS_CURSED) end

-- @name    isstrengthened
-- @desc    returns true if your character is strengthened
-- @author  Dworak
-- @returns boolean

function isstrengthened() return playerflag(PLAYER_FLAGS_STRENGTHENED) end

-- @name    ispvpsigned
-- @desc    returns true if your character is pvp singed
-- @author  Dworak
-- @returns boolean

function ispvpsigned() return playerflag(PLAYER_FLAGS_RED_SWORDS) end

-- @name    ispzone
-- @desc    returns true if your character is in protection zone
-- @author  Dworak
-- @returns boolean

function ispzone() return playerflag(PLAYER_FLAGS_PROTECTION_ZONE) end

-- @name    isbleeding
-- @desc    returns true if your character is bleeding
-- @author  Dworak
-- @returns boolean

function isbleeding() return playerflag(PLAYER_FLAGS_BLEEDING) end

-- @name    ishexed
-- @desc    returns hex level if your character is hexed
-- @author  Dworak
-- @returns number

function ishexed()
    if playerflag(PLAYER_FLAGS_GREATER_HEX) then
        return 3
    elseif playerflag(PLAYER_FLAGS_INTENSE_HEX) then
        return 2
    elseif playerflag(PLAYER_FLAGS_LESSER_HEX) then
        return 1
    else
        return 0
    end
end

-- @name    isstrengthened
-- @desc    returns true if your character is strengthened
-- @author  Dworak
-- @returns boolean

function isrooted() return playerflag(PLAYER_FLAGS_ROOTED) end

-- @name    isstrengthened
-- @desc    returns true if your character is strengthened
-- @author  Dworak
-- @returns boolean

function isfeared() return playerflag(PLAYER_FLAGS_FEARED) end

-- @name    isgoshnar
-- @desc    returns taint level if your character has taints
-- @author  Dworak
-- @returns number

function isgoshnar()
    if playerflag(PLAYER_FLAGS_GOSHNAR_5) then
        return 5
    elseif playerflag(PLAYER_FLAGS_GOSHNAR_4) then
        return 4
    elseif playerflag(PLAYER_FLAGS_GOSHNAR_3) then
        return 3
    elseif playerflag(PLAYER_FLAGS_GOSHNAR_2) then
        return 2
    elseif playerflag(PLAYER_FLAGS_GOSHNAR_1) then
        return 1
    else
        return 0
    end
end

-- @name    creatureonscreen
-- @desc    check if monster/player/NPC is on screen
-- @author  Loro
-- @returns bool

function creatureonscreen(name)
    if type(name) ~= "string" then error("Monster name must be a string") end

    local creatures = getcreatures()

    for _, c in ipairs(creatures) do if c.name == name then return true end end

    return false
end

-- @name    paround
-- @desc    return number of players in range
-- @author  Loro
-- @returns number

function paround(range)
    if type(range) ~= "number" then error("Range must be a number") end

    local creatures = getcreatures()
    local playersAround = 0

    for _, c in ipairs(creatures) do
        if math.floor(c.dist) <= range and c.type == CREATURE_TYPE_PLAYER then
            playersAround = playersAround + 1
        end
    end

    return playersAround
end

-- @name    maround
-- @desc    return number of players in range
-- @author  Loro
-- @returns number

function maround(range)
    if type(range) ~= "number" then error("Range must be a number") end

    local creatures = getcreatures()
    local monstersAround = 0

    for _, c in ipairs(creatures) do
        if math.floor(c.dist) <= range and c.type == CREATURE_TYPE_MONSTER then
            monstersAround = monstersAround + 1
        end
    end

    return monstersAround
end

-- @name    saround
-- @desc    return number of summons in range
-- @author  Loro
-- @returns number

function saround(range)
    if type(range) ~= "number" then error("Range must be a number") end

    local creatures = getcreatures()
    local around = 0

    for _, c in ipairs(creatures) do
        if math.floor(c.dist) <= range and
            (c.type == CREATURE_TYPE_PLAYER_SUMMON or c.type ==
                CREATURE_TYPE_OTHER_SUMMON) then around = around + 1 end
    end

    return around
end

-- @name    naround
-- @desc    return number of NPC in range
-- @author  Loro
-- @returns number

function naround(range, name)
    if type(range) ~= "number" then error("Range must be a number") end

    local creatures = getcreatures()
    local around = 0

    for _, c in ipairs(creatures) do
        if name ~= nil and c.name == name then return 1 end

        if math.floor(c.dist) <= range and c.type == CREATURE_TYPE_NPC then
            around = around + 1
        end
    end

    return around
end

-- @name    reachnpc
-- @desc    follows/reach npc range by name
-- @author  Loro
-- @returns nil

function reachnpc(name)
    if type(name) ~= "string" then error("Npc name must be a string") end

    local creatures = getcreatures()

    for _, c in ipairs(creatures) do
        if c.type == CREATURE_TYPE_NPC and c.name == name then
            local npcpos = c.position

            if tilereachable(npcpos.x, npcpos.y, npcpos.z) then
                follow(c.id)
                return
            end

            for x = 1, 3 do
                for y = 1, 3 do
                    if tilereachable(npcpos.x + x, npcpos.y + y, npcpos.z) then
                        reachlocation(npcpos.x + x, npcpos.y + y, npcpos.z)
                        return
                    end
                end
            end
        end
    end
end

-- @name    reachlocation
-- @desc    reach location specified by params
-- @author  szulak
-- @returns nil

function reachlocation(x, y, z)
    -- TODO: limit the amount of tries by either time or fixed number
    -- TODO: add error reporting
    while posx() ~= x or posy() ~= y do
        steplocation(x, y, z)
        waitping()
    end
end

-- @name    finditemindex
-- @desc    find item index in items table
-- @author  dulec
-- @returns number

function finditemindex(itemlist, itemid)
    if type(itemid) ~= "number" then error("itemid must be number") end

    if type(itemlist) ~= "table" then error("itemlist must be table") end

    if #itemlist < 1 then return -1 end

    for index, item in ipairs(itemlist) do
        if item.id == itemid then return index - 1 end
    end

    return -1
end

-- @name    sstime
-- @desc    check if its ss time (from 9:55 AM till 10:10 AM)
-- @author  spec8320
-- @returns boolean

function sstime() return 600 >= secondtillss() or 85800 <= secondtillss() end

-- @name    distance
-- @desc    distance between two points
-- @author  spec8320
-- @returns number

function distance(x1, y1, x2, y2)
    -- Check if all arguments are numbers
    if type(x1) ~= "number" or type(y1) ~= "number" or type(x2) ~= "number" or
        type(y2) ~= "number" then error("All arguments must be numbers") end

    -- Calculate the distance using the Euclidean formula
    local distance = math.sqrt((x2 - x1) ^ 2 + (y2 - y1) ^ 2)
    return distance
end

--[[
        Helper functions
--]]

-- @name    secondtillss
-- @desc    returns time till ss in seconds if 0 means that its ss time and 86400 means that there is 24h till next
-- @author  spec8320
-- @returns number

function secondtillss() return (36000 - cettime()) % 86400 end

-- @name    	distance
-- @desc    	distance between two points
-- @author     	spec8320
-- @returns     number

function distance(x1, y1, x2, y2)
    -- Check if all arguments are numbers
    if type(x1) ~= "number" or type(y1) ~= "number" or type(x2) ~= "number" or
        type(y2) ~= "number" then error("All arguments must be numbers") end

    -- Calculate the distance using the Euclidean formula
    local distance = math.sqrt((x2 - x1) ^ 2 + (y2 - y1) ^ 2)

    return distance
end

-- @name    cettime
-- @desc    get CET time
-- @author  spec8320
-- @returns number

function cettime() return utctime() - utcoffset() + cetoffset() end

-- @name    utctime
-- @desc    get UTC time
-- @author  spec8320
-- @returns number

function utctime()
    local t = os.date("!%X")

    -- Apparently os.date('!%X') returns the time with AM/PM appended on some
    -- computers; this ignores anything before and after the actual timestamp
    t = t:match("(%d%d:%d%d:%d%d)")

    return tosec(t)
end

-- @name    utcoffset
-- @desc    get UTC timezone offset
-- @author  spec8320
-- @returns number

function utcoffset()
    local now = os.time()
    return os.difftime(os.time(os.date("!*t", now)), now)
end

-- @name    cetoffset
-- @desc    get CET timezone offset
-- @author  spec8320
-- @returns number

function cetoffset()
    -- See the difference an 'n' can do?
    local function iscest()
        -- List taken from http://www.timeanddate.com/time/zone/germany/frankfurt
        local daylightDates = {
            [2013] = {90, 300},
            [2014] = {89, 299},
            [2015] = {88, 298},
            [2016] = {87, 304},
            [2017] = {85, 302},
            [2018] = {84, 301},
            [2019] = {90, 300},
            [2023] = {91, 301},
            [2024] = {87, 302},
            [2025] = {90, 300}
        }

        local now = os.date("!*t")
        local daylightDate = daylightDates[now.year]

        return now.yday >= daylightDate[1] and now.yday <= daylightDate[2]
    end

    return utcoffset() + tern(iscest(), 7200, 3600)
end

-- @name    tosec
-- @desc    converting date format to seconds
-- @author  spec8320
-- @returns number

function tosec(str)
    local sum, time, units, index = 0, str:token(nil, ":"),
                                    {86400, 3600, 60, 1}, 1

    for i = #units - #time + 1, #units do
        sum, index = sum + ((tonumber(time[index]) or 0) * units[i]), index + 1
    end

    return math.max(sum, 0)
end

-- @name    tern
-- @desc    Helper for the ternary operator that Lua lacks. Returns `expr2` if `expr1` is true, `expr3` otherwise.
-- @author  spec8320
-- @returns expr2 if expr1 is true, expr3 otherwise

function tern(expr1, expr2, expr3)
    if expr1 then
        return expr2
    else
        return expr3
    end
end

--[[
Extensions
--]]
-- @name    table.contains
-- @desc    extension method for table.contains functionality
-- @author  spec8320
-- @returns boolean

function table.contains(table, element)
    for _, value in pairs(table) do if value == element then return true end end
    return false
end

-- @name    token
-- @desc    split token string with delimiter
-- @author  spec8320
-- @returns string

function string:token(n, delimiter)
    delimiter = delimiter or " +"
    local result = {}
    local from = 1
    local delim_from, delim_to = self:find(delimiter, from)
    while delim_from do
        table.insert(result, self:sub(from, delim_from - 1))
        from = delim_to + 1
        delim_from, delim_to = self:find(delimiter, from)
    end
    table.insert(result, self:sub(from))
    if n then return result[n] end
    return result
end
