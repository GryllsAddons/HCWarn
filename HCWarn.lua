HCWarn_Settings = {
    nointeract = false,
}

local HCWarn = CreateFrame("Frame")
HCWarn:SetPoint("CENTER", UIParent, "CENTER", 0, 0)
HCWarn:SetHeight(10)
HCWarn:SetWidth(300)

HCWarn.player = HCWarn:CreateFontString("Status", "LOW", "GameFontNormal")
HCWarn.player:SetFont(STANDARD_TEXT_FONT, 12, "OUTLINE")
HCWarn.player:SetTextColor(255/255, 0/255, 0/255)
HCWarn.player:SetAllPoints(HCWarn)

HCWarn.target = HCWarn:CreateFontString("Status", "LOW", "GameFontNormal")
HCWarn.target:SetFont(STANDARD_TEXT_FONT, 12, "OUTLINE")
HCWarn.target:SetTextColor(255/255, 124/255, 10/255)
HCWarn.target:SetPoint("TOP", HCWarn.player, "BOTTOM", 0, -5)

local function pvp(unit)
    local ispvp = UnitIsPVP(unit)
    if unit == "player" then
        if ispvp then
            PlaySound("ReadyCheck","SFX")
            HCWarn.player:SetText("YOU ARE PVP FLAGGED")
        else
            HCWarn.player:SetText("")
        end
    elseif unit == "target" then
        if (ispvp and UnitReaction("target", "player") <= 4) or (ispvp and UnitIsPlayer(unit)) then
            if HCWarn_Settings.nointeract then
                ClearTarget()
            else
                HCWarn.target:SetText("TARGET IS PVP FLAGGED")                
            end
        else
            HCWarn.target:SetText("")
        end
    end
end

local function interactSetting()
    if HCWarn_Settings.nointeract then
        HCWarn_nointeract = true
        DEFAULT_CHAT_FRAME:AddMessage("HCWarn: You cannot interact with pvp flagged targets")
    else
        HCWarn_nointeract = nil
        DEFAULT_CHAT_FRAME:AddMessage("HCWarn: You can interact with pvp flagged targets")
    end
end

local function HCWarn_commands(msg, editbox)
    if msg == "interact" then
        if HCWarn_Settings.nointeract then
            HCWarn_Settings.nointeract = false
        else
            HCWarn_Settings.nointeract = true
        end
        interactSetting()
    else
        DEFAULT_CHAT_FRAME:AddMessage("HCWarn usage:")
        DEFAULT_CHAT_FRAME:AddMessage("/hcwarn interact - toggle allowing interacting with targets that are pvp flagged")
    end
end

local events = CreateFrame("Frame")
events:RegisterEvent("ADDON_LOADED")
events:RegisterEvent("PLAYER_TARGET_CHANGED")
events:RegisterEvent("UNIT_FACTION", "player")
events:RegisterEvent("UNIT_FACTION", "target")
events:RegisterEvent("PLAYER_ENTERING_WORLD")

events:SetScript("OnEvent", function()
    if event == "ADDON_LOADED" then
		if not HCWarn.loaded then
            SLASH_HCWARN1 = "/hcwarn"
            SLASH_HCWARN2 = "/hcw"
            SlashCmdList["HCWARN"] = HCWarn_commands
			DEFAULT_CHAT_FRAME:AddMessage("HCWarn loaded! /hcwarn")
            interactSetting()
            HCWarn.loaded = true
		end
    elseif event == "PLAYER_TARGET_CHANGED" then
        pvp("target")
    elseif event == "PLAYER_ENTERING_WORLD" then
        pvp("player")
    else
        pvp(arg1)
    end
end)