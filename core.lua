
-- GLOBALS
KQ_allowWhispers = true
KQ_saveWhenreloading = false
KQ_whisperMessage = ""
KQ_whisperSender = ""
KQ_HideSystemMSG = false

-- UIMAIN
local isUIMAINHidden = true
local isFirstRun = true
UIMAIN = CreateFrame("Frame", "KeystoneHelperMain", UIParent, "BasicFrameTemplateWithInset")
UIMAIN:Hide()
UIMAIN:SetSize(500, 350);
UIMAIN:SetPoint("CENTER", UIParent, "CENTER");
UIMAIN:SetMovable(true)
UIMAIN:EnableMouse(true)
UIMAIN:RegisterForDrag("LeftButton")
UIMAIN:SetScript("OnDragStart", UIMAIN.StartMoving)
UIMAIN:SetScript("OnDragStop", UIMAIN.StopMovingOrSizing)
UIMAIN:SetClampedToScreen(true)

local topBarString = UIMAIN:CreateFontString("$parrenttopbarstring", "ARTWORK", "GameFontNormal")
topBarString:SetText("Dcarterwww's Key Queue")
topBarString:SetPoint("TOP", UIMAIN, "TOP", 0, -5)


-- TAB TWO

local UIFrameTwo = CreateFrame("Frame", "KeystoneHelperFrametwo", UIMAIN);

local checkString = UIFrameTwo:CreateFontString("$parrentqueuecheck", "ARTWORK", "GameFontNormal")

checkString:SetPoint("TOP", UIMAIN, "TOP", -10, -37)




local applicantHeader = CreateFrame("Frame", "$parrentapplicantHeader", UIFrameTwo)
applicantHeader:SetSize(250,20)
applicantHeader:SetPoint("TOP", UIMAIN, "TOP", -10, -35)
local textureFrameHeader = applicantHeader:CreateTexture("ARTWORK")
textureFrameHeader:SetColorTexture(0.5, 0.5, 0.5, 0.2)
textureFrameHeader:SetAllPoints(applicantHeader)

local applicantSlider = CreateFrame("Slider", "$parrentSlider", UIFrameTwo)
applicantSlider:SetPoint("TOPLEFT", applicantHeader, "TOPRIGHT", 5 ,5)
applicantSlider:SetHeight(300)
applicantSlider:SetWidth(17)
applicantSlider:SetOrientation("VERTICAL") 
applicantSlider:SetMinMaxValues(0,1)
applicantSlider:SetValue(0)
applicantSlider:SetBackdrop({
	bgFile = "Interface\\Buttons\\UI-SliderBar-Background", 
  edgeFile = "Interface\\Buttons\\UI-SliderBar-Border",
  tile = true, tileSize = 8, edgeSize = 8, 
  insets = { left = 3, right = 3, top = 6, bottom = 6 }})

applicantSlider:SetObeyStepOnDrag(true)
applicantSlider:SetValueStep(1)
applicantSlider:SetThumbTexture("Interface\\Buttons\\UI-ScrollBar-Knob")

sliderMax = 1

applicantFrame = {}
applicantFrameTexture = {}

applicantFrame[0] = CreateFrame("Frame", "$parrentapplicant1", UIFrameTwo, "ApplicantTemplate")
applicantFrame[0]:SetPoint("TOP", applicantHeader, "BOTTOM", 0, 0)
applicantFrameTexture[0] = applicantFrame[0]:CreateTexture("ARTWORK")
applicantFrameTexture[0]:SetColorTexture(58/100, 48/100, 68/100, 0.1)
applicantFrameTexture[0]:SetAllPoints(applicantFrame[0])

 applicantFrame[1] = CreateFrame("Frame", "$parrentapplicant2", UIFrameTwo, "ApplicantTemplate")
applicantFrame[1]:SetPoint("TOP", applicantFrame[0], "BOTTOM")
 applicantFrameTexture[1] = applicantFrame[1]:CreateTexture("ARTWORK")
applicantFrameTexture[1]:SetColorTexture(48/100, 58/100, 68/100, 0.1)
applicantFrameTexture[1]:SetAllPoints(applicantFrame[1])

 applicantFrame[2] = CreateFrame("Frame", "$parrentapplicant3", UIFrameTwo, "ApplicantTemplate")
applicantFrame[2]:SetPoint("TOP", applicantFrame[1], "BOTTOM")
 applicantFrameTexture[2] = applicantFrame[2]:CreateTexture("ARTWORK")
applicantFrameTexture[2]:SetColorTexture(48/100, 58/100, 68/100, 0.1)
applicantFrameTexture[2]:SetAllPoints(applicantFrame[2])

 applicantFrame[3] = CreateFrame("Frame", "$parrentapplicant1", UIFrameTwo, "ApplicantTemplate")
applicantFrame[3]:SetPoint("TOP", applicantFrame[2], "BOTTOM", 0, 0)
 applicantFrameTexture[3] = applicantFrame[3]:CreateTexture("ARTWORK")
applicantFrameTexture[3]:SetColorTexture(58/100, 48/100, 68/100, 0.1)
applicantFrameTexture[3]:SetAllPoints(applicantFrame[3])

 applicantFrame[4] = CreateFrame("Frame", "$parrentapplicant2", UIFrameTwo, "ApplicantTemplate")
applicantFrame[4]:SetPoint("TOP", applicantFrame[3], "BOTTOM")
 applicantFrameTexture[4] = applicantFrame[4]:CreateTexture("ARTWORK")
applicantFrameTexture[4]:SetColorTexture(48/100, 58/100, 68/100, 0.1)
applicantFrameTexture[4]:SetAllPoints(applicantFrame[4])

 applicantFrame[5] = CreateFrame("Frame", "$parrentapplicant3", UIFrameTwo, "ApplicantTemplate")
