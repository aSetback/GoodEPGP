GoodEPGP = LibStub("AceAddon-3.0"):NewAddon("GoodEPGP", "AceConsole-3.0", "AceEvent-3.0", "AceHook-3.0")

-- Add our slash commands
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
    if (subcmd == "player") then 
        if (arg1 ~= "" and arg1 ~= nil) then
            GoodEPGP:PlayerInfo(arg1)
        end
    end
    if (subcmd == "bids") then
        GoodEPGP:ShowBids()
    end
    if (subcmd == "award") then
        if (arg1 ~= "" and arg1 ~= nil) then
            if (arg2 == "" or arg2 == nil) then
                arg2 = 'ms'
            end
            GoodEPGP:AwardItem(arg1, arg2)
        end
    end
    if (subcmd == "item") then
        local spacePosition = string.find(msg, " ")
        itemName = string.sub(msg, spacePosition + 1)
        GoodEPGP:ShowPrice(itemName)
    end
end

-- Alert the player the add-on has started, and register our events.
function GoodEPGP:OnEnable()
    self:Print("Add-on started.")
    self:RegisterEvent("LOOT_OPENED")
    self:RegisterEvent("CHAT_MSG_WHISPER")
    GoodEPGP:GuildRoster()
    GoodEPGP:RaidRoster()
    GoodEPGP.lootButtons = {}
end

-- Event handler for being whispered
function GoodEPGP:CHAT_MSG_WHISPER(type, text, playerName)
    -- If a whisper starts with the triger, route it to a separate function
    local trigger = select(1, strsplit(" ", text))
    if (trigger == "!gep") then
        local spacePosition = string.find(text, " ")
        local command = string.sub(text, spacePosition + 1)
        GoodEPGP:WhisperCommands(command, playerName)
        return true
    end

    -- Handle bidding
    if (GoodEPGP.activeBid ~= true) then 
        return false
    end
    local player = select(1, strsplit("-", playerName))
    local index = GoodEPGP:GetGuildIndexByName(player)
    local memberInfo = GoodEPGP.guildRoster[index]
    local prio = GoodEPGP:Round(memberInfo.ep / memberInfo.gp, 2)

    if (text == "+")  then
        table.insert(GoodEPGP.bids, {["player"]=player, ["prio"]=prio, ["type"]="mainspec"})
    elseif (text == "-") then
        table.insert(GoodEPGP.bids, {["player"]=player, ["prio"]=prio, ["type"]="offspec"})
    end
end

-- Handle whispered command parsing / routing
function GoodEPGP:WhisperCommands(command, playerName)
    local subcmd = select(1, strsplit(" ", command))
    local arg1 = select(2, strsplit(" ", command))
    local arg2 = select(3, strsplit(" ", command))

    if (subcmd == "item") then
        local spacePosition = string.find(command, " ")
        local itemName = string.sub(command, spacePosition + 1)
        GoodEPGP:ShowPrice(itemName, "whisper", playerName)
    end
    if (subcmd == "player") then
        GoodEPGP:PlayerInfo(arg1, "whisper", playerName)
    end
end

-- Add click event listeners for all items within a loot box
function GoodEPGP:LOOT_OPENED()
	local n = GetNumLootItems()
    for i = 1, n do
        local buttonName = "LootButton" .. tostring(i)
        local buttonExists = false
        for j = 1, #GoodEPGP.lootButtons do
            if (GoodEPGP.lootButtons[j] == buttonName) then
                buttonExists = true
            end
        end
        if (buttonExists == false) then
            _G[buttonName]:HookScript("OnClick", function(button, data)
                table.insert(GoodEPGP.lootButtons, buttonName)
                GoodEPGP:LootClick(button, data, i);
            end)    
        end
	end
end

