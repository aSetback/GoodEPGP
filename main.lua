GoodEPGP = LibStub("AceAddon-3.0"):NewAddon("GoodEPGP", "AceConsole-3.0", "AceEvent-3.0", "AceHook-3.0", "AceTimer-3.0")

-- Add our slash commands
SLASH_GEP1, SLASH_GEP2 = "/goodepgp", "/gep"
function SlashCmdList.GEP(msg, editbox)
    if (msg == nil) then
        return true
    end
    GoodEPGP:PrivateCommands(msg)
    GoodEPGP:PublicCommands(msg)
end

-- Current Game Phase
GoodEPGPphase = 3

function GoodEPGP:OnInitialize()

	-- Enable add-on messages
    C_ChatInfo.RegisterAddonMessagePrefix("GoodEPGP")

    -- Default settings
    if (GoodEPGPConfig == nil) then
        GoodEPGPConfig = {
            ["trigger"] = "!gep",
            ["debugEnabled"] = false,
            ["decayPercent"] = 0.1,
            ["minGP"] = 100
        }
    end

	-- Default minimap icon position
    if (GoodEPGPMiniMapPos == nil) then
        GoodEPGPMiniMapPos = {
			["minimapPos"] = 206,
			["show"] = true,
        }
    end

	-- Generte our minimap icon
    GoodEPGP.MinimapIcon = LibStub("LibDBIcon-1.0")
    GoodEPGP.LDB = LibStub("LibDataBroker-1.1"):NewDataObject("GoodEPGPMinimap", {
        ["type"] = "data source",
        ["text"] = "GoodEPGP",
        ["icon"] = "Interface\\Icons\\inv_hammer_05",
        ["OnTooltipShow"] = function(tooltip)
            tooltip:SetText("GoodEPGP v1.2")
            tooltip:AddLine("Left click to toggle standings", 1, 1, 1)
			tooltip:AddLine("Shift+Left click to toggle prices", 1, 1, 1)
            tooltip:AddLine("Right click for menu", 1, 1, 1)
            tooltip:Show()
        end,
        ["OnClick"] = function(_, button)
            if (button == "LeftButton") then
				if IsShiftKeyDown() then
					GoodEPGP:TogglePrices()
				else
					GoodEPGP:ToggleStandings()
				end
            else
                GoodEPGP:ToggleMenuFrame()
            end
        end
    })
    GoodEPGP.MinimapIcon:Register("GoodEPGPMinimap", GoodEPGP.LDB, GoodEPGPMiniMapPos)

    -- Use our settings
    GoodEPGP.config = GoodEPGPConfig

    -- Set up our cached standings table
    if (GoodEPGPCachedStandings == nil) then
        GoodEPGPCachedStandings = {}
    end

	-- Set up our cached price table
	if (GoodEPGPCachedPrices == nil) then
		GoodEPGPCachedPrices = {}
	end

    -- Initialize our last updated variables
    if (GoodEPGPConfig.standingsLastUpdated == nil) then
        GoodEPGPConfig.standingsLastUpdated = 0
    end

    -- Build standings frames
    GoodEPGP:CreateStandingsFrame()

    -- Build our prices table
    GoodEPGP:BuildPrices()

    -- Create our options frame
    GoodEPGP:CreateMenuFrame()

end

-- Alert the player the add-on has started, and register our events.
function GoodEPGP:OnEnable()

    -- Notify that debug is enabled
    GoodEPGP:Debug('Debug is enabled.')

    -- Events
    self:RegisterEvent("LOOT_OPENED")
    self:RegisterEvent("LOOT_CLOSED")
    self:RegisterEvent("CHAT_MSG_WHISPER")
    self:RegisterEvent("GUILD_ROSTER_UPDATE")
    self:RegisterEvent("CHAT_MSG_ADDON")


    -- Add bag click hooks
    GoodEPGP:BagClickHooks()

    -- Table to track which loot buttons have atttached click events
    GoodEPGP.lootButtons = {}

    -- Load standings table
    GoodEPGP:LoadAllStandings()

    -- Load the prices table
    GoodEPGP:LoadAllPrices()

    -- Add the tabs to the menu frame
    GoodEPGP:CreateMenuTabs()
end

-- =====================
-- EVENT HANDLERS
-- =====================

-- Close our bid window when loot window is closed
function GoodEPGP:LOOT_CLOSED()
    GoodEPGP:HideBidFrame()
end

