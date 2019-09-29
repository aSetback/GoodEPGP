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
    --TODO: Make settings configurable
    -- Settings
    GoodEPGP.config = {
        ["trigger"] = "!gep",
        ["decayPercent"] = .1,
        ["minGP"] = 100,
        ["debugEnabled"] = 1
    }

    -- Load message
    GoodEPGP:Debug("Add-on started.")

    -- Fire off the event to update guild roster
    GuildRoster()

    -- Events
    self:RegisterEvent("LOOT_OPENED")
    self:RegisterEvent("CHAT_MSG_WHISPER")
    self:RegisterEvent("GUILD_ROSTER_UPDATE")
    
    -- Build Guild Roster
    GoodEPGP:GuildRoster()

    -- Build Raid Roster
    GoodEPGP:RaidRoster()

    -- Table to track which loot buttons have atttached click events
    GoodEPGP.lootButtons = {}
end

function GoodEPGP:GUILD_ROSTER_UPDATE()
    GoodEPGP:Debug('Guild Roster has been updated.')
    -- Rebuild our guild roster table
    GoodEPGP:GuildRoster()
end

-- Event handler for being whispered
function GoodEPGP:CHAT_MSG_WHISPER(type, whisperText, playerName)
    -- If a whisper starts with the triger, route it to a separate function
    local trigger = select(1, strsplit(" ", whisperText))
    local player = select(1, strsplit("-", playerName))
    if (trigger == GoodEPGP.config.trigger) then
        local command = string.sub(whisperText, string.find(whisperText, " ") + 1)
        GoodEPGP:PublicCommands(command, player)
        return true
    end

    -- Prevent further processing if it's not a bid
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
        memberInfo = {["ep"]=100, ["gp"]=GoodEPGP.config.minGP}
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
    local arg3 = select(4, strsplit(" ", commandMessage))
    if (command == "ep") then
        if (arg1 ~= "" and arg2 ~= "") then
            if (arg1:lower() == "raid") then
                GoodEPGP:AddEPToRaid(arg2)
            elseif (arg1:lower() == "list") then
                GoodEPGP:AddEPToList(arg2, arg3)
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
            GoodEPGP:ConfirmAwardItem(arg1, arg2)
        end
    end
    if (command == "decay") then
        GoodEPGP:Decay()
    end
    if (command == "reset") then
        GoodEPGP:ResetEPGP()
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
    local argString = nil
    local type = nil

    -- Full string after the command
    if (string.find(commandMessage, " ") ~= nil) then
        local argString = string.sub(commandMessage, string.find(commandMessage, " ") + 1)
    end

    -- Set response type
    if (playerName ~= nil) then
        type = "whisper"
    end

    -- Item cost lookup
    if (command == "item") then
        GoodEPGP:ShowPrice(argString, type, playerName)
        return
    end

    -- Standings lookup by class
    if (command == "standings") then
        GoodEPGP:ShowStandingsByClass(arg1, arg2, type, playerName)
        return
    end

    -- Player standngs lookup
    if (command == "player") then
        GoodEPGP:PlayerInfo(arg1, type, playerName)
        return
    end

    -- Set spec via member note
    if (command == "setspec" and playerName ~= nil) then
        GoodEPGP:SetSpec(playerName, arg1)
        return
    end

    -- Charge a player for an item
    if (command == "charge") then
        GoodEPGP:ChargeForItem(arg1, arg2, arg3, type, playerName)
    end

    -- None of the if statements triggered, let's assume they want an item lookup
    GoodEPGP:ShowPrice(commandMessage, type, playerName)


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
    -- If the alt key is being run down, run a EPGP  bid
    if not IsAltKeyDown() then 
        return true;
    end
    
    -- If it's just currency, or the slot is empty, just return.
    local item = GetLootSlotLink(key)
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
    -- Attempt to pull up item data via link
    local itemID = GoodEPGP:GetItemID(item)

    -- If we couldn't find an item id, try a wildcard check against the price list
    if (itemID == nil) then
        local itemIDs = GoodEPGP:GetWildcardItemIDs(item)
        -- Display the price info for all matching items
        for key, value in pairs(itemIDs) do
            GoodEPGP:DisplayPrice(value, type, playerName)
        end
    else
        -- Display the price info for the single matching info.
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
    -- Verify we have a passed itemID
    if (itemID == nil) then
        return false
    end

    -- Verify itemID is numeric
    itemID = tonumber(itemID)

    -- Retrieve item info from the database asynchronously
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
function GoodEPGP:GetItemID(itemString)
    local itemID = nil
    
    -- Attempt to retrieve item info by name / item link
    local itemLink = select(2, GetItemInfo(itemString))
    if (itemLink ~= nil) then
        -- Pull itemID from itemLink
        itemID = select(2, strsplit(":", itemLink, 3))
        -- If itemID is set, return it.
        if (itemID ~= nil) then
            return itemID
        end
    end

    -- Couldn't find by a straight GetItemInfo lookup, let's try looking it up in our price list.
    for key, value in pairs(GoodEPGP.prices) do
        local itemName = value[2]
        if (itemString:lower() == itemName:lower()) then
            itemID = key;
        end
    end

    -- Return whatever we have itemID
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

        if (gp == nil or gp < GoodEPGP.config.minGP) then
            gp = GoodEPGP.config.minGP
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
        if (candidate == playerName) then
            GoodEPGP:Debug('Candidate found. (' .. playerName .. '}')
            return i
        end
    end
    return false
