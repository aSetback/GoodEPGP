GoodEPGP = LibStub("AceAddon-3.0"):NewAddon("GoodEPGP", "AceConsole-3.0", "AceEvent-3.0", "AceHook-3.0")

-- Add our slash commands
SLASH_GEP1, SLASH_GEP2 = "/goodepgp", "/gep"
function SlashCmdList.GEP(msg, editbox)
    if (msg == nil) then
        return true
    end
    GoodEPGP:PrivateCommands(msg)
    GoodEPGP:PublicCommands(msg)
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
function GoodEPGP:CHAT_MSG_WHISPER(type, whisperText, playerName)
    -- If a whisper starts with the triger, route it to a separate function
    local trigger = select(1, strsplit(" ", whisperText))
    local player = select(1, strsplit("-", playerName))
    if (trigger == "!gep") then
        local command = string.sub(whisperText, string.find(whisperText, " ") + 1)
        GoodEPGP:PublicCommands(command, player)
        return true
    end

    if (whisperText ~= "+" and whisperText ~= "-") then 
        return true
    end

    -- Handle bidding
    if (GoodEPGP.activeBid ~= true) then 
        return false
    end
    local index = GoodEPGP:GetGuildIndexByName(player)
    local memberInfo = GoodEPGP.guildRoster[index]
    if (memberInfo == nil) then
        memberInfo = {["ep"]=100, ["gp"]=100}
    end
    local prio = GoodEPGP:Round(memberInfo.ep / memberInfo.gp, 2)

    if (whisperText == "+")  then
        table.insert(GoodEPGP.bids, {["player"]=player, ["prio"]=prio, ["type"]="mainspec"})
    elseif (whisperText == "-") then
        table.insert(GoodEPGP.bids, {["player"]=player, ["prio"]=prio, ["type"]="offspec"})
    end
end

-- Handle private command parsing/routing
function GoodEPGP:PrivateCommands(commandMessage)
    local command = select(1, strsplit(" ", commandMessage))
    local arg1 = select(2, strsplit(" ", commandMessage))
    local arg2 = select(3, strsplit(" ", commandMessage))
    if (command == "ep") then
         if (arg1 ~= "" and arg2 ~= "") then
             if (GoodEPGP:UCFirst(arg1) == "Raid") then
                 GoodEPGP:AddEPToRaid(arg2)
             else
                 GoodEPGP:AddEPByName(arg1, arg2)
             end
         end
    end
    if (command == "gp") then
        if (arg1 ~= "" and arg2 ~= "") then
            GoodEPGP:AddGPByName(arg1, arg2)
        end
    end
    if (command == "bids") then
        GoodEPGP:ShowBids()
    end
    if (command == "award") then
        if (arg1 ~= "" and arg1 ~= nil) then
            if (arg2 == "" or arg2 == nil) then
                arg2 = 'ms'
            end
            GoodEPGP:AwardItem(arg1, arg2)
        end
    end
end

-- Handle public command parsing / routing
function GoodEPGP:PublicCommands(commandMessage, playerName)
    if (commandMessage == "") then
        return true
    end
    local command = select(1, strsplit(" ", commandMessage))
    local arg1 = select(2, strsplit(" ", commandMessage))
    local arg2 = select(3, strsplit(" ", commandMessage))
    local argString = string.sub(commandMessage, string.find(commandMessage, " ") + 1)
    local type = nil

    -- Set response type
    if (playerName ~= nil) then
        type = "whisper"
    end

    -- Item cost lookup
    if (command == "item") then
        GoodEPGP:ShowPrice(argString, type, playerName)
    end

    -- Standings lookup by class
    if (command == "standings") then
        GoodEPGP:ShowStandingsByClass(arg1, arg2, type, playerName)
    end

    -- Player standngs lookup
    if (command == "player") then
        GoodEPGP:PlayerInfo(arg1, type, playerName)
    end

    if (command == "setspec" and playerName ~= nil) then
        
        GoodEPGP:SetSpec(playerName, arg1)
    end
end

