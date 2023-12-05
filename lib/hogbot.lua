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

--[[
        Built-in functions (implemented in C++)
--]]