end

-- Save a player's EP & GP to their officer note.
function GoodEPGP:SetEPGP(index, ep, gp)
    -- Format our officer note
    local epgpString = tostring(ep) .. "," .. tostring(gp)
    
    -- Update the officer note
    GuildRosterSetOfficerNote(index, epgpString)
    
    -- Update our internal table as well
    GoodEPGP.guildRoster[index].ep = ep
    GoodEPGP.guildRoster[index].gp = gp
    GoodEPGP.guildRoster[index].pr = GoodEPGP:Round(tonumber(ep) / tonumber(gp), 2)
end

-- Set a player's spec
function GoodEPGP:SetSpec(player, spec)
    local playerIndex = GoodEPGP:GetGuildIndexByName(player)
    if (playerIndex == nil) then
        GoodEPGP:Debug('Could not find ' .. player)
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
    GoodEPGP:Debug("Added " .. amount .. " EP to " .. name .. ".")
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
    GoodEPGP:Debug("Added " .. amount .. " GP to " .. name .. ".")
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
        GoodEPGP:Debug("Empty name for Raid Index lookup.")
    else 
        for i=1, #GoodEPGP.raidRoster do
            if (name == GoodEPGP.raidRoster[i].player) then
                index = i;
            end
        end
        if (index == 0) then
            GoodEPGP:Debug("Unable to find " .. name)
        end
    end
    return index
end

-- Get a player's index within the guild roster
function GoodEPGP:GetGuildIndexByName(name)
    local index = 0;
    if (name == nil) then
        GoodEPGP:Debug("Empty name for Raid Index lookup.")
    else 
        for i=1, #GoodEPGP.guildRoster do
            if (name == GoodEPGP.guildRoster[i].player) then
                index = i;
            end
        end
        if (index == 0) then
            GoodEPGP:Debug("Unable to find " .. name)
        end
    end
    return index
end

-- Reset all EPGP
function GoodEPGP:ResetEPGP()
    --TODO: Add confirmation
    for key, member in pairs(GoodEPGP.guildRoster) do
        GoodEPGP:SetEPGP(key, 0, GoodEPGP.config.minGP)
    end
end

-- Decay EPGP of all members
function GoodEPGP:Decay()
    -- Loop through guild roster, decay all members
    for key, member in pairs(GoodEPGP.guildRoster) do
        GoodEPGP:DecayByGuildIndex(key)
    end

    -- Announce to guild
    local decayPercent = GoodEPGP:Round(GoodEPGP.config.decayPercent * 100, 0) .. '%.'
    GoodEPGP:SendGuild("EP & GP have been decayed by " .. decayPercent)
end

-- Decay a player
function GoodEPGP:DecayByGuildIndex(index)
    if (GoodEPGP.guildRoster[index] == nil) then
        GoodEPGP:Debug('Unabled to find index: ' .. index)
        return
    end

    local ep = GoodEPGP.guildRoster[index].ep * (1 - tonumber(GoodEPGP.config.decayPercent))
    local gp = GoodEPGP.guildRoster[index].gp * (1 - tonumber(GoodEPGP.config.decayPercent))
    if (gp < GoodEPGP.config.minGP) then
        gp = GoodEPGP.config.minGP
    end
    local prio = GoodEPGP:Round(ep / gp, 2)
    GoodEPGP:SetEPGP(index, ep, gp)
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
    GoodEPGP:ShowPlayerInfo(memberInfo, type, playerName)
end

