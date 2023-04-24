HCWarn_Settings = {
    interact = true,
    sound = true,
    border = true,
    reminder = true,
    player = true,
    target = true,
    quest = true
}

local HCWarn = CreateFrame("Frame")

HCWarn.border = CreateFrame("Frame")
HCWarn.border:SetAllPoints(UIParent)
HCWarn.border:SetBackdrop({edgeFile = "Interface\\AddOns\\HCWarn\\media\\border", edgeSize = 16})
HCWarn.border:SetBackdropBorderColor(1, 0.25, 0)
HCWarn.border:Hide()

HCWarn.player = HCWarn:CreateFontString(nil, "LOW", "GameFontNormal")
HCWarn.player:SetFont(DAMAGE_TEXT_FONT, 12, "NONE")
HCWarn.player:SetPoint("TOP", UIErrorsFrame, "BOTTOM", 0, -10)
HCWarn.player:SetText("You are PvP flagged!")
HCWarn.player:SetTextColor(1, 0.25, 0)
HCWarn.player:Hide()

HCWarn.target = HCWarn:CreateFontString(nil, "LOW", "GameFontNormal")
HCWarn.target:SetFont(DAMAGE_TEXT_FONT, 12, "NONE")
HCWarn.target:SetPoint("TOP", HCWarn.player, "BOTTOM", 0, -5)
HCWarn.target:SetText("Target is PvP flagged!")
HCWarn.target:SetTextColor(1, 0.5, 0)
HCWarn.target:Hide()

function HCWarn:mapUpdate(reset)
    if IsInInstance() then
        HCWarn.inInstance = true
        HCWarn:pvpPlayer()
    elseif HCWarn.inInstance then
        -- left instance
        HCWarn.inInstance = nil
        HCWarn:pvpPlayer()
        HCWarn:interactMessage()
    elseif reset then
        -- entering world / reset
        HCWarn:pvpPlayer()
        HCWarn:interactMessage()
    end
end

function HCWarn:interactMessage()
    if (not HCWarn_Settings.target) or (not HCWarn_Settings.reminder) then return end
    if UnitIsDead("player") then return end
    if HCWarn_Settings.interact then
        if HCWarn.hardcore then
            HCWarn:ErrorMessage("You can target PvP flagged enemies", 1, 0.5, 0)
        else
            HCWarn:ErrorMessage("You can target PvP flagged units", 1, 0.5, 0)
        end
    else
        if HCWarn.hardcore then
            HCWarn:ErrorMessage("You cannot target PvP flagged enemies", 1, 0.25, 0)
        else
            HCWarn:ErrorMessage("You cannot target PvP flagged units", 1, 0.25, 0)
        end
    end
end

function HCWarn:Sound()
    if not HCWarn_Settings.sound then return end
    PlaySoundFile("Interface\\AddOns\\HCWarn\\media\\"..HCWarn.faction..".ogg")
end

function HCWarn:ErrorMessage(message)
    UIErrorsFrame:AddMessage(message, 1, 0.25, 0)
end

function HCWarn:pvpPlayer()
    HCWarn.player:Hide()
    HCWarn.border:Hide()
    if not HCWarn_Settings.player then return end
    if UnitIsPVP("player") and (not IsInInstance()) then
        SetCVar('MasterSoundEffects', 0)
        SetCVar('MasterSoundEffects', 1)
        HCWarn:Sound()
        HCWarn.player:Show()
        if HCWarn_Settings.border then
            HCWarn.border:Show()
        end
    end
end

HCWarn.target.timer = CreateFrame("Frame", nil, HCWarn)
HCWarn.target.timer:Hide()
HCWarn.target.timer:SetScript("OnUpdate", function()
    if GetTime() >= HCWarn.target.time then
        HCWarn.target.time = nil
        HCWarn:pvpTargetLogic()
        this:Hide()
    end
end)

function HCWarn:pvpTargetLogic()
    local function target()
        if HCWarn_Settings.interact then
            HCWarn.target:Show()
        else            
            ClearTarget()
            HCWarn:ErrorMessage("Target is PvP flagged", 1, 0.25, 0)
        end
    end

    if HCWarn.hardcore then
        -- You can assist PvP units without flagging
        -- You can not assist PvP player targets (Invalid Target)
        if UnitIsPVP("target") and UnitCanAttack("player", "target") and (not IsInInstance()) then       
            target()
        end
    else
        -- not hardcore
        -- You can not assist PvP units without flagging
        if UnitIsPVP("target") and (not IsInInstance()) then
            target()
        end
    end
