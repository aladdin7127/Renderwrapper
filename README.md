# Documentation for retards

Getting Loadstring

```lua
local Library = loadstring(syn.request({Method = "GET", Url = "https://raw.githubusercontent.com/aladdin7127/Renderwrapper/main/Library.lua"}))()
```

Creating the Window

```lua
local Window = Library.Create("WindowName", {MinSize = Vector2.new(300,400)} --[[Any Renderwindow property]])
```

Creating Tabs

```lua
local Tab = Window:NewTab("TabName")
```

Creating Labels

```lua
Tab:Label("Label")
```

Creating CheckBoxes

```lua
Tab:CheckBox({Label = "CheckBox", Default = true}, function(v)
    print(v)
end)
```

Creating Sliders

```lua
Tab:IntSlider({Label = "IntSlider", Min = 0, Max = 100}, function(v)
    print(v)
end)

Tab:Slider({Label = "Slider", Min = 0, Max = 100}, function(v)
    print(v)
end)
```

Creating Buttons

```lua
Tab:Button({Label = "Button", Size = Vector2.new(100,25)}, function()
    print("Pressed")
end)
```

Creating Colour Buttons

```lua
Tab:ColorButton({Description = "Colourful button", Size = Vector2.new(25,25), Color = Color3.new(1,0,0)}, function()
    print("Pressed")
end)
```

Creating Colourpickers

```lua
Tab:ColorPicker({Label = "Colourpicker", Color = Color3.new(1,0,0), UseAlpha = true}, function(r,g,b,a)
    print(r,g,b,a)
end)
```

Creating Combos

```lua
local Combo
Combo = Tab:Combo({Label = "Combo", Items = {"item1", "item2", "item3",}}, function(i)
    print(i, Combo.Items[i]) -- i,v
end)
```

Creating Drags

```lua
Tab:IntDrag({Label = "IntDrag", Min = 0, Max = 100, Speed = 1}, function(v)
    print(v)
end)

Tab:Drag({Label = "Drag", Min = 0, Max = 100, Speed = 1}, function(v)
    print(v)
end)
```

Creating Textboxes

```lua
Tab:TextBox({Label = "TextBox", MaxTextLength = 21, Value = "Text"}, function(v)
    print(v)
end)
```

Creating Selectables

```lua
Tab:Selectable({Label = "Selectable", Size = Vector2.new(100,25), Value = false, Toggles = true}, function(v)
    print(v)
end)
```

Loading Themes

```lua
local ThemeList = loadstring(syn.request({Method = "GET", Url = "https://raw.githubusercontent.com/aladdin7127/RenderStyles/main/ThemeManager/ThemeList.lua"}).Body)()
Tab:Combo({Label = "Themes", Items = ThemeList}, function(v)
    Window:SetTheme(ThemeList[v])
end)
```
