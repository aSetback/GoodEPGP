GoodEPGP = LibStub("AceAddon-3.0"):NewAddon("GoodEPGP", "AceConsole-3.0", "AceEvent-3.0", "AceHook-3.0")

SLASH_GEP1, SLASH_GEP2 = "/goodepgp", "/gep"
function SlashCmdList.GEP(msg, editbox)
   local subcmd = select(1, strsplit(" ", msg))
   local arg1 = select(2, strsplit(" ", msg))
   local arg2 = select(3, strsplit(" ", msg))
   if (subcmd == "ep") then
        if (arg1 ~= "" and arg2 ~= "") then
            if (GoodEPGP:UCFirst(arg1) == "Raid") then
                GoodEPGP:AddEPToRaid(arg2)
            else
                GoodEPGP:AddEPByName(arg1, arg2)
            end
        end
    end
    if (subcmd == "gp") then
        if (arg1 ~= "" and arg2 ~= "") then
            GoodEPGP:AddGPByName(arg1, arg2)
        end
    end
    if (subcmd == "info") then 
        if (arg1 ~= "") then
            GoodEPGP:PlayerInfo(arg1)
        end
    end

end

function GoodEPGP:OnInitialize()
    self:Print("Add-on Initialized.")
end

function GoodEPGP:OnEnable()
    self:Print("Add-on Enabled.")
    self:RegisterEvent("LOOT_OPENED")
    GoodEPGP:GuildRoster()
    GoodEPGP:RaidRoster()
end

function GoodEPGP:OnDisable()
    self:Print("Add-on Disabled.")
end

function GoodEPGP:LOOT_OPENED()
	local n = GetNumLootItems()
	for i = 1, n do
        _G["LootButton" .. tostring(i)]:SetScript("OnClick", function(button, data)
            GoodEPGP:LootClick(button, data, i);
        end)    
	end
end

function GoodEPGP:LootClick(button, data, key)
    if not IsAltKeyDown() then return end
    local item = GetLootSlotLink(key)
    local itemName = select(1, GetItemInfo(item))
    local itemLink = select(2, GetItemInfo(item))
    local itemID = select(2, strsplit(":", itemLink, 3))
    if (data == "LeftButton") then
        GoodEPGP:WidestAudience("Whisper me a + to bid on " .. itemLink .. " as main spec.")
    else 
        GoodEPGP:WidestAudience("Whisper me a - to bid on " .. itemLink .. " as off spec.")
    end
end

function GoodEPGP:WidestAudience(msg)
    local channel = "GUILD"
    if UnitInRaid("player") then
        if (UnitIsGroupLeader("player") or UnitIsGroupAssistant("player")) then
        channel = "RAID_WARNING"
        else
        channel = "RAID"
        end
    elseif UnitExists("party1") then
        channel = "PARTY"
    end
    SendChatMessage(msg, channel)
end

function GoodEPGP:GuildRoster()
    local guildMembers = GetNumGuildMembers()
    GoodEPGP.guildRoster = {};
    
    for i = 1, guildMembers, 1 do
        local player = select(1, GetGuildRosterInfo(i))
        player = select(1, strsplit("-", player))
        local note  = select(8, GetGuildRosterInfo(i))
        local ep = select(1, strsplit(",", note))
        local gp = select(2, strsplit(",", note))
        ep = tonumber(ep)
        gp = tonumber(gp)

        local reset = false;
        if (ep == nil) then
            ep = 0
            reset = true;
        end
        if (gp == nil or gp < 100) then
            gp = 100
            reset = true;
        end
        local pr = GoodEPGP:Round(ep/gp, 2)
        GoodEPGP.guildRoster[i] = {["player"]=player, ["ep"]=ep, ["gp"]=gp, ["pr"]=pr}
        
        if (reset) then
            GoodEPGP:SetEPGP(i, ep, gp)
        end
    end
end

function GoodEPGP:RaidRoster()
    local raidMember = GetNumGroupMembers()
    GoodEPGP.raidRoster = {};
    
    for i = 1, raidMember, 1 do
        local player = select(1, GetRaidRosterInfo(i))
        player = select(1, strsplit("-", player))
        GoodEPGP.raidRoster[i] = {["player"]=player}
    end
end

function GoodEPGP:Round(num, places)
    local mult = 10^(places or 0)
    return math.floor(num * mult + 0.5) / mult
end

function GoodEPGP:SetEPGP(index, ep, gp)
    local epgpString = tostring(ep) .. "," .. tostring(gp)
    GuildRosterSetOfficerNote(index, epgpString)
    -- Update our table as well
    GoodEPGP.guildRoster[index].ep = ep
    GoodEPGP.guildRoster[index].gp = gp    
end

function GoodEPGP:AddEPByName(name, amount)
    name = GoodEPGP:UCFirst(name)
    local index = GoodEPGP:GetGuildIndexByName(name)
    if (index == 0) then
        return 0
    end
    GoodEPGP:AddEPByIndex(index, amount)
    self:Print("Added " .. amount .. " EP to " .. name .. ".")
    GoodEPGP:PlayerInfo(name)
end

function GoodEPGP:AddGPByName(name, amount)
    name = GoodEPGP:UCFirst(name)
    local index = GoodEPGP:GetGuildIndexByName(name)
    if (index == 0) then
        return 0
    end
    GoodEPGP:AddGPByIndex(index, amount)
    self:Print("Added " .. amount .. " GP to " .. name .. ".")
    GoodEPGP:PlayerInfo(name)
end

function GoodEPGP:AddGPByIndex(index, amount)
    local memberInfo = GoodEPGP.guildRoster[index]
    local newGP = tonumber(memberInfo.gp) + tonumber(amount)
    GoodEPGP:SetEPGP(index, memberInfo.ep, newGP)
end

function GoodEPGP:AddEPByIndex(index, amount)
    local memberInfo = GoodEPGP.guildRoster[index]
    local newEP = tonumber(memberInfo.ep) + tonumber(amount)
    GoodEPGP:SetEPGP(index, newEP, memberInfo.gp)
end

function GoodEPGP:GetGuildIndexByName(name)
    local index = 0;
    for i=1, table.getn(GoodEPGP.guildRoster) do
        if (name == GoodEPGP.guildRoster[i].player) then
            index = i;
        end
    end
    if (index == 0) then
        self:Print("Unable to find " .. name)
    end
    return index
end

function GoodEPGP:UCFirst(word)
    word = word:sub(1,1):upper() .. word:sub(2):lower()
    return word
end

function GoodEPGP:PlayerInfo(name)
    name = GoodEPGP:UCFirst(name)
    local index = GoodEPGP:GetGuildIndexByName(name)
    if (index == 0) then
        return 0
    end
    local memberInfo = GoodEPGP.guildRoster[index]
    local prio = GoodEPGP:Round(memberInfo.ep / memberInfo.gp, 2)
    self:Print("EPGP for " .. name .. ": " .. memberInfo.ep .. " EP / " .. memberInfo.gp .. " GP (" .. prio .. " Prio)" )
end

function GoodEPGP:AddEPToRaid(amount)
    for i=1, table.getn(GoodEPGP.raidRoster) do
        GoodEPGP:AddEPByName(GoodEPGP.raidRoster[i].player, amount)
    end
    GoodEPGP:WidestAudience("Added " .. amount .. " EP to entire raid.")
end