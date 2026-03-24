-- Tooltip scanner library for DragonflightReloaded
-- Ported from Dragonflight3 (credit: shagu v1.0)
-- Provides hidden tooltip scanning for reading buff/debuff names

local scanner = {}
local libtipscan = {}

local function isEmpty(value)
    if value == nil then return true end
    if type(value) == "string" then return value == "" end
    if type(value) == "table" then
        for _ in pairs(value) do return false end
        return true
    end
    return false
end

local SET_METHODS = {
    "SetBagItem", "SetAction", "SetAuctionItem", "SetAuctionSellItem", "SetBuybackItem",
    "SetCraftItem", "SetCraftSpell", "SetHyperlink", "SetInboxItem", "SetInventoryItem",
    "SetLootItem", "SetLootRollItem", "SetMerchantItem", "SetPetAction", "SetPlayerBuff",
    "SetQuestItem", "SetQuestLogItem", "SetQuestRewardSpell", "SetSendMailItem", "SetShapeshift",
    "SetSpell", "SetTalent", "SetTrackingSpell", "SetTradePlayerItem", "SetTradeSkillItem", "SetTradeTargetItem",
    "SetTrainerService", "SetUnit", "SetUnitBuff", "SetUnitDebuff"
}

function scanner:GetText()
    local name = self:GetName()
    local result = {}
    for i = 1, self:NumLines() do
        local leftName = name .. "TextLeft" .. i
        local rightName = name .. "TextRight" .. i
        local left = _G[leftName]
        local right = _G[rightName]
        local leftText = left and left:IsVisible() and left:GetText()
        local rightText = right and right:IsVisible() and right:GetText()
        leftText = not isEmpty(leftText) and leftText or nil
        rightText = not isEmpty(rightText) and rightText or nil
        if leftText or rightText then
            result[i] = {leftText, rightText}
        end
    end
    return result
end

function scanner:FindText(pattern, exact)
    local name = self:GetName()
    for i = 1, self:NumLines() do
        local leftName = name .. "TextLeft" .. i
        local rightName = name .. "TextRight" .. i
        local left = _G[leftName]
        local right = _G[rightName]
        local leftText = left and left:IsVisible() and left:GetText()
        local rightText = right and right:IsVisible() and right:GetText()

        if exact then
            if (leftText and leftText == pattern) or (rightText and rightText == pattern) then
                return i, pattern
            end
        else
            if leftText then
                local found, _, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10 = string.find(leftText, pattern)
                if found then
                    return i, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10
                end
            end
            if rightText then
                local found, _, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10 = string.find(rightText, pattern)
                if found then
                    return i, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10
                end
            end
        end
    end
end

function scanner:GetLine(lineNum)
    local name = self:GetName()
    if lineNum <= self:NumLines() then
        local leftName = name .. "TextLeft" .. lineNum
        local rightName = name .. "TextRight" .. lineNum
        local left = _G[leftName]
        local right = _G[rightName]
        local leftText = left and left:IsVisible() and left:GetText()
        local rightText = right and right:IsVisible() and right:GetText()
        if leftText or rightText then
            return leftText, rightText
        end
    end
end

libtipscan.registry = setmetatable({}, {
    __index = function(t, name)
        local tooltip = CreateFrame("GameTooltip", "DFRL_Scan" .. name, nil, "GameTooltipTemplate")
        tooltip:SetOwner(WorldFrame, "ANCHOR_NONE")
        tooltip:SetScript("OnHide", function()
            this:SetOwner(WorldFrame, "ANCHOR_NONE")
        end)

        for key, method in pairs(scanner) do
            tooltip[key] = method
        end

        for _, methodName in ipairs(SET_METHODS) do
            local original = tooltip[methodName]
            if original then
                tooltip[methodName] = function(self, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10)
                    self:ClearLines()
                    self:SetOwner(WorldFrame, "ANCHOR_NONE")
                    return original(self, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10)
                end
            end
        end

        rawset(t, name, tooltip)
        return tooltip
    end
})

function libtipscan:GetScanner(name)
    local tooltip = self.registry[name]
    tooltip:ClearLines()
    return tooltip
end

DFRL_Libs = DFRL_Libs or {}
DFRL_Libs.libtipscan = libtipscan
