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

-- @name    distance
-- @desc    distance between two points
-- @author  spec8320
-- @returns number

function distance(x1, y1, x2, y2)
    -- Check if all arguments are numbers
    if type(x1) ~= "number" or type(y1) ~= "number" or type(x2) ~= "number" or type(y2) ~= "number" then
        error("All arguments must be numbers")
    end
    
    -- Calculate the distance using the Euclidean formula
    local distance = math.sqrt((x2 - x1)^2 + (y2 - y1)^2)
    
    return distance
end

-- @name    creatureonscreen
-- @desc    check if monster/player/NPC is on screen
-- @author  Loro
-- @returns bool

function creatureonscreen(name)
    if type(name) ~= "string" then error("Monster name must be a string") end

	local creatures = getcreatures()

	for _, c in ipairs(creatures) do
		if c:name() == name then
			return true
		end
	end

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
		if math.floor(c:dist()) <= range and c:type() == CREATURE_TYPE_PLAYER then
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
		if math.floor(c:dist()) <= range and c:type() == CREATURE_TYPE_MONSTER then

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
		if math.floor(c:dist()) <= range and (c:type() == CREATURE_TYPE_PLAYER_SUMMON or c:type() == CREATURE_TYPE_OTHER_SUMMON) then
            around = around + 1
		end
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
        if name ~= nil and c:name() == name  then
            return 1;
        end

		if math.floor(c:dist()) <= range and c:type() == CREATURE_TYPE_NPC then
            around = around + 1
		end
	end

	return around
end


-- @name    reachnpc
-- @desc    follows/reach npc range by name
-- @author  Loro
-- @returns nothing

function reachnpc(name)
    if type(name) ~= "string" then error("Npc name must be a string") end

	local creatures = getcreatures()
    
	for _, c in ipairs(creatures) do
		if c:type() == CREATURE_TYPE_NPC and c:name() == name then
            local cPos = c:pos()
            local tile = gettiles(cPos.x, cPos.y, cPos.z)
            
            if tilereachable(tile) then 
                follow(c:id())

                return
            end
            -- TO FINISH WHEN GOTOXYZ WILL BE IMPLEMENTED
            -- for x = 1, 3 do
            --     for y = 1, 3 do 
            --         local tile = gettiles(cPos.x + x, cPos.y + y, cPos.z) 
                    
            --         if tilereachable(tile) then 
            --             walk(tile.x, tile.y, tile.z)

            --             return
            --         end
            --     end
            -- end

		end
	end
end

-- @name    reachlocation
-- @desc    reach location specified by params
-- @author  szulak
-- @returns nil

function reachlocation(x, y, z)
    while posx() ~= x or posy() ~= y do
        steplocation(x,y,z)
        wait(50)
    end
end





--[[
Extensions
--]]

function table.contains(table, element)
    for _, value in pairs(table) do
      if value == element then
        return true
      end
    end
    return false
  end

--[[
        Built-in functions (implemented in C++)
--]]