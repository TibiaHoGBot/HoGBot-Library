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

-- @name    sstime
-- @desc    check if its ss time (from 9:55 AM till 10:10 AM)
-- @author  spec8320
-- @returns boolean

function sstime()
    return 600 >= secondtillss() or 85800 <= secondtillss()
end

--[[
        Helper functions
--]]

-- @name    secondtillss
-- @desc    returns time till ss in seconds if 0 means that its ss time and 86400 means that there is 24h till next
-- @author  spec8320
-- @returns number

function secondtillss()
    return (36000 - cettime()) % 86400
end

-- @name    cettime
-- @desc    get CET time
-- @author  spec8320
-- @returns number

function cettime()
    return utctime() - utcoffset() + cetoffset()
end

-- @name    utctime
-- @desc    get UTC time
-- @author  spec8320
-- @returns number

function utctime()
    local t = os.date('!%X')

    -- Apparently os.date('!%X') returns the time with AM/PM appended on some
    -- computers; this ignores anything before and after the actual timestamp
    t = t:match('(%d%d:%d%d:%d%d)')

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
            [2025] = {90, 300},
        }

        local now = os.date('!*t')
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
	local sum, time, units, index = 0, str:token(nil, ":"), {86400, 3600, 60, 1}, 1

	for i = #units - #time + 1, #units do
		sum, index = sum + ((tonumber(time[index]) or 0) * units[i]), index + 1
	end

	return math.max(sum, 0)
end

-- @name    tern
-- @desc    Helper for the ternary operator that Lua lacks. Returns `expr2` if `expr1` is true, `expr3` otherwise.
-- @author  spec8320
--
-- @param     {any}          expr1          - The expression to be evaluated
-- @param     {any}          expr2          - The expression to be returned if
--                                            `expr1` evaluates to true
-- @param     {any}          expr3          - The expression to be returned if
--                                            `expr1` evaluates to false
--
-- @returns   {any}                         - `expr2` or `expr3`
--
function tern(expr1, expr2, expr3)
    if expr1 then
        return expr2
    else
        return expr3
    end
end

-- @name    token
-- @desc    split token string with delimiter
-- @author  spec8320
-- @returns string

function string:token(n,delimiter)
	delimiter = delimiter or ' +'
	local result = {}
	local from = 1
	local delim_from, delim_to = self:find(delimiter,from)
	while delim_from do
		table.insert(result, self:sub(from,delim_from-1))
		from = delim_to + 1
		delim_from, delim_to = self:find(delimiter,from)
	end
	table.insert(result,self:sub(from))
	if n then
		return result[n]
	end
	return result
end

-- @name    move
-- @desc    move your's character with choosen amount of steps
-- @author     Dworak
-- @returns     nothing

function move(direction, stepsAmount)
  local dir
  stepsAmount = stepsAmount or 1

  if direction:lower() == "n" or direction:lower() == "north" then
    dir = STEP_DIRECTION_NORTH
  elseif direction:lower() == "ne" or direction:lower() == "north-east" or direction:lower() == "northeast" then
    dir = STEP_DIRECTION_NORTH_EAST
  elseif direction:lower() == "e" or direction:lower() == "east" then
    dir = STEP_DIRECTION_EAST
  elseif direction:lower() == "se" or direction:lower() == "south-east" or direction:lower() == "southeast" then
    dir = STEP_DIRECTION_SOUTH_EAST
  elseif direction:lower() == "s" or direction:lower() == "south" then
    dir = STEP_DIRECTION_SOUTH
  elseif direction:lower() == "sw" or direction:lower() == "south-west" or direction:lower() == "southwest" then
    dir = STEP_DIRECTION_SOUTH_WEST
  elseif direction:lower() == "w" or direction:lower() == "west" then
    dir = STEP_DIRECTION_WEST
  elseif direction:lower() == "nw" or direction:lower() == "north-west" or direction:lower() == "northwest" then
    dir = STEP_DIRECTION_NORTH_WEST
  else
    return
  end

  for i = 1, stepsAmount do
    step(dir)
  end
end


-- @name    turn
-- @desc    turn your's character with choosen direction
-- @author     Dworak
-- @returns     nothing

function turn(direction)
  local dir

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

-- @name    Player Flags
-- @desc    Return's player statuses
-- @author     Dworak
-- @returns     boolean or number

function ispoisoned()
  return playerflag(PLAYER_FLAGS_POISON)
end

function isburning()
  return playerflag(PLAYER_FLAGS_FIRE)
end

function islectrified()
  return playerflag(PLAYER_FLAGS_ENERGY)
end

function isdrunk()
  return playerflag(PLAYER_FLAGS_DRUNK)
end

function ismanashielded()
  return playerflag(PLAYER_FLAGS_MANA_SHIELD) or playerflag(PLAYER_FLAGS_MANA_SHIELD_NEW)
end

function isparalysed()
  return playerflag(PLAYER_FLAGS_PARALYSED)
end

function ishasted()
  return playerflag(PLAYER_FLAGS_HASTE)
end

function isbattlesigned()
  return playerflag(PLAYER_FLAGS_BATTLE)
end

function isdrowning()
  return playerflag(PLAYER_FLAGS_DROWNING)
end

function isfreezing()
  return playerflag(PLAYER_FLAGS_FREEZING)
end

function isdazzled()
  return playerflag(PLAYER_FLAGS_DAZZLING)
end

function iscursed()
  return playerflag(PLAYER_FLAGS_CURSED)
end

function isstrengthened()
  return playerflag(PLAYER_FLAGS_STRENGTHENED)
end

function ispvpsigned()
  return playerflag(PLAYER_FLAGS_RED_SWORDS)
end

function ispzone()
  return playerflag(PLAYER_FLAGS_PROTECTION_ZONE)
end

function isbleeding()
  return playerflag(PLAYER_FLAGS_BLEEDING)
end

function ishexed() -- Returns Number
  if playerflag(PLAYER_FLAGS_GREATER_HEX) then
    return 3
  elseif playerflag(PLAYER_FLAGS_INTENSE_HEX) then
    return 2
  elseif playerflag(PLAYER_FLAGS_LESSER_HEX) then
    return 1
  else
    return false
  end
end

function isrooted()
  return playerflag(PLAYER_FLAGS_ROOTED)
end

function isfeared()
  return playerflag(PLAYER_FLAGS_FEARED)
end

function isgoshnar() -- Returns Number
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
    return false
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