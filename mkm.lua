-- queue structure and functions
keyq = {name=nil, realm=nil, className=nil, mapName=nil, mapLevel=0, first=0, last=-1}
players = {}
--[[function keyq.pushleft (list, value)
    local first = list.first - 1
    list.first = first
    list[first] = value
end]]
    
function keyq.pushright (list, value)
	local last = list.last + 1
	list.last = last
    list[last] = value
end
    
function keyq.popleft (list)
	local first = list.first
    if first > list.last then error("self is empty") end
    local value = list[first]
    list[first] = nil        -- to allow garbage collection
    list.first = first + 1
    return value
end
    
--[[function keyq.popright (list)
    local last = list.last
    if list.first > last then error("self is empty") end
    local value = list[last]
    list[last] = nil         -- to allow garbage collection
    list.last = last - 1
    return value
end]]

-- event handling (Credit for most of parseWhispers goes to AngryKeystones/Keystone.lua: https://mods.curse.com/addons/wow/angry-keystones) 
local poorColor = select(4, GetItemQualityColor(LE_ITEM_QUALITY_POOR))
local epicColor = select(4, GetItemQualityColor(LE_ITEM_QUALITY_EPIC))

local frame = CreateFrame("FRAME", "mkmFrame")
frame:RegisterEvent("CHAT_MSG_BN_WHISPER")
frame:RegisterEvent("CHAT_MSG_WHISPER")

local function parseWhispers(self, event, msg, sender, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, guid, p_id, ...)
	local mapName, mapLevel
	local msg2 = msg:gsub("(|c"..epicColor.."|Hitem:138019:([0-9:]+)|h(%b[])|h|r)", function(msg, itemString, itemName)
		local info = { strsplit(":", itemString) }
		local mapID = tonumber(info[13])
		local mapLevel = tonumber(info[14])
		if not mapID or not mapLevel then return msg end

		local offset = 15
		if mapLevel >= 4 then offset = offset + 1 end
		if mapLevel >= 7 then offset = offset + 1 end
		if mapLevel >= 10 then offset = offset + 1 end
		local depleted = info[offset] ~= "1"

		if depleted then
			return nil
		else
			return msg
		end
	end)
	if msg2 == nil then
		return
	end
	msg2 = msg2:gsub("(|Hitem:138019:([0-9:]+)|h(%b[])|h)", function(msg, itemString, itemName)
		local info = { strsplit(":", itemString) }
		local mapID = tonumber(info[13])
		mapLevel = tonumber(info[14])

		if mapID and mapLevel then
			mapName = C_ChallengeMode.GetMapInfo(mapID)
			return msg:gsub(itemName:gsub("(%W)","%%%1"), format("%s: %s - Level %d", sender, mapName, mapLevel))
		else
			return msg
		end
	end)
	if msg2 ~= msg then
		if event == "CHAT_MSG_BN_WHISPER" then
		--add logic here
			a, b, c, d, e, bnetIDGameAccount = BNGetFriendInfoByID(p_id)
			_, name, garbage4, realm, garbage, garbage2, garbage3, className = BNGetGameAccountInfo(bnetIDGameAccount)
			if players[name] ~= true then
				keyq.pushright(keyq, {name=name, realm=realm, className=className, mapName=mapName, mapLevel=mapLevel})
				players[name] = true
			end
			print(name .. realm .. className .. mapName .. mapLevel)
			return
		else
			className, classId, raceName, raceId, gender, name, realm = GetPlayerInfoByGUID(tostring(guid))
			if players[name] ~= true then
				keyq.pushright(keyq, {name=name, realm=realm, className=className, mapName=mapName, mapLevel=mapLevel})
				players[name] = true
			end
			print(name .. realm .. className .. mapName .. mapLevel)
		end
	end
end
frame:SetScript("OnEvent", parseWhispers)
