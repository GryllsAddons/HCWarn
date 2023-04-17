local HCWarn = CreateFrame("Frame")
HCWarn:Hide()
HCWarn:SetAllPoints(UIParent)
HCWarn:SetBackdrop({edgeFile = "Interface\\AddOns\\HCWarn\\media\\border", edgeSize = 16})
HCWarn:SetBackdropBorderColor(1, 0.25, 0)

HCWarn.player = HCWarn:CreateFontString("Status", "LOW", "GameFontNormal")
HCWarn.player:SetFont(STANDARD_TEXT_FONT, 12, "OUTLINE")
HCWarn.player:SetPoint("CENTER", HCWarn, "CENTER", 0, 50)
HCWarn.player:SetText("YOU ARE PVP FLAGGED")
HCWarn.player:SetTextColor(1, 0.25, 0)

function HCWarn:PvP()
    if UnitIsPVP("player") then
        SetCVar('MasterSoundEffects', 0)
        SetCVar('MasterSoundEffects', 1)
        HCWarn:Alert()
        HCWarn:Show()
    else
        HCWarn:Hide()
    end
end

function HCWarn:Alert()
    PlaySoundFile("Interface\\AddOns\\HCWarn\\media\\"..HCWarn.faction..".ogg")
end

HCWarn:RegisterEvent("PLAYER_ENTERING_WORLD")
HCWarn:RegisterEvent("UNIT_FACTION", "player")
HCWarn:SetScript("OnEvent", function()
    if event == "PLAYER_ENTERING_WORLD" then
        HCWarn.faction = UnitFactionGroup("player")
        HCWarn:PvP()
    else        
        HCWarn:PvP()
    end
end)