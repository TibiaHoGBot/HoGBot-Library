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
--]]

--[[
        Constants
--]]

CREATURE_TYPE_PLAYER        = 0
CREATURE_TYPE_MONSTER       = 1
CREATURE_TYPE_NPC           = 2
CREATURE_TYPE_PLAYER_SUMMON = 3
CREATURE_TYPE_OTHER_SUMMON  = 4

DIRECTION_NORTH = 0
DIRECTION_EAST  = 1
DIRECTION_SOUTH = 2
DIRECTION_WEST  = 3

INVENTORY_HELMET    = 1
INVENTORY_NECKLACE  = 2
INVENTORY_BACKPACK  = 3
INVENTORY_ARMOR     = 4
INVENTORY_SHIELD    = 5
INVENTORY_WEAPON    = 6
INVENTORY_LEGS      = 7
INVENTORY_SHOES     = 8
INVENTORY_RING      = 9
INVENTORY_TRINKET   = 10

MESSAGE_TYPE_SAY        = 1
MESSAGE_TYPE_WHISPER    = 2
MESSAGE_TYPE_YELL       = 3
MESSAGE_TYPE_NPC_TO     = 12
MESSAGE_TYPE_LOOK       = 22
MESSAGE_TYPE_STATUS     = 30
MESSAGE_TYPE_LOOT       = 31

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

STEP_DIRECTION_EAST         = 1
STEP_DIRECTION_NORTH_EAST   = 2
STEP_DIRECTION_NORTH        = 3
STEP_DIRECTION_NORTH_WEST   = 4
STEP_DIRECTION_WEST         = 5
STEP_DIRECTION_SOUTH_WEST   = 6
STEP_DIRECTION_SOUTH        = 7
STEP_DIRECTION_SOUTH_EAST   = 8

--[[
        User functions
--]]

-- @name    	distance
-- @desc    	distance between two points
-- @author     	spec8320
-- @returns     number

function distance(x1, y1, x2, y2)
    -- Check if all arguments are numbers
    if type(x1) ~= "number" or type(y1) ~= "number" or type(x2) ~= "number" or type(y2) ~= "number" then
        error("All arguments must be numbers")
    end
    
    -- Calculate the distance using the Euclidean formula
    local distance = math.sqrt((x2 - x1)^2 + (y2 - y1)^2)
    
    return distance
end

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
    if type(itemid) ~= "number" then
        error("itemid must be number")
    end

    local containers = getcontainers()
    
    for _, container in ipairs(containers) do
        for _, item in ipairs(container.items) do
            if item.id == itemid then
                return true
            end
        end
    end
    return false
end

-- @name    getitemsontile
-- @desc    get all items on specific tile
-- @author  dulec
-- @returns table
function getitemsontile(position)
    if getmetatable(position) ~= Position then
        error('position must be Position')
    end

    local tiles = gettiles()
    for _, tile in ipairs(tiles) do
        if tile.position.x == position.x and tile.position.y == position.y then
            return tile
        end
    end
end