-- Event function that fires when a loot button is clicked within the loot box
function GoodEPGP:LootClick(button, data, key)
    if not IsAltKeyDown() then 
        return 
    end
    local item = GetLootSlotLink(key)
    local itemName = select(1, GetItemInfo(item))
    local itemLink = select(2, GetItemInfo(item))
    local itemID = select(2, strsplit(":", itemLink, 3))
    local price = GoodEPGP:GetPrice(itemID)
    local offspecPrice = math.floor(price * .25)
    GoodEPGP.activeBid = true
    GoodEPGP.activeItemIndex = key
    GoodEPGP.activePrice = price
    GoodEPGP.activeOffspecPrice = offspecPrice
    GoodEPGP.bids = {}

    if (data == "LeftButton") then
        GoodEPGP:WidestAudience("Whisper me + to bid on " .. itemLink .. " as main spec. (Cost: " .. price .. " GP)")
    else 
        GoodEPGP:WidestAudience("Whisper me - to bid on " .. itemLink .. " as off spec.  (Cost: " .. offspecPrice .. " GP)")
    end
    
end

-- Get an item's GP price by item ID
function GoodEPGP:GetPrice(itemID)
    local price = 0
    itemID = tonumber(itemID)
    if (GoodEPGP.prices[itemID] ~= nil) then
        local priceTable = GoodEPGP.prices[itemID]
        price = priceTable[1];
    end
    return price
end

-- Retrive the price of an item, and send it back via whisper/console
function GoodEPGP:ShowPrice(item, type, playerName)
    local itemID = GoodEPGP:GetItemID(item)
    self:Print(itemID)
    if (itemID == 0) then
        self:Print("Item not found.")
        return false
    end

    local itemLink = select(2, GetItemInfo(itemID))
    local itemPrice = GoodEPGP:GetPrice(itemID)
    local itemString = itemLink .. ': ' .. itemPrice .. ' GP.'
    if (type == "whisper") then
        GoodEPGP:SendWhisper(itemString, playerName)
    else
        self:Print(itemString)
    end
end

-- Get an item's ID based on the name (retrived from prices.lua)
function GoodEPGP:GetItemID(name)
    local itemID = 0
    for key, value in pairs(GoodEPGP.prices) do
        local itemName = value[2]
        if (name:lower() == itemName:lower()) then
            itemID = key;
        end
    end
    return itemID
end

-- Retrieve the current guild roster, load to GoodEPGP.guildRoster
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
        --TODO: Add a variable somewhere for min-GP
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

-- Retrieve the current raid roster, load to GoodEPGP.raidRoster
function GoodEPGP:RaidRoster()
    local raidMember = GetNumGroupMembers()
    GoodEPGP.raidRoster = {};
    
    for i = 1, raidMember, 1 do
        local player = select(1, GetRaidRosterInfo(i))
        player = select(1, strsplit("-", player))
        GoodEPGP.raidRoster[i] = {["player"]=player}
    end
end

-- Save a player's EP & GP to their officer note.
function GoodEPGP:SetEPGP(index, ep, gp)
    local epgpString = tostring(ep) .. "," .. tostring(gp)
    GuildRosterSetOfficerNote(index, epgpString)
    -- Update our table as well
    GoodEPGP.guildRoster[index].ep = ep
    GoodEPGP.guildRoster[index].gp = gp    
end

-- Add EP to a player by their name
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

-- Add GP to a player by their name
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

-- Add GP to a player based on their index in guild roster
function GoodEPGP:AddGPByIndex(index, amount)
    local memberInfo = GoodEPGP.guildRoster[index]
    local newGP = tonumber(memberInfo.gp) + tonumber(amount)
    GoodEPGP:SetEPGP(index, memberInfo.ep, newGP)
end

-- Add EP to a player based on their index in guild roster
function GoodEPGP:AddEPByIndex(index, amount)
    local memberInfo = GoodEPGP.guildRoster[index]
    local newEP = tonumber(memberInfo.ep) + tonumber(amount)
    GoodEPGP:SetEPGP(index, newEP, memberInfo.gp)
end

-- Get a player's index within the raid roster
function GoodEPGP:GetRaidIndexByName(name)
    local index = 0;
    if (name == nil) then
        self:Print("Nil name.")
    else 
        for i=1, #GoodEPGP.raidRoster do
            if (name == GoodEPGP.raidRoster[i].player) then
                index = i;
            end
        end
        if (index == 0) then
            self:Print("Unable to find " .. name)
        end
    end
    return index
