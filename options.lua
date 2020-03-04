local AceGUI = LibStub("AceGUI-3.0")

-- Attempt to create our options frame
function GoodEPGP:createOptionsFrame() 
    -- Don't create it if it already exists
    if (GoodEPGP.optionsFrame ~= nil) then
        return
    end

    -- Create the parent frame
    GoodEPGP.optionsFrame = AceGUI:Create("Frame")
    GoodEPGP.optionsFrame:SetTitle("GoodEPGP Options")
    GoodEPGP.optionsFrame:SetStatusText("Configure your GoodEPGP")
    GoodEPGP.optionsFrame:SetLayout("List")

    -- Loop through our config options we'd like to display
    for key, value in pairs(GoodEPGP.configOptions) do
        local configWidget = AceGUI:Create(value.type)
        if (value.label ~= nil) then
            configWidget:SetLabel(value.label)
        end
        if (value.description ~= nil) then
            configWidget:SetDescription(value.description)
        end
        if (value.text ~= nil) then
            configWidget:SetText(value.text)
        end
        configWidget:SetFullWidth(true)

        -- Set our initial values by type, and callback
        if (value.type == "EditBox") then
            configWidget:SetText(GoodEPGP.config[value.key])
            configWidget:SetCallback("OnEnterPressed", function(widget)
                GoodEPGP.config[value.key] = widget:GetText()
                GoodEPGPConfig = GoodEPGP.config
            end)
        end
        if (value.type == "CheckBox") then
            configWidget:SetValue(GoodEPGP.config[value.key])
            configWidget:SetCallback("OnValueChanged", function(widget)
                GoodEPGP.config[value.key] = widget:GetValue()
                GoodEPGPConfig = GoodEPGP.config
            end)
        end

        -- Add the widget to our otpions frame
        GoodEPGP.optionsFrame:AddChild(configWidget)
    end

    -- Hide our frame by default
    GoodEPGP.optionsFrame:Hide()
    
end

-- Show our options menu
function GoodEPGP:toggleOptionsFrame()
    if (GoodEPGP.optionsFrame:IsVisible()) then
        GoodEPGP.optionsFrame:Hide()
    else
        GoodEPGP.optionsFrame:Show()
    end
end
