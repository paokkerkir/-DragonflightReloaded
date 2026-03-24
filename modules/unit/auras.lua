DFRL:NewDefaults("Auras", {
    enabled = {true},
    -- Player
    playerBuffs = {true, "checkbox", nil, nil, "Player", 1, "Show buffs", nil, nil},
    playerDebuffs = {true, "checkbox", nil, nil, "Player", 2, "Show debuffs", nil, nil},
    playerShowBuffTimer = {true, "checkbox", nil, "playerBuffs", "Player", 3, "Show buff timers", nil, nil},
    playerShowDebuffTimer = {true, "checkbox", nil, "playerDebuffs", "Player", 4, "Show debuff timers", nil, nil},
    playerAuraSize = {20, "slider", {10, 30}, nil, "Player", 5, "Icon size", nil, nil},
    playerAuraSpacing = {2, "slider", {0, 6}, nil, "Player", 6, "Icon spacing", nil, nil},
    playerAurasPerRow = {5, "slider", {3, 8}, nil, "Player", 7, "Icons per row", nil, nil},
    playerGrowRight = {true, "checkbox", nil, nil, "Player", 8, "Grow icons right", nil, nil},
    -- Target
    targetBuffs = {true, "checkbox", nil, nil, "Target", 1, "Show buffs", nil, nil},
    targetDebuffs = {true, "checkbox", nil, nil, "Target", 2, "Show debuffs", nil, nil},
    targetShowBuffTimer = {true, "checkbox", nil, "targetBuffs", "Target", 3, "Show buff timers", nil, nil},
    targetShowDebuffTimer = {true, "checkbox", nil, "targetDebuffs", "Target", 4, "Show debuff timers", nil, nil},
    targetAuraSize = {20, "slider", {10, 30}, nil, "Target", 5, "Icon size", nil, nil},
    targetAuraSpacing = {2, "slider", {0, 6}, nil, "Target", 6, "Icon spacing", nil, nil},
    targetAurasPerRow = {5, "slider", {3, 8}, nil, "Target", 7, "Icons per row", nil, nil},
    targetGrowRight = {false, "checkbox", nil, nil, "Target", 8, "Grow icons right", nil, nil},
    -- Pet
    petBuffs = {true, "checkbox", nil, nil, "Pet", 1, "Show buffs", nil, nil},
    petDebuffs = {true, "checkbox", nil, nil, "Pet", 2, "Show debuffs", nil, nil},
    petShowBuffTimer = {true, "checkbox", nil, "petBuffs", "Pet", 3, "Show buff timers", nil, nil},
    petShowDebuffTimer = {true, "checkbox", nil, "petDebuffs", "Pet", 4, "Show debuff timers", nil, nil},
    petAuraSize = {20, "slider", {10, 30}, nil, "Pet", 5, "Icon size", nil, nil},
    petAuraSpacing = {2, "slider", {0, 6}, nil, "Pet", 6, "Icon spacing", nil, nil},
    petAurasPerRow = {5, "slider", {3, 8}, nil, "Pet", 7, "Icons per row", nil, nil},
    petGrowRight = {true, "checkbox", nil, nil, "Pet", 8, "Grow icons right", nil, nil},
    -- Party
    partyBuffs = {true, "checkbox", nil, nil, "Party", 1, "Show buffs", nil, nil},
    partyDebuffs = {true, "checkbox", nil, nil, "Party", 2, "Show debuffs", nil, nil},
    partyShowBuffTimer = {true, "checkbox", nil, "partyBuffs", "Party", 3, "Show buff timers", nil, nil},
    partyShowDebuffTimer = {true, "checkbox", nil, "partyDebuffs", "Party", 4, "Show debuff timers", nil, nil},
    partyAuraSize = {20, "slider", {10, 30}, nil, "Party", 5, "Icon size", nil, nil},
    partyAuraSpacing = {2, "slider", {0, 6}, nil, "Party", 6, "Icon spacing", nil, nil},
    partyAurasPerRow = {5, "slider", {3, 8}, nil, "Party", 7, "Icons per row", nil, nil},
    partyGrowRight = {true, "checkbox", nil, nil, "Party", 8, "Grow icons right", nil, nil},
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

    -- Time formatter
    local function FormatTime(remaining)
        if remaining >= 86400 then
            return math.floor(remaining / 86400) .. "d"
        elseif remaining >= 3600 then
            return math.floor(remaining / 3600) .. "h"
        elseif remaining >= 60 then
            return math.floor(remaining / 60) .. "m"
        else
            return math.floor(remaining) .. ""
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
        btn.timer = btn:CreateFontString(nil, "OVERLAY")
        btn.timer:SetFont("Fonts\\FRIZQT__.TTF", 8, "OUTLINE")
        btn.timer:SetTextColor(1.0, 0.82, 0)
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
        btn.timer = btn:CreateFontString(nil, "OVERLAY")
        btn.timer:SetFont("Fonts\\FRIZQT__.TTF", 8, "OUTLINE")
        btn.timer:SetTextColor(1.0, 0.82, 0)
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

    local function LayoutBuffs(buttons, anchor, anchorPoint, relPoint, xOff, yOff, growRight, iconSize, iconSpacing, perRow)
        local step = iconSize + iconSpacing
        local visCount = 0
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
        return visCount
    end

    local function LayoutDebuffs(buttons, anchor, anchorPoint, relPoint, xOff, yOff, growRight, extraRowOffset, iconSize, iconSpacing, perRow)
        local step = iconSize + iconSpacing
        local visCount = 0
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
        return visCount
    end

    -------------------------------------------------------------------
    -- Update functions
    -------------------------------------------------------------------

    local function UpdateBuffs(data, anchor, anchorPoint, relPoint, xOff, yOff, growRight, showTimer, iconSize, iconSpacing, perRow)
        local visible = 0
        local guid = nil
        local texToSpell = {}

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

                -- Buff timer via auraDurations tracking
                if showTimer and guid then
                    local spellId = texToSpell[string.lower(texture)]
                    local duration, timeleft = GetTrackedDuration(guid, spellId)
                    if duration and timeleft and timeleft > 0 then
                        data.buffs[i].timer:SetText(FormatTime(timeleft))
                        data.buffs[i].timer:Show()
                        data.buffs[i].timerStart = GetTime() + timeleft - duration
                        data.buffs[i].timerDuration = duration
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

                data.buffs[i]:Show()
                visible = visible + 1
            else
                data.buffs[i]:Hide()
            end
        end
        if visible > 0 then
            LayoutBuffs(data.buffs, anchor, anchorPoint, relPoint, xOff, yOff, growRight, iconSize, iconSpacing, perRow)
        end
        return visible
    end

    local function UpdateDebuffs(data, anchor, anchorPoint, relPoint, xOff, yOff, growRight, extraRowOffset, showTimer, iconSize, iconSpacing, perRow)
        extraRowOffset = extraRowOffset or 0

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
                        data.debuffs[i].timer:SetText(FormatTime(timeleft))
                        data.debuffs[i].timer:Show()
                        data.debuffs[i].timerStart = GetTime() + timeleft - duration
                        data.debuffs[i].timerDuration = duration
                    else
                        data.debuffs[i].timer:Hide()
                        data.debuffs[i].timerStart = nil
                        data.debuffs[i].timerDuration = nil
                    end
                else
                    data.debuffs[i].timer:Hide()
                    data.debuffs[i].timerStart = nil
                    data.debuffs[i].timerDuration = nil
                end
                data.debuffs[i]:Show()
            else
                data.debuffs[i]:Hide()
            end
        end
        LayoutDebuffs(data.debuffs, anchor, anchorPoint, relPoint, xOff, yOff, growRight, extraRowOffset, iconSize, iconSpacing, perRow)
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
        local sz = GetAuraSize("player")
        local sp = GetAuraSpacing("player")
        local pr = GetAurasPerRow("player")
        local step = sz + sp

        if showBuffs then
            UpdateBuffs(unitData.player, playerAnchor, "TOPLEFT", "TOPLEFT", 0, 0, growRight, showBuffTimer, sz, sp, pr)
        else
            for i = 1, 16 do unitData.player.buffs[i]:Hide() end
        end

        local buffRows = showBuffs and CountVisibleBuffRows(unitData.player, pr) or 0

        if showDebuffs then
            UpdateDebuffs(unitData.player, playerAnchor, "TOPLEFT", "TOPLEFT", 0, -buffRows * step, growRight, 0, showDebuffTimer, sz, sp, pr)
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
        local sz = GetAuraSize("target")
        local sp = GetAuraSpacing("target")
        local pr = GetAurasPerRow("target")
        local step = sz + sp

        if showBuffs then
            UpdateBuffs(unitData.target, targetAnchor, "TOPRIGHT", "TOPRIGHT", 0, 0, growRight, showBuffTimer, sz, sp, pr)
        else
            for i = 1, 16 do unitData.target.buffs[i]:Hide() end
        end

        local buffRows = showBuffs and CountVisibleBuffRows(unitData.target, pr) or 0

        if showDebuffs then
            UpdateDebuffs(unitData.target, targetAnchor, "TOPRIGHT", "TOPRIGHT", 0, -buffRows * step, growRight, 0, showDebuffTimer, sz, sp, pr)
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
        local sz = GetAuraSize("pet")
        local sp = GetAuraSpacing("pet")
        local pr = GetAurasPerRow("pet")
        local step = sz + sp

        if showBuffs and UnitExists("pet") then
            UpdateBuffs(unitData.pet, petAnchor, "TOPLEFT", "TOPLEFT", 0, 0, growRight, showBuffTimer, sz, sp, pr)
        else
            for i = 1, 16 do unitData.pet.buffs[i]:Hide() end
        end

        local buffRows = showBuffs and CountVisibleBuffRows(unitData.pet, pr) or 0

        if showDebuffs and UnitExists("pet") then
            UpdateDebuffs(unitData.pet, petAnchor, "TOPLEFT", "TOPLEFT", 0, -buffRows * step, growRight, 0, showDebuffTimer, sz, sp, pr)
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
        local sz = GetAuraSize("party")
        local sp = GetAuraSpacing("party")
        local pr = GetAurasPerRow("party")
        local step = sz + sp

        for idx = 1, 4 do
            if not partyAnchors[idx] then break end

            if showBuffs and UnitExists("party" .. idx) then
                UpdateBuffs(partyData[idx], partyAnchors[idx], "TOPLEFT", "TOPLEFT", 0, 0, growRight, showBuffTimer, sz, sp, pr)
            else
                for i = 1, 16 do
                    if partyData[idx].buffs[i] then partyData[idx].buffs[i]:Hide() end
                end
            end

            local buffRows = showBuffs and CountVisibleBuffRows(partyData[idx], pr) or 0

            if showDebuffs and UnitExists("party" .. idx) then
                UpdateDebuffs(partyData[idx], partyAnchors[idx], "TOPLEFT", "TOPLEFT", 0, -buffRows * step, growRight, 0, showDebuffTimer, sz, sp, pr)
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

    local timerFrame = CreateFrame("Frame")
    timerFrame.elapsed = 0
    timerFrame:SetScript("OnUpdate", function()
        timerFrame.elapsed = timerFrame.elapsed + arg1
        if timerFrame.elapsed < 0.1 then return end
        timerFrame.elapsed = 0

        -- Refresh buff timers on player
        local showPlayerBuffTimer = DFRL:GetTempDB("Auras", "playerShowBuffTimer")
        local showPlayerBuffs = DFRL:GetTempDB("Auras", "playerBuffs")
        if showPlayerBuffTimer and showPlayerBuffs then
            for i = 1, 16 do
                local btn = unitData.player.buffs[i]
                if btn and btn:IsShown() and btn.timerDuration and btn.timerStart then
                    local remaining = btn.timerDuration - (GetTime() - btn.timerStart)
                    if remaining > 0 then
                        btn.timer:SetText(FormatTime(remaining))
                        btn.timer:Show()
                    else
                        btn.timer:SetText("")
                        btn.timer:Hide()
                    end
                end
            end
        end

        -- Refresh debuff timers on player
        local showPlayerDebuffTimer = DFRL:GetTempDB("Auras", "playerShowDebuffTimer")
        local showPlayerDebuffs = DFRL:GetTempDB("Auras", "playerDebuffs")
        if showPlayerDebuffTimer and showPlayerDebuffs then
            for i = 1, 16 do
                local btn = unitData.player.debuffs[i]
                if btn and btn:IsShown() and btn.timerDuration and btn.timerStart then
                    local remaining = btn.timerDuration - (GetTime() - btn.timerStart)
                    if remaining > 0 then
                        btn.timer:SetText(FormatTime(remaining))
                        btn.timer:Show()
                    else
                        btn.timer:SetText("")
                        btn.timer:Hide()
                    end
                end
            end
        end

        -- Refresh buff timers on target
        local showTargetBuffTimer = DFRL:GetTempDB("Auras", "targetShowBuffTimer")
        local showTargetBuffs = DFRL:GetTempDB("Auras", "targetBuffs")
        if showTargetBuffTimer and showTargetBuffs and UnitExists("target") then
            for i = 1, 16 do
                local btn = unitData.target.buffs[i]
                if btn and btn:IsShown() and btn.timerDuration and btn.timerStart then
                    local remaining = btn.timerDuration - (GetTime() - btn.timerStart)
                    if remaining > 0 then
                        btn.timer:SetText(FormatTime(remaining))
                        btn.timer:Show()
                    else
                        btn.timer:SetText("")
                        btn.timer:Hide()
                    end
                end
            end
        end

        -- Refresh debuff timers on target
        local showTargetDebuffTimer = DFRL:GetTempDB("Auras", "targetShowDebuffTimer")
        local showTargetDebuffs = DFRL:GetTempDB("Auras", "targetDebuffs")
        if showTargetDebuffTimer and showTargetDebuffs and UnitExists("target") then
            for i = 1, 16 do
                local btn = unitData.target.debuffs[i]
                if btn and btn:IsShown() and btn.timerDuration and btn.timerStart then
                    local remaining = btn.timerDuration - (GetTime() - btn.timerStart)
                    if remaining > 0 then
                        btn.timer:SetText(FormatTime(remaining))
                        btn.timer:Show()
                    else
                        btn.timer:SetText("")
                        btn.timer:Hide()
                    end
                end
            end
        end

        -- Refresh buff timers on pet
        local showPetBuffTimer = DFRL:GetTempDB("Auras", "petShowBuffTimer")
        local showPetBuffs = DFRL:GetTempDB("Auras", "petBuffs")
        if showPetBuffTimer and showPetBuffs and UnitExists("pet") then
            for i = 1, 16 do
                local btn = unitData.pet.buffs[i]
                if btn and btn:IsShown() and btn.timerDuration and btn.timerStart then
                    local remaining = btn.timerDuration - (GetTime() - btn.timerStart)
                    if remaining > 0 then
                        btn.timer:SetText(FormatTime(remaining))
                        btn.timer:Show()
                    else
                        btn.timer:SetText("")
                        btn.timer:Hide()
                    end
                end
            end
        end

        -- Refresh debuff timers on pet
        local showPetDebuffTimer = DFRL:GetTempDB("Auras", "petShowDebuffTimer")
        local showPetDebuffs = DFRL:GetTempDB("Auras", "petDebuffs")
        if showPetDebuffTimer and showPetDebuffs and UnitExists("pet") then
            for i = 1, 16 do
                local btn = unitData.pet.debuffs[i]
                if btn and btn:IsShown() and btn.timerDuration and btn.timerStart then
                    local remaining = btn.timerDuration - (GetTime() - btn.timerStart)
                    if remaining > 0 then
                        btn.timer:SetText(FormatTime(remaining))
                        btn.timer:Show()
                    else
                        btn.timer:SetText("")
                        btn.timer:Hide()
                    end
                end
            end
        end

        -- Refresh buff timers on party
        local showPartyBuffTimer = DFRL:GetTempDB("Auras", "partyShowBuffTimer")
        local showPartyBuffsFlag = DFRL:GetTempDB("Auras", "partyBuffs")
        if showPartyBuffTimer and showPartyBuffsFlag then
            for idx = 1, 4 do
                if UnitExists("party" .. idx) then
                    for i = 1, 16 do
                        local btn = partyData[idx].buffs[i]
                        if btn and btn:IsShown() and btn.timerDuration and btn.timerStart then
                            local remaining = btn.timerDuration - (GetTime() - btn.timerStart)
                            if remaining > 0 then
                                btn.timer:SetText(FormatTime(remaining))
                                btn.timer:Show()
                            else
                                btn.timer:SetText("")
                                btn.timer:Hide()
                            end
                        end
                    end
                end
            end
        end

        -- Refresh debuff timers on party
        local showPartyDebuffTimer = DFRL:GetTempDB("Auras", "partyShowDebuffTimer")
        local showPartyDebuffs = DFRL:GetTempDB("Auras", "partyDebuffs")
        if showPartyDebuffTimer and showPartyDebuffs then
            for idx = 1, 4 do
                if UnitExists("party" .. idx) then
                    for i = 1, 16 do
                        local btn = partyData[idx].debuffs[i]
                        if btn and btn:IsShown() and btn.timerDuration and btn.timerStart then
                            local remaining = btn.timerDuration - (GetTime() - btn.timerStart)
                            if remaining > 0 then
                                btn.timer:SetText(FormatTime(remaining))
                                btn.timer:Show()
                            else
                                btn.timer:SetText("")
                                btn.timer:Hide()
                            end
                        end
                    end
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
    -- Target callbacks
    callbacks.targetBuffs = function() UpdateTargetAuras() end
    callbacks.targetDebuffs = function() UpdateTargetAuras() end
    callbacks.targetShowBuffTimer = function() UpdateTargetAuras() end
    callbacks.targetShowDebuffTimer = function() UpdateTargetAuras() end
    callbacks.targetAuraSize = function() UpdateTargetAuras() end
    callbacks.targetAuraSpacing = function() UpdateTargetAuras() end
    callbacks.targetAurasPerRow = function() UpdateTargetAuras() end
    -- Pet callbacks
    callbacks.petBuffs = function() UpdatePetAuras() end
    callbacks.petDebuffs = function() UpdatePetAuras() end
    callbacks.petShowBuffTimer = function() UpdatePetAuras() end
    callbacks.petShowDebuffTimer = function() UpdatePetAuras() end
    callbacks.petAuraSize = function() UpdatePetAuras() end
    callbacks.petAuraSpacing = function() UpdatePetAuras() end
    callbacks.petAurasPerRow = function() UpdatePetAuras() end
    -- Party callbacks
    callbacks.partyBuffs = function() UpdatePartyAuras() end
    callbacks.partyDebuffs = function() UpdatePartyAuras() end
    callbacks.partyShowBuffTimer = function() UpdatePartyAuras() end
    callbacks.partyShowDebuffTimer = function() UpdatePartyAuras() end
    callbacks.partyAuraSize = function() UpdatePartyAuras() end
    callbacks.partyAuraSpacing = function() UpdatePartyAuras() end
    callbacks.partyAurasPerRow = function() UpdatePartyAuras() end

    DFRL:NewCallbacks("Auras", callbacks)
end)