-- @name    moveallitemstoyourposition
-- @desc    move all items from position to your position 
-- @author  dulec
-- @returns nil
function moveallitemstoyourposition(position)
    if getmetatable(position) ~= Position then
        error('position must be Position')
    end

    local itemsToMove = getItemsOnTile(position)
    local selfPosition = selfposition()

    while #itemsToMove > 0 do
        moveobject(position, itemsToMove[-1], #itemsToMove, selfPosition, itemsToMove[-1].count)  
        table.remove(itemsToMove, itemsToMove[-1]) 
    end
end

-- @name    moveallitemsonground
-- @desc    move all items from position to destination
-- @author  dulec
-- @returns nil
function moveallitemsonground(position, destination)
    if getmetatable(position) ~= Position or getmetatable(destination) ~= Position then
        error('All arguments must be Positions')
    end

    local itemsToMove = getItemsOnTile(position)
    itemsToMove = table.remove(itemsToMove, 0)
    local selfPosition = selfposition()

    while #itemsToMove > 0 do
        moveobject(position, itemsToMove[-1], #itemsToMove, selfPosition, itemsToMove[-1].count) 
        table.remove(itemsToMove, itemsToMove[-1]) 
    end
end

-- @name    moveitemonground
-- @desc    move items from position to destination
-- @author  dulec
-- @returns nil
function moveitemonground(position, destination, itemid, amount)
    if type(itemid) ~= "number" or type(amount) ~= "number" then
        error("itemid and amount must be numbers")
    end 

    if getmetatable(position) ~= Position or getmetatable(destination) ~= Position then
        error('position and destination arguments must be Positions')
    end

    while amount > 0 then
        if amount >= 100 then
            moveobject(position, itemid, 0, destination, 100)
            amount -= 100 
        else
            moveobject(position, itemid, 0, destination, 100-amount) 
            amount = 0
        end
    end
end

-- @name    finditemindex
-- @desc    find item index in items table
-- @author  dulec
-- @returns number
function finditemindex(itemlist, itemid)
    if type(itemid) ~= "number" then
        error("itemid must be number")
    end

    if type(itemlist) ~= "table" then
        error("itemlist must be table")
    end

    if #itemlist < 1 then
        return -1
    end

    for index, item in ipairs(itemlist) do
        if item.id == itemid then
            return index
        end
    end

    return -1
end

-- @name    countitems
-- @desc    amount of items in cointainers by id
-- @author  dulec
-- @returns number
function countitems(itemid)
    if type(itemid) ~= "number" then
        error("All arguments must be numbers")
    end 

    local containers = getcontainers()
    local count = 0
    
    for _, container in ipairs(containers) do
        for _, item in ipairs(container.items) do
            if item.id == id then
                count += item.count
            end
        end
    end
    return count
end

-- @name    getitempositionfromcontainers
-- @desc    search all your containers until find first item with itemid and returns its position
-- @author  dulec
-- @returns position
function getitempositionfromcontainers(itemid)
    if type(itemid) ~= "number" then
        error("All arguments must be numbers")
    end 

    local containers = getcontainers()
    for i, container in ipairs(containers) do
        for j, item in ipairs(container.items) do
            if item == itemid then
                return Position:new(0xffff, 0x40 + i,  j)
            end
        end
    end
end

-- @name    dropitems
-- @desc    drop specific items on floor, position optional(if nil will drop on self)
-- @author  dulec
-- @returns nil
function dropitems(itemid, amount, position)
    if type(itemid) ~= "number" or type(amount) ~= "number" and type(amount) ~= nil then
        error("All arguments must be numbers")
    end 

    if position == nil then
        position = selfposition()
    end

    local itemscount = countitems(itemid)
    if itemscount < amount then
        amount = itemscount
    end

    while amount > 0 then
        local itemposition = getitempositionfromcontainers(itemid)

        if(itemposition == nil) then
            return
        end

        if amount >= 100 then
            moveobject(itemposition, itemid, 0, selfposition, 100)
            amount -= 100 
        else
            moveobject(itemposition, itemid, 0, selfposition, 100-amount) 
            amount = 0
        end
    end
end

-- @name    selfposition
-- @desc    return self position
-- @author  dulec
-- @returns Position
function selfposition()
    return Position:new(posx(), posy(),  posz())
end

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
end

-- @name    destroyobject
-- @desc    use itemid on object id until it exists in position
-- @author  dulec
-- @returns nil
function destroyobject(position, objectid, itemid)
    if type(itemid) ~= "number" or type(objectid) ~= "number" then
        error("itemid and objectid must be numbers")
    end 
    if getmetatable(position) ~= Position then
        error("position must be Position")
    end

    local toolposition = getitempositionfromcontainers(itemid)
    if tool == nil then
        error("You don't have specified tool")
    end

    local tile = getitemsontile(position)
    local objectindex = finditemindex(tile, objectid)
    while objectindex ~= -1 then
        usetwoobjects(toolposition, itemid, 0, position, objectid, objectindex)
        tile = getitemsontile(position)
        objectindex = finditemindex(tile, objectid)
    end

end
--[[
        Built-in functions (implemented in C++)
--]]
