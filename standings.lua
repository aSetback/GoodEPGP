-- Include the AceGUI for frame manipulation
local AceGUI = LibStub("AceGUI-3.0")

-- Class List
local classList = {"All Classes", "Warrior", "Paladin", "Shaman", "Hunter", "Rogue", "Druid", "Priest", "Warlock", "Mage"}

-- Role List
local roleList = {"All Roles", "Tank", "Healer", "Caster", "Melee"}

-- Combo lists for role sorting
local validCombos = {
    ["Tank"] = {
        {["class"] = "Warrior", ["spec"] = "Protection"},
        {["class"] = "Druid", ["spec"] = "Feral"},
    },
    ["Healer"] = {
        {["class"] = "Priest", ["spec"] = "Holy"},
        {["class"] = "Priest", ["spec"] = "Discipline"},
        {["class"] = "Druid", ["spec"] = "Restoration"},
        {["class"] = "Paladin", ["spec"] = "Holy"},
    },
    ["Caster"] = {
        {["class"] = "Priest", ["spec"] = "Shadow"},
        {["class"] = "Mage", ["spec"] = "Frost"},
        {["class"] = "Mage", ["spec"] = "Fire"},
        {["class"] = "Mage", ["spec"] = "Arcane"},
        {["class"] = "Warlock", ["spec"] = "Demonology"},
        {["class"] = "Warlock", ["spec"] = "Affliction"},
        {["class"] = "Warlock", ["spec"] = "Destruction"},
        {["class"] = "Druid", ["spec"] = "Balance"},
    },
    ["Melee"] = {
        {["class"] = "Druid", ["spec"] = "Feral"},
        {["class"] = "Warrior", ["spec"] = "Arms"},
        {["class"] = "Warrior", ["spec"] = "Fury"},
        {["class"] = "Rogue", ["spec"] = "Combat"},
        {["class"] = "Rogue", ["spec"] = "Subtlety"},
        {["class"] = "Rogue", ["spec"] = "Assassination"},
    }
}

-- Class colors in RGB
local classColors = {
    ["Druid"] = {["r"] = 1.00, ["g"] = .49, ["b"] = .04},
    ["Hunter"] = {["r"] = .67, ["g"] = .83, ["b"] = .45},
    ["Mage"] = {["r"] = .25, ["g"] = .78, ["b"] = .92},
    ["Paladin"] = {["r"] = .96, ["g"] = .55, ["b"] = .73},
    ["Priest"] = {["r"] = 1.00, ["g"] = 1.00, ["b"] = 1.00},
    ["Rogue"] = {["r"] = 1.00, ["g"] = .96, ["b"] = .41},
    ["Shaman"] = {["r"] = .00, ["g"] = .44, ["b"] = .87},
    ["Warlock"] = {["r"] = .53, ["g"] = .53, ["b"] = .93},
    ["Warrior"] = {["r"] = .78, ["g"] = .61, ["b"] = .43},
}


-- Date format
local dateFormat = "%m/%d/%y @ %I:%M:%S %p"

-- Receive standings
function GoodEPGP:ReceiveStandings(text)

    -- Parse the broadcast
    local broadcast = { strsplit(";", string.sub(text, 3)) }
    for key, standing in pairs(broadcast) do
        if (standing ~= "") then
            local player, class, spec, ep, gp, pr = strsplit(",", standing)
            local pr = GoodEPGP:Round(ep/gp, 2)
            local playerInfo = {
                ["name"] = player,
                ["class"] = class,
                ["spec"] = spec,
                ["ep"] = ep,
                ["gp"] = gp,
                ["pr"] = pr
            };
            table.insert(GoodEPGPCachedStandings, playerInfo)
        end
    end

end

-- Request standings
function GoodEPGP:RequestStandings()
    GoodEPGP:AddonMessage("requestStandings")
    GoodEPGP.requestStandings = true
end