end

function HCWarn:pvpTarget()
    HCWarn.target:Hide()
    if not HCWarn_Settings.target then return end
    if HCWarn.unitscan then
        HCWarn.target.time = GetTime() + 0.001
        HCWarn.target.timer:Show()
    else
        HCWarn:pvpTargetLogic()
    end
end

function HCWarn:checkHardcore()
    for slot = 1, 24 do
        local spellName, spellRank = GetSpellName(slot, BOOKTYPE_SPELL)
        if not spellName then break end
        if spellName == "Hardcore" and spellRank == "Challenge" then
            -- DEFAULT_CHAT_FRAME:AddMessage("You are hardcore")
            return true
        end
    end
end

function HCWarn:mouseover()
    -- set global variable for /stcast mouseover
    if HCWarn_Settings.interact then
        HCWarn_interact = true
    else
        HCWarn_interact = nil
    end    
end

function HCWarn:quest()
    if HCWarn_Settings.quest then
        HCWarn.quests = HCWarn_quests(HCWarn.faction)
    else
        HCWarn.quests = nil
    end
end

function HCWarn:findQuest(title, giver, objective)    
    for quest, table in pairs(HCWarn.quests) do
        if (strupper(quest) == strupper(title)) and (table[1].giver == giver) then
            local _, _, match = string.find(objective, "("..table[1].objective..")")
            if match then
                -- DEFAULT_CHAT_FRAME:AddMessage("HCWarn: Quest Match", 1, 0.5, 0)
                return table[1]
            end
        end
    end
end

function HCWarn:questPVP(table)
    if table.pvp then
        return "Attacking "..table.pvp.." will flag you for PvP."
    else
        return "No information available."
    end
end