-- Handle chat messages from other copies of the add-on
function GoodEPGP:CHAT_MSG_ADDON(_, prefix, text, channel, sender)
    if (prefix == "GoodEPGP") then
        local player = select(1, strsplit("-", sender))

		-- Standings Messages
        if (text == "requestStandings") then
            GoodEPGP:StandingsAvailability(player)
        end

        if (text == "standingsAvailable") then
            if (GoodEPGP.requestStandings) then
				GoodEPGP.requestStandings = false
				GoodEPGPCachedStandings = {}
                GoodEPGP:Debug("Requesting standings from " .. player)
                GoodEPGP:AddonMessage("getStandings", player)
            end
        end

        if (text == "getStandings") then
            GoodEPGP:SendStandings(player)
        end

        if (text == "standingsBroadcastComplete") then
			GoodEPGP:Debug("Standings broadcast complete...")
            GoodEPGP:StandingsUpdateLastUpdated()
			GoodEPGP.standingsScrollFrame:ReleaseChildren()
			GoodEPGP.standingsLinesFrames = {}
			GoodEPGP.standingsFrame.sortOrder = "DESC"
			GoodEPGP:StandingsSort("name")
        end

        if (string.sub(text, 1, 2) == "S:") then
            GoodEPGP:ReceiveStandings(text)
        end

		-- Set Player Spec Messages
		if (text == "requestSetSpecialization") then
			GoodEPGP:Debug("setSpecialization requested by "..player)
			GoodEPGP:RequestSetSpec(player)
		end

		if (text == "setSpecializationAvailable") then
            if (GoodEPGP.requestSetSpec) then
                GoodEPGP.requestSetSpec = false
                GoodEPGP:Debug("Sending setSpecialization request to " .. player)
                GoodEPGP:AddonMessage("setSpecialization:"..GoodEPGP.tempReqSpec, player)
			end
		end

		if (text:find("setSpecialization:")) then
			GoodEPGP:Debug("setSpecialization request recieved from "..player)
			local spec = select(2, strsplit(":", text))
			GoodEPGP:SetSpec(player, spec)
			GoodEPGP:Debug("setSpecialization request for "..player.." set to spec "..spec)
		end
    end
end

-- Re-compile our internal EPGP table
function GoodEPGP:GUILD_ROSTER_UPDATE()
    GoodEPGP:ExportGuildRoster()
end

function GoodEPGP:BagClickHooks()
    for bag = 1, 5 do
        local bagSlots = GetContainerNumSlots(bag - 1);
        for slot = 1, bagSlots do
            local buttonName = "ContainerFrame" .. bag .. "Item" .. slot
            if (_G[buttonName] ~= nil) then
                _G[buttonName]:HookScript("OnClick", function(button, data)
                    GoodEPGP:BagLootClick(bag - 1, (bagSlots - slot + 1), data);
                end)
            end
        end
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
            local button = _G[buttonName]
            if (button ~= nil) then
                _G[buttonName]:HookScript("OnClick", function(button, data)
                    GoodEPGP:LootClick(button, data, button.slot);
                end)
            end
        end
	end
end

-- Event handler for being whispered
function GoodEPGP:CHAT_MSG_WHISPER(type, whisperText, playerName)
    -- If a whisper starts with the triger, route it to a separate function
    local trigger = select(1, strsplit(" ", whisperText))
    local player = select(1, strsplit("-", playerName))
    if (trigger == GoodEPGP.config.trigger) then
        -- Check if there's a command to send to the PublicCommands meethod
        if (string.find(whisperText, " ") == nil) then
            return
        end

        -- Separate out the actual command and parameters, send them to PublicCommand
        local command = string.sub(whisperText, string.find(whisperText, " ") + 1)
        GoodEPGP:PublicCommands(command, player)
        return
    end

    -- Prevent further processing if it's not a bid
    if ((whisperText == "+" or whisperText == "-") and GoodEPGP.activeBid) then
        GoodEPGP:ReceiveBid(whisperText, player)
    end
end

-- =====================
-- COMMAND ROUTING
-- =====================