applicantFrame[5]:SetPoint("TOP", applicantFrame[4], "BOTTOM")
 applicantFrameTexture[5] = applicantFrame[5]:CreateTexture("ARTWORK")
applicantFrameTexture[5]:SetColorTexture(48/100, 58/100, 68/100, 0.1)
applicantFrameTexture[5]:SetAllPoints(applicantFrame[5])

 applicantFrame[6] = CreateFrame("Frame", "$parrentapplicant1", UIFrameTwo, "ApplicantTemplate")
applicantFrame[6]:SetPoint("TOP", applicantFrame[5], "BOTTOM", 0, 0)
 applicantFrameTexture[6] = applicantFrame[6]:CreateTexture("ARTWORK")
applicantFrameTexture[6]:SetColorTexture(58/100, 48/100, 68/100, 0.1)
applicantFrameTexture[6]:SetAllPoints(applicantFrame[6])

 applicantFrame[7] = CreateFrame("Frame", "$parrentapplicant2", UIFrameTwo, "ApplicantTemplate")
applicantFrame[7]:SetPoint("TOP", applicantFrame[6], "BOTTOM")
 applicantFrameTexture[7] = applicantFrame[7]:CreateTexture("ARTWORK")
applicantFrameTexture[7]:SetColorTexture(48/100, 58/100, 68/100, 0.1)
applicantFrameTexture[7]:SetAllPoints(applicantFrame[7])

 applicantFrame[8] = CreateFrame("Frame", "$parrentapplicant3", UIFrameTwo, "ApplicantTemplate")
applicantFrame[8]:SetPoint("TOP", applicantFrame[7], "BOTTOM")
 applicantFrameTexture[8] = applicantFrame[8]:CreateTexture("ARTWORK")
applicantFrameTexture[8]:SetColorTexture(48/100, 58/100, 68/100, 0.1)
applicantFrameTexture[8]:SetAllPoints(applicantFrame[8])


UIMAIN:SetScript("OnShow", function(self)
	isUIMAINHidden = false
end)

UIMAIN:SetScript("OnHide", function(self)
	isUIMAINHidden = true
end)

-- SLASH COMMANDS
SLASH_KEYSTONEHELPER1 = "/dcwkey";
function SlashCmdList.KEYSTONEHELPER(msg)
	if msg == "clear" then
		applicants = {}
		applicants[0] = {}
		KH_UpdateApplicants(0)
		return
	end
	if msg == "w" then
		if KQ_allowWhispers == true then
			checkString:SetText("Ignores whispers")
			KQ_allowWhispers = false
		else
			checkString:SetText("Accepts whispers")
			KQ_allowWhispers = true
		end
		return
	end
	if isUIMAINHidden then
		isUIMAINHidden = false
		UIMAIN:Show()
	else 
		isUIMAINHidden = true 
		UIMAIN:Hide()
	end
end

-- "" NETWORK "" 


function handleWhisper()
	originalLinkSubstring = strsub(KQ_whisperMessage, 11, strfind(KQ_whisperMessage, '|h') - 1)
	parts = { strsplit(':', originalLinkSubstring) }
	
	if tonumber(parts[2]) == 138019 then
		dungeonID = tonumber(parts[15])
		keystoneLevel = tonumber(parts[16])
		--KQ_HideSystemMSG = true
		--SendWho(KQ_whisperSender)
		--name, guild, level, race, class, zone, classFileName, sex = GetWhoInfo(1)
		--class = converClassToNumber(class)
		addApplicant(dungeonID, keystoneLevel, 0, KQ_whisperSender, 0)
	end
end

local function eventHandler(self, event, prefix, msg, channel, sender)
	if event == 'CHAT_MSG_ADDON' and prefix == 'KeystoneHelper' then
		-- Another user's keystone info (which we may or may not have asked for, but print either way)
		prefix = 'keynameclass:'
		if strsub(msg, 1, strlen(prefix)) == prefix then
			_, dungeonID, keystoneLevel, lootEligible, name, class = strsplit(':', msg)	
			addApplicant(dungeonID, keystoneLevel, lootEligible, name, class)
		end
	end
	if event == 'CHAT_MSG_WHISPER' and KQ_allowWhispers == true then
		KQ_whisperSender = msg
		KQ_whisperMessage = prefix
		--originalLinkSubstring = strsub(msg, 11, strfind(msg, '|h') - 1)
		
		if pcall(handleWhisper) then
			--print("Success")
		else
			--print("Failure")
		end
	end
end

UIMAIN:RegisterEvent('CHAT_MSG_ADDON')
UIMAIN:RegisterEvent('CHAT_MSG_WHISPER')
UIMAIN:SetScript('OnEvent', eventHandler)
RegisterAddonMessagePrefix('KeystoneHelper')

function printApplicants()
	for x=1, #applicants do
		print(applicants[x][3])
	end
end

ChatFrame_AddMessageEventFilter("CHAT_MSG_SYSTEM", function(_, _, message)
	if KQ_HideSystemMSG then
		if string.match(message, ": Level") then
			return true
		end
		if string.match(message, "1 player total") then
			KQ_HideSystemMSG = false
			return true
		end
	end
end)

function test()
	SendWho("Dreadnote-EarthenRing")
	name, guild, level, race, class, zone, classFileName, sex = GetWhoInfo(1)
	print(class)
end

-- Saved variables



UIMAIN:RegisterEvent("ADDON_LOADED"); -- Fired when saved variables are loaded
UIMAIN:RegisterEvent("PLAYER_LOGOUT"); -- Fired when about to log out