-- Output a single line of standings
function GoodEPGP:ShowPlayerInfo(memberInfo, type, playerName)
    if (memberInfo == nil) then
        return false
    end
    local playerString = memberInfo.player .. ": " .. memberInfo.ep .. " EP / " .. memberInfo.gp .. " GP (" .. memberInfo.pr .. " Prio)"
    GoodEPGP:HandleOutput(playerString, type, playerName)
end

-- Add a certain amount of EP to all players in the raid
function GoodEPGP:AddEPToRaid(amount)
    for i=1, #GoodEPGP.raidRoster do
        local guildIndex = GoodEPGP:GetGuildIndexByName(GoodEPGP.raidRoster[i].player)
        if (guildIndex ~= nil) then
            GoodEPGP:Debug("Added " .. amount .. " EP to " .. GoodEPGP.raidRoster[i].player .. ".")
            GoodEPGP:AddEPByIndex(guildIndex, amount)
        end
    end
    GoodEPGP:WidestAudience("Added " .. amount .. " EP to entire raid.")
end

-- Add a certain amount of EP to a comma delimited list of guild members
function GoodEPGP:AddEPToList(list, amount) 
    list = GoodEPGP:SplitString(list, ",")
    for key, member in pairs(list) do
        GoodEPGP:AddEPByName(member, amount)
    end
end

-- Display all bids for the current item to console.
function GoodEPGP:ShowBids()
    --TODO: Output this to a frame
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

-- Confirm the item should be looted to player
function GoodEPGP:ConfirmAwardItem(playerName, type)
    -- Callback is anonymous function that awards the item
    GoodEPGP:ConfirmAction(function(playerName, type) 
        GoodEPGP:AwardItem(playerName, type)
    end)
end

-- Award the current item up for bids to player by namne.  priceType = (ms|os)
function GoodEPGP:AwardItem(playerName, priceType)

    -- Format player's name
    playerName = GoodEPGP:UCFirst(playerName)

    -- Retrive player's candidate index by name
    candidateIndex = GoodEPGP:MasterLootCandidateByName(playerName)
    
    -- Award the item
    GiveMasterLoot(GoodEPGP.activeItemIndex, candidateIndex)
    
    --- Award main spec or offspec GP
    local price = GoodEPGP:GetPrice(itemID)
    if (priceType == 'os') then
        price = GoodEPGP.Round(price * .25, 0)
    end
    GoodEPGP:AddGPByName(playerName, price)
end

-- Charge a player for an item
function GoodEPGP:ChargeForItem(member, itemString, priceType, type, playerName)
    local itemID = GoodEPGP:GetItemID(itemString)
    if (itemID == nil) then
        GoodEPGP:HandleOutput('Could not find item.', type, member)
    end

    local price = GoodEPGP:GetPrice(itemID)
    if (priceType == 'os') then
        price = GoodEPGP.Round(price * .25, 0)
    end

    GoodEPGP:AddGPByName(member, price)
end

-- Show standings by class, with a minimum priority (1 by default)
function GoodEPGP:ShowStandingsByClass(class, minimumPrio, type, playerName)
    -- Retrieve our standings by class(es)
    local classStandings = GoodEPGP:GetStandingsByClass(class:lower())
    if (classStandings == nil or #classStandings == 0) then
        GoodEPGP:HandleOutput("No results found.", type, playerName)
        return false
    end
    
    -- Check if minimum is set and numeric
    minimumPrio = tonumber(minimumPrio)
    if (minimumPrio == nil) then
        minimumPrio = 1
    end
    
    -- Loop through our classStandings table and show every line above minimum prio
    for key, memberInfo in pairs(classStandings) do
        if (tonumber(memberInfo.pr) >= tonumber(minimumPrio)) then
            GoodEPGP:ShowPlayerInfo(memberInfo, type, playerName)
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

-- Send a branded message to guild chat
function GoodEPGP:SendGuild(message)
    SendChatMessage("GEPGP: " .. message, "GUILD")
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

function GoodEPGP:ConfirmAction(acceptCallback, cancelCalback)
    StaticPopupDialogs["CONFIRM_ACTION"] ={
        preferredIndex = 3,
        text = "-",
        button1 = "Yes",
        button2 = "No",
        OnAccept = acceptCallback,
        OnCancel = cancelCalback,
        timeout = 0,
        hideOnEscape = false,
        showAlert = true
    }

    StaticPopupDialogs["CONFIRM_ACTION"].text =  "Hello world"
    StaticPopup_Show("CONFIRM_ACTION")      
end

function GoodEPGP:Debug(message)
    if (GoodEPGP.config.debugEnabled == 1 or GoodEPGP.debugEnabled == true) then
        self:Print("DEBUG: " .. message)
    end
end