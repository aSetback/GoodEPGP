
-- Receive standings
function GoodEPGP:ReceiveStandings(text)
    -- Set up our cached standings table
    if (GoodEPGPCachedStandings == nil) then
        GoodEPGPCachedStandings = {}
    end

    -- Parse the broadcast
    local broadcast = { strsplit(";", string.sub(text, 3)) }
    for key, standing in pairs(broadcast) do
        if (standing ~= "") then
            local player = select(1, strsplit(",", standing))
            local class = select(2, strsplit(",", standing))
            local spec = select(3, strsplit(",", standing))
            local ep = select(4, strsplit(",", standing))
            local gp = select(5, strsplit(",", standing))
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
    if (CanEditOfficerNote()) then
        GoodEPGP:AddonMessage("standingsAvailable", player)
    end
end

-- Show EPGP standings
function GoodEPGP:ShowStandings()
    local AceGUI = LibStub("AceGUI-3.0")
    if (GoodEPGP.standingsFrame == nil) then
        GoodEPGP.standingsFrame = AceGUI:Create("Frame")
        GoodEPGP.standingsFrame:SetTitle("GoodEPGP")
        GoodEPGP.standingsFrame:SetStatusText("EPGP Standings")
        GoodEPGP.standingsFrame:SetLayout("Flow")
        GoodEPGP.standingsFrame:EnableResize(false)

        GoodEPGP.standingsScrollContainer = AceGUI:Create("SimpleGroup") -- "InlineGroup" is also good
        GoodEPGP.standingsScrollContainer:SetFullWidth(true)
        GoodEPGP.standingsScrollContainer:SetFullHeight(true) -- probably?
        GoodEPGP.standingsScrollContainer:SetLayout("Fill") -- important!
        
        GoodEPGP.standingsFrame:AddChild(GoodEPGP.standingsScrollContainer)
        
        GoodEPGP.standingsScrollFrame = AceGUI:Create("ScrollFrame")
        GoodEPGP.standingsScrollFrame:SetLayout("Flow") -- probably?
        GoodEPGP.standingsScrollContainer:AddChild(GoodEPGP.standingsScrollFrame)
    end
    GoodEPGP.standingsScrollFrame:ReleaseChildren()

    local headers = {
        {["label"] = "Player", ["width"] = 200, ["sortColumn"] = "name"},
        {["label"] = "Class", ["width"] = 150, ["sortColumn"] = "class"},
        {["label"] = "EP", ["width"] = 80, ["sortColumn"] = "ep"},
        {["label"] = "GP", ["width"] = 80, ["sortColumn"] = "gp"},
        {["label"] = "Priority", ["width"] = 80, ["sortColumn"] = "pr"},
    }

    GoodEPGP:AddHeaderLine(headers, GoodEPGP.standingsScrollFrame)

    for key, player in pairs(GoodEPGPCachedStandings) do
        GoodEPGP:AddStandingLine(player, GoodEPGP.standingsScrollFrame)
    end
end

-- Display header line
function GoodEPGP:AddHeaderLine(headers, frame)
    local AceGUI = LibStub("AceGUI-3.0")

    for key, values in pairs(headers) do
        local headerLabel = AceGUI:Create("InteractiveLabel")
        headerLabel:SetText(values.label)
        headerLabel:SetWidth(values.width)
        headerLabel:SetColor(1, 1, 200)
        headerLabel:SetCallback("OnClick", function() 
            GoodEPGP:StandingsSort(values.sortColumn)
        end)
        frame:AddChild(headerLabel)
    end
end

-- Sort the EPGP standings tablez
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
function GoodEPGP:AddStandingLine(player, frame)
    local AceGUI = LibStub("AceGUI-3.0")

    local fields = {
        {["field"] = "name", ["width"] = 200},
        {["field"] = "class", ["width"] = 150},
        {["field"] = "ep", ["width"] = 80},
        {["field"] = "gp", ["width"] = 80},
        {["field"] = "pr", ["width"] = 80},
    }

    for key, field in pairs(fields) do
        local label = AceGUI:Create("Label")
        label:SetText(player[field.field])
        label:SetWidth(field.width)
        frame:AddChild(label)
    end
end

-- Broadcast standings
function GoodEPGP:SendStandings(requestor)
    GoodEPGP:Debug("Broadcasting standings to " .. requestor)
    local standings = {}
    for i = 1, GetNumGuildMembers() do
        local name = GetGuildRosterInfo(i)
        name = select(1, strsplit("-", name))
        local member = GoodEPGP:GetGuildMemberByName(name)
        table.insert(standings, member)
    end
    
    local broadcast = ""
    for key, player in pairs(standings) do
        if (tonumber(player.ep) > 0) then
            broadcast = broadcast .. player.name .. "," .. player.class .. "," .. player.spec .. "," .. player.ep .. "," .. player.gp .. ";"
            if (string.len(broadcast) > 200) then
                GoodEPGP:AddonMessage("S:" .. broadcast, requestor)
                broadcast = ""
            end
        end
    end
    if (broadcast ~= "") then
        GoodEPGP:AddonMessage("S:" .. broadcast, requestor)
    end
    GoodEPGP:AddonMessage("standingsBroadcastComplete", requestor)
end

-- Broadcast item award to all players with the add-on
function GoodEPGP:BroadcastAward(player, item, price)
    GoodEPGP:AddonMessage("Award:" .. player .. ":" .. item .. ":" .. price)
end

-- Show standings by class, with a minimum priority (1 by default)
function GoodEPGP:ShowStandingsByClass(class, minimumPrio, type, playerName)
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
