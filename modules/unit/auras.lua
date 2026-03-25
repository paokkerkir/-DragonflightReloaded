DFRL:NewDefaults("Auras", {
    enabled = {true},
    -- Buff Bar (top-right player buffs) - category index 1 so it appears first
    buffBarMode = {"Buff Bar", "dropdown", {"Default", "Buff Bar", "Disabled"}, nil, "Buff Bar", 1, "Player buff display", nil, nil},
    buffBarShowBuffs = {true, "checkbox", nil, nil, "Buff Bar", 2, "Show buffs", nil, nil},
    buffBarShowDebuffs = {true, "checkbox", nil, nil, "Buff Bar", 3, "Show debuffs", nil, nil},
    buffBarShowWeapons = {true, "checkbox", nil, nil, "Buff Bar", 4, "Show weapon enchants", nil, nil},
    buffBarSize = {25, "slider", {16, 50}, nil, "Buff Bar", 5, "Icon size", nil, nil},
    buffBarPerRow = {8, "slider", {4, 16}, nil, "Buff Bar", 6, "Icons per row", nil, nil},
    buffBarSpacing = {5, "slider", {0, 20}, nil, "Buff Bar", 7, "Icon spacing", nil, nil},
    buffBarFrameSpacing = {15, "slider", {0, 50}, nil, "Buff Bar", 8, "Section spacing", nil, nil},
    buffBarTimerInside = {false, "checkbox", nil, nil, "Buff Bar", 9, "Timer inside icon", nil, nil},
    buffBarTimerFontSize = {10, "slider", {6, 20}, nil, "Buff Bar", 10, "Timer font size", nil, nil},
    buffBarTimerStyle = {"White + Red", "dropdown", {"Gold", "White + Red"}, nil, "Buff Bar", 11, "Timer color style", nil, nil},
    buffBarSortOrder = {"Default", "dropdown", {"Default", "Duration ascending", "Duration descending"}, nil, "Buff Bar", 12, "Sort by", nil, nil},
    buffBarShowSpiral = {true, "checkbox", nil, nil, "Buff Bar", 13, "Show debuff spiral", nil, nil},
    -- Player (buffs/debuffs hidden by default on unitframe)
    playerBuffs = {false, "checkbox", nil, nil, "Player", 1, "Show buffs", nil, nil},
    playerDebuffs = {false, "checkbox", nil, nil, "Player", 2, "Show debuffs", nil, nil},
    playerShowBuffTimer = {true, "checkbox", nil, "playerBuffs", "Player", 3, "Show buff timers", nil, nil},
    playerShowDebuffTimer = {true, "checkbox", nil, "playerDebuffs", "Player", 4, "Show debuff timers", nil, nil},
    playerShowSpiral = {true, "checkbox", nil, nil, "Player", 5, "Show debuff spiral", nil, nil},
    playerAuraSize = {20, "slider", {10, 30}, nil, "Player", 6, "Icon size", nil, nil},
    playerAuraSpacing = {2, "slider", {0, 6}, nil, "Player", 7, "Icon spacing", nil, nil},
    playerAurasPerRow = {5, "slider", {3, 8}, nil, "Player", 8, "Icons per row", nil, nil},
    playerGrowRight = {true, "checkbox", nil, nil, "Player", 9, "Grow icons right", nil, nil},
    playerTimerFontSize = {8, "slider", {6, 20}, nil, "Player", 10, "Timer font size", nil, nil},
    playerTimerStyle = {"White + Red", "dropdown", {"Gold", "White + Red"}, nil, "Player", 11, "Timer color style", nil, nil},
    playerSortOrder = {"Default", "dropdown", {"Default", "Duration ascending", "Duration descending"}, nil, "Player", 12, "Sort by", nil, nil},
    -- Target
    targetBuffs = {true, "checkbox", nil, nil, "Target", 1, "Show buffs", nil, nil},
    targetDebuffs = {true, "checkbox", nil, nil, "Target", 2, "Show debuffs", nil, nil},
    targetShowBuffTimer = {true, "checkbox", nil, "targetBuffs", "Target", 3, "Show buff timers", nil, nil},
    targetShowDebuffTimer = {true, "checkbox", nil, "targetDebuffs", "Target", 4, "Show debuff timers", nil, nil},
    targetShowSpiral = {true, "checkbox", nil, nil, "Target", 5, "Show debuff spiral", nil, nil},
    targetAuraSize = {20, "slider", {10, 30}, nil, "Target", 6, "Icon size", nil, nil},
    targetAuraSpacing = {2, "slider", {0, 6}, nil, "Target", 7, "Icon spacing", nil, nil},
    targetAurasPerRow = {5, "slider", {3, 8}, nil, "Target", 8, "Icons per row", nil, nil},
    targetGrowRight = {false, "checkbox", nil, nil, "Target", 9, "Grow icons right", nil, nil},
    targetTimerFontSize = {8, "slider", {6, 20}, nil, "Target", 10, "Timer font size", nil, nil},
    targetTimerStyle = {"White + Red", "dropdown", {"Gold", "White + Red"}, nil, "Target", 11, "Timer color style", nil, nil},
    targetSortOrder = {"Default", "dropdown", {"Default", "Duration ascending", "Duration descending"}, nil, "Target", 12, "Sort by", nil, nil},
    -- Pet
    petBuffs = {true, "checkbox", nil, nil, "Pet", 1, "Show buffs", nil, nil},
    petDebuffs = {true, "checkbox", nil, nil, "Pet", 2, "Show debuffs", nil, nil},
    petShowBuffTimer = {true, "checkbox", nil, "petBuffs", "Pet", 3, "Show buff timers", nil, nil},
    petShowDebuffTimer = {true, "checkbox", nil, "petDebuffs", "Pet", 4, "Show debuff timers", nil, nil},
    petShowSpiral = {true, "checkbox", nil, nil, "Pet", 5, "Show debuff spiral", nil, nil},
    petAuraSize = {20, "slider", {10, 30}, nil, "Pet", 6, "Icon size", nil, nil},
    petAuraSpacing = {2, "slider", {0, 6}, nil, "Pet", 7, "Icon spacing", nil, nil},
    petAurasPerRow = {5, "slider", {3, 8}, nil, "Pet", 8, "Icons per row", nil, nil},
    petGrowRight = {true, "checkbox", nil, nil, "Pet", 9, "Grow icons right", nil, nil},
    petTimerFontSize = {8, "slider", {6, 20}, nil, "Pet", 10, "Timer font size", nil, nil},
    petTimerStyle = {"White + Red", "dropdown", {"Gold", "White + Red"}, nil, "Pet", 11, "Timer color style", nil, nil},
    petSortOrder = {"Default", "dropdown", {"Default", "Duration ascending", "Duration descending"}, nil, "Pet", 12, "Sort by", nil, nil},
    -- Party
    partyBuffs = {true, "checkbox", nil, nil, "Party", 1, "Show buffs", nil, nil},
    partyDebuffs = {true, "checkbox", nil, nil, "Party", 2, "Show debuffs", nil, nil},
    partyShowBuffTimer = {true, "checkbox", nil, "partyBuffs", "Party", 3, "Show buff timers", nil, nil},
    partyShowDebuffTimer = {true, "checkbox", nil, "partyDebuffs", "Party", 4, "Show debuff timers", nil, nil},
    partyShowSpiral = {true, "checkbox", nil, nil, "Party", 5, "Show debuff spiral", nil, nil},
    partyAuraSize = {20, "slider", {10, 30}, nil, "Party", 6, "Icon size", nil, nil},
    partyAuraSpacing = {2, "slider", {0, 6}, nil, "Party", 7, "Icon spacing", nil, nil},
    partyAurasPerRow = {5, "slider", {3, 8}, nil, "Party", 8, "Icons per row", nil, nil},
    partyGrowRight = {true, "checkbox", nil, nil, "Party", 9, "Grow icons right", nil, nil},
    partyTimerFontSize = {8, "slider", {6, 20}, nil, "Party", 10, "Timer font size", nil, nil},
    partyTimerStyle = {"White + Red", "dropdown", {"Gold", "White + Red"}, nil, "Party", 11, "Timer color style", nil, nil},
    partySortOrder = {"Default", "dropdown", {"Default", "Duration ascending", "Duration descending"}, nil, "Party", 12, "Sort by", nil, nil},
})