-- Handle private command parsing/routing
function GoodEPGP:PrivateCommands(commandMessage)
    local command = select(1, strsplit(" ", commandMessage))
    local arg1 = select(2, strsplit(" ", commandMessage))
    local arg2 = select(3, strsplit(" ", commandMessage))
    local arg3 = select(4, strsplit(" ", commandMessage))

    -- Add EP to a player
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

    if (command == "menu") then
        GoodEPGP:ToggleMenuFrame()
    end

    -- Add GP to a player
    if (command == "gp") then
        if (arg1 ~= "" and arg2 ~= "") then
            GoodEPGP:AddGPByName(arg1, arg2)
        end
    end

    -- Decay EPGP standings
    if (command == "decay") then
        GoodEPGP:Decay()
    end

    -- Round all EP & GP
    if (command == "round") then
        GoodEPGP:RoundPoints()
    end

    -- Reset EPGP standings
    if (command == "reset") then
        GoodEPGP:Reset()
    end

    -- Charge a player for an item
    if (command == "charge") then
        GoodEPGP:ChargeForItem(arg1, arg2, arg3)
    end

    -- Import EPGP standings from SavedVariables
    if (command == "import") then
        GoodEPGP:ImportStandings()
    end

    -- Show EPGP standings
    if (command == "show" or command == "standings") then
        GoodEPGP:ToggleStandings()
    end

    if (command == "prices") then
		GoodEPGP:TogglePrices()
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
        argString = string.sub(commandMessage, string.find(commandMessage, " ") + 1)
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

    -- None of the if statements triggered, let's assume they want an item lookup
    GoodEPGP:ShowPrice(commandMessage, type, playerName)
    GoodEPGP:PlayerInfo(commandMessage, type, playerName)
    GoodEPGP:ShowStandingsByClass(commandMessage, 1, type, playerName)

end

-- =====================
-- PRIVATE FUNCTIONS
-- =====================

function GoodEPGP:BagLootClick(bag, slot, data)
    if (GetContainerItemInfo(bag, slot)) then
        local itemID = select(10, GetContainerItemInfo(bag, slot))
        local itemName = select(1, GetItemInfo(itemID))
        local itemLink = select(2, GetItemInfo(itemID))
        local itemQuality = select(3, GetItemInfo(itemID))

        GoodEPGP.activeItemIndex = 'bag'
        GoodEPGP.activeItem = itemLink

        -- If the alt key is being run down, run a EPGP  bid
        if (IsAltKeyDown()) then
            -- Alt + Left Click
            if (data == "LeftButton") then
                GoodEPGP:StartBid(itemID)
                return
            end
        end
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

-- Charge a player for an item
function GoodEPGP:ChargeForItem(member, itemString, priceType, type, playerName)
    local itemID = GoodEPGP:GetItemID(itemString)
    if (itemID == nil) then
        GoodEPGP:HandleOutput('Could not find item: ' .. itemString, type, member)
        return
    end

    local price = GoodEPGP:GetPrice(itemID)
    if (priceType == 'os') then
        price = GoodEPGP:Round(price * .25, 2)
    end

    GoodEPGP:Debug("Adding " .. price .. "GP to " .. member .. " for " .. itemString)
    GoodEPGP:AddGPByName(member, price)
    return price
end

-- Retrieve the price of an item, and send it back via whisper/console
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

function GoodEPGP:GetGuildRoster()
    local guildRoster = {};
    for i = 1, GetNumGuildMembers() do
        local player = select(1, GetGuildRosterInfo(i))
        -- Remove realm name
        player = select(1, strsplit("-", player))
        table.insert(guildRoster, player)
    end

    table.sort(guildRoster)

    return guildRoster
end

-- Retrieve the current guild roster
function GoodEPGP:ExportGuildRoster()
    GoodEPGP.standings = {};
    for i = 1, GetNumGuildMembers() do
        -- Retrieve information about our player, remove the realm name
        local player = select(1, GetGuildRosterInfo(i))
        if (player ~= nil) then
            player = select(1, strsplit("-", player))
        end
        local officerNote  = select(8, GetGuildRosterInfo(i))
        local level = select(4, GetGuildRosterInfo(i))
        local class = select(5, GetGuildRosterInfo(i))
        local spec = select(7, GetGuildRosterInfo(i))

        -- Set initial EPGP
        if (officerNote == nil or string.find(officerNote, ",") == nil) then
            officerNote = '0,100'
            -- GoodEPGP:SetEPGPByName(player, 0, 100)
        end

        -- Retrieve the player's EPGP
        local ep = select(1, strsplit(",", officerNote))
        local gp = select(2, strsplit(",", officerNote))
        ep = tonumber(ep)
        gp = tonumber(gp)

        -- Round to 2 decimal places
        ep = GoodEPGP:Round(ep, 2)
        gp = GoodEPGP:Round(gp, 2)

        -- Just making sure ..
        if (ep == nil) then
            ep = 0
        end

        -- Make sure we're above the min GP.
        if (gp == nil or gp < tonumber(GoodEPGP.config.minGP)) then
            gp = tonumber(GoodEPGP.config.minGP)
        end

        -- Calculate our PR
        local pr = GoodEPGP:Round(ep/gp, 2)

        -- Add the player to our standings table
        GoodEPGP.standings[i] = {["player"]=player, ["ep"]=ep, ["gp"]=gp, ["pr"]=pr, ["class"]=class, ["spec"]=spec, ["level"]=level}
    end

    table.sort(GoodEPGP.standings, function(a, b)
        return a.pr > b.pr
    end)

    local raiderList = {}
    -- Filter out people with no EP, less than lvl 55
    for key, player in pairs(GoodEPGP.standings) do
        if (tonumber(player.level) > 55 and tonumber(player.ep) > 0) then
            table.insert(raiderList, player)
        end
    end

    GoodEPGPStandings = GoodEPGP:ConvertToJSON(raiderList)
