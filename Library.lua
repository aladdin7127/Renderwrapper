-- ik source is terrible i will rewrite another time

local Library = {}
Library.__index = Library
local Tabs = {}
Tabs.__index = Tabs
local Samelines = {}
Samelines.__index = Samelines
local Collapsables = {}
Collapsables.__index = Collapsables

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

    return Tabs.new(Tab)
end

function Tabs:SameLine()
    local SameLine = self.Tab:SameLine()

    return Samelines.new(SameLine)
end

function Tabs:Collapsable()
    local Collapsable = self.Tab:Collapsable()

    return Collapsable.new(Collapsable)
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

function Tabs.new(Tab)
    return setmetatable({Tab = Tab}, Tabs)
end

function Samelines.new(Sameline)
    return setmetatable({Sameline = Sameline}, Samelines)
end

function Collapsable.new(Collapsable)
    return setmetatable({Collapsable = Collapsable}, Collapsables)
end

function Tabs:CheckBox(Settings:table, Callback)
    local CheckBox = self.Tab:CheckBox()
    for i,v in Settings do
        CheckBox[i] = v
    end
    CheckBox.OnUpdated:Connect(Callback or function() end)

    return CheckBox
end

function Tabs:Label(Text:string)
    return self.Tab:Label(Text)
end

function Tabs:IntSlider(Settings:table, Callback)
    local Slider = self.Tab:IntSlider()
    for i,v in Settings do
        Slider[i] = v
    end
    Slider.OnUpdated:Connect(Callback or function() end)

    return Slider
end

function Tabs:Separator()
    return self.Tab:Separator()
end

function Tabs:Slider(Settings:table, Callback)
    local Slider = self.Tab:Slider()
    for i,v in Settings do
        Slider[i] = v
    end
    Slider.OnUpdated:Connect(Callback or function() end)

    return Slider
end

function Tabs:Button(Settings:table, Callback)
    local Button = self.Tab:Button()
    for i,v in Settings do
        Button[i] = v
    end
    Button.OnUpdated:Connect(Callback or function() end)

    return Button
end

function Tabs:ColorButton(Settings:table, Callback)
    local Button = self.Tab:ColorButton()
    for i,v in Settings do
        Button[i] = v
    end
    Button.OnUpdated:Connect(Callback or function() end)

    return Button
end

function Tabs:ColorPicker(Settings:table, Callback)
    local ColorPicker = self.Tab:ColorPicker()
    for i,v in Settings do
        ColorPicker[i] = v
    end
    ColorPicker.OnUpdated:Connect(Callback or function() end)

    return ColorPicker
end

function Tabs:Combo(Settings:table, Callback)
    local Combo = self.Tab:Combo()
    for i,v in Settings do
        Combo[i] = v
    end
    Combo.OnUpdated:Connect(Callback or function() end)

    return Combo
end

function Tabs:IntDrag(Settings:table, Callback)
    local Drag = self.Tab:IntDrag()
    for i,v in Settings do
        Drag[i] = v
    end
    Drag.OnUpdated:Connect(Callback or function() end)

    return Drag
end

function Tabs:Drag(Settings:table, Callback)
    local Drag = self.Tab:Drag()
    for i,v in Settings do
        Drag[i] = v
    end
    Drag.OnUpdated:Connect(Callback or function() end)

    return Drag
end

function Tabs:TextBox(Settings:table, Callback)
    local TextBox = self.Tab:TextBox()
    for i,v in Settings do
        TextBox[i] = v
    end
    TextBox.OnUpdated:Connect(Callback or function() end)

    return TextBox
end

function Tabs:Selectable(Settings:table, Callback)
    local Selectable = self.Tab:Selectable()
    for i,v in Settings do
        Selectable[i] = v
    end
    Selectable.OnUpdated:Connect(Callback or function() end)

    return Selectable
end




function Samelines:CheckBox(Settings:table, Callback)
    local CheckBox = self.Sameline:CheckBox()
    for i,v in Settings do
        CheckBox[i] = v
    end
    CheckBox.OnUpdated:Connect(Callback or function() end)

    return CheckBox
end

function Samelines:Label(Text:string)
    return self.Sameline:Label(Text)
end

function Samelines:IntSlider(Settings:table, Callback)
    local Slider = self.Sameline:IntSlider()
    for i,v in Settings do
        Slider[i] = v
    end
    Slider.OnUpdated:Connect(Callback or function() end)

    return Slider
end

function Samelines:Separator()
    return self.Sameline:Separator()
end

function Samelines:Slider(Settings:table, Callback)
    local Slider = self.Sameline:Slider()
    for i,v in Settings do
        Slider[i] = v
    end
    Slider.OnUpdated:Connect(Callback or function() end)

    return Slider
end

function Samelines:Button(Settings:table, Callback)
    local Button = self.Sameline:Button()
    for i,v in Settings do
        Button[i] = v
    end
    Button.OnUpdated:Connect(Callback or function() end)

    return Button
