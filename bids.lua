local AceGUI = LibStub("AceGUI-3.0")

-- Event function that fires when a loot button is clicked within the loot box
function GoodEPGP:LootClick(button, data, key)
    -- If it's just currency, or the slot is empty, just return.
    local item = GetLootSlotLink(key)
    if (item == nil) then
        return
    end

    -- Set our object vars to remember what's being currently looted.
    local itemName = select(1, GetItemInfo(item))
    local itemLink = select(2, GetItemInfo(item))
    local itemQuality = select(3, GetItemInfo(item))
    local itemID = select(2, strsplit(":", itemLink, 3))
    GoodEPGP.activeItemIndex = key
    GoodEPGP.activeItem = item

    -- You can only ML stuff that's uncommon +
    if (itemQuality <= 1) then
        return
    end

    -- If the alt key is being run down, run a EPGP  bid
    if (IsAltKeyDown()) then
        -- Alt + Left Click
        if (data == "LeftButton") then
            GoodEPGP:StartBid(itemID)
            return
        end
    end

    -- Don't allow random roll / loot to self if quality >= 5 (Epic)
    if (itemQuality >= 5) then
        return
    end

    -- Check if ctrl key is being held down
    -- if (IsControlKeyDown()) then
    --     -- Ctrl + Left Click
    --     if (data == "LeftButton") then
    --         GoodEPGP:LootToSelf()
    --         return
    --     end
    -- end
end

-- Start a bid for the current item
function GoodEPGP:StartBid(itemID)
    local price = GoodEPGP:GetPrice(itemID)
    local offspecPrice = math.floor(price * .25)
    GoodEPGP.activePrice = price
    GoodEPGP.activeOffspecPrice = offspecPrice
    GoodEPGP.activeBid = true
    GoodEPGP.bids = {}

    GoodEPGP:WidestAudience("Whisper me + for main spec, - for off spec to bid on " .. GoodEPGP.activeItem .. ". (MS Cost: " .. price .. " GP, OS Cost: " .. offspecPrice .. " GP)")
    GoodEPGP:UpdateBidFrame()
end

-- Main/Off Spec Chat Filter
local function ChatFilterBids(chatFrame, event, msg, masterLooter, ...)
	if msg then
		if msg:find("Whisper me %+ for main spec%, %- for off spec to bid on ") then
			--local masterLooter = select(1, strsplit("-", sender))
			local MAIN = GoodEPGP:BidLink("228B22", masterLooter, "ms", "MAIN")
			local OFF = GoodEPGP:BidLink("8b0000", masterLooter, "os", "OFF")
			return false, string.gsub(msg, "Whisper me %+ for main spec%, %- for off spec to bid on ", "Click "..MAIN.." to bid main spec or, click "..OFF.." to bid off spec on "), masterLooter, ...
		end
	end
end

ChatFrame_AddMessageEventFilter("CHAT_MSG_RAID_WARNING", ChatFilterBids)

-- HyperLink Bid Builder
function GoodEPGP:BidLink(linkColor, masterLooter, bidType, linkLabel)
	local mlGUID = GoodEPGP:PlayerGUID(masterLooter)
	return "|Hgoodbid:2020:"..mlGUID..":"..bidType.."|h|cff"..linkColor.."["..linkLabel.."]|r|h"
end


-- Confirm the item should be looted to player
function GoodEPGP:ConfirmAwardItem(playerName, type)
    -- Hide our bid frame when awarding
    GoodEPGP:HideBidFrame()

    local confirmString = "Are you sure you want to loot this item to " .. playerName .. " as " .. type .. "?"
    GoodEPGP:ConfirmAction(confirmString, function()
        GoodEPGP:AwardItem(playerName, type)
    end,
    function()
        GoodEPGP:UpdateBidFrame()
    end)
end

-- Award the current item up for bids to player by namne.  priceType = (ms|os)
function GoodEPGP:AwardItem(playerName, priceType)
    -- Format player's name
    playerName = GoodEPGP:UCFirst(playerName)

    -- Retrive player's candidate index by name
    if (GoodEPGP.activeItemIndex ~= 'bag') then
        GoodEPGP:MasterLootByName(playerName)
    end

    -- Award main spec or offspec GP
    local chargedPrice = GoodEPGP:ChargeForItem(playerName, GoodEPGP.activeItem, priceType)

    -- Notify other players using add-on
    GoodEPGP:BroadcastAward(playerName, GoodEPGP.activeItem, chargedPrice)
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