-- Let user know you have standings available
function GoodEPGP:StandingsAvailability(player)
    -- Verify you can actually SEE epgp before you offer to give people standings
    if (CanEditOfficerNote()) then
        GoodEPGP:AddonMessage("standingsAvailable", player)
    end
end

-- Update our last updated timestamp
function GoodEPGP:StandingsUpdateLastUpdated()
    GoodEPGPConfig.standingsLastUpdated = GetServerTime()
    GoodEPGP.standingsFrame:SetStatusText("Last Updated: " .. date(dateFormat, GoodEPGPConfig.standingsLastUpdated))
end

-- Show EPGP standings
function GoodEPGP:ShowStandings()
    -- Create the standingsFrame if it doesn't exist.
    if (GoodEPGP.standingsFrame == nil) then

        -- Create the overall frame
        GoodEPGP.standingsFrame = AceGUI:Create("Frame")
	    GoodEPGP.standingsFrame:SetTitle("GoodEPGP - Standings")
        if (GoodEPGPConfig.standingsLastUpdated == 0)  then
            GoodEPGP.standingsFrame:SetStatusText("Last Updated: never")
        else
            GoodEPGP.standingsFrame:SetStatusText("Last Updated: " .. date(dateFormat, GoodEPGPConfig.standingsLastUpdated))
        end
        GoodEPGP.standingsFrame:SetLayout("Flow")
        GoodEPGP.standingsFrame:EnableResize(false)

        -- Create navigation at the top
        GoodEPGP.standingsFrame.classSelectDropdown = AceGUI:Create("Dropdown")
        GoodEPGP.standingsFrame.classSelectDropdown:SetLabel("Class")
        GoodEPGP.standingsFrame.classSelectDropdown:SetText("Select a class")
        GoodEPGP.standingsFrame.classSelectDropdown:SetList(classList)
        GoodEPGP.standingsFrame.classSelectDropdown:SetCallback("OnValueChanged", function(widget)
            local selectedClass = classList[widget:GetValue()];
            GoodEPGP:StandingsFilter("class", selectedClass)
        end)
        GoodEPGP.standingsFrame:AddChild(GoodEPGP.standingsFrame.classSelectDropdown)

        GoodEPGP.standingsFrame.roleSelectDropdown = AceGUI:Create("Dropdown")
        GoodEPGP.standingsFrame.roleSelectDropdown:SetLabel("Role")
        GoodEPGP.standingsFrame.roleSelectDropdown:SetText("Select a role")
        GoodEPGP.standingsFrame.roleSelectDropdown:SetList(roleList)
        GoodEPGP.standingsFrame.roleSelectDropdown:SetCallback("OnValueChanged", function(widget)
            local selectedRole = roleList[widget:GetValue()];
            GoodEPGP:StandingsFilter("role", selectedRole)
        end)
        GoodEPGP.standingsFrame:AddChild(GoodEPGP.standingsFrame.roleSelectDropdown)

		-- Blank Spacer
		GoodEPGP.standingsFrame.blankSpacer = AceGUI:Create("Label")
		GoodEPGP.standingsFrame.blankSpacer:SetFullWidth(true)
		GoodEPGP.standingsFrame:AddChild(GoodEPGP.standingsFrame.blankSpacer)

		-- 4px padding (hacks!)
		GoodEPGP.standingsFrame.padding = AceGUI:Create("Label")
		GoodEPGP.standingsFrame.padding:SetWidth(4)
		GoodEPGP.standingsFrame:AddChild(GoodEPGP.standingsFrame.padding)

        -- Generate labels for each of our headers
        local headers = {
            {["label"] = "Player", ["width"] = 200, ["sortColumn"] = "name"},
            {["label"] = "Class", ["width"] = 150, ["sortColumn"] = "class"},
            {["label"] = "EP", ["width"] = 80, ["sortColumn"] = "ep"},
            {["label"] = "GP", ["width"] = 80, ["sortColumn"] = "gp"},
            {["label"] = "Priority", ["width"] = 80, ["sortColumn"] = "pr"},
        }

        -- Add our header line, and specify the sorting function to us
        GoodEPGP:AddHeaderLine(headers, GoodEPGP.standingsFrame, "StandingsSort")

        -- Create a container for the scrolling content
        GoodEPGP.standingsScrollContainer = AceGUI:Create("SimpleGroup")
        GoodEPGP.standingsScrollContainer:SetFullWidth(true)
        GoodEPGP.standingsScrollContainer:SetFullHeight(true)
        GoodEPGP.standingsScrollContainer:SetLayout("Fill")

        -- Add scrolling container to parent
        GoodEPGP.standingsFrame:AddChild(GoodEPGP.standingsScrollContainer)

        -- Add the actual frame for the scrolling standings to go to
        GoodEPGP.standingsScrollFrame = AceGUI:Create("ScrollFrame")
        GoodEPGP.standingsScrollFrame:SetLayout("Flow")
        GoodEPGP.standingsScrollContainer:AddChild(GoodEPGP.standingsScrollFrame)
		GoodEPGP.standingsScrollFrame:ClearAllPoints()
		GoodEPGP.standingsScrollFrame:SetPoint("TOP", GoodEPGP.standingsScrollContainer.frame, "TOP", 0, -4)
		GoodEPGP.standingsScrollFrame:SetPoint("BOTTOM", 0, 4)
		GoodEPGP.standingsScrollFrame.frame:SetBackdrop({ bgFile = "Interface/Tooltips/UI-Tooltip-Background"})
        GoodEPGP.standingsScrollFrame.frame:SetBackdropColor(0, 0, 0, 1)

        -- Hide our standings frame
        GoodEPGP.standingsFrame:Hide()

		-- Allows closing hitting ESC
		_G["GoodEPGP_Standings"] = GoodEPGP.standingsFrame
		table.insert(UISpecialFrames, "GoodEPGP_Standings")
    end

    -- Go through our standings and display them
    for key, player in pairs(GoodEPGPCachedStandings) do
        GoodEPGP:AddStandingLine(player, GoodEPGP.standingsScrollFrame, key)
    end