end

-- Get a player's index within the guild roster
function GoodEPGP:GetGuildIndexByName(name)
    local index = 0;
    if (name == nil) then
        self:Print("Nil name.")
    else 
        for i=1, #GoodEPGP.guildRoster do
            if (name == GoodEPGP.guildRoster[i].player) then
                index = i;
            end
        end
        if (index == 0) then
            self:Print("Unable to find " .. name)
        end
    end
    return index
end

-- Get a player's current EP/GP standing. Name = player to lookup, type = (whisper|console), playerName = player to whisper back with information
function GoodEPGP:PlayerInfo(name, type, playerName)
    name = GoodEPGP:UCFirst(name)
    local index = GoodEPGP:GetGuildIndexByName(name)
    if (index == 0) then
        if (type == "whisper") then
            GoodEPGP:SendWhisper("Unable to find player '" .. name .. "'", playerName)
        end
        return false
    end
    local memberInfo = GoodEPGP.guildRoster[index]
    local prio = GoodEPGP:Round(memberInfo.ep / memberInfo.gp, 2)
    local playerString = "EPGP for " .. name .. ": " .. memberInfo.ep .. " EP / " .. memberInfo.gp .. " GP (" .. prio .. " Prio)"
    if (type == "whisper") then
        GoodEPGP:SendWhisper(playerString, playerName)
    else
        self:Print(playerString)
    end
end

-- Add a certain amount of EP to all players in the raid
function GoodEPGP:AddEPToRaid(amount)
    for i=1, #GoodEPGP.raidRoster do
        GoodEPGP:AddEPByName(GoodEPGP.raidRoster[i].player, amount)
    end
    GoodEPGP:WidestAudience("Added " .. amount .. " EP to entire raid.")
end

-- Display all bids for the current item to console.
function GoodEPGP:ShowBids()
    if (GoodEPGP.bids == nil) then
        self:Print("No bids.")
        return
    end
    self:Print("=== Main Spec ===")
    for i=1, #GoodEPGP.bids do
        local bid = GoodEPGP.bids[i]
        if (bid.type == "mainspec") then
            self:Print(bid.player .. " (Prio: " .. bid.prio .. ")")
        end
    end
    self:Print(" ")
    self:Print("=== Off Spec ===")
    for i=1, #GoodEPGP.bids do
        local bid = GoodEPGP.bids[i]
        if (bid.type == "offspec") then
            self:Print(bid.player .. " (Prio: " .. bid.prio .. ")")
        end
    end
end

-- Award the current item up for bids to player by namne.  Type = (ms|os)
function GoodEPGP:AwardItem(player, type)
    player = GoodEPGP:UCFirst(player)
    local playerIndex = GoodEPGP:GetRaidIndexByName(player)
    if (playerIndex == 0) then
        self:Print("Player " .. player .. " not found in raid.")
        return false
    end
    GiveMasterLoot(GoodEPGP.activeItemIndex, playerIndex)
    if (arg2:lower() == "ms") then
        GoodEPGP.AddGPByName(player, GoodEPGP.activePrice)
    elseif (arg2:lower() == "os") then
        GoodEPGP.AddGPByName(player, GoodEPGP.activeOffspecPrice)
    end
end

-- == UTILITY FUNCTIONS ==

-- Capitalize the first letter of a word, lowercase the rest.
function GoodEPGP:UCFirst(word)
    word = word:sub(1,1):upper() .. word:sub(2):lower()
    return word
end

-- Send a branded whisper to player.  message = message to send, playerName = player to whisper
function GoodEPGP:SendWhisper(message, playerName)
    SendChatMessage("<GoodEPGP> -- " .. message, "WHISPER", "COMMON", playerName)
end

-- Round a number to a certain number of places
function GoodEPGP:Round(num, places)
    local mult = 10^(places or 0)
    return math.floor(num * mult + 0.5) / mult
end

-- Determine which chat channel should be used to display a message
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