end

function Samelines:ColorButton(Settings:table, Callback)
    local Button = self.Sameline:ColorButton()
    for i,v in Settings do
        Button[i] = v
    end
    Button.OnUpdated:Connect(Callback or function() end)

    return Button
end

function Samelines:ColorPicker(Settings:table, Callback)
    local ColorPicker = self.Sameline:ColorPicker()
    for i,v in Settings do
        ColorPicker[i] = v
    end
    ColorPicker.OnUpdated:Connect(Callback or function() end)

    return ColorPicker
end

function Samelines:Combo(Settings:table, Callback)
    local Combo = self.Sameline:Combo()
    for i,v in Settings do
        Combo[i] = v
    end
    Combo.OnUpdated:Connect(Callback or function() end)

    return Combo
end

function Samelines:IntDrag(Settings:table, Callback)
    local Drag = self.Sameline:IntDrag()
    for i,v in Settings do
        Drag[i] = v
    end
    Drag.OnUpdated:Connect(Callback or function() end)

    return Drag
end

function Samelines:Drag(Settings:table, Callback)
    local Drag = self.Sameline:Drag()
    for i,v in Settings do
        Drag[i] = v
    end
    Drag.OnUpdated:Connect(Callback or function() end)

    return Drag
end

function Samelines:TextBox(Settings:table, Callback)
    local TextBox = self.Sameline:TextBox()
    for i,v in Settings do
        TextBox[i] = v
    end
    TextBox.OnUpdated:Connect(Callback or function() end)

    return TextBox
end

function Samelines:Selectable(Settings:table, Callback)
    local Selectable = self.Sameline:Selectable()
    for i,v in Settings do
        Selectable[i] = v
    end
    Selectable.OnUpdated:Connect(Callback or function() end)

    return Selectable
end




function Collapsables:CheckBox(Settings:table, Callback)
    local CheckBox = self.Collapsable:CheckBox()
    for i,v in Settings do
        CheckBox[i] = v
    end
    CheckBox.OnUpdated:Connect(Callback or function() end)

    return CheckBox
end

function Collapsables:Label(Text:string)
    return self.Collapsable:Label(Text)
end

function Collapsables:IntSlider(Settings:table, Callback)
    local Slider = self.Collapsable:IntSlider()
    for i,v in Settings do
        Slider[i] = v
    end
    Slider.OnUpdated:Connect(Callback or function() end)

    return Slider
end

function Collapsables:Separator()
    return self.Collapsable:Separator()
end

function Collapsables:Slider(Settings:table, Callback)
    local Slider = self.Collapsable:Slider()
    for i,v in Settings do
        Slider[i] = v
    end
    Slider.OnUpdated:Connect(Callback or function() end)

    return Slider
end

function Collapsables:Button(Settings:table, Callback)
    local Button = self.Collapsable:Button()
    for i,v in Settings do
        Button[i] = v
    end
    Button.OnUpdated:Connect(Callback or function() end)

    return Button
end

function Collapsables:ColorButton(Settings:table, Callback)
    local Button = self.Collapsable:ColorButton()
    for i,v in Settings do
        Button[i] = v
    end
    Button.OnUpdated:Connect(Callback or function() end)

    return Button
end

function Collapsables:ColorPicker(Settings:table, Callback)
    local ColorPicker = self.Collapsable:ColorPicker()
    for i,v in Settings do
        ColorPicker[i] = v
    end
    ColorPicker.OnUpdated:Connect(Callback or function() end)

    return ColorPicker
end

function Collapsables:Combo(Settings:table, Callback)
    local Combo = self.Collapsable:Combo()
    for i,v in Settings do
        Combo[i] = v
    end
    Combo.OnUpdated:Connect(Callback or function() end)

    return Combo
end

function Collapsables:IntDrag(Settings:table, Callback)
    local Drag = self.Collapsable:IntDrag()
    for i,v in Settings do
        Drag[i] = v
    end
    Drag.OnUpdated:Connect(Callback or function() end)

    return Drag
end

function Collapsables:Drag(Settings:table, Callback)
    local Drag = self.Collapsable:Drag()
    for i,v in Settings do
        Drag[i] = v
    end
    Drag.OnUpdated:Connect(Callback or function() end)

    return Drag
end

function Collapsables:TextBox(Settings:table, Callback)
    local TextBox = self.Collapsable:TextBox()
    for i,v in Settings do
        TextBox[i] = v
    end
    TextBox.OnUpdated:Connect(Callback or function() end)

    return TextBox
end

function Collapsables:Selectable(Settings:table, Callback)
    local Selectable = self.Collapsable:Selectable()
    for i,v in Settings do
        Selectable[i] = v
    end
    Selectable.OnUpdated:Connect(Callback or function() end)

    return Selectable
end

return Library