-- Add click event listeners for all items within a loot box
function GoodEPGP:LOOT_OPENED()
	local n = GetNumLootItems()
    for i = 1, n do
        local buttonName = "LootButton" .. tostring(i)

        local buttonExists = false
        for j = 0, #GoodEPGP.lootButtons do
            if (GoodEPGP.lootButtons[j] == buttonName) then
                buttonExists = true
            end
        end

        if (buttonExists == false) then
            table.insert(GoodEPGP.lootButtons, buttonName)
            _G[buttonName]:HookScript("OnClick", function(button, data)                
                GoodEPGP:LootClick(button, data, i);
            end)    
        end
	end
end

-- Event function that fires when a loot button is clicked within the loot box
function GoodEPGP:LootClick(button, data, key)
    if not IsAltKeyDown() then 
        return true;
    end
    local item = GetLootSlotLink(key)
    
    -- If it's just currency, or the slot is empty, just return.
    if (item == nil) then
        return true;
    end
    local itemName = select(1, GetItemInfo(item))
    local itemLink = select(2, GetItemInfo(item))
    local itemID = select(2, strsplit(":", itemLink, 3))
    local price = GoodEPGP:GetPrice(itemID)
    local offspecPrice = math.floor(price * .25)
    GoodEPGP.activeBid = true
    GoodEPGP.activeItemIndex = key
    self:Print(key)
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
    if (itemID == 0) then
        local itemIDs = GoodEPGP:GetWildcardItemIDs(item)
        for key, value in pairs(itemIDs) do
            GoodEPGP:DisplayPrice(value, type, playerName)
        end
    else
        GoodEPGP:DisplayPrice(itemID, type, playerName)
    end
end

-- Gets a list of all item IDs that match item name
function GoodEPGP:GetWildcardItemIDs(item) 
    local itemIDs = {}
    for key, value in pairs(GoodEPGP.prices) do
        if (string.find(value[2]:lower(), item:lower()) ~= nil) then
            table.insert(itemIDs, key)
        end
    end

    return itemIDs
end

-- Display the price of an item
function GoodEPGP:DisplayPrice(itemID, type, playerName)
    local item = Item:CreateFromItemID(itemID)
    item:ContinueOnItemLoad(function() 
        local itemName = select(1, GetItemInfo(itemID))
        local itemLink = select(2, GetItemInfo(itemID))
        local itemPrice = GoodEPGP:GetPrice(itemID)
        local itemString = GoodEPGP:PadString(itemPrice .. "GP", 10, "_", "right") .. itemLink
        GoodEPGP:HandleOutput(itemString, type, playerName)
    end)
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
    
    --TODO: Add a callback handler for getting guild info
    for i = 1, guildMembers, 1 do
        local player = select(1, GetGuildRosterInfo(i))
        player = select(1, strsplit("-", player))
        local note  = select(8, GetGuildRosterInfo(i))
        local class = select(5, GetGuildRosterInfo(i))
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
        GoodEPGP.guildRoster[i] = {["player"]=player, ["ep"]=ep, ["gp"]=gp, ["pr"]=pr, ["class"]=class}
        
        if (reset) then
            GoodEPGP:SetEPGP(i, ep, gp)
        end
    end
end

-- Retrieve the current raid roster, load to GoodEPGP.raidRoster
function GoodEPGP:RaidRoster()
    local raidMembers = GetNumGroupMembers()
    GoodEPGP.raidRoster = {};
    
    for i = 1, raidMembers, 1 do
        local player = select(1, GetRaidRosterInfo(i))
        player = select(1, strsplit("-", player))
        GoodEPGP.raidRoster[i] = {["player"]=player}
    end
end

-- Retrieve masterloot candidate by name
function GoodEPGP:MasterLootCandidateByName(playerName)
    playerName = GoodEPGP:UCFirst(playerName)
    local raidMembers = GetNumGroupMembers()
    for i = 1, raidMembers, 1 do
        local candidate = GetMasterLootCandidate(GoodEPGP.activeItemIndex, i)
        self:Print(candidate)
        if (candidate == playerName) then
            return i
        end
    end
    return false
end

-- Save a player's EP & GP to their officer note.
function GoodEPGP:SetEPGP(index, ep, gp)
    local epgpString = tostring(ep) .. "," .. tostring(gp)
    GuildRosterSetOfficerNote(index, epgpString)
    -- Update our table as well
    GoodEPGP.guildRoster[index].ep = ep
    GoodEPGP.guildRoster[index].gp = gp    
end

