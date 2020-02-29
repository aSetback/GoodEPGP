-- Include the AceGUI for frame manipulation
local AceGUI = LibStub("AceGUI-3.0")

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

-- Show EPGP standings
function GoodEPGP:ShowStandings()
    -- Create the standingsFrame if it doesn't exist.
    if (GoodEPGP.standingsFrame == nil) then
        -- Create the overall frame
        GoodEPGP.standingsFrame = AceGUI:Create("Frame")
        GoodEPGP.standingsFrame:SetTitle("EPGP Standings")
        GoodEPGP.standingsFrame:SetStatusText("Last Updated: ***")
        GoodEPGP.standingsFrame:SetLayout("Flow")
        GoodEPGP.standingsFrame:EnableResize(false)

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

        -- Generate labels for each of our headers
        local headers = {
            {["label"] = "Player", ["width"] = 200, ["sortColumn"] = "name"},
            {["label"] = "Class", ["width"] = 150, ["sortColumn"] = "class"},
            {["label"] = "EP", ["width"] = 80, ["sortColumn"] = "ep"},
            {["label"] = "GP", ["width"] = 80, ["sortColumn"] = "gp"},
            {["label"] = "Priority", ["width"] = 80, ["sortColumn"] = "pr"},
        }

        -- Add our header line, and specify the sorting function to us
        GoodEPGP:AddHeaderLine(headers, GoodEPGP.standingsScrollFrame, "StandingsSort")

        GoodEPGP.standingsFrame:Hide()
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
        headerLabel:SetText(values.label)
        headerLabel:SetWidth(values.width)

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
end

-- Display a single line of standings
function GoodEPGP:AddStandingLine(player, frame, index)

    -- Set up a table of standings frame lines
    if (GoodEPGP.standingsFrames == nil) then
        GoodEPGP.standingsFrames = {}
    end

    -- Our list of fields and related widths
    local fields = {
        {["field"] = "name", ["width"] = 200},
        {["field"] = "class", ["width"] = 150},
        {["field"] = "ep", ["width"] = 80},
        {["field"] = "gp", ["width"] = 80},
        {["field"] = "pr", ["width"] = 80},
    }

    -- If the key for this index exists, modify it .. otherwise create a new label and insert it into a table to insert into the standingsFrame table
    if (GoodEPGP.standingsFrames[index]) then
        local standingLine = GoodEPGP.standingsFrames[index]
        -- Loop through each of the fields in our line and adjust the text of the frame.
        for key, field in pairs(fields) do
            local standingLabel = standingLine[field.field]
            standingLabel:SetText(player[field.field])
        end
    else
        local standingLine = {};

        -- Our frames didn't already exist -- create them!
        for key, field in pairs(fields) do
            local label = AceGUI:Create("Label")
            label:SetText(player[field.field])
            label:SetWidth(field.width)
            frame:AddChild(label)

            -- Add the new label frame to the standingLine table for re-use later
            standingLine[field.field] = label
        end

        -- Add our new standingLine table to the standingsFrames table for later use
        GoodEPGP.standingsFrames[index] = standingLine
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