end

-- Display header line
function GoodEPGP:AddHeaderLine(headers, frame, sortFunction)
    -- Loop through our table of headers and display them
    for key, values in pairs(headers) do
        local headerLabel = AceGUI:Create("InteractiveLabel")
        headerLabel:SetWidth(values.width)
		headerLabel:SetText(values.label)

        -- Add our sorting event on click
        headerLabel:SetCallback("OnClick", function()
            GoodEPGP[sortFunction](GoodEPGP, values.sortColumn)
        end)

        -- Attach the label to our parent frame
        frame:AddChild(headerLabel)
    end
end

-- Sort the EPGP standings tables
function GoodEPGP:StandingsSort(sortColumn)

    -- Sort based on previous sort (ASC => DESC => ASC)
    local sortOrder = "ASC"
    if (GoodEPGP.standingsFrame ~= nil) then
        if (GoodEPGP.standingsFrame.sort == sortColumn) then
            if (GoodEPGP.standingsFrame.sortOrder == "ASC") then
                GoodEPGP.standingsFrame.sortOrder = "DESC"
            else
                GoodEPGP.standingsFrame.sortOrder = "ASC"
            end
        else
            GoodEPGP.standingsFrame.sort = sortColumn
            GoodEPGP.standingsFrame.sortOrder = "ASC"
        end

        -- Fill in our sortOrder var
        sortOrder = GoodEPGP.standingsFrame.sortOrder
    end

    -- Sort numerically when using a numeric column
    local numeric = false
    if (sortColumn == 'ep' or sortColumn == 'gp' or sortColumn == 'pr') then
        numeric = true
    end

    -- Custom sort function
    table.sort(GoodEPGPCachedStandings, function(a, b)
        if (numeric) then
            a[sortColumn] = tonumber(a[sortColumn])
            b[sortColumn] = tonumber(b[sortColumn])
        else
            local a = a[sortColumn]
            local b = b[sortColumn]
        end

        if (sortOrder == "ASC") then
            return b[sortColumn] > a[sortColumn]
        else
            return a[sortColumn] > b[sortColumn]
        end
    end)

    GoodEPGP:ShowStandings()

    local selectedClass = classList[GoodEPGP.standingsFrame.classSelectDropdown:GetValue()]
    if (selectedClass ~= nil) then
        GoodEPGP:StandingsFilter("class", selectedClass)
    end

    local selectedRole = roleList[GoodEPGP.standingsFrame.roleSelectDropdown:GetValue()]
    if (selectedRole ~= nil) then
        GoodEPGP:StandingsFilter("role", selectedRole)
    end