-- Set a player's spec
function GoodEPGP:SetSpec(player, spec)
    local playerIndex = GoodEPGP:GetGuildIndexByName(player)
    if (playerIndex == nil) then
        self:Print('Could not find ' .. player)
        return false
    end
    local memberInfo = GoodEPGP.guildRoster[playerIndex]    
    for key, value in pairs(GoodEPGP.specs) do
        if (value[1]:lower() == memberInfo.class:lower() and value[2]:lower() == spec:lower()) then
            GuildRosterSetPublicNote(playerIndex, value[2])
            GoodEPGP:SendWhisper("Your specialization has been set.", player)
            return true
        end
    end

    GoodEPGP:SendWhisper("Please choose a valid spec for your class.", player)
    return false
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
    GoodEPGP:HandleOutput(playerString, type, playerName)
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
function GoodEPGP:AwardItem(playerName, type)
    playerName = GoodEPGP:UCFirst(playerName)
    -- Retrive player's candidate index by name
    candidateIndex = GoodEPGP:MasterLootCandidateByName(playerName)
    
    -- Award the item
    GiveMasterLoot(GoodEPGP.activeItemIndex, candidateIndex)
    
    --- Award main spec or offspec GP
    if (type:lower() == "ms") then
        GoodEPGP:AddGPByName(playerName, GoodEPGP.activePrice)
    elseif (type:lower() == "os") then
        GoodEPGP:AddGPByName(playerName, GoodEPGP.activeOffspecPrice)
    end
end

-- Show standings by class, with a minimum priority (1 by default)
function GoodEPGP:ShowStandingsByClass(class, minimumPrio, type, playerName)
    local classStandings = GoodEPGP:GetStandingsByClass(class)
    if (minimumPrio == nil) then
        minimumPrio = 1
    end
    
    for key, member in pairs(classStandings) do
        if (tonumber(member.pr) >= tonumber(minimumPrio)) then
            local playerString = member.player .. ": " .. member.ep .. " EP / " .. member.gp .. " GP (" .. member.pr .. " Prio)"
            GoodEPGP:HandleOutput(playerString, type, playerName)
        end
    end
end

-- Get EPGP standings by class/classes
function GoodEPGP:GetStandingsByClass(class)
    local classes = nil
    if (string.find(class, ",") ~= nil) then
        classes = GoodEPGP:SplitString(class, ",")
    end

    local classStandings = {}
    for key, member in pairs(GoodEPGP.guildRoster) do
        if (classes ~= nil) then 
            GoodEPGP.classes = classes
            for classKey, className in pairs(classes) do
                if (member.class == GoodEPGP:UCFirst(className)) then
                    table.insert(classStandings, member)
                end
            end
        else
            if (member.class == GoodEPGP:UCFirst(class)) then
                table.insert(classStandings, member)
            end
        end
    end
    table.sort(classStandings, function(a, b)
        return a.pr > b.pr
    end)
    return classStandings
end

-- == UTILITY FUNCTIONS ==

-- Capitalize the first letter of a word, lowercase the rest.
function GoodEPGP:UCFirst(word)
    word = word:sub(1,1):upper() .. word:sub(2):lower()
    return word
end

-- Send a branded whisper to player.  message = message to send, playerName = player to whisper
function GoodEPGP:SendWhisper(message, playerName)
    SendChatMessage("GEPGP: " .. message, "WHISPER", "COMMON", playerName)
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

-- Pad a string
function GoodEPGP:PadString(originalString, length, padCharacter, direction) 
    if (padCharacter == nil) then 
        padCharacter = ' ' 
    end
    if (direction == nil) then
        direction = "right"
    end
    originalString = tostring(originalString)
    
    local padString = ""
    if (direction == "left") then
        padString = string.rep(padCharacter, length - #originalString) .. originalString
    else
        padString = originalString .. string.rep(padCharacter, length - #originalString)
    end

    return padString
end

-- Handle output to console / whisper
function GoodEPGP:HandleOutput(string, type, playerName)
    if (type == "whisper") then
        GoodEPGP:SendWhisper(string, playerName)
    else
        self:Print(string)
    end
end

-- Split a string into a table
function GoodEPGP:SplitString(string, delimiter)
    result = {};
    for match in (string..delimiter):gmatch("(.-)"..delimiter) do
        table.insert(result, match);
    end
    return result;
end