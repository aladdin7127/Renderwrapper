local Library = {}
Library.__index = Library
local Tabs = {}
Tabs.__index = Tabs

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

    return Tabs.new(Tab)
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

function Tabs.new(Tab)
    return setmetatable({Tab = Tab}, Tabs)
end

function Tabs:CheckBox(Settings:table, Callback)
    local CheckBox = self.Tab:CheckBox()
    CheckBox.Label = Settings.Label or "CheckBox"
    CheckBox.Value = Settings.Default or false
    CheckBox.OnUpdated:Connect(Callback or function() end)

    return CheckBox
end

function Tabs:Label(Text:string)
    return self.Tab:Label(Text)
end

function Tabs:IntSlider(Settings:table, Callback)
    local Slider = self.Tab:IntSlider()
    Slider.Label = Settings.Label or "IntSlider"
    Slider.Max = Settings.Max or 1
    Slider.Min = Settings.Min or 0
    Slider.Clamped = Settings.Clamped or true
    Slider.OnUpdated:Connect(Callback or function() end)

    return Slider
end

function Tabs:Slider(Settings:table, Callback)
    local Slider = self.Tab:Slider()
    Slider.Label = Settings.Label or "Slider"
    Slider.Max = Settings.Max or 1
    Slider.Min = Settings.Min or 0
    Slider.Clamped = Settings.Clamped or true
    Slider.OnUpdated:Connect(Callback or function() end)

    return Slider
end

function Tabs:Button(Settings:table, Callback)
    local Button = self.Tab:Button()
    Button.Label = Settings.Label or "Button"
    Button.Size = Settings.Size or Button.Size
    Button.OnUpdated:Connect(Callback or function() end)

    return Button
end

function Tabs:ColorButton(Settings:table, Callback)
    local Button = self.Tab:ColorButton()
    Button.Description = Settings.Description or Button.Description
    Button.Size = Settings.Size or Button.Size
    Button.Color = Settings.Color or Color3.new(1,1,1)
    Button.Alpha = Settings.Alpha or 1
    Button.OnUpdated:Connect(Callback or function() end)

    return Button
end

function Tabs:ColorPicker(Settings:table, Callback)
    local ColorPicker = self.Tab:ColorPicker()
    ColorPicker.Label = Settings.Label or "ColorPicker"
    ColorPicker.Color = Settings.Color or Color3.new(1,1,1)
    ColorPicker.Alpha = Settings.Alpha or 1
    ColorPicker.UseAlpha = Settings.UseAlpha or false
    ColorPicker.ReturnInt = Settings.ReturnInt or true
    ColorPicker.OnUpdated:Connect(Callback or function() end)

    return ColorPicker
end

function Tabs:Combo(Settings:table, Callback)
    local Combo = self.Tab:Combo()
    Combo.Label = Settings.Label or "Combo"
    Combo.Items = Settings.Items or {}
    Combo.SelectedItem = Settings.SelectedItem or 1
    Combo.OnUpdated:Connect(Callback or function() end)

    return Combo
end

function Tabs:IntDrag(Settings:table, Callback)
    local Drag = self.Tab:IntDrag()
    Drag.Label = Settings.Label or "IntDrag"
    Drag.Speed = Settings.Speed or 1
    Drag.Min = Settings.Min or 0
    Drag.Max = Settings.Max or 1
    Drag.Clamped = Settings.Clamped or true
    Drag.OnUpdated:Connect(Callback or function() end)

    return Drag
end

function Tabs:Drag(Settings:table, Callback)
    local Drag = self.Tab:Drag()
    Drag.Label = Settings.Label or "Drag"
    Drag.Speed = Settings.Speed or 1
    Drag.Min = Settings.Min or 0
    Drag.Max = Settings.Max or 1
    Drag.Clamped = Settings.Clamped or true
    Drag.OnUpdated:Connect(Callback or function() end)

    return Drag
end

function Tabs:TextBox(Settings:table, Callback)
    local TextBox = self.Tab:TextBox()
    TextBox.Label = Settings.Label or "Textbox"
    TextBox.MaxTextLength = Settings.MaxTextLength or 16384
    TextBox.Value = Settings.Value or TextBox.Value
    TextBox.OnUpdated:Connect(Callback or function() end)

    return TextBox
end

function Tabs:Selectable(Settings:table, Callback)
    local Selectable = self.Tab:Selectable()
    Selectable.Label = Settings.Label or "Selectable"
    Selectable.Size = Settings.Size or Selectable.Size
    Selectable.Value = Settings.Value or false
    Selectable.Toggles = Settings.Toggles or true
    Selectable.OnUpdated:Connect(Callback or function() end)

    return Selectable
end

return Library
