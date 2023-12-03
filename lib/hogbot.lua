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


-- @name    hppc
-- @desc    amount of current health percent
-- @author     Dworak
-- @returns     number

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
-- @author     Dworak
-- @returns     number

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

-- @name    creatureonscreen
-- @desc    check if monster/player/NPC is on screen
-- @author     Loro
-- @returns     bool

function creatureonscreen(name)
    if type(name) ~= "string" then error("Npc name must be a string") end

	local creatures = getcreatures()

	for _, c in ipairs(creatures) do
		if c:name() == name and c:dist() <= 7 then
			return true
		end
	end

	return false
end

-- @name    paround
-- @desc    return number of players in range
-- @author     Loro
-- @returns     number

function paround(range)
    if type(range) ~= "number" then error("Range must be a number") end
	
    local creatures = getcreatures()
    local playersAround = 0

	for _, c in ipairs(creatures) do
		if math.floor(c:dist()) <= range and c:type() == CREATURE_TYPE.PLAYER then
            playersAround = playersAround + 1
		end
	end

	return playersAround
end

-- @name    maround
-- @desc    return number of players in range
-- @author     Loro
-- @returns     number

function maround(range)
    if type(range) ~= "number" then error("Range must be a number") end

	local creatures = getcreatures()
    local monstersAround = 0
    
	for _, c in ipairs(creatures) do
		if math.floor(c:dist()) <= range and c:type() == CREATURE_TYPE.MONSTER then

            monstersAround = monstersAround + 1
		end
	end

	return monstersAround
end

-- @name    saround
-- @desc    return number of summons in range
-- @author     Loro
-- @returns     number

function saround(range)
    if type(range) ~= "number" then error("Range must be a number") end

	local creatures = getcreatures()
    local around = 0
    
	for _, c in ipairs(creatures) do
		if math.floor(c:dist()) <= range and (c:type() == CREATURE_TYPE.PLAYER_SUMMON or c:type() == CREATURE_TYPE.OTHER_SUMMON) then
            around = around + 1
		end
	end

	return around
end


-- @name    naround
-- @desc    return number of NPC in range
-- @author     Loro
-- @returns     number

function naround(range, name)
    if type(range) ~= "number" then error("Range must be a number") end

	local creatures = getcreatures()
    local around = 0
    
	for _, c in ipairs(creatures) do
        if name ~= nil and c:name() == name  then
            return 1;
        end

		if math.floor(c:dist()) <= range and c:type() == CREATURE_TYPE.NPC then
            around = around + 1
		end
	end

	return around
end


-- @name    reachnpc
-- @desc    follows/reach npc range by name
-- @author     Loro
-- @returns     nothing

function reachnpc(name)
    if type(name) ~= "string" then error("Npc name must be a string") end

	local creatures = getcreatures()
    
	for _, c in ipairs(creatures) do
		if c:type() == CREATURE_TYPE.NPC and c:name() == name then
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


--   ______      __    __        ______     __                  _
--  /_  __/___ _/ /_  / /__     / ____/  __/ /____  ____  _____(_)___  ____
--   / / / __ `/ __ \/ / _ \   / __/ | |/_/ __/ _ \/ __ \/ ___/ / __ \/ __ \
--  / / / /_/ / /_/ / /  __/  / /____>  </ /_/  __/ / / (__  ) / /_/ / / / /
-- /_/  \__,_/_.___/_/\___/  /_____/_/|_|\__/\___/_/ /_/____/_/\____/_/ /_/
--


function table.contains(table, element)
    for _, value in pairs(table) do
      if value == element then
        return true
      end
    end
    return false
  end