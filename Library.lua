-- rewrite 10/04/2023 (10th march 2023)

local Library = {}
local Objects = {}

Library.__index = Library
Objects.__index = Objects

local ThemesRepo = "https://raw.githubusercontent.com/aladdin7127/RenderStyles/main/ThemeManager/Themes/%s.lua"
local ThemeList = loadstring(syn.request({Method = "GET", Url = "https://raw.githubusercontent.com/aladdin7127/RenderStyles/main/ThemeManager/ThemeList.lua"}).Body)()

function Library.Create(WindowName:string, Properties:table)
    local Window = RenderWindow.new(WindowName or "Window");Window.VisibilityOverride = true
    Properties = Properties or {}

    for i,v in Properties do
        Window[i] = v
    end

    local TabMenu = Window:TabMenu()

    return setmetatable({
        Window = Window,
        TabMenu = TabMenu
    }, Library)
end

function Library:Tab(TabName:string)
    local Tab = self.TabMenu:Add(TabName)

    return Objects.NewTab(Tab)
end

function Library:SetColor(Option, Colour, Alpha)
    self.Window:SetColor(Option, Colour, Alpha)
end

function Library:SetStyle(Option, Value)
    self.Window:SetStyle(Option, Value)
end

function Library:ThemesTab(TabName:string)
    local Tab = self.TabMenu:Add(TabName)

    local ThemesCombo = Tab:Combo()
    ThemesCombo.Label = "Themes"
    ThemesCombo.Items = ThemeList
    ThemesCombo.OnUpdated:Connect(function(v)
        -- couldnt call the set theme function :(

        local Colours, Style  = loadstring(syn.request({Method = "GET", Url = string.format(ThemesRepo, ThemesCombo.Items[v])}).Body)();Style = Style or {};
        for i,v in Colours do
            self.Window:SetColor(RenderColorOption[i], v.Colour, v.Alpha)
        end
    
        for i,v in Style do
            self.Window:SetStyle(RenderStyleOption[i], v)
        end
    end)

    local Sameline = Tab:SameLine()

    return Objects.NewTab(Tab)
end

function Objects:SameLine()
    local SameLine = self.Tab:SameLine()

    return Objects.NewSameline(SameLine)
end

function Objects:Collapsable()
    local Collapsable = self.Tab:Collapsable()

    return Objects.NewCollapsable(Collapsable)
end

function Library:SetTheme(Name)
    local Colours, Style  = loadstring(syn.request({Method = "GET", Url = string.format(ThemesRepo, Name)}).Body)();Style = Style or {};
    for i,v in Colours do
        self.Window:SetColor(RenderColorOption[i], v.Colour, v.Alpha)
    end

    for i,v in Style do
        self.Window:SetStyle(RenderStyleOption[i], v)
    end
end

function Library:Toggle(value)
    if not self.Window then return end
    self.Window.Visible = value or not self.Window.Visible
end

function Library:Unload()
    self.Window:Clear()
    self.Window.Visible = false
    self.Window = nil
end

function Objects.NewTab(Tab)
    return setmetatable({Tab = Tab}, Objects)
end

function Objects.NewSameline(Sameline)
    return setmetatable({Sameline = Sameline}, Objects)
end

function Objects.NewCollapsable(Collapsable)
    return setmetatable({Collapsable = Collapsable}, Objects)
end

function Objects:CheckBox(Settings:table, Callback)
    local obj = self.Tab or self.Sameline or self.Collapsable

    local CheckBox = obj:CheckBox()
    for i,v in Settings do
        CheckBox[i] = v
    end
    CheckBox.OnUpdated:Connect(Callback or function() end)

    return CheckBox
end

function Objects:Label(Text:string)
    local obj = self.Tab or self.Sameline or self.Collapsable

    return obj:Label(Text)
end

function Objects:IntSlider(Settings:table, Callback)
    local obj = self.Tab or self.Sameline or self.Collapsable

    local Slider = obj:IntSlider()
    for i,v in Settings do
        Slider[i] = v
    end
    Slider.OnUpdated:Connect(Callback or function() end)

    return Slider
end

function Objects:Separator()
    local obj = self.Tab or self.Sameline or self.Collapsable

    return obj:Separator()
end

function Objects:Slider(Settings:table, Callback)
    local obj = self.Tab or self.Sameline or self.Collapsable

    local Slider = obj:Slider()
    for i,v in Settings do
        Slider[i] = v
    end
    Slider.OnUpdated:Connect(Callback or function() end)

    return Slider
end

function Objects:Button(Settings:table, Callback)
    local obj = self.Tab or self.Sameline or self.Collapsable

    local Button = obj:Button()
    for i,v in Settings do
        Button[i] = v
    end
    Button.OnUpdated:Connect(Callback or function() end)

    return Button
end

function Objects:ColorButton(Settings:table, Callback)
    local obj = self.Tab or self.Sameline or self.Collapsable

    local Button = obj:ColorButton()
    for i,v in Settings do
        Button[i] = v
    end
    Button.OnUpdated:Connect(Callback or function() end)

    return Button
end

function Objects:ColorPicker(Settings:table, Callback)
    local obj = self.Tab or self.Sameline or self.Collapsable

    local ColorPicker = obj:ColorPicker()
    for i,v in Settings do
        ColorPicker[i] = v
    end
    ColorPicker.OnUpdated:Connect(Callback or function() end)

    return ColorPicker
end

function Objects:Combo(Settings:table, Callback)
    local obj = self.Tab or self.Sameline or self.Collapsable

    local Combo = obj:Combo()
    for i,v in Settings do
        Combo[i] = v
    end
    Combo.OnUpdated:Connect(Callback or function() end)

    return Combo
end

function Objects:IntDrag(Settings:table, Callback)
    local obj = self.Tab or self.Sameline or self.Collapsable

    local Drag = obj:IntDrag()
    for i,v in Settings do
        Drag[i] = v
    end
    Drag.OnUpdated:Connect(Callback or function() end)

    return Drag
end

function Objects:Drag(Settings:table, Callback)
    local obj = self.Tab or self.Sameline or self.Collapsable

    local Drag = obj:Drag()
    for i,v in Settings do
        Drag[i] = v
    end
    Drag.OnUpdated:Connect(Callback or function() end)

    return Drag
end

function Objects:TextBox(Settings:table, Callback)
    local obj = self.Tab or self.Sameline or self.Collapsable

    local TextBox = obj:TextBox()
    for i,v in Settings do
        TextBox[i] = v
    end
    TextBox.OnUpdated:Connect(Callback or function() end)

    return TextBox
end

function Objects:Selectable(Settings:table, Callback)
    local obj = self.Tab or self.Sameline or self.Collapsable

    local Selectable = obj:Selectable()
    for i,v in Settings do
        Selectable[i] = v
    end
    Selectable.OnUpdated:Connect(Callback or function() end)

    return Selectable
end

return Library