end

-- Filter the EPGP standings
function GoodEPGP:StandingsFilter(type, filterValue)
    for key, standingsLine in pairs(GoodEPGP.standingsLinesFrames) do
        for fieldKey, field in pairs(standingsLine) do
            if (fieldKey ~= "group") then
                field:SetText("")
            end
        end
    end

    if (type == "role") then
        GoodEPGP.standingsFrame.classSelectDropdown:SetValue("")

        -- Go through our standings and display them
        local counter = 1
        local combos = validCombos[filterValue]
        for key, player in pairs(GoodEPGPCachedStandings) do
            if (filterValue == "All Roles") then
                GoodEPGP:AddStandingLine(player, GoodEPGP.standingsScrollFrame, counter)
                counter = counter + 1
            else
                for comboKey, combo in pairs(combos) do
                    if (combo.class == player.class and combo.spec == player.spec) then
                        GoodEPGP:AddStandingLine(player, GoodEPGP.standingsScrollFrame, counter)
                        counter = counter + 1
                    end
                end
            end
        end
    end

    if (type == "class") then
        GoodEPGP.standingsFrame.roleSelectDropdown:SetValue("")

        -- Go through our standings and display them
        local counter = 1
        for key, player in pairs(GoodEPGPCachedStandings) do
            if (player.class == filterValue or filterValue == "All Classes") then
                GoodEPGP:AddStandingLine(player, GoodEPGP.standingsScrollFrame, counter)
                counter = counter + 1
            end
        end
    end
end


-- Display a single line of standings
function GoodEPGP:AddStandingLine(player, frame, index)

    -- Set up a table of standings frame lines
    if (GoodEPGP.standingsLinesFrames == nil) then
        GoodEPGP.standingsLinesFrames = {}
    end

    -- Our list of fields and related widths
    local fields = {
        {["field"] = "name", ["width"] = 196},
        {["field"] = "class", ["width"] = 146},
        {["field"] = "ep", ["width"] = 76},
        {["field"] = "gp", ["width"] = 76},
        {["field"] = "pr", ["width"] = 76},
    }

    -- Get our player's class color
    local playerClass = player["class"]
    local classColor = classColors[playerClass]

    -- If the key for this index exists, modify it .. otherwise create a new label and insert it into a table to insert into the standingsFrame table
    if (GoodEPGP.standingsLinesFrames[index]) then
        local standingLine = GoodEPGP.standingsLinesFrames[index]
        -- Loop through each of the fields in our line and adjust the text of the frame.
        for key, field in pairs(fields) do
            local standingLabel = standingLine[field.field]
            if (field.field == "class" or field.field == "name") then
                standingLabel:SetColor(classColor.r, classColor.g, classColor.b)
            end
            standingLabel:SetText(player[field.field])
        end
        if (index % 2 == 1) then
		--[[
            standingLine["group"].frame:SetBackdrop({ bgFile = "Interface/Tooltips/UI-Tooltip-Background"})
            standingLine["group"].frame:SetBackdropColor(.2, 0, 0, .8)
		--]]
		else
			standingLine["group"].frame:SetBackdrop({ bgFile = "Interface/Tooltips/UI-Tooltip-Background"})
            standingLine["group"].frame:SetBackdropColor(.2, .2, .2, .8)
        end
    else
        local standingLine = {};
        labelGroup = AceGUI:Create("SimpleGroup")
        labelGroup:SetLayout("Flow")
        labelGroup:SetRelativeWidth(1)

        -- Our frames didn't already exist -- create them!
        for key, field in pairs(fields) do
            local label = AceGUI:Create("Label")
            if (field.field == "class" or field.field == "name") then
                label:SetColor(classColor.r, classColor.g, classColor.b)
            end
            label:SetWidth(field.width)
			label:SetText(player[field.field])
			label:SetHeight(14)

			-- add 4px padding to each label group (hacks!)
			local padding = AceGUI:Create("Label")
			padding:SetWidth(4)
			labelGroup:AddChild(padding)

			-- add label to label group
			labelGroup:AddChild(label)

            -- Add the new label frame to the standingLine table for re-use later
            standingLine[field.field] = label
        end

		-- Add label group to standingsScrollFrame
        frame:AddChild(labelGroup)

        standingLine["group"] = labelGroup

        -- Add our new standingLine table to the standingsLinesFrames table for later use
        GoodEPGP.standingsLinesFrames[index] = standingLine
    end