function GoodEPGP:CreateBidFrame()
    GoodEPGP.bidFrame = AceGUI:Create("Frame")
    GoodEPGP.bidFrame:SetTitle("GoodEPGP")
    GoodEPGP.bidFrame:SetStatusText("Current bids for " .. GoodEPGP.activeItem)
    GoodEPGP.bidFrame:SetCallback("OnClose", function(widget)
        AceGUI:Release(widget)
        GoodEPGP.bidFrame = nil
    end)
    GoodEPGP.bidFrame:SetLayout("Flow")
end

function GoodEPGP:HideBidFrame()
    if (GoodEPGP.bidFrame == nil) then
        return
    end
    AceGUI:Release(GoodEPGP.bidFrame)
    GoodEPGP.bidFrame = nil
end

function GoodEPGP:UpdateBidFrame()

    -- Sort by prio
    table.sort(GoodEPGP.bids, function(a, b)
        return a.pr > b.pr
    end)

    -- Create or reset bid frame
    if (GoodEPGP.bidFrame ~= nil) then
        AceGUI:Release(GoodEPGP.bidFrame)
    end
    GoodEPGP:CreateBidFrame()

    -- Add title
    GoodEPGP:AddBidFrameTitle("Main Spec")

    -- Add Header
    GoodEPGP:AddBidFrameHeader()

    -- Main Spec
    for i=1, #GoodEPGP.bids do
        local bid = GoodEPGP.bids[i]
        if (bid.type == "+") then
            GoodEPGP:AddBidLine(bid, "ms")
        end
    end

    -- Add spacer
    GoodEPGP:AddBidFrameTitle(" ")

    -- Add title
    GoodEPGP:AddBidFrameTitle("Off Spec")

    -- Add Header
    GoodEPGP:AddBidFrameHeader()

    -- Off Spec
    for i=1, #GoodEPGP.bids do
        local bid = GoodEPGP.bids[i]
        if (bid.type == "-") then
           GoodEPGP:AddBidLine(bid, "os")
        end
    end
end

function GoodEPGP:AddBidFrameTitle(title)
    local titleLabel = AceGUI:Create("Label")
    titleLabel:SetText(title)
    titleLabel:SetFullWidth(true)
    titleLabel:SetJustifyH("Left")
    titleLabel:SetFont("Fonts\\FRIZQT__.TTF", 14)
    GoodEPGP.bidFrame:AddChild(titleLabel)
end

function GoodEPGP:AddBidFrameHeader()

    -- Our table of header data (width, label)
    local headers = {
        {200, "Player"},
        {150, "Level/Class"},
        {50, "EP"},
        {50, "GP"},
        {50, "Prio"},
        {150, ""}
    }

    -- Generate header labels
    for key, value in pairs(headers) do
        local headerLabel = AceGUI:Create("Label")
        headerLabel:SetText(value[2])
        headerLabel:SetWidth(value[1])
        GoodEPGP.bidFrame:AddChild(headerLabel)
    end
end


function GoodEPGP:AddBidLine(bid, bidType)

    local assignButton = AceGUI:Create("Button")
    assignButton:SetText("Assign")
    assignButton:SetWidth(100)
    assignButton:SetCallback("OnClick", function()
        GoodEPGP:ConfirmAwardItem(bid.name, bidType)
    end)

    local spacerLabel = AceGUI:Create("Label")
    spacerLabel:SetText(" ")
    spacerLabel:SetWidth(50)

    local playerLabel = AceGUI:Create("Label")
    playerLabel:SetText(bid.name)
    playerLabel:SetWidth(200)

    local classLabel = AceGUI:Create("Label")
    classLabel:SetText(bid.spec .. " " .. bid.class)
    classLabel:SetWidth(150)

    local epLabel = AceGUI:Create("Label")
    epLabel:SetText(bid.ep)
    epLabel:SetWidth(50)

    local gpLabel = AceGUI:Create("Label")
    gpLabel:SetText(bid.gp)
    gpLabel:SetWidth(50)

    local prioLabel = AceGUI:Create("Label")
    prioLabel:SetText(bid.pr)
    prioLabel:SetWidth(100)

    GoodEPGP.bidFrame:AddChild(playerLabel)
    GoodEPGP.bidFrame:AddChild(classLabel)
    GoodEPGP.bidFrame:AddChild(epLabel)
    GoodEPGP.bidFrame:AddChild(gpLabel)
    GoodEPGP.bidFrame:AddChild(prioLabel)
    GoodEPGP.bidFrame:AddChild(assignButton)
end