function HCWarn:questDetail()
    if not QuestFrameDetailPanel.pvp then        
        QuestFrameDetailPanel.pvp = CreateFrame("Frame", nil, QuestFrameDetailPanel)
        QuestFrameDetailPanel.pvp:Hide()
        QuestFrameDetailPanel.pvp:SetWidth(1)
        QuestFrameDetailPanel.pvp:SetHeight(30)
        QuestFrameDetailPanel.pvp:SetPoint("TOP", QuestNpcNameFrame, "BOTTOM", 0, -8)
        QuestFrameDetailPanel.pvp:SetBackdrop({
            bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
            edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
            tile = true, tileSize = 14, edgeSize = 14,
            insets = { left = 4, right = 4, top = 4, bottom = 4 }
        })
        QuestFrameDetailPanel.pvp:SetBackdropColor(1, .25, 0, .5)
        QuestFrameDetailPanel.pvp:SetBackdropBorderColor(1, .25, 0)
        QuestFrameDetailPanel.pvp:EnableMouse(true)
        
        QuestFrameDetailPanel.pvp.icon = QuestFrameDetailPanel.pvp:CreateTexture(nil, "ARTWORK")
        local icon = "Interface\\Icons\\Inv_bannerpvp_01"
        if HCWarn.faction == "Alliance" then
            icon = "Interface\\Icons\\Inv_bannerpvp_02"
        end
        local inset = 5
        QuestFrameDetailPanel.pvp.icon:SetTexture(icon)        
        QuestFrameDetailPanel.pvp.icon:SetWidth(20)
        QuestFrameDetailPanel.pvp.icon:SetHeight(20)
        QuestFrameDetailPanel.pvp.icon:SetPoint("LEFT", QuestFrameDetailPanel.pvp, "LEFT", inset, 0)

        QuestFrameDetailPanel.pvp.icon.border = CreateFrame("Frame", nil, QuestFrameDetailPanel.pvp)
        QuestFrameDetailPanel.pvp.icon.border:SetPoint("TOPLEFT", QuestFrameDetailPanel.pvp.icon, "TOPLEFT", -2, 2)
        QuestFrameDetailPanel.pvp.icon.border:SetPoint("BOTTOMRIGHT", QuestFrameDetailPanel.pvp.icon, "BOTTOMRIGHT", 2, -2)
        QuestFrameDetailPanel.pvp.icon.border:SetBackdrop({edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border", edgeSize = 12})
        QuestFrameDetailPanel.pvp.icon.border:SetBackdropBorderColor(1, .25, 0)

        QuestFrameDetailPanel.pvp.text = QuestFrameDetailPanel.pvp:CreateFontString("Status", "LOW", "GameFontNormal")
        QuestFrameDetailPanel.pvp.text:SetFont(DAMAGE_TEXT_FONT, 12, "OUTLINE")
        QuestFrameDetailPanel.pvp.text:SetPoint("LEFT", QuestFrameDetailPanel.pvp.icon, "RIGHT", 2, 0)
        QuestFrameDetailPanel.pvp.text:SetFontObject(GameFontWhite)
        QuestFrameDetailPanel.pvp.text:SetText("PvP Quest")
        QuestFrameDetailPanel.pvp.text:SetTextColor(1, 0.25, 0)

        QuestFrameDetailPanel.pvp:SetWidth((inset*2)+QuestFrameDetailPanel.pvp.icon.border:GetWidth()+QuestFrameDetailPanel.pvp.text:GetWidth())
        if IsAddOnLoaded("pfUI") then
            QuestFrameDetailPanel.pvp:ClearAllPoints()
            QuestFrameDetailPanel.pvp:SetPoint("TOP", QuestNpcNameFrame, "BOTTOM", -10, -8)
        end

        QuestFrameDetailPanel.pvp:SetScript("OnEnter", function()
            GameTooltip:ClearLines()
            GameTooltip:SetOwner(this, ANCHOR_BOTTOMLEFT)

            GameTooltip:AddLine(HCWarn:questPVP(HCWarn.pvpQuest))
            GameTooltip:Show()
        end)

        QuestFrameDetailPanel.pvp:SetScript("OnLeave", function()
            GameTooltip:Hide()
        end)
    end

    HCWarn.pvpQuest = HCWarn:findQuest(GetTitleText(), QuestFrameNpcNameText:GetText(), GetObjectiveText())
    if HCWarn.pvpQuest then
        QuestFrameDetailPanel.pvp:Show()
        QuestFrameAcceptButton:SetTextColor(1, .25, 0)        
    end
end

function HCWarn:questFinished()
    HCWarn.pvpQuest = nil
    if QuestFrameDetailPanel.pvp then
        QuestFrameDetailPanel.pvp:Hide()
    end
    QuestFrameAcceptButton:SetTextColor(1, 0.82, 0)    
end

function HCWarn:reset()
    HCWarn_Settings.interact = true
    HCWarn_Settings.sound = true
    HCWarn_Settings.border = true
    HCWarn_Settings.player = true
    HCWarn_Settings.target = true
    HCWarn_Settings.quest = true
    HCWarn_Settings.reminder = true
    HCWarn.inInstance = nil
    HCWarn:mapUpdate(true)
    HCWarn:pvpPlayer()
    HCWarn:pvpTarget()
end

local function HCWarn_commands(msg, editbox)
    local function message(setting, name)
        local state = "off"
        if setting then state = "on" end
        DEFAULT_CHAT_FRAME:AddMessage("HCWarn: "..name.." is "..state..".", 1, 0.5, 0)
    end
    if msg == "target" then
        if HCWarn_Settings.interact then
            HCWarn_Settings.interact = false
        else
            HCWarn_Settings.interact = true
        end
        message(HCWarn_Settings.interact, "PvP targeting")
        HCWarn:mouseover()        
        HCWarn:pvpTarget()
        if HCWarn_Settings.target then
            HCWarn:interactMessage()
        end
    elseif msg == "sound" then
        if HCWarn_Settings.sound then
            HCWarn_Settings.sound = false
        else
            HCWarn_Settings.sound = true
        end
        message(HCWarn_Settings.sound, "Sound")
    elseif msg == "border" then
        if HCWarn_Settings.border then
            HCWarn_Settings.border = false
        else
            HCWarn_Settings.border = true            
        end        
        message(HCWarn_Settings.border, "Border")
        HCWarn:pvpPlayer()
    elseif msg == "warn player" then
        if HCWarn_Settings.player then
            HCWarn_Settings.player = false
        else
            HCWarn_Settings.player = true
        end
        message(HCWarn_Settings.player, "Player PvP warning")
        HCWarn:pvpPlayer()
    elseif msg == "warn target" then
        if HCWarn_Settings.target then
            HCWarn_Settings.target = false
        else
            HCWarn_Settings.target = true
        end
        message(HCWarn_Settings.target, "Target PvP warning")
        HCWarn:pvpTarget()
    elseif msg == "quest" then
        if HCWarn_Settings.quest then
            HCWarn_Settings.quest = false
        else
            HCWarn_Settings.quest = true
        end
        message(HCWarn_Settings.quest, "Quest PvP warning")
        HCWarn:quest()
    elseif msg == "reminder" then
        if HCWarn_Settings.reminder then
            HCWarn_Settings.reminder = false
        else
            HCWarn_Settings.reminder = true
        end
        message(HCWarn_Settings.reminder, "Target reminder")
    elseif msg == "reset" then
        HCWarn:reset()
        DEFAULT_CHAT_FRAME:AddMessage("HCWarn: Settings reset.", 1, 0.5, 0)
    else
        DEFAULT_CHAT_FRAME:AddMessage("HCWarn usage:", 1, 0.5, 0)
        DEFAULT_CHAT_FRAME:AddMessage("/hcwarn target - toggle targeting PvP flagged units", 1, 0.5, 0)
        DEFAULT_CHAT_FRAME:AddMessage("/hcwarn warn player - toggle PvP warning for your character", 1, 0.5, 0)
        DEFAULT_CHAT_FRAME:AddMessage("/hcwarn warn target - toggle PvP warning for your target", 1, 0.5, 0)
        DEFAULT_CHAT_FRAME:AddMessage("/hcwarn quest - toggle PvP warning for quests", 1, 0.5, 0)
        DEFAULT_CHAT_FRAME:AddMessage("/hcwarn reminder - toggle 'You can target' reminder", 1, 0.5, 0)
        DEFAULT_CHAT_FRAME:AddMessage("/hcwarn sound - toggle player PvP warning sound", 1, 0.5, 0)
        DEFAULT_CHAT_FRAME:AddMessage("/hcwarn border - toggle player PvP warning border", 1, 0.5, 0)        
        DEFAULT_CHAT_FRAME:AddMessage("/hcwarn reset - reset settings", 1, 0.5, 0)  
    end
end

HCWarn:RegisterEvent("ADDON_LOADED")
HCWarn:RegisterEvent("PLAYER_ENTERING_WORLD")
HCWarn:RegisterEvent("WORLD_MAP_UPDATE")
HCWarn:RegisterEvent("PLAYER_TARGET_CHANGED")
HCWarn:RegisterEvent("UNIT_FACTION", "player")
HCWarn:RegisterEvent("UNIT_FACTION", "target")
HCWarn:RegisterEvent("QUEST_DETAIL")
HCWarn:RegisterEvent("QUEST_FINISHED")

HCWarn:SetScript("OnEvent", function()
    if event == "ADDON_LOADED" then
        if not this.loaded then
            this.loaded = true
            SLASH_HCWARN1 = "/hcwarn"
            SLASH_HCWARN2 = "/hcw"
            SlashCmdList["HCWARN"] = HCWarn_commands
            DEFAULT_CHAT_FRAME:AddMessage("HCWarn Loaded! /hcwarn or /hcw", 1, 0.5, 0)
        end    
    elseif event == "PLAYER_ENTERING_WORLD" then
        if not this.login then
            this.login = true
            HCWarn:mouseover()
            HCWarn.hardcore = HCWarn:checkHardcore()
            HCWarn.faction = UnitFactionGroup("player")           
            HCWarn:pvpPlayer()
            HCWarn:mapUpdate(true)
            HCWarn:quest()
            if IsAddOnLoaded("unitscan") or IsAddOnLoaded("unitscan-turtle") then
                HCWarn.unitscan = true
            end
        end
    elseif event == "WORLD_MAP_UPDATE" then
        HCWarn:mapUpdate()
    elseif event == "PLAYER_TARGET_CHANGED" then        
            HCWarn:pvpTarget()
    elseif event == "UNIT_FACTION" then
        if arg1 == "player" then
            HCWarn:pvpPlayer()
        elseif arg1 == "target" then
            HCWarn:pvpTarget()  
        end
    elseif event == "QUEST_DETAIL" then
        if HCWarn_Settings.quest then
            HCWarn:questDetail()
        end
    elseif event == "QUEST_FINISHED" then
        if HCWarn_Settings.quest or HCWarn.pvpQuest then
            HCWarn:questFinished()
        end
    end
end)