end

-- Broadcast standings
function GoodEPGP:SendStandings(requestor)
    -- Debug info
    GoodEPGP:Debug("Broadcasting standings to " .. requestor)

    -- Generate a table of what the standings currently are
    local standings = {}
    for i = 1, GetNumGuildMembers() do
        local name = GetGuildRosterInfo(i)
        name = select(1, strsplit("-", name))
        local member = GoodEPGP:GetGuildMemberByName(name)
        table.insert(standings, member)
    end

    -- Generate our broadcast string
    local broadcast = ""
    for key, player in pairs(standings) do
        if (tonumber(player.ep) > 0) then
            broadcast = broadcast .. player.name .. "," .. player.class .. "," .. player.spec .. "," .. player.ep .. "," .. player.gp .. ";"
            -- Our string is approaching the 255 character limit.  Let's send it and start a new one.
            if (string.len(broadcast) > 200) then
                GoodEPGP:AddonMessage("S:" .. broadcast, requestor)
                broadcast = ""
            end
        end
    end

    -- If there's a remainder message that didn't quite hit the
    if (broadcast ~= "") then
        GoodEPGP:AddonMessage("S:" .. broadcast, requestor)
    end

    -- Let the user know that we're doing sending standings
    GoodEPGP:AddonMessage("standingsBroadcastComplete", requestor)
end

-- Broadcast item award to all players with the add-on
function GoodEPGP:BroadcastAward(player, item, price)
    GoodEPGP:AddonMessage("Award:" .. player .. ":" .. item .. ":" .. price)
end

-- Show standings by class, with a minimum priority (1 by default)
function GoodEPGP:ShowStandingsByClass(class, minimumPrio, type, playerName)
    -- Make sure we have a class
    if (class == nil) then
        return nil
    end

    -- Retrieve our standings by class(es)
    local classStandings = GoodEPGP:GetStandingsByClass(class:lower())
    if (classStandings == nil or #classStandings == 0) then
        return
    end

    -- Check if minimum is set and numeric
    minimumPrio = tonumber(minimumPrio)
    if (minimumPrio == nil) then
        minimumPrio = .1
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
    -- Make sure we have a class
    if (class == nil) then
        return nil
    end

    local classes = nil
    if (string.find(class, ",") ~= nil) then
        classes = GoodEPGP:SplitString(class, ",")
    end

    local classStandings = {}
    for i = 1, GetNumGuildMembers() do
        local name = GetGuildRosterInfo(i)
        name = select(1, strsplit("-", name))
        local member = GoodEPGP:GetGuildMemberByName(name)
        if (member == nil) then
            return classStandings
        end
        if (classes ~= nil) then
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