DFRL:NewMod("Auras", 2, function()
    -- requires SuperWoW for UNIT_AURA event and GUID-based debuff tracking

    local DEBUFF_COLORS = {
        Magic   = {0.2, 0.6, 1.0},
        Disease = {0.6, 0.4, 0.0},
        Poison  = {0.0, 0.6, 0.0},
        Curse   = {0.6, 0.0, 1.0},
    }
    local DEFAULT_DEBUFF_COLOR = {0.8, 0.0, 0.0}

    -- Per-unit appearance getters
    local function GetAuraSize(prefix)
        return DFRL:GetTempDB("Auras", prefix .. "AuraSize") or 20
    end
    local function GetAuraSpacing(prefix)
        return DFRL:GetTempDB("Auras", prefix .. "AuraSpacing") or 2
    end
    local function GetAurasPerRow(prefix)
        return DFRL:GetTempDB("Auras", prefix .. "AurasPerRow") or 5
    end

    -- reference to libdebuff (loaded via libs/libdebuff.lua)
    local libdebuff = DFRL_Libs and DFRL_Libs.libdebuff

    -------------------------------------------------------------------
    -- Buff duration tracking (SuperWoW + Nampower)
    -------------------------------------------------------------------

    -- Duration tracking: [targetGuid] = { [spellId] = { start, duration } }
    local auraDurations = {}

    -- Spell icon cache
    local iconCache = {}
    local function CachedGetSpellIcon(spellId)
        if not spellId or spellId <= 0 then return nil end
        if iconCache[spellId] then return iconCache[spellId] end
        if GetSpellRecField and GetSpellIconTexture then
            local iconId = GetSpellRecField(spellId, "spellIconID")
            if iconId and type(iconId) == "number" and iconId > 0 then
                local tex = GetSpellIconTexture(iconId)
                if tex then
                    if not string.find(tex, "\\") then
                        tex = "Interface\\Icons\\" .. tex
                    end
                    iconCache[spellId] = tex
                    return tex
                end
            end
        end
        return nil
    end

    -- Spell name cache
    local nameCache = {}
    local function CachedGetSpellName(spellId)
        if not spellId or spellId <= 0 then return nil end
        if nameCache[spellId] then return nameCache[spellId] end
        if SpellInfo then
            local name = SpellInfo(spellId)
            if name then nameCache[spellId] = name end
            return name
        end
        return nil
    end

    -- Common buff durations (libdebuff only covers debuffs)
    local buffDurations = {
        -- Priest
        ["Power Word: Fortitude"] = 1800,
        ["Prayer of Fortitude"] = 3600,
        ["Power Word: Shield"] = 30,
        ["Divine Spirit"] = 1800,
        ["Prayer of Spirit"] = 3600,
        ["Shadow Protection"] = 600,
        ["Prayer of Shadow Protection"] = 1200,
        ["Inner Fire"] = 600,
        ["Renew"] = 15,
        ["Fear Ward"] = 600,
        -- Druid
        ["Mark of the Wild"] = 1800,
        ["Gift of the Wild"] = 3600,
        ["Thorns"] = 600,
        ["Rejuvenation"] = 12,
        ["Regrowth"] = 21,
        -- Mage
        ["Arcane Intellect"] = 1800,
        ["Arcane Brilliance"] = 3600,
        ["Ice Armor"] = 1800,
        ["Frost Armor"] = 1800,
        ["Mage Armor"] = 1800,
        ["Ice Barrier"] = 60,
        ["Dampen Magic"] = 600,
        ["Amplify Magic"] = 600,
        -- Paladin
        ["Blessing of Might"] = 300,
        ["Blessing of Wisdom"] = 300,
        ["Blessing of Kings"] = 300,
        ["Blessing of Salvation"] = 300,
        ["Blessing of Light"] = 300,
        ["Blessing of Sanctuary"] = 300,
        ["Greater Blessing of Might"] = 900,
        ["Greater Blessing of Wisdom"] = 900,
        ["Greater Blessing of Kings"] = 900,
        ["Greater Blessing of Salvation"] = 900,
        ["Greater Blessing of Light"] = 900,
        ["Greater Blessing of Sanctuary"] = 900,
        -- Warlock
        ["Demon Armor"] = 1800,
        ["Demon Skin"] = 1800,
        ["Unending Breath"] = 600,
        -- Warrior
        ["Battle Shout"] = 120,
        -- Shaman
        ["Lightning Shield"] = 600,
        ["Water Shield"] = 600,
        -- Consumables
        ["Flask of the Titans"] = 7200,
        ["Flask of Supreme Power"] = 7200,
        ["Flask of Distilled Wisdom"] = 7200,
        ["Flask of Chromatic Resistance"] = 7200,
        ["Spirit of Zanza"] = 7200,
        ["Rallying Cry of the Dragonslayer"] = 7200,
        ["Songflower Serenade"] = 3600,
        ["Fengus' Ferocity"] = 7200,
        ["Mol'dar's Moxie"] = 7200,
        ["Slip'kik's Savvy"] = 7200,
        ["Warchief's Blessing"] = 3600,
    }

    -- Look up duration by spell name (debuff table first, then buff table)
    local function LookupDuration(name)
        if not name then return nil end
        if libdebuff then
            local dur = libdebuff:GetDuration(name, nil)
            if dur and dur > 0 then return dur end
        end
        local dur = buffDurations[name]
        if dur and dur > 0 then return dur end
        return nil
    end

    -- Record a duration for a spell on a target
    local function TrackDuration(targetGuid, spellId, durationSec)
        if not targetGuid or not spellId or not durationSec or durationSec <= 0 then return end
        if not auraDurations[targetGuid] then auraDurations[targetGuid] = {} end
        auraDurations[targetGuid][spellId] = {
            start = GetTime(),
            duration = durationSec,
        }
    end

    -- Get tracked duration for a spell
    local function GetTrackedDuration(guid, spellId)
        if not guid or not spellId then return nil, nil end
        if auraDurations[guid] and auraDurations[guid][spellId] then
            local data = auraDurations[guid][spellId]
            local remaining = (data.start + data.duration) - GetTime()
            if remaining > 0 then
                return data.duration, remaining
            else
                auraDurations[guid][spellId] = nil
            end
        end
        return nil, nil
    end

    -- Build texture->spellId map from GetUnitField for a unit's auras
    local function BuildTexToSpellMap(guid)
        local map = {}
        if not guid then return map end
        if not GetUnitField then return map end
        local auras = GetUnitField(guid, "aura")
        if not auras then return map end
        for slot = 1, 48 do
            local spellId = auras[slot]
            if spellId and spellId > 0 then
                local tex = CachedGetSpellIcon(spellId)
                if tex then
                    map[string.lower(tex)] = spellId
                end
            end
        end
        return map
    end

    -- Time formatter: style = "Gold" (solid gold text) or "White + Red" (white number, red suffix)
    local function FormatTime(remaining, style)
        if not style or style == "Gold" then
            if remaining >= 86400 then
                return math.ceil(remaining / 86400) .. "d"
            elseif remaining >= 3600 then
                return math.ceil(remaining / 3600) .. "h"
            elseif remaining >= 60 then
                return math.ceil(remaining / 60) .. "m"
            else
                return math.floor(remaining) .. ""
            end
        else
            -- DF3 style: white number + red suffix letter
            if remaining >= 86400 then
                return math.ceil(remaining / 86400) .. "|cffff0000d|r"
            elseif remaining >= 3600 then
                return math.ceil(remaining / 3600) .. "|cffff0000h|r"
            elseif remaining >= 60 then
                return math.ceil(remaining / 60) .. "|cffff0000m|r"
            else
                return tostring(math.floor(remaining))
            end
        end
    end

    -- Get timer style setting for a given prefix (player/target/pet/party)
    local function GetTimerStyle(prefix)
        return DFRL:GetTempDB("Auras", prefix .. "TimerStyle") or "White + Red"
    end

    local function GetTimerFontSize(prefix)
        return DFRL:GetTempDB("Auras", prefix .. "TimerFontSize") or 8
    end

    local function GetSortOrder(prefix)
        return DFRL:GetTempDB("Auras", prefix .. "SortOrder") or "Default"
    end

    -- Apply timer color based on style
    local function ApplyTimerColor(fontString, style)
        if style == "Gold" then
            fontString:SetTextColor(1.0, 0.82, 0)
        else
            fontString:SetTextColor(1, 1, 1)
        end
    end

    -------------------------------------------------------------------
    -- Event tracking for buff/debuff durations (UNIT_CASTEVENT + Nampower)
    -------------------------------------------------------------------

    local castTracker = CreateFrame("Frame")
    castTracker:RegisterEvent("UNIT_CASTEVENT")
    castTracker:SetScript("OnEvent", function()
        local casterGuid = arg1
        local targetGuid = arg2
        local eventType = arg3
        local spellId = arg4

        if eventType == "CAST" and targetGuid and targetGuid ~= "" and spellId then
            local name = CachedGetSpellName(spellId)
            local dur = LookupDuration(name)
            if dur then
                TrackDuration(targetGuid, spellId, dur)
            end
        end
    end)

    -- Nampower AURA_CAST events (exact duration in ms)
    pcall(function()
        local nampowerTracker = CreateFrame("Frame")
        nampowerTracker:RegisterEvent("AURA_CAST_ON_SELF")
        nampowerTracker:RegisterEvent("AURA_CAST_ON_OTHER")
        nampowerTracker:SetScript("OnEvent", function()
            local spellId = arg1
            local casterGuid = arg2
            local targetGuid = arg3
            local durationMs = arg8

            if not targetGuid or targetGuid == "" then
                targetGuid = casterGuid
            end

            if targetGuid and spellId and durationMs and type(durationMs) == "number" and durationMs > 0 then
                TrackDuration(targetGuid, spellId, durationMs / 1000)
            end
        end)
    end)

    -- Periodic cleanup of expired durations (every 60s)
    local cleanupTick = 0
    castTracker:SetScript("OnUpdate", function()
        if cleanupTick > GetTime() then return end
        cleanupTick = GetTime() + 60
        local now = GetTime()
        for guid, spells in pairs(auraDurations) do
            local empty = true
            for spellId, data in pairs(spells) do
                if data.start + data.duration < now then
                    spells[spellId] = nil
                else
                    empty = false
                end
            end
            if empty then auraDurations[guid] = nil end
        end
    end)

    -------------------------------------------------------------------
    -- Unit data
    -------------------------------------------------------------------

    local unitData = {
        player = { buffs = {}, debuffs = {}, unit = "player" },
        target = { buffs = {}, debuffs = {}, unit = "target" },
        pet    = { buffs = {}, debuffs = {}, unit = "pet" },
    }
    local partyData = {}
    for i = 1, 4 do
        partyData[i] = { buffs = {}, debuffs = {}, unit = "party" .. i }
    end

    -------------------------------------------------------------------
    -- Hide default Blizzard target buff/debuff frames
    -------------------------------------------------------------------

    local function HideBlizzardTargetAuras()
        for i = 1, 16 do
            local buff = _G["TargetFrameBuff" .. i]
            if buff then
                buff:Hide()
                buff:SetScript("OnShow", function() this:Hide() end)
            end
            local debuff = _G["TargetFrameDebuff" .. i]
            if debuff then
                debuff:Hide()
                debuff:SetScript("OnShow", function() this:Hide() end)
            end
        end
    end

    HideBlizzardTargetAuras()

    -- also hook TargetFrame_UpdateAuras to keep them hidden
    if _G.TargetFrame_UpdateAuras then
        local origTargetFrame_UpdateAuras = _G.TargetFrame_UpdateAuras
        _G.TargetFrame_UpdateAuras = function(a1, a2, a3, a4, a5)
            origTargetFrame_UpdateAuras(a1, a2, a3, a4, a5)
            HideBlizzardTargetAuras()
        end
    end

    -------------------------------------------------------------------
    -- Hide default Blizzard party buff tooltip & icons
    -------------------------------------------------------------------

    -- Suppress the party member buff tooltip that appears on hover
    if PartyMemberBuffTooltip then
        PartyMemberBuffTooltip:Hide()
        PartyMemberBuffTooltip.Show = function(self) self:Hide() end
    end

    -- Disable the default party buff refresh (creates default buff icons on party frames)
    if RefreshBuffs then
        RefreshBuffs = function() end
    end

    -- Hide default party member buff/debuff frames
    local function HideBlizzardPartyAuras()
        for p = 1, 4 do
            for i = 1, 4 do
                local buff = _G["PartyMemberFrame" .. p .. "Buff" .. i]
                if buff then
                    buff:Hide()
                    buff:SetScript("OnShow", function() this:Hide() end)
                end
            end
            for i = 1, 4 do
                local debuff = _G["PartyMemberFrame" .. p .. "Debuff" .. i]
                if debuff then
                    debuff:Hide()
                    debuff:SetScript("OnShow", function() this:Hide() end)
                end
            end
        end
    end

    HideBlizzardPartyAuras()

    -- Hide default pet buff/debuff frames
    local function HideBlizzardPetAuras()
        for i = 1, 4 do
            local buff = _G["PetFrameBuff" .. i]
            if buff then
                buff:Hide()
                buff:SetScript("OnShow", function() this:Hide() end)
            end
            local debuff = _G["PetFrameDebuff" .. i]
            if debuff then
                debuff:Hide()
                debuff:SetScript("OnShow", function() this:Hide() end)
            end
        end
    end

    HideBlizzardPetAuras()

    -- Re-hide after Blizzard updates party frames
    if _G.PartyMemberFrame_UpdateMember then
        local origPartyUpdate = _G.PartyMemberFrame_UpdateMember
        _G.PartyMemberFrame_UpdateMember = function(a1, a2, a3, a4, a5)
            origPartyUpdate(a1, a2, a3, a4, a5)
            HideBlizzardPartyAuras()
        end
    end

    if _G.PetFrame_Update then
        local origPetUpdate = _G.PetFrame_Update
        _G.PetFrame_Update = function(a1, a2, a3, a4, a5)
            origPetUpdate(a1, a2, a3, a4, a5)
            HideBlizzardPetAuras()
        end
    end

    -------------------------------------------------------------------
    -- Button creation
    -------------------------------------------------------------------

    -- create a high-level container for aura buttons so they render above pet/party frames
    local function CreateAuraContainer(parent, name)
        local container = CreateFrame("Frame", name, parent)
        container:SetAllPoints(parent)
        container:SetFrameStrata("MEDIUM")
        container:SetFrameLevel(10)
        return container
    end

    -- Draggable aura anchor: positioned relative to unit frame by default,
    -- can be repositioned via Ctrl+Shift+Alt (handled by frames.lua MakeFrameMovable).
    -- Position saved/restored via DFRL_FRAMEPOS by global frame name.
    local function CreateAuraAnchor(parent, name, defaultX, defaultY, anchorPoint, relPoint)
        local anchor = CreateFrame("Frame", name, UIParent)
        anchor:SetWidth(16)
        anchor:SetHeight(16)
        anchor:SetFrameStrata("MEDIUM")
        anchor:SetFrameLevel(10)

        -- default position relative to parent unit frame
        anchor:SetPoint(anchorPoint, parent, relPoint, defaultX, defaultY)

        return anchor
    end

    -- default positions relative to parent unit frames
    local playerAnchor = CreateAuraAnchor(PlayerFrame, "DFRL_AuraAnchor_Player", 100, -68, "TOPLEFT", "TOPLEFT")
    local targetAnchor = CreateAuraAnchor(TargetFrame, "DFRL_AuraAnchor_Target", -100, -68, "TOPRIGHT", "TOPRIGHT")
    local petAnchor = CreateAuraAnchor(PetFrame, "DFRL_AuraAnchor_Pet", 30, -2, "TOPLEFT", "BOTTOMLEFT")
    local partyAnchors = {}
    for i = 1, 4 do
        local pf = _G["PartyMemberFrame" .. i]
        if pf then
            partyAnchors[i] = CreateAuraAnchor(pf, "DFRL_AuraAnchor_Party" .. i, 30, -2, "TOPLEFT", "BOTTOMLEFT")
        end
    end

    -- containers for aura buttons (parented to UIParent so strata works)
    local playerAuraContainer = CreateAuraContainer(UIParent, "DFRL_PlayerAuras")
    local targetAuraContainer = CreateAuraContainer(UIParent, "DFRL_TargetAuras")
    local petAuraContainer = CreateAuraContainer(UIParent, "DFRL_PetAuras")
    local partyAuraContainers = {}
    for i = 1, 4 do
        local pf = _G["PartyMemberFrame" .. i]
        if pf then
            partyAuraContainers[i] = CreateAuraContainer(UIParent, "DFRL_PartyAuras" .. i)
        end
    end

    local function CreateBuffButton(parent, unit, index)
        local btn = CreateFrame("Button", nil, parent)
        btn:SetWidth(20)
        btn:SetHeight(20)
        btn.icon = btn:CreateTexture(nil, "ARTWORK")
        btn.icon:SetAllPoints(btn)
        btn.cooldown = CreateFrame("Model", nil, btn, "CooldownFrameTemplate")
        btn.cooldown:SetAllPoints(btn)
        btn.cooldown.noCooldownCount = true
        btn.cooldown:Hide()
        btn.timer = btn:CreateFontString(nil, "OVERLAY")
        btn.timer:SetFont("Fonts\\FRIZQT__.TTF", 8, "OUTLINE")
        btn.timer:SetTextColor(1, 1, 1)
        btn.timer:SetPoint("CENTER", btn, "CENTER", 0, 0)
        btn.timer:Hide()
        btn.buffIndex = index
        btn.parentUnit = unit
        btn:SetScript("OnEnter", function()
            GameTooltip:SetOwner(this, "ANCHOR_RIGHT")
            GameTooltip:SetUnitBuff(this.parentUnit, this.buffIndex)
        end)
        btn:SetScript("OnLeave", function()
            GameTooltip:Hide()
        end)
        btn:Hide()
        return btn
    end

    local function CreateDebuffButton(parent, unit, index)
        local btn = CreateFrame("Button", nil, parent)
        btn:SetWidth(20)
        btn:SetHeight(20)
        btn.icon = btn:CreateTexture(nil, "ARTWORK")
        btn.icon:SetAllPoints(btn)
        btn.border = btn:CreateTexture(nil, "OVERLAY")
        btn.border:SetTexture("Interface\\Buttons\\UI-Debuff-Overlays")
        btn.border:SetAllPoints(btn)
        btn.border:SetTexCoord(0.296875, 0.5703125, 0, 0.515625)
        btn.cooldown = CreateFrame("Model", nil, btn, "CooldownFrameTemplate")
        btn.cooldown:SetAllPoints(btn)
        btn.cooldown.noCooldownCount = true
        btn.cooldown:Hide()
        btn.timer = btn:CreateFontString(nil, "OVERLAY")
        btn.timer:SetFont("Fonts\\FRIZQT__.TTF", 8, "OUTLINE")
        btn.timer:SetTextColor(1, 1, 1)
        btn.timer:SetPoint("CENTER", btn, "CENTER", 0, 0)
        btn.timer:Hide()
        btn.count = btn:CreateFontString(nil, "OVERLAY")
        btn.count:SetFont("Fonts\\FRIZQT__.TTF", 8, "OUTLINE")
        btn.count:SetPoint("BOTTOMRIGHT", btn, "BOTTOMRIGHT", 0, 0)
        btn.count:Hide()
        btn.debuffIndex = index
        btn.parentUnit = unit
        btn:SetScript("OnEnter", function()
            GameTooltip:SetOwner(this, "ANCHOR_RIGHT")
            GameTooltip:SetUnitDebuff(this.parentUnit, this.debuffIndex)
        end)
        btn:SetScript("OnLeave", function()
            GameTooltip:Hide()
        end)
        btn:Hide()
        return btn
    end

    local function CreateBuffRow(parent, unit)
        local btns = {}
        for i = 1, 16 do
            btns[i] = CreateBuffButton(parent, unit, i)
        end
        return btns
    end

    local function CreateDebuffRow(parent, unit)
        local btns = {}
        for i = 1, 16 do
            btns[i] = CreateDebuffButton(parent, unit, i)
        end
        return btns
    end

    -------------------------------------------------------------------
    -- Layout helpers (compact - no gaps between visible icons)
    -------------------------------------------------------------------

    local function LayoutBuffs(buttons, anchor, anchorPoint, relPoint, xOff, yOff, growRight, iconSize, iconSpacing, perRow, sortedOrder)
        local step = iconSize + iconSpacing
        local visCount = 0
        if sortedOrder then
            for _, idx in ipairs(sortedOrder) do
                if buttons[idx]:IsShown() then
                    local row = math.floor(visCount / perRow)
                    local col = math.mod(visCount, perRow)
                    local colOff = growRight and (col * step) or (-col * step)
                    buttons[idx]:ClearAllPoints()
                    buttons[idx]:SetPoint(anchorPoint, anchor, relPoint, colOff + xOff, -row * step + yOff)
                    visCount = visCount + 1
                end
            end
        else
            for i = 1, 16 do
                if buttons[i]:IsShown() then
                    local row = math.floor(visCount / perRow)
                    local col = math.mod(visCount, perRow)
                    local colOff = growRight and (col * step) or (-col * step)
                    buttons[i]:ClearAllPoints()
                    buttons[i]:SetPoint(anchorPoint, anchor, relPoint, colOff + xOff, -row * step + yOff)
                    visCount = visCount + 1
                end
            end
        end
        return visCount
    end

    local function LayoutDebuffs(buttons, anchor, anchorPoint, relPoint, xOff, yOff, growRight, extraRowOffset, iconSize, iconSpacing, perRow, sortedOrder)
        local step = iconSize + iconSpacing
        local visCount = 0
        if sortedOrder then
            for _, idx in ipairs(sortedOrder) do
                if buttons[idx]:IsShown() then
                    local row = math.floor(visCount / perRow) + (extraRowOffset or 0)
                    local col = math.mod(visCount, perRow)
                    local colOff = growRight and (col * step) or (-col * step)
                    buttons[idx]:ClearAllPoints()
                    buttons[idx]:SetPoint(anchorPoint, anchor, relPoint, colOff + xOff, -row * step + yOff)
                    visCount = visCount + 1
                end
            end
        else
            for i = 1, 16 do
                if buttons[i]:IsShown() then
                    local row = math.floor(visCount / perRow) + (extraRowOffset or 0)
                    local col = math.mod(visCount, perRow)
                    local colOff = growRight and (col * step) or (-col * step)
                    buttons[i]:ClearAllPoints()
                    buttons[i]:SetPoint(anchorPoint, anchor, relPoint, colOff + xOff, -row * step + yOff)
                    visCount = visCount + 1
                end
            end
        end
        return visCount
    end

    -------------------------------------------------------------------
    -- Sort helper: builds sorted index list based on timeleft stored on buttons
    -------------------------------------------------------------------
    local function BuildSortedOrder(buttons, sortOrder)
        if not sortOrder or sortOrder == "Default" then return nil end
        local entries = {}
        for i = 1, 16 do
            if buttons[i]:IsShown() then
                local tl = buttons[i].timerDuration and buttons[i].timerDuration or 99999
                if buttons[i].timerStart and buttons[i].timerDuration then
                    tl = (buttons[i].timerStart + buttons[i].timerDuration) - GetTime()
                    if tl < 0 then tl = 0 end
                end
                table.insert(entries, {idx = i, timeLeft = tl})
            end
        end
        if sortOrder == "Duration ascending" then
            table.sort(entries, function(a, b) return a.timeLeft < b.timeLeft end)
        elseif sortOrder == "Duration descending" then
            table.sort(entries, function(a, b) return a.timeLeft > b.timeLeft end)
        end
        local order = {}
        for _, e in ipairs(entries) do
            table.insert(order, e.idx)
        end
        return order
    end

    -------------------------------------------------------------------
    -- Update functions
    -------------------------------------------------------------------

    local function UpdateBuffs(data, anchor, anchorPoint, relPoint, xOff, yOff, growRight, showTimer, iconSize, iconSpacing, perRow, timerStyle, timerFontSize, sortOrder)
        local visible = 0
        local guid = nil
        local texToSpell = {}
        timerStyle = timerStyle or "White + Red"
        timerFontSize = timerFontSize or 8

        -- Build texture-to-spellId map if we need timers
        if showTimer then
            if data.unit == "player" then
                local _, g = UnitExists("player")
                guid = g
            elseif data.unit == "target" then
                local _, g = UnitExists("target")
                guid = g
            elseif data.unit == "pet" then
                local _, g = UnitExists("pet")
                guid = g
            elseif string.find(data.unit, "party") then
                local _, g = UnitExists(data.unit)
                guid = g
            end
            if guid then
                texToSpell = BuildTexToSpellMap(guid)
            end
        end

        for i = 1, 16 do
            local texture = UnitBuff(data.unit, i)
            if texture then
                data.buffs[i].icon:SetTexture(texture)
                data.buffs[i]:SetWidth(iconSize)
                data.buffs[i]:SetHeight(iconSize)
                data.buffs[i].timer:SetFont("Fonts\\FRIZQT__.TTF", timerFontSize, "OUTLINE")
                ApplyTimerColor(data.buffs[i].timer, timerStyle)

                -- Buff timer via auraDurations tracking
                if showTimer and guid then
                    local spellId = texToSpell[string.lower(texture)]
                    local duration, timeleft = GetTrackedDuration(guid, spellId)
                    if duration and timeleft and timeleft > 0 then
                        data.buffs[i].timer:SetText(FormatTime(timeleft, timerStyle))
                        data.buffs[i].timer:Show()
                        data.buffs[i].timerStart = GetTime() + timeleft - duration
                        data.buffs[i].timerDuration = duration
                        data.buffs[i].timerStyle = timerStyle
                    else
                        data.buffs[i].timer:Hide()
                        data.buffs[i].timerStart = nil
                        data.buffs[i].timerDuration = nil
                    end
                else
                    data.buffs[i].timer:Hide()
                    data.buffs[i].timerStart = nil
                    data.buffs[i].timerDuration = nil
                end
                if data.buffs[i].cooldown then data.buffs[i].cooldown:Hide() end

                data.buffs[i]:Show()
                visible = visible + 1
            else
                data.buffs[i]:Hide()
            end
        end
        if visible > 0 then
            local sorted = BuildSortedOrder(data.buffs, sortOrder)
            LayoutBuffs(data.buffs, anchor, anchorPoint, relPoint, xOff, yOff, growRight, iconSize, iconSpacing, perRow, sorted)
        end
        return visible
    end

    local function UpdateDebuffs(data, anchor, anchorPoint, relPoint, xOff, yOff, growRight, extraRowOffset, showTimer, iconSize, iconSpacing, perRow, timerStyle, timerFontSize, showSpiral, sortOrder)
        extraRowOffset = extraRowOffset or 0
        timerStyle = timerStyle or "White + Red"
        timerFontSize = timerFontSize or 8

        local guid = nil
        local texToSpell = {}

        -- Build texture-to-spellId map for debuff timers too
        if showTimer then
            if data.unit == "player" then
                local _, g = UnitExists("player")
                guid = g
            elseif data.unit == "target" then
                local _, g = UnitExists("target")
                guid = g
            elseif data.unit == "pet" then
                local _, g = UnitExists("pet")
                guid = g
            elseif string.find(data.unit, "party") then
                local _, g = UnitExists(data.unit)
                guid = g
            end
            if guid then
                texToSpell = BuildTexToSpellMap(guid)
            end
        end

        for i = 1, 16 do
            local texture, stacks, debuffType = UnitDebuff(data.unit, i)
            if texture then
                data.debuffs[i].icon:SetTexture(texture)
                data.debuffs[i]:SetWidth(iconSize)
                data.debuffs[i]:SetHeight(iconSize)
                -- debuff type border color
                local color = DEBUFF_COLORS[debuffType] or DEFAULT_DEBUFF_COLOR
                data.debuffs[i].border:SetVertexColor(color[1], color[2], color[3])
                -- stack count
                if stacks and stacks > 1 then
                    data.debuffs[i].count:SetText(stacks)
                    data.debuffs[i].count:SetTextColor(0, 1, 0)
                    data.debuffs[i].count:Show()
                else
                    data.debuffs[i].count:Hide()
                end
                data.debuffs[i].timer:SetFont("Fonts\\FRIZQT__.TTF", timerFontSize, "OUTLINE")
                ApplyTimerColor(data.debuffs[i].timer, timerStyle)
                -- debuff timer: try auraDurations first (GUID-based), fall back to libdebuff
                if showTimer then
                    local duration, timeleft = nil, nil

                    -- Try GUID-based tracking first
                    if guid then
                        local spellId = texToSpell[string.lower(texture)]
                        duration, timeleft = GetTrackedDuration(guid, spellId)
                    end

                    -- Fall back to libdebuff name-based tracking
                    if not timeleft and libdebuff then
                        local _, _, _, _, _, dur, tl = libdebuff:UnitDebuff(data.unit, i)
                        if tl and tl > 0 then
                            duration = dur
                            timeleft = tl
                        end
                    end

                    if timeleft and timeleft > 0 then
                        data.debuffs[i].timer:SetText(FormatTime(timeleft, timerStyle))
                        data.debuffs[i].timer:Show()
                        data.debuffs[i].timerStart = GetTime() + timeleft - duration
                        data.debuffs[i].timerDuration = duration
                        data.debuffs[i].timerStyle = timerStyle
                        if showSpiral and data.debuffs[i].cooldown and CooldownFrame_SetTimer then
                            CooldownFrame_SetTimer(data.debuffs[i].cooldown, data.debuffs[i].timerStart, duration, 1)
                        elseif data.debuffs[i].cooldown then
                            data.debuffs[i].cooldown:Hide()
                        end
                    else
                        data.debuffs[i].timer:Hide()
                        data.debuffs[i].timerStart = nil
                        data.debuffs[i].timerDuration = nil
                        if data.debuffs[i].cooldown then data.debuffs[i].cooldown:Hide() end
                    end
                else
                    data.debuffs[i].timer:Hide()
                    data.debuffs[i].timerStart = nil
                    data.debuffs[i].timerDuration = nil
                    if data.debuffs[i].cooldown then data.debuffs[i].cooldown:Hide() end
                end
                data.debuffs[i]:Show()
            else
                data.debuffs[i]:Hide()
            end
        end
        local sorted = BuildSortedOrder(data.debuffs, sortOrder)
        LayoutDebuffs(data.debuffs, anchor, anchorPoint, relPoint, xOff, yOff, growRight, extraRowOffset, iconSize, iconSpacing, perRow, sorted)
    end

    local function CountVisibleBuffRows(data, perRow)
        if not data.buffs then return 0 end
        local count = 0
        for i = 1, 16 do
            if data.buffs[i] and data.buffs[i]:IsShown() then
                count = count + 1
            end
        end
        if count == 0 then return 0 end
        return math.floor((count - 1) / perRow) + 1
    end

    -------------------------------------------------------------------
    -- Create aura buttons (parented to high-level containers)
    -------------------------------------------------------------------

    unitData.player.buffs = CreateBuffRow(playerAuraContainer, "player")
    unitData.player.debuffs = CreateDebuffRow(playerAuraContainer, "player")

    unitData.target.buffs = CreateBuffRow(targetAuraContainer, "target")
    unitData.target.debuffs = CreateDebuffRow(targetAuraContainer, "target")

    unitData.pet.buffs = CreateBuffRow(petAuraContainer, "pet")
    unitData.pet.debuffs = CreateDebuffRow(petAuraContainer, "pet")

    for i = 1, 4 do
        if partyAuraContainers[i] then
            partyData[i].buffs = CreateBuffRow(partyAuraContainers[i], "party" .. i)
            partyData[i].debuffs = CreateDebuffRow(partyAuraContainers[i], "party" .. i)
        end
    end

    -------------------------------------------------------------------
    -- Per-frame update functions
    -------------------------------------------------------------------

    local function UpdatePlayerAuras()
        local showBuffs = DFRL:GetTempDB("Auras", "playerBuffs")
        local showDebuffs = DFRL:GetTempDB("Auras", "playerDebuffs")
        local showBuffTimer = DFRL:GetTempDB("Auras", "playerShowBuffTimer")
        local showDebuffTimer = DFRL:GetTempDB("Auras", "playerShowDebuffTimer")
        local growRight = DFRL:GetTempDB("Auras", "playerGrowRight")
        if growRight == nil then growRight = true end
        local showSpiral = DFRL:GetTempDB("Auras", "playerShowSpiral")
        if showSpiral == nil then showSpiral = true end
        local sz = GetAuraSize("player")
        local sp = GetAuraSpacing("player")
        local pr = GetAurasPerRow("player")
        local step = sz + sp
        local tStyle = GetTimerStyle("player")
        local tSize = GetTimerFontSize("player")
        local sOrder = GetSortOrder("player")

        if showBuffs then
            UpdateBuffs(unitData.player, playerAnchor, "TOPLEFT", "TOPLEFT", 0, 0, growRight, showBuffTimer, sz, sp, pr, tStyle, tSize, sOrder)
        else
            for i = 1, 16 do unitData.player.buffs[i]:Hide() end
        end

        local buffRows = showBuffs and CountVisibleBuffRows(unitData.player, pr) or 0

        if showDebuffs then
            UpdateDebuffs(unitData.player, playerAnchor, "TOPLEFT", "TOPLEFT", 0, -buffRows * step, growRight, 0, showDebuffTimer, sz, sp, pr, tStyle, tSize, showSpiral, sOrder)
        else
            for i = 1, 16 do unitData.player.debuffs[i]:Hide() end
        end
    end

    local function UpdateTargetAuras()
        local showBuffs = DFRL:GetTempDB("Auras", "targetBuffs")
        local showDebuffs = DFRL:GetTempDB("Auras", "targetDebuffs")
        local showBuffTimer = DFRL:GetTempDB("Auras", "targetShowBuffTimer")
        local showDebuffTimer = DFRL:GetTempDB("Auras", "targetShowDebuffTimer")
        local growRight = DFRL:GetTempDB("Auras", "targetGrowRight")
        if growRight == nil then growRight = false end
        local showSpiral = DFRL:GetTempDB("Auras", "targetShowSpiral")
        if showSpiral == nil then showSpiral = true end
        local sz = GetAuraSize("target")
        local sp = GetAuraSpacing("target")
        local pr = GetAurasPerRow("target")
        local step = sz + sp
        local tStyle = GetTimerStyle("target")
        local tSize = GetTimerFontSize("target")
        local sOrder = GetSortOrder("target")

        if showBuffs then
            UpdateBuffs(unitData.target, targetAnchor, "TOPRIGHT", "TOPRIGHT", 0, 0, growRight, showBuffTimer, sz, sp, pr, tStyle, tSize, sOrder)
        else
            for i = 1, 16 do unitData.target.buffs[i]:Hide() end
        end

        local buffRows = showBuffs and CountVisibleBuffRows(unitData.target, pr) or 0

        if showDebuffs then
            UpdateDebuffs(unitData.target, targetAnchor, "TOPRIGHT", "TOPRIGHT", 0, -buffRows * step, growRight, 0, showDebuffTimer, sz, sp, pr, tStyle, tSize, showSpiral, sOrder)
        else
            for i = 1, 16 do unitData.target.debuffs[i]:Hide() end
        end

        HideBlizzardTargetAuras()
    end

    local function UpdatePetAuras()
        local showBuffs = DFRL:GetTempDB("Auras", "petBuffs")
        local showDebuffs = DFRL:GetTempDB("Auras", "petDebuffs")
        local showBuffTimer = DFRL:GetTempDB("Auras", "petShowBuffTimer")
        local showDebuffTimer = DFRL:GetTempDB("Auras", "petShowDebuffTimer")
        local growRight = DFRL:GetTempDB("Auras", "petGrowRight")
        if growRight == nil then growRight = true end
        local showSpiral = DFRL:GetTempDB("Auras", "petShowSpiral")
        if showSpiral == nil then showSpiral = true end
        local sz = GetAuraSize("pet")
        local sp = GetAuraSpacing("pet")
        local pr = GetAurasPerRow("pet")
        local step = sz + sp
        local tStyle = GetTimerStyle("pet")
        local tSize = GetTimerFontSize("pet")
        local sOrder = GetSortOrder("pet")

        if showBuffs and UnitExists("pet") then
            UpdateBuffs(unitData.pet, petAnchor, "TOPLEFT", "TOPLEFT", 0, 0, growRight, showBuffTimer, sz, sp, pr, tStyle, tSize, sOrder)
        else
            for i = 1, 16 do unitData.pet.buffs[i]:Hide() end
        end

        local buffRows = showBuffs and CountVisibleBuffRows(unitData.pet, pr) or 0

        if showDebuffs and UnitExists("pet") then
            UpdateDebuffs(unitData.pet, petAnchor, "TOPLEFT", "TOPLEFT", 0, -buffRows * step, growRight, 0, showDebuffTimer, sz, sp, pr, tStyle, tSize, showSpiral, sOrder)
        else
            for i = 1, 16 do unitData.pet.debuffs[i]:Hide() end
        end
        HideBlizzardPetAuras()
    end

    local function UpdatePartyAuras()
        local showBuffs = DFRL:GetTempDB("Auras", "partyBuffs")
        local showDebuffs = DFRL:GetTempDB("Auras", "partyDebuffs")
        local showBuffTimer = DFRL:GetTempDB("Auras", "partyShowBuffTimer")
        local showDebuffTimer = DFRL:GetTempDB("Auras", "partyShowDebuffTimer")
        local growRight = DFRL:GetTempDB("Auras", "partyGrowRight")
        if growRight == nil then growRight = true end
        local showSpiral = DFRL:GetTempDB("Auras", "partyShowSpiral")
        if showSpiral == nil then showSpiral = true end
        local sz = GetAuraSize("party")
        local sp = GetAuraSpacing("party")
        local pr = GetAurasPerRow("party")
        local step = sz + sp
        local tStyle = GetTimerStyle("party")
        local tSize = GetTimerFontSize("party")
        local sOrder = GetSortOrder("party")

        for idx = 1, 4 do
            if not partyAnchors[idx] then break end

            if showBuffs and UnitExists("party" .. idx) then
                UpdateBuffs(partyData[idx], partyAnchors[idx], "TOPLEFT", "TOPLEFT", 0, 0, growRight, showBuffTimer, sz, sp, pr, tStyle, tSize, sOrder)
            else
                for i = 1, 16 do
                    if partyData[idx].buffs[i] then partyData[idx].buffs[i]:Hide() end
                end
            end

            local buffRows = showBuffs and CountVisibleBuffRows(partyData[idx], pr) or 0

            if showDebuffs and UnitExists("party" .. idx) then
                UpdateDebuffs(partyData[idx], partyAnchors[idx], "TOPLEFT", "TOPLEFT", 0, -buffRows * step, growRight, 0, showDebuffTimer, sz, sp, pr, tStyle, tSize, showSpiral, sOrder)
            else
                for i = 1, 16 do
                    if partyData[idx].debuffs[i] then partyData[idx].debuffs[i]:Hide() end
                end
            end
        end
        HideBlizzardPartyAuras()
    end

    local function UpdateAllAuras()
        UpdatePlayerAuras()
        UpdateTargetAuras()
        UpdatePetAuras()
        UpdatePartyAuras()
    end

    -------------------------------------------------------------------
    -- Timer refresh via OnUpdate (timers tick down continuously)
    -------------------------------------------------------------------

    -- Helper: tick down timers on a set of buttons
    local function RefreshTimers(buttons, count)
        for i = 1, (count or 16) do
            local btn = buttons[i]
            if btn and btn:IsShown() and btn.timerDuration and btn.timerStart then
                local remaining = btn.timerDuration - (GetTime() - btn.timerStart)
                if remaining > 0 then
                    btn.timer:SetText(FormatTime(remaining, btn.timerStyle))
                    btn.timer:Show()
                else
                    btn.timer:SetText("")
                    btn.timer:Hide()
                end
            end
        end
    end

    local timerFrame = CreateFrame("Frame")
    timerFrame.elapsed = 0
    timerFrame:SetScript("OnUpdate", function()
        timerFrame.elapsed = timerFrame.elapsed + arg1
        if timerFrame.elapsed < 0.1 then return end
        timerFrame.elapsed = 0

        -- Player
        if DFRL:GetTempDB("Auras", "playerShowBuffTimer") and DFRL:GetTempDB("Auras", "playerBuffs") then
            RefreshTimers(unitData.player.buffs)
        end
        if DFRL:GetTempDB("Auras", "playerShowDebuffTimer") and DFRL:GetTempDB("Auras", "playerDebuffs") then
            RefreshTimers(unitData.player.debuffs)
        end
        -- Target
        if UnitExists("target") then
            if DFRL:GetTempDB("Auras", "targetShowBuffTimer") and DFRL:GetTempDB("Auras", "targetBuffs") then
                RefreshTimers(unitData.target.buffs)
            end
            if DFRL:GetTempDB("Auras", "targetShowDebuffTimer") and DFRL:GetTempDB("Auras", "targetDebuffs") then
                RefreshTimers(unitData.target.debuffs)
            end
        end
        -- Pet
        if UnitExists("pet") then
            if DFRL:GetTempDB("Auras", "petShowBuffTimer") and DFRL:GetTempDB("Auras", "petBuffs") then
                RefreshTimers(unitData.pet.buffs)
            end
            if DFRL:GetTempDB("Auras", "petShowDebuffTimer") and DFRL:GetTempDB("Auras", "petDebuffs") then
                RefreshTimers(unitData.pet.debuffs)
            end
        end
        -- Party
        for idx = 1, 4 do
            if UnitExists("party" .. idx) then
                if DFRL:GetTempDB("Auras", "partyShowBuffTimer") and DFRL:GetTempDB("Auras", "partyBuffs") then
                    RefreshTimers(partyData[idx].buffs)
                end
                if DFRL:GetTempDB("Auras", "partyShowDebuffTimer") and DFRL:GetTempDB("Auras", "partyDebuffs") then
                    RefreshTimers(partyData[idx].debuffs)
                end
            end
        end
    end)

    -------------------------------------------------------------------
    -- Event handling (requires SuperWoW for UNIT_AURA)
    -------------------------------------------------------------------

    local eventFrame = CreateFrame("Frame")
    eventFrame:RegisterEvent("UNIT_AURA")
    eventFrame:RegisterEvent("PLAYER_AURAS_CHANGED")
    eventFrame:RegisterEvent("PLAYER_TARGET_CHANGED")
    eventFrame:RegisterEvent("PLAYER_ENTERING_WORLD")
    eventFrame:RegisterEvent("UNIT_PET")
    eventFrame:RegisterEvent("PARTY_MEMBERS_CHANGED")

    eventFrame:SetScript("OnEvent", function()
        if event == "UNIT_AURA" then
            if arg1 == "player" then
                UpdatePlayerAuras()
            elseif arg1 == "target" then
                UpdateTargetAuras()
            elseif arg1 == "pet" then
                UpdatePetAuras()
            elseif arg1 and string.find(arg1, "party") then
                UpdatePartyAuras()
            end
        elseif event == "PLAYER_AURAS_CHANGED" then
            UpdatePlayerAuras()
        elseif event == "PLAYER_TARGET_CHANGED" then
            UpdateTargetAuras()
        elseif event == "PLAYER_ENTERING_WORLD" then
            UpdateAllAuras()
        elseif event == "UNIT_PET" then
            UpdatePetAuras()
        elseif event == "PARTY_MEMBERS_CHANGED" then
            UpdatePartyAuras()
        end
    end)

    -------------------------------------------------------------------
    -- Buff Bar (top-right player buffs/debuffs/weapons, replaces Blizzard BuffFrame)
    -------------------------------------------------------------------

    local buffBar = {}
    buffBar.buffFrame = nil
    buffBar.debuffFrame = nil
    buffBar.weaponFrame = nil
    buffBar.active = false

    local DEBUFF_COLORS_BB = {
        ["none"]    = {0.80, 0, 0},
        ["Magic"]   = {0.20, 0.60, 1.00},
        ["Curse"]   = {0.60, 0.00, 1.00},
        ["Disease"] = {0.60, 0.40, 0},
        ["Poison"]  = {0.00, 0.60, 0},
    }

    local function BB_GetSetting(key)
        return DFRL:GetTempDB("Auras", key)
    end

    local function BB_FormatTime(timeLeft, style)
        return FormatTime(timeLeft, style)
    end

    local function BB_FormatTimeHHMM(seconds)
        local hours = math.floor(seconds / 3600)
        local mins = math.floor(math.mod(seconds, 3600) / 60)
        if hours > 0 then
            return string.format("%d:%02dh", hours, mins)
        else
            return string.format("0:%02dm", mins)
        end
    end

    local function BB_CreateButton(parent, name, id, buffFilter)
        local size = BB_GetSetting("buffBarSize") or 25
        local btn = CreateFrame("Button", name, parent)
        btn:SetWidth(size)
        btn:SetHeight(size)
        btn:SetID(id)
        btn.buffFilter = buffFilter

        btn.icon = btn:CreateTexture(nil, "BORDER")
        btn.icon:SetAllPoints(btn)

        btn.border = btn:CreateTexture(nil, "OVERLAY")
        btn.border:SetTexture("Interface\\Buttons\\UI-Debuff-Overlays")
        btn.border:SetWidth(size)
        btn.border:SetHeight(size)
        btn.border:SetPoint("CENTER", btn, "CENTER", 0, 0)
        btn.border:SetTexCoord(0.296875, 0.5703125, 0, 0.515625)
        btn.border:Hide()

        btn.cooldown = CreateFrame("Model", nil, btn, "CooldownFrameTemplate")
        btn.cooldown:SetAllPoints(btn)
        btn.cooldown.noCooldownCount = true
        btn.cooldown:Hide()

        btn.count = btn:CreateFontString(nil, "OVERLAY")
        btn.count:SetFont("Fonts\\FRIZQT__.TTF", 10, "OUTLINE")
        btn.count:SetPoint("BOTTOMRIGHT", btn, "BOTTOMRIGHT", -2, 2)
        btn.count:SetTextColor(1, 1, 1, 1)

        btn.duration = btn:CreateFontString(nil, "OVERLAY")
        btn.duration:SetFont("Fonts\\FRIZQT__.TTF", 10, "OUTLINE")
        btn.duration:SetTextColor(1, 1, 1, 1)

        return btn
    end

    local function BB_UpdateTimerPosition(btn)
        local inside = BB_GetSetting("buffBarTimerInside")
        btn.duration:ClearAllPoints()
        if inside then
            btn.duration:SetPoint("CENTER", btn, "CENTER", 0, 0)
        else
            btn.duration:SetPoint("TOP", btn, "BOTTOM", 0, 0)
        end
    end

    local function BB_UpdateIcon(btn)
        local frame = btn:GetParent()
        local sortedIndex = frame.sortedIndices and frame.sortedIndices[btn:GetID()] or btn:GetID()
        local buffIndex = GetPlayerBuff(sortedIndex, btn.buffFilter)
        btn.buffIndex = buffIndex
        if buffIndex >= 0 then
            local texture = GetPlayerBuffTexture(buffIndex)
            btn.icon:SetTexture(texture)
            btn:Show()
        else
            btn:Hide()
        end
    end

    local function BB_UpdateBorder(btn)
        if btn.buffFilter == "HARMFUL" then
            if btn.buffIndex and btn.buffIndex >= 0 then
                local debuffType = GetPlayerBuffDispelType(btn.buffIndex)
                local color = DEBUFF_COLORS_BB[debuffType] or DEBUFF_COLORS_BB["none"]
                btn.border:SetVertexColor(color[1], color[2], color[3])
                btn.border:Show()
            else
                btn.border:Hide()
            end
        end
    end

    local function BB_UpdateCount(btn)
        if btn.buffIndex and btn.buffIndex >= 0 then
            local count = GetPlayerBuffApplications(btn.buffIndex)
            if count > 1 then
                btn.count:SetText(count)
                btn.count:Show()
            else
                btn.count:Hide()
            end
        else
            btn.count:Hide()
        end
    end

    local function BB_UpdateDuration(btn)
        if btn.buffIndex and btn.buffIndex >= 0 then
            local timeLeft = GetPlayerBuffTimeLeft(btn.buffIndex)
            if timeLeft and timeLeft > 0 then
                local style = BB_GetSetting("buffBarTimerStyle") or "White + Red"
                local fontSize = BB_GetSetting("buffBarTimerFontSize") or 10
                btn.duration:SetFont("Fonts\\FRIZQT__.TTF", fontSize, "OUTLINE")
                ApplyTimerColor(btn.duration, style)
                btn.duration:SetText(BB_FormatTime(timeLeft, style))
                btn.duration:Show()
                -- Spiral only for debuffs (HARMFUL), not buffs
                if btn.buffFilter == "HARMFUL" then
                    local showSpiral = BB_GetSetting("buffBarShowSpiral")
                    if showSpiral == nil then showSpiral = true end
                    if showSpiral and btn.cooldown and CooldownFrame_SetTimer then
                        if not btn.cdTotalDur or timeLeft > btn.cdTotalDur then
                            btn.cdTotalDur = timeLeft
                            btn.cdStartTime = GetTime()
                            CooldownFrame_SetTimer(btn.cooldown, btn.cdStartTime, btn.cdTotalDur, 1)
                        end
                    elseif btn.cooldown then
                        btn.cooldown:Hide()
                        btn.cdTotalDur = nil
                    end
                elseif btn.cooldown then
                    btn.cooldown:Hide()
                end
            else
                btn.duration:Hide()
                if btn.cooldown then btn.cooldown:Hide() end
                btn.cdTotalDur = nil
            end
        else
            btn.duration:Hide()
            if btn.cooldown then btn.cooldown:Hide() end
            btn.cdTotalDur = nil
        end
    end

    local function BB_UpdateWeaponIcon(btn)
        local mh, mhtime, mhcharge, oh, ohtime, ohcharge = GetWeaponEnchantInfo()
        local hasEnchant = (btn:GetID() == 1 and mh) or (btn:GetID() == 2 and oh)
        if hasEnchant then
            local slot = btn:GetID() == 1 and 16 or 17
            local texture = GetInventoryItemTexture("player", slot)
            btn.icon:SetTexture(texture)
            btn:Show()
        else
            btn:Hide()
        end
    end

    local function BB_UpdateWeaponDuration(btn)
        local mh, mhtime, mhcharge, oh, ohtime, ohcharge = GetWeaponEnchantInfo()
        local timeLeft = 0
        if btn:GetID() == 1 and mh and mhtime then
            timeLeft = mhtime / 1000
        elseif btn:GetID() == 2 and oh and ohtime then
            timeLeft = ohtime / 1000
        end
        if timeLeft > 0 then
            local style = BB_GetSetting("buffBarTimerStyle") or "White + Red"
            local fontSize = BB_GetSetting("buffBarTimerFontSize") or 10
            btn.duration:SetFont("Fonts\\FRIZQT__.TTF", fontSize, "OUTLINE")
            ApplyTimerColor(btn.duration, style)
            btn.duration:SetText(BB_FormatTime(timeLeft, style))
            btn.duration:Show()
        else
            btn.duration:Hide()
        end
    end

    local function BB_UpdateWeaponCount(btn)
        local mh, mhtime, mhcharge, oh, ohtime, ohcharge = GetWeaponEnchantInfo()
        local count = 0
        if btn:GetID() == 1 and mhcharge then count = mhcharge end
        if btn:GetID() == 2 and ohcharge then count = ohcharge end
        if count > 1 then
            btn.count:SetText(count)
            btn.count:Show()
        else
            btn.count:Hide()
        end
    end

    local function BB_UpdateButton(btn)
        BB_UpdateIcon(btn)
        BB_UpdateBorder(btn)
        BB_UpdateCount(btn)
        BB_UpdateDuration(btn)
        BB_UpdateTimerPosition(btn)
    end

    local function BB_UpdateWeaponButton(btn)
        BB_UpdateWeaponIcon(btn)
        BB_UpdateWeaponCount(btn)
        BB_UpdateWeaponDuration(btn)
        BB_UpdateTimerPosition(btn)
    end

    local function BB_SortButtons(frame)
        local sortOrder = BB_GetSetting("buffBarSortOrder") or "Default"
        if sortOrder == "Default" then
            frame.sortedIndices = nil
            return
        end
        local buffData = {}
        local idx = 0
        while true do
            local buffIndex = GetPlayerBuff(idx, frame.buffFilter)
            if buffIndex < 0 then break end
            local timeLeft = GetPlayerBuffTimeLeft(buffIndex) or 0
            table.insert(buffData, {index = idx, timeLeft = timeLeft})
            idx = idx + 1
        end
        table.sort(buffData, function(a, b)
            if sortOrder == "Duration ascending" then
                return a.timeLeft < b.timeLeft
            else
                return a.timeLeft > b.timeLeft
            end
        end)
        frame.sortedIndices = {}
        for i = 1, table.getn(buffData) do
            frame.sortedIndices[i - 1] = buffData[i].index
        end
    end

    local function BB_UpdateLayout(frame, buttons, perRow)
        local total = table.getn(buttons)
        local cols = perRow
        local rows = math.ceil(total / cols)
        local size = BB_GetSetting("buffBarSize") or 25
        local gap = BB_GetSetting("buffBarSpacing") or 5

        local slotIndex = 1
        for row = 0, rows - 1 do
            for col = 0, cols - 1 do
                if slotIndex <= total then
                    local btn = buttons[slotIndex]
                    btn:ClearAllPoints()
                    btn:SetPoint("TOPRIGHT", frame, "TOPRIGHT", -(col * (size + gap)), -(row * (size + gap)))
                    btn:SetWidth(size)
                    btn:SetHeight(size)
                    btn.border:SetWidth(size)
                    btn.border:SetHeight(size)
                    slotIndex = slotIndex + 1
                end
            end
        end

        frame:SetWidth(cols * size + (cols - 1) * gap)
        frame:SetHeight(rows * size + (rows - 1) * gap)
    end

    local function BB_CreateBuffFrame(name, count, buffFilter, perRow)
        local frame = CreateFrame("Frame", name, UIParent)
        frame.buttons = {}
        frame.buffFilter = buffFilter
        frame:SetFrameStrata("LOW")

        for i = 1, count do
            local btn = BB_CreateButton(frame, name .. i, i - 1, buffFilter)
            -- OnUpdate for duration ticking
            btn:SetScript("OnUpdate", function()
                BB_UpdateDuration(this)
            end)
            btn:RegisterForClicks("RightButtonUp")
            btn:SetScript("OnClick", function()
                if this.buffIndex and this.buffIndex >= 0 then
                    CancelPlayerBuff(this.buffIndex)
                end
            end)
            btn:SetScript("OnEnter", function()
                if this.buffIndex and this.buffIndex >= 0 then
                    GameTooltip:SetOwner(this, "ANCHOR_BOTTOMRIGHT")
                    GameTooltip:SetPlayerBuff(this.buffIndex)
                    GameTooltip:Show()
                end
            end)
            btn:SetScript("OnLeave", function()
                GameTooltip:Hide()
            end)
            BB_UpdateButton(btn)
            frame.buttons[i] = btn
        end

        frame.tick = 0
        frame:SetScript("OnUpdate", function()
            if not frame:IsShown() then return end
            if frame.tick > GetTime() then return else frame.tick = GetTime() + 0.4 end
            BB_SortButtons(frame)
            for _, btn in pairs(frame.buttons) do
                BB_UpdateButton(btn)
            end
        end)

        BB_SortButtons(frame)
        BB_UpdateLayout(frame, frame.buttons, perRow)

        return frame
    end

    local function BB_CreateWeaponFrame(name, perRow)
        local frame = CreateFrame("Frame", name, UIParent)
        frame.buttons = {}
        frame:SetFrameStrata("LOW")

        for i = 1, 2 do
            local btn = BB_CreateButton(frame, name .. i, i, nil)
            btn:SetScript("OnUpdate", function()
                BB_UpdateWeaponDuration(this)
            end)
            btn:RegisterForClicks("RightButtonUp")
            btn:SetScript("OnClick", function()
                if CancelItemTempEnchantment then
                    CancelItemTempEnchantment(this:GetID())
                end
            end)
            btn:SetScript("OnEnter", function()
                local slot = this:GetID() == 1 and 16 or 17
                GameTooltip:SetOwner(this, "ANCHOR_BOTTOMRIGHT")
                GameTooltip:SetInventoryItem("player", slot)
            end)
            btn:SetScript("OnLeave", function()
                GameTooltip:Hide()
            end)
            BB_UpdateWeaponButton(btn)
            frame.buttons[i] = btn
        end

        frame.tick = 0
        frame:SetScript("OnUpdate", function()
            if not frame:IsShown() then return end
            if frame.tick > GetTime() then return else frame.tick = GetTime() + 0.4 end
            for _, btn in pairs(frame.buttons) do
                BB_UpdateWeaponButton(btn)
            end
        end)

        BB_UpdateLayout(frame, frame.buttons, perRow)

        return frame
    end

    -- Buff bar frames use DFRL's Ctrl+Alt+Shift drag system via frames.lua
    -- (added to framesToMakeMovable list there)

    local function BB_Init()
        if buffBar.active then return end

        local mode = BB_GetSetting("buffBarMode") or "Buff Bar"
        if mode == "Default" then
            -- Restore default BuffFrame
            if BuffFrame then
                BuffFrame:Show()
                BuffFrame:SetAlpha(1)
            end
            if TemporaryEnchantFrame then
                TemporaryEnchantFrame:Show()
                TemporaryEnchantFrame:SetAlpha(1)
            end
            return
        elseif mode == "Disabled" then
            -- Kill Blizzard's and don't create ours
            if BuffFrame then
                BuffFrame:Hide()
                BuffFrame:UnregisterAllEvents()
            end
            if TemporaryEnchantFrame then
                TemporaryEnchantFrame:Hide()
                TemporaryEnchantFrame:UnregisterAllEvents()
            end
            return
        end

        -- mode == "Buff Bar": kill defaults and create custom
        if BuffFrame then
            BuffFrame:Hide()
            BuffFrame:UnregisterAllEvents()
            BuffFrame:SetScript("OnUpdate", nil)
            BuffFrame:SetScript("OnEvent", nil)
            BuffFrame:SetScript("OnShow", function() this:Hide() end)
        end
        if TemporaryEnchantFrame then
            TemporaryEnchantFrame:Hide()
            TemporaryEnchantFrame:UnregisterAllEvents()
            TemporaryEnchantFrame:SetScript("OnUpdate", nil)
            TemporaryEnchantFrame:SetScript("OnShow", function() this:Hide() end)
        end

        local perRow = BB_GetSetting("buffBarPerRow") or 8
        local frameSpacing = BB_GetSetting("buffBarFrameSpacing") or 15

        buffBar.buffFrame = BB_CreateBuffFrame("DFRL_BuffBar_Buffs", 16, "HELPFUL", perRow)
        buffBar.buffFrame:SetPoint("TOPRIGHT", UIParent, "TOPRIGHT", -255, -20)

        buffBar.debuffFrame = BB_CreateBuffFrame("DFRL_BuffBar_Debuffs", 16, "HARMFUL", perRow)
        buffBar.debuffFrame:SetPoint("TOPRIGHT", buffBar.buffFrame, "BOTTOMRIGHT", 0, -frameSpacing)

        buffBar.weaponFrame = BB_CreateWeaponFrame("DFRL_BuffBar_Weapons", 2)
        buffBar.weaponFrame:SetPoint("TOPRIGHT", buffBar.debuffFrame, "BOTTOMRIGHT", 0, -frameSpacing)

        if not (BB_GetSetting("buffBarShowBuffs") == true or BB_GetSetting("buffBarShowBuffs") == nil) then
            buffBar.buffFrame:Hide()
        end
        if not BB_GetSetting("buffBarShowDebuffs") then
            buffBar.debuffFrame:Hide()
        end
        if not BB_GetSetting("buffBarShowWeapons") then
            buffBar.weaponFrame:Hide()
        end

        buffBar.active = true
    end

    local function BB_Refresh()
        if not buffBar.active then return end
        local perRow = BB_GetSetting("buffBarPerRow") or 8

        if buffBar.buffFrame then
            BB_UpdateLayout(buffBar.buffFrame, buffBar.buffFrame.buttons, perRow)
            for _, btn in pairs(buffBar.buffFrame.buttons) do BB_UpdateButton(btn) end
        end
        if buffBar.debuffFrame then
            BB_UpdateLayout(buffBar.debuffFrame, buffBar.debuffFrame.buttons, perRow)
            for _, btn in pairs(buffBar.debuffFrame.buttons) do BB_UpdateButton(btn) end
        end
        if buffBar.weaponFrame then
            BB_UpdateLayout(buffBar.weaponFrame, buffBar.weaponFrame.buttons, 2)
            for _, btn in pairs(buffBar.weaponFrame.buttons) do BB_UpdateWeaponButton(btn) end
        end

        -- Update section spacing
        local frameSpacing = BB_GetSetting("buffBarFrameSpacing") or 15
        if buffBar.debuffFrame then
            buffBar.debuffFrame:ClearAllPoints()
            buffBar.debuffFrame:SetPoint("TOPRIGHT", buffBar.buffFrame, "BOTTOMRIGHT", 0, -frameSpacing)
        end
        if buffBar.weaponFrame then
            buffBar.weaponFrame:ClearAllPoints()
            buffBar.weaponFrame:SetPoint("TOPRIGHT", buffBar.debuffFrame, "BOTTOMRIGHT", 0, -frameSpacing)
        end
    end

    -- Initialize buff bar on login
    BB_Init()

    -------------------------------------------------------------------
    -- Callbacks for config changes
    -------------------------------------------------------------------

    local callbacks = {}

    -- Player callbacks
    callbacks.playerBuffs = function() UpdatePlayerAuras() end
    callbacks.playerDebuffs = function() UpdatePlayerAuras() end
    callbacks.playerShowBuffTimer = function() UpdatePlayerAuras() end
    callbacks.playerShowDebuffTimer = function() UpdatePlayerAuras() end
    callbacks.playerAuraSize = function() UpdatePlayerAuras() end
    callbacks.playerAuraSpacing = function() UpdatePlayerAuras() end
    callbacks.playerAurasPerRow = function() UpdatePlayerAuras() end
    callbacks.playerGrowRight = function() UpdatePlayerAuras() end
    callbacks.playerTimerFontSize = function() UpdatePlayerAuras() end
    callbacks.playerTimerStyle = function() UpdatePlayerAuras() end
    callbacks.playerSortOrder = function() UpdatePlayerAuras() end
    -- Target callbacks
    callbacks.targetBuffs = function() UpdateTargetAuras() end
    callbacks.targetDebuffs = function() UpdateTargetAuras() end
    callbacks.targetShowBuffTimer = function() UpdateTargetAuras() end
    callbacks.targetShowDebuffTimer = function() UpdateTargetAuras() end
    callbacks.targetAuraSize = function() UpdateTargetAuras() end
    callbacks.targetAuraSpacing = function() UpdateTargetAuras() end
    callbacks.targetAurasPerRow = function() UpdateTargetAuras() end
    callbacks.targetGrowRight = function() UpdateTargetAuras() end
    callbacks.targetTimerFontSize = function() UpdateTargetAuras() end
    callbacks.targetTimerStyle = function() UpdateTargetAuras() end
    callbacks.targetSortOrder = function() UpdateTargetAuras() end
    -- Pet callbacks
    callbacks.petBuffs = function() UpdatePetAuras() end
    callbacks.petDebuffs = function() UpdatePetAuras() end
    callbacks.petShowBuffTimer = function() UpdatePetAuras() end
    callbacks.petShowDebuffTimer = function() UpdatePetAuras() end
    callbacks.petAuraSize = function() UpdatePetAuras() end
    callbacks.petAuraSpacing = function() UpdatePetAuras() end
    callbacks.petAurasPerRow = function() UpdatePetAuras() end
    callbacks.petGrowRight = function() UpdatePetAuras() end
    callbacks.petTimerFontSize = function() UpdatePetAuras() end
    callbacks.petTimerStyle = function() UpdatePetAuras() end
    callbacks.petSortOrder = function() UpdatePetAuras() end
    -- Party callbacks
    callbacks.partyBuffs = function() UpdatePartyAuras() end
    callbacks.partyDebuffs = function() UpdatePartyAuras() end
    callbacks.partyShowBuffTimer = function() UpdatePartyAuras() end
    callbacks.partyShowDebuffTimer = function() UpdatePartyAuras() end
    callbacks.partyAuraSize = function() UpdatePartyAuras() end
    callbacks.partyAuraSpacing = function() UpdatePartyAuras() end
    callbacks.partyAurasPerRow = function() UpdatePartyAuras() end
    callbacks.partyGrowRight = function() UpdatePartyAuras() end
    callbacks.partyTimerFontSize = function() UpdatePartyAuras() end
    callbacks.partyTimerStyle = function() UpdatePartyAuras() end
    callbacks.partySortOrder = function() UpdatePartyAuras() end
    -- Buff Bar callbacks
    callbacks.buffBarShowBuffs = function(val)
        if buffBar.buffFrame then
            if val then buffBar.buffFrame:Show() else buffBar.buffFrame:Hide() end
        end
    end
    callbacks.buffBarShowDebuffs = function(val)
        if buffBar.debuffFrame then
            if val then buffBar.debuffFrame:Show() else buffBar.debuffFrame:Hide() end
        end
    end
    callbacks.buffBarShowWeapons = function(val)
        if buffBar.weaponFrame then
            if val then buffBar.weaponFrame:Show() else buffBar.weaponFrame:Hide() end
        end
    end
    callbacks.buffBarSize = function() BB_Refresh() end
    callbacks.buffBarPerRow = function() BB_Refresh() end
    callbacks.buffBarSpacing = function() BB_Refresh() end
    callbacks.buffBarFrameSpacing = function() BB_Refresh() end
    callbacks.buffBarTimerInside = function() BB_Refresh() end
    callbacks.buffBarTimerFontSize = function() BB_Refresh() end
    callbacks.buffBarTimerStyle = function() BB_Refresh() end
    callbacks.buffBarSortOrder = function() BB_Refresh() end
    callbacks.buffBarShowSpiral = function() BB_Refresh() end
    -- Spiral callbacks
    callbacks.playerShowSpiral = function() UpdatePlayerAuras() end
    callbacks.targetShowSpiral = function() UpdateTargetAuras() end
    callbacks.petShowSpiral = function() UpdatePetAuras() end
    callbacks.partyShowSpiral = function() UpdatePartyAuras() end

    DFRL:NewCallbacks("Auras", callbacks)
end)
