keyq = {keyq.player=nil, keyq.key=nil}

-- event handling (Credit for most of this function goes to AngryKeystones/Keystone.lua: https://mods.curse.com/addons/wow/angry-keystones) 
local poorColor = select(4, GetItemQualityColor(LE_ITEM_QUALITY_POOR))
local epicColor = select(4, GetItemQualityColor(LE_ITEM_QUALITY_EPIC))
local frame = CreateFrame("FRAME", "mkmFrame")
frame:RegisterEvent("CHAT_MSG_BN_WHISPER")
frame:RegisterEvent("CHAT_MSG_WHISPER")
local function parseWhispers(self, event, msg, sender, ...)
	local msg2 = msg:gsub("(|c"..epicColor.."|Hitem:138019:([0-9:]+)|h(%b[])|h|r)", function(msg, itemString, itemName)
		local info = { strsplit(":", itemString) }
		local mapID = tonumber(info[13])
		local mapLevel = tonumber(info[14])
		if not mapID or not mapLevel then return end

		local offset = 15
		if mapLevel >= 4 then offset = offset + 1 end
		if mapLevel >= 7 then offset = offset + 1 end
		if mapLevel >= 10 then offset = offset + 1 end
		local depleted = info[offset] ~= "1"

		if depleted then
			--return msg:gsub("|c"..epicColor, "|c"..poorColor)
			return
		else
			-- return msg
		end
	end)
	msg2 = msg2:gsub("(|Hitem:138019:([0-9:]+)|h(%b[])|h)", function(msg, itemString, itemName)
		local info = { strsplit(":", itemString) }
		local mapID = tonumber(info[13])
		local mapLevel = tonumber(info[14])

		if mapID and mapLevel then
			local mapName = C_ChallengeMode.GetMapInfo(mapID)
			--return msg:gsub(itemName:gsub("(%W)","%%%1"), format(Addon.Locale.keystoneFormat, mapName, mapLevel))
		else
			--return msg
		end
	end)
	if msg2 ~= msg then
		--return false, msg2, ...
	end
end
frame:SetScript("OnEvent", parseWhispers)