end

-- Converts a our Lua table to json string for processing
function GoodEPGP:ConvertToJSON(table)
    local jsonString = ""
    jsonString = jsonString .. "["
    for key, playerTable in pairs(table) do
        jsonString = jsonString .. "{"
        for infoKey, infoValue in pairs(playerTable) do
            jsonString = jsonString .. "\"" .. infoKey .. "\": \"" .. infoValue .. "\", "
        end
        jsonString = jsonString:sub(1, -3) .. "},"
    end
    jsonString = jsonString:sub(1, -2) .. "]"

    return jsonString
end

-- Award master loot by name
function GoodEPGP:MasterLootByName(playerName)
    playerName = GoodEPGP:UCFirst(playerName)
    for i = 1, 40 do
        local candidate = GetMasterLootCandidate(GoodEPGP.activeItemIndex, i)
        -- We found the correct person ..
        if (candidate == playerName) then
            -- Go through the loot items, and make sure it's still in the right spot
            for itemIndex = 1, GetNumLootItems() do
                local itemLink = GetLootSlotLink(itemIndex)
                if (itemLink == GoodEPGP.activeItem) then
                    -- Award the item
                    GiveMasterLoot(GoodEPGP.activeItemIndex, i)
                end
            end
        end
    end
   GoodEPGP:Debug("Could not loot item")
end

-- Add EP to a player by their name
function GoodEPGP:AddEPByName(name, amount)
	if name then
	    if (amount == nil) then
			amount = 0
		end
	    name = GoodEPGP:UCFirst(name)
		message = "Adding " .. amount .. " EP to " .. name .. ".";
		GoodEPGP:Debug(message)
		SendChatMessage(message, "GUILD")
		GoodEPGP:SetEPGPByName(name, nil, nil, amount, nil)
	end
end

-- Add GP to a player by their name
function GoodEPGP:AddGPByName(name, amount)
	if name then
	    if (amount == nil) then
			amount = 0
		end
		name = GoodEPGP:UCFirst(name)
		message = "Adding " .. amount .. " GP to " .. name .. "."
		GoodEPGP:Debug(message)
		SendChatMessage(message, "GUILD")
		GoodEPGP:SetEPGPByName(name, nil, nil, nil, amount)
	end
end

-- Set a player's EPGP by name (used on mass updates)
function GoodEPGP:SetEPGPByName(player, ep, gp, addEp, addGp)

    -- If our addEp or addGp params are set, add the amount before setting.
    local index = GoodEPGP:GetMembersGuildIndex(player)
    if (addEp ~= nil or addGp ~= nil) then
		local name, _, _, _, class, _, note, officerNote, _, _ = GetGuildRosterInfo(index)
		if (player == select(1, strsplit("-", name))) then
			ep = select(1, strsplit(",", officerNote))
			gp = select(2, strsplit(",", officerNote))
			if (ep == nil or ep == "") then
				ep = 0
			end
			if (gp == nil or gp == "") then
				gp = GoodEPGP.config.minGP
			end

			if (addEp ~= nil) then
				ep = tonumber(ep) + tonumber(addEp)
			end
			if (addGp ~= nil) then
				gp = tonumber(gp) + tonumber(addGp)
			end
		end
    end

    -- Round our EP & GP
    ep = GoodEPGP:Round(ep, 2)
    gp = GoodEPGP:Round(gp, 2)

    -- Set the EPGP record
	local name, _, _, _, class, _, note, officernote, _, _ = GetGuildRosterInfo(index)
	if (player == select(1, strsplit("-", name))) then
		-- Format our officer note
		local epgpString = tostring(ep) .. "," .. tostring(gp)

		-- Inform to console
		GoodEPGP:Debug('Updated ' .. player .. ' to ' .. epgpString);

		-- Update the officer note
		GuildRosterSetOfficerNote(index, epgpString)
	end
end

