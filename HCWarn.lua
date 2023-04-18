HCWarn_Settings = {
    interact = false,
}

local HCWarn = CreateFrame("Frame")

HCWarn.border = CreateFrame("Frame")
HCWarn.border:SetAllPoints(UIParent)
HCWarn.border:SetBackdrop({edgeFile = "Interface\\AddOns\\HCWarn\\media\\border", edgeSize = 16})
HCWarn.border:SetBackdropBorderColor(1, 0.25, 0)
HCWarn.border:Hide()

HCWarn.player = HCWarn:CreateFontString("Status", "LOW", "GameFontNormal")
HCWarn.player:SetFont(DAMAGE_TEXT_FONT, 12, "OUTLINE")
HCWarn.player:SetPoint("CENTER", UIParent, "CENTER", 0, 50)
HCWarn.player:SetText("YOU ARE PVP FLAGGED")
HCWarn.player:SetTextColor(1, 0.25, 0)
HCWarn.player:Hide()

HCWarn.target = HCWarn:CreateFontString("Status", "LOW", "GameFontNormal")
HCWarn.target:SetFont(DAMAGE_TEXT_FONT, 12, "OUTLINE")
HCWarn.target:SetPoint("TOP", HCWarn.player, "BOTTOM", 0, -5)
HCWarn.target:SetText("TARGET IS PVP FLAGGED")
HCWarn.target:SetTextColor(1, 0.5, 0)
HCWarn.target:Hide()

function HCWarn:announceSetting()
    if HCWarn_Settings.interact then
        DEFAULT_CHAT_FRAME:AddMessage("HCWarn: You can interact with pvp flagged targets", 1, 0.5, 0)
        UIErrorsFrame:AddMessage("You can interact with pvp flagged targets", 1, 0.5, 0)        
    else
        DEFAULT_CHAT_FRAME:AddMessage("HCWarn: You cannot interact with pvp flagged targets", 1, 0.25, 0)
        UIErrorsFrame:AddMessage("You cannot interact with pvp flagged targets", 1, 0.25, 0)
    end
end

function HCWarn:Alert()
    PlaySoundFile("Interface\\AddOns\\HCWarn\\media\\"..HCWarn.faction..".ogg")
end

function HCWarn:interactSetting()
    -- set global interact variable for /stcast support
    if not HCWarn_Settings.interact then        
        HCWarn_nointeract = true        
    else
        HCWarn_nointeract = nil   
    end
end

function HCWarn:PvP(unit)
    if unit == "player" then
        HCWarn.player:Hide()
        HCWarn.border:Hide()
        if UnitIsPVP("player") then
            SetCVar('MasterSoundEffects', 0)
            SetCVar('MasterSoundEffects', 1)
            HCWarn:Alert()
            HCWarn.player:Show()
            HCWarn.border:Show()
        end
    elseif unit == "target" then
        HCWarn.target:Hide()
        if UnitIsPVP("target") and UnitCanAttack("player", "target") then
            if HCWarn_Settings.interact then
                HCWarn.target:Show()
            else
                ClearTarget()
                UIErrorsFrame:AddMessage("Target is PVP flagged", 1, 0.25, 0)
            end
        end
    end
end

local function HCWarn_commands(msg, editbox)
    if HCWarn_Settings.interact then
        HCWarn_Settings.interact = false
    else
        HCWarn_Settings.interact = true
    end
    HCWarn:interactSetting()
    HCWarn:announceSetting()
end

HCWarn:RegisterEvent("ADDON_LOADED")
HCWarn:RegisterEvent("PLAYER_ENTERING_WORLD")
HCWarn:RegisterEvent("PLAYER_TARGET_CHANGED")
HCWarn:RegisterEvent("UNIT_FACTION", "player")
HCWarn:RegisterEvent("UNIT_FACTION", "target")

HCWarn:SetScript("OnEvent", function()
    if event == "ADDON_LOADED" then
		if not HCWarn.loaded then
            HCWarn.loaded = true
            HCWarn.faction = UnitFactionGroup("player")
            SLASH_HCWARN1 = "/hcwarn"
            SLASH_HCWARN2 = "/hcw"
            SlashCmdList["HCWARN"] = HCWarn_commands
            DEFAULT_CHAT_FRAME:AddMessage("HCWarn Loaded! /hcwarn", 1, 0.5, 0)
            HCWarn:interactSetting()                       
		end
    elseif event == "PLAYER_ENTERING_WORLD" then        
        HCWarn:announceSetting()
        HCWarn:PvP("player")
    elseif event == "PLAYER_TARGET_CHANGED" then        
        HCWarn:PvP("target")    
    elseif event == "UNIT_FACTION" then       
        HCWarn:PvP(arg1)
    end
end)