function GoodEPGP:ValidSpecsByClass(playerClass, spec)

	-- If both values are passed and are true then return true
	if playerClass and spec then
		for key, value in pairs(GoodEPGP.specs) do
			if (value[1] == playerClass and value[2] == spec) then
				return true
			end
		end

	-- If only playerClass is passed then it returns valid specs for that class
	elseif playerClass then
		local validSpecs = {}
		for key, value in pairs(GoodEPGP.specs) do
			if (value[1] == playerClass) then
				table.insert(validSpecs, value[2])
			end
		end
		if #validSpecs > 0 then
			return validSpecs
		else
			return false
		end
	end

	-- If no values are passed or none of the above are true then return false
	return false
end

function GoodEPGP:GetMembersGuildIndex(player)
	local player = select(1, strsplit("-", player))
	for index = 1, GetNumGuildMembers() do
		local name = GetGuildRosterInfo(index)
		if (player == select(1, strsplit("-", name))) then
			return index
		end
	end
end

--------------------------------------------------------------------------------------------------
-- Set a player's spec. This assumes that your guild is using the following format for their Guild
-- Notes. This format is also compatible with and recommended for the Discord Bot named GoodBot.

-- '[Player Spec]:Main' <-- For Main Characters
-- '[Player Spec]:[Players Main Name]' <-- For Alt Characters
-----------------------------------------------------------
function GoodEPGP:SetSpec(player, spec, confirm)
	local spec = GoodEPGP:UCFirst(spec)

	-- Confirm that the spec was set
	if (confirm == true) then

		-- Waits 2 seconds then sends request back into confirmation stack for final step
		if (GoodEPGP.requestSetSpec == true) then
			GoodEPGP:ScheduleTimer("SetSpec", 2, nil, spec, false, GoodEPGP)
			GoodEPGP:Debug("setSpecialization request processing...")
			return
		end
	elseif (confirm == false) then

		-- Officer was online, or self was Officer -> spec set successfully
		if (GoodEPGP.requestSetSpec ~= true) then
			GoodEPGP.menuFrame:SetStatusText("|cff228B22Spec changed successfully to: "..spec.."|r")
			GoodEPGP:Debug("setSpecialization request successful...")
			return
		end

		-- We have not recieved an answer to our request -> no Officers online
		if (GoodEPGP.requestSetSpec == true) then
			GoodEPGP.menuFrame:SetStatusText("|cff8b0000Spec change failed - no officers online|r")
			GoodEPGP:Debug("setSpecialization request failed. No officers online...")
			return
		end
	end

	-- GoodEPGP:UCFirst() useage: edge case to catch manual input laziness
	GoodEPGP.requestSetSpec = false
	local player = GoodEPGP:UCFirst(select(1, strsplit("-", player)))
    local index = GoodEPGP:GetMembersGuildIndex(player)
	local rank = select(2, GetGuildRosterInfo(index))
	local class = select(5, GetGuildRosterInfo(index))
	local gMemNote = select(7, GetGuildRosterInfo(index))
	local gMemSpec = GoodEPGP:UCFirst(select(1, strsplit(":", gMemNote)))
	local gMemName = GoodEPGP:UCFirst(select(2, strsplit(":", gMemNote)))
	local oldMemSpec = GoodEPGP:ValidSpecsByClass(class, gMemSpec)
	local oldMemName = (GoodEPGP:GetMembersGuildIndex(gMemNote) ~= nil) and (GoodEPGP:GetMembersGuildIndex(gMemNote) > 0)

	------------------------------------
	-- New Guild Note format Logic stack
	------------------------------------

	-- Is the spec a valid spec?
	if gMemSpec and GoodEPGP:ValidSpecsByClass(class, gMemSpec) then
		local validGmemSpec = gMemSpec
	end

	-- Is the name an actual member of the guild or just a "Main" tag?
	if gMemName and (((GoodEPGP:GetMembersGuildIndex(gMemName) ~= nil) and (GoodEPGP:GetMembersGuildIndex(gMemName) > 0)) or (gMemName == "Main")) then
		local validGmemName = gMemName
	end

	-- We found a note in the new format
	if validGmemSpec and validGmemName and spec ~= gMemSpec then
		if (CanEditOfficerNote()) then

			-- Form the new note with the modified spec
			local nSpec = spec..":"..gMemName
			GuildRosterSetPublicNote(index, nSpec)
			GoodEPGP:SetSpec(nil, spec, false)

		-- Not an officer - send request
		else
			GoodEPGP:AddonMessage("requestSetSpecialization")
			GoodEPGP.requestSetSpec = true
			GoodEPGP.tempReqSpec = spec
			GoodEPGP:SetSpec(nil, spec, true)
		end

	-----------------------------------------------------------------------------------------------
	-- Old Guild Note format logic stack --> New Guild Note format. Will also clean up after
	-- Officers who don't manually set the Guild Note correctly. At some point one can comment out
	-- this code or keep it. All the code above this section will not work or error unless the new
	-- format is used for the character that this function is being run against.
	-- TODO: Maybe turn this into an option in the Admin Panel?
	-----------------------------------------------------------------------------------------------

	-- All we found is a valid spec (old format)
	elseif oldMemSpec and oldMemSpec ~= spec then
		if (CanEditOfficerNote()) then

			-- Look for the Alt rank and tag it
			if (rank:find("Alt") or rank:find(" Alt")) then
				local nSpec = spec..":Alt(Find Main please)"
				GuildRosterSetPublicNote(index, nSpec)
				GoodEPGP:SetSpec(nil, spec, false)

			-- Assume its a "Main"
			else
				local nSpec = spec..":Main"
				GuildRosterSetPublicNote(index, nSpec)
				GoodEPGP:SetSpec(nil, spec, false)
			end

		-- Not an officer - send request
		else
			GoodEPGP:AddonMessage("requestSetSpecialization")
			GoodEPGP.requestSetSpec = true
			GoodEPGP.tempReqSpec = spec
			GoodEPGP:SetSpec(nil, spec, true)
		end

	-- All we found is a valid name of a memeber in the guild (old format)
	elseif oldMemName then
		if (CanEditOfficerNote()) then

			-- We assume this name is the Mains name
			local nSpec = spec..":"..oldMemName
			GuildRosterSetPublicNote(index, nSpec)
			GoodEPGP:SetSpec(nil, spec, false)

		-- Not an officer - send request
		else
			GoodEPGP:AddonMessage("requestSetSpecialization")
			GoodEPGP.requestSetSpec = true
			GoodEPGP.tempReqSpec = spec
			GoodEPGP:SetSpec(nil, spec, true)
		end

	-- We found a Guild Note that doesn't match anything
	elseif (oldMemName == false or oldMemSpec == false) then
		if (CanEditOfficerNote()) then

			-- Look for the Alt rank and tag it
			if (rank:find("Alt") or rank:find(" Alt")) then
				local nSpec = spec..":Alt(Find Main please)"
				GuildRosterSetPublicNote(index, nSpec)
				GoodEPGP:SetSpec(nil, spec, false)

			-- Assume its a "Main"
			else
				local nSpec = spec..":Main"
				GuildRosterSetPublicNote(index, nSpec)
				GoodEPGP:SetSpec(nil, spec, false)
			end

		-- Not an officer - send request
		else
			GoodEPGP:AddonMessage("requestSetSpecialization")
			GoodEPGP.requestSetSpec = true
			GoodEPGP.tempReqSpec = spec
			GoodEPGP:SetSpec(nil, spec, true)
		end
	-----------------------------------------------------------------------------------------------

	-- We found a blank Guild Note
	elseif (#gMemNote == 0) then
		if (CanEditOfficerNote()) then

			-- Look for the Alt rank and tag it
			if (rank:find("Alt") or rank:find(" Alt")) then
				local nSpec = spec..":Alt(Find Main please)"
				GuildRosterSetPublicNote(index, nSpec)
				GoodEPGP:SetSpec(nil, spec, false)

			-- Assume its a "Main"
			else
				local nSpec = spec..":Main"
				GuildRosterSetPublicNote(index, nSpec)
				GoodEPGP:SetSpec(nil, spec, false)
			end

		-- Not an officer - send request
		else
			GoodEPGP:AddonMessage("requestSetSpecialization")
			GoodEPGP.requestSetSpec = true
			GoodEPGP.tempReqSpec = spec
			GoodEPGP:SetSpec(nil, spec, true)
		end
	end
end

-- Let user know you can set the requested spec
function GoodEPGP:RequestSetSpec(player)
    -- Verify you can actually SEE officer notes before offering to set spec
    if (CanEditOfficerNote()) then
        GoodEPGP:AddonMessage("setSpecializationAvailable", player)
    end
end

-- Get a player's index within the guild roster
function GoodEPGP:GetGuildMemberByName(name)
    local playerInfo
    if (name == nil) then
        GoodEPGP:Debug("Empty name for guild member lookup.")
    else
        for i = 1, GetNumGuildMembers() do
            local playerName, _, _, _, class, _, note, officerNote, _, _ = GetGuildRosterInfo(i)
            -- Strip the server name
            playerName = select(1, strsplit("-", playerName))
            if (playerName:lower() == name:lower()) then
                local ep = select(1, strsplit(",", officerNote))
                local gp = select(2, strsplit(",", officerNote))
                if (ep == nil or gp == nil) then
                    ep = 0
                    gp = GoodEPGP.config.minGP
                end
                local pr = GoodEPGP:Round(tonumber(ep) / tonumber(gp), 2)
                playerInfo = {
                    ["name"] = GoodEPGP:UCFirst(playerName),
                    ["spec"] = GoodEPGP:UCFirst(note),
                    ["class"] = GoodEPGP:UCFirst(class),
                    ["ep"] = ep,
                    ["gp"] = gp,
                    ["pr"] = pr,
                };
            end
        end
    end

    -- If there's a player that can't be found within the guild ...
    if (playerInfo == nil) then
        playerInfo = {
            ["name"] = GoodEPGP:UCFirst(name),
            ["spec"] = '',
            ["class"] = '',
            ["ep"] = 0,
            ["gp"] = 0,
            ["pr"] = 0,
        }
    end
    return playerInfo
end

-- Reset EPGP of all members
function GoodEPGP:Reset()
    -- Loop through guild roster, reset all members
    for i = 1, GetNumGuildMembers() do
        local guildName, _, _, _, class, _, note, officerNote, _, _ = GetGuildRosterInfo(i)
        local ep = 0
        local gp = GoodEPGP.config.minGP
        playerName = select(1, strsplit("-", guildName))
        GoodEPGP:SetEPGPByName(playerName, ep, gp)
    end
end

-- Decay EPGP of all members
function GoodEPGP:Decay()
    -- Loop through guild roster, decay all members
    for i = 1, GetNumGuildMembers() do
        local guildName, _, _, _, class, _, note, officerNote, _, _ = GetGuildRosterInfo(i)
        if (string.find(officerNote, ",") == nil) then
            officerNote = '0,' .. GoodEPGP.config.minGP
        end

        local ep = select(1, strsplit(",", officerNote))
        local gp = select(2, strsplit(",", officerNote))
        ep = tonumber(ep)
        gp = tonumber(gp)

        if (ep > 0) then
            ep = ep * (1 - tonumber(GoodEPGP.config.decayPercent))
            gp = gp * (1 - tonumber(GoodEPGP.config.decayPercent))
            if (gp < tonumber(GoodEPGP.config.minGP)) then
                gp = tonumber(GoodEPGP.config.minGP)
            end
            playerName = select(1, strsplit("-", guildName))
            GoodEPGP:SetEPGPByName(playerName, ep, gp)
        end
    end

    local decayPercent = GoodEPGP:Round(GoodEPGP.config.decayPercent * 100, 0) .. '%.'

    GoodEPGP:SendGuild("EP & GP have been decayed by " .. decayPercent)
end

-- Round all player's EP & GP to 2 decimal places
function GoodEPGP:RoundPoints()
    -- Loop through guild roster, decay all members
    for i = 1, GetNumGuildMembers() do
        local guildName, _, _, _, class, _, note, officerNote, _, _ = GetGuildRosterInfo(i)
        if (string.find(officerNote, ",") == nil) then
            officerNote = '0,' .. GoodEPGP.config.minGP
        end

        local ep = select(1, strsplit(",", officerNote))
        local gp = select(2, strsplit(",", officerNote))
        ep = tonumber(ep)
        gp = tonumber(gp)
        local ep = GoodEPGP:Round(ep, 2)
        local gp = GoodEPGP:Round(gp, 2)

        if (ep > 0) then
            playerName = select(1, strsplit("-", guildName))
            GoodEPGP:SetEPGPByName(playerName, ep, gp)
        end
    end
end

-- Get a player's current EP/GP standing. Name = player to lookup, type = (whisper|console), playerName = player to whisper back with information
function GoodEPGP:PlayerInfo(name, type, playerName)
    local memberInfo = GoodEPGP:GetGuildMemberByName(name)
    GoodEPGP:ShowPlayerInfo(memberInfo, type, playerName)
end

-- Output a single line of standings
function GoodEPGP:ShowPlayerInfo(memberInfo, type, playerName)
    if (memberInfo == nil) then
        return
    end
    local playerString = memberInfo.name .. ": " .. memberInfo.ep .. " EP / " .. memberInfo.gp .. " GP (" .. memberInfo.pr .. " Prio)"
    GoodEPGP:HandleOutput(playerString, type, playerName)
end

-- Add a certain amount of EP to all players in the raid
function GoodEPGP:AddEPToRaid(amount)
    for i = 1, GetNumGroupMembers() do
        local name, _, subgroup, level, class = GetRaidRosterInfo(i);
        local guildInfo = GoodEPGP:GetGuildMemberByName(name)
        if (guildInfo ~= nil) then
            GoodEPGP:AddEPByName(name, amount)
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

function GoodEPGP:ImportRecords()
    -- Don't bother unless we have records
    if (GoodEPGPImport == nil or #GoodEPGPImport == 0) then
        return
    end

    -- Loop through import data
    for key, value in pairs(GoodEPGPImport) do
        GoodEPGP:ChargeForItem(value["name"], value["item"], value["type"])
    end

    -- Clear out our import variable so we don't import twice
    GoodEPGPImport = {}
end

function GoodEPGP:ImportStandings()
    -- Don't bother unless we have records
    if (GoodEPGPStandingsImport == nil or #GoodEPGPStandingsImport == 0) then
        return
    end

    -- Inform debug that we're importing.
    GoodEPGP:Debug('Importing standings.')

    -- Loop through import data
    for key, value in pairs(GoodEPGPStandingsImport) do
        if (tonumber(value.ep) > 0) then
            GoodEPGP:Debug(value.player)
            GoodEPGP:SetEPGPByName(value.player, value.ep, value.gp)
        end
    end

    -- GoodEPGPStandingsImport = {}
end

-- =====================
-- UTILITY FUNCTIONS
-- =====================

-- Capitalize the first letter of a word, lowercase the rest.
function GoodEPGP:UCFirst(word)
	if word then
	    word = word:sub(1,1):upper() .. word:sub(2):lower()
		return word
	end
end

-- Send an add-on message
function GoodEPGP:AddonMessage(msg, target)
    if (target ~= nil) then
        C_ChatInfo.SendAddonMessage("GoodEPGP", msg, "WHISPER", target);
    else
        C_ChatInfo.SendAddonMessage("GoodEPGP", msg, "GUILD");
    end
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
function GoodEPGP:WidestAudience(msg, rw)
    if (rw == nil) then
        rw = true
    end
    local channel = "GUILD"
    if UnitInRaid("player") then
        if ((UnitIsGroupLeader("player") or UnitIsGroupAssistant("player")) and rw == true) then
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
        self:Print('GEPGP: ' .. string)
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

-- Put up a confirmation modal
function GoodEPGP:ConfirmAction(confirmString, acceptCallback, cancelCalback)
    StaticPopupDialogs["CONFIRM_ACTION"] ={
        preferredIndex = 5,
        text = confirmString,
        button1 = "Yes",
        button2 = "No",
        OnAccept = acceptCallback,
        OnCancel = cancelCalback,
        timeout = 0,
        hideOnEscape = false,
        showAlert = true
    }

    StaticPopup_Show("CONFIRM_ACTION")
end

-- Debug!
function GoodEPGP:Debug(message)
    if (GoodEPGP.config.debugEnabled == true) then
        if (message == nil) then
            self:Print("DEBUG: nil")
        else
            self:Print("DEBUG: " .. message)
        end
    end
end

-- Minimap Icon
function GoodEPGP:MinimapIconToggle()
	if (GoodEPGPMiniMapPos.show == false) then
		GoodEPGP.MinimapIcon:Hide("GoodEPGPMinimap")
	else
		GoodEPGP.MinimapIcon:Show("GoodEPGPMinimap")
	end
end

-- Get Player GUID by Name
function GoodEPGP:PlayerGUID(playerName)
	player = select(1, strsplit("-", playerName))
    for i = 1, MAX_RAID_MEMBERS do
		local raidMember = select(1, GetRaidRosterInfo(i))
		if raidMember then
			if raidMember == player then
				local unitID = "raid"..i
				local playerGUID = UnitGUID(unitID)
				return playerGUID
			end
		end
    end
end

-- Secure Hookfunction
local old = ItemRefTooltip.SetHyperlink
function ItemRefTooltip:SetHyperlink(link, ...)
	if link:find("goodbid:") then
		GoodEPGP:Debug("ItemRefTooltip - link: "..link)
		local mlGUID = select(3, strsplit(":", link))
		local bidType = select(4, strsplit(":", link))
		if link and mlGUID and bidType then
			GoodEPGP:Debug("ItemRefTooltip - link: "..link.." | mlGUID: "..mlGUID.." | bidType: "..bidType)
		end
		local masterlooter = select(6, GetPlayerInfoByGUID(mlGUID))
		if masterlooter and bidType then
			if bidType == "ms" then
				SendChatMessage("+", "WHISPER", nil, masterlooter)
			end
			if bidType == "os" then
				SendChatMessage("-", "WHISPER", nil, masterlooter)
			end
		end
	else
		return old(self, link, ...)
	end
end