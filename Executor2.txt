-- Objects

local ScreenGui = Instance.new("ScreenGui")
local guiframe = Instance.new("Frame")
local topbar = Instance.new("Frame")
local filename = Instance.new("TextLabel")
local execute = Instance.new("TextButton")
local close = Instance.new("TextButton")
local clear = Instance.new("TextButton")
local scriptContainer = Instance.new("ScrollingFrame")
local script = Instance.new("TextBox")
local openframe = Instance.new("Frame")
local open = Instance.new("TextButton")

-- Properties

ScreenGui.Parent = game.CoreGui

-- Main GUI Frame
guiframe.Name = "guiframe"
guiframe.Parent = ScreenGui
guiframe.BackgroundColor3 = Color3.new(0.117647, 0.117647, 0.117647)
guiframe.BackgroundTransparency = 0.5
guiframe.BorderSizePixel = 0
guiframe.Position = UDim2.new(0.3, 0, 0.3, 0) -- Default position
guiframe.Size = UDim2.new(0, 247, 0, 160)
guiframe.Visible = false
guiframe.Active = true
guiframe.Draggable = true  -- Enable dragging for the main frame

-- Top bar for GUI
topbar.Name = "topbar"
topbar.Parent = guiframe
topbar.BackgroundColor3 = Color3.new(0, 0, 0)
topbar.BackgroundTransparency = 0.5
topbar.Size = UDim2.new(1, 0, 0, 20)

filename.Name = "filename"
filename.Parent = topbar
filename.BackgroundColor3 = Color3.new(1, 1, 1)
filename.BackgroundTransparency = 1
filename.Size = UDim2.new(0.8, 0, 1, 0)
filename.Font = Enum.Font.SourceSansBold
filename.Text = "Script Executor"
filename.TextColor3 = Color3.new(1, 0, 0)
filename.TextSize = 12
filename.TextXAlignment = Enum.TextXAlignment.Left

-- Close button in top-right corner
close.Name = "close"
close.Parent = topbar
close.BackgroundColor3 = Color3.new(1, 1, 1)
close.BackgroundTransparency = 1
close.Position = UDim2.new(1, -20, 0, 0) -- Top-right corner of GUI
close.Size = UDim2.new(0, 20, 0, 20)
close.Font = Enum.Font.SourceSansBold
close.Text = "X"
close.TextSize = 15

-- Execute button
execute.Name = "execute"
execute.Parent = guiframe
execute.BackgroundColor3 = Color3.new(0.0588235, 0.0588235, 0.0588235)
execute.BorderColor3 = Color3.new(0, 0, 0)
execute.Position = UDim2.new(0.1, 0, 0.75, 0)
execute.Size = UDim2.new(0, 67, 0, 20)
execute.Font = Enum.Font.SourceSansBold
execute.Text = "Execute"
execute.TextColor3 = Color3.new(1, 1, 1)
execute.TextSize = 15

-- Clear button
clear.Name = "clear"
clear.Parent = guiframe
clear.BackgroundColor3 = Color3.new(0.0588235, 0.0588235, 0.0588235)
clear.BorderColor3 = Color3.new(0, 0, 0)
clear.Position = UDim2.new(0.7, 0, 0.75, 0)
clear.Size = UDim2.new(0, 67, 0, 20)
clear.Font = Enum.Font.SourceSansBold
clear.Text = "Clear"
clear.TextColor3 = Color3.new(1, 1, 1)
clear.TextSize = 15

-- Script Container (Scrolling)
scriptContainer.Name = "scriptContainer"
scriptContainer.Parent = guiframe
scriptContainer.BackgroundColor3 = Color3.new(0.9, 0.9, 0.9)
scriptContainer.BackgroundTransparency = 0.5
scriptContainer.Position = UDim2.new(0.05, 0, 0.2, 0)
scriptContainer.Size = UDim2.new(0.9, 0, 0.5, 0)
scriptContainer.CanvasSize = UDim2.new(0, 0, 0, 100)
scriptContainer.ScrollBarThickness = 6
scriptContainer.ClipsDescendants = true

script.Name = "script"
script.Parent = scriptContainer
script.BackgroundColor3 = Color3.new(1, 1, 1)
script.BackgroundTransparency = 1
script.ClearTextOnFocus = false
script.MultiLine = true
script.TextWrapped = false
script.TextSize = 14
script.Text = "print(\"Works\")"
script.TextColor3 = Color3.new(0, 0, 0)
script.Size = UDim2.new(1, -10, 0, 1000)
script.TextXAlignment = Enum.TextXAlignment.Left
script.TextYAlignment = Enum.TextYAlignment.Top

-- Open Frame
openframe.Name = "openframe"
openframe.Parent = ScreenGui
openframe.BackgroundTransparency = 1
openframe.Position = UDim2.new(0.05, 0, 0.8, 0)
openframe.Size = UDim2.new(0, 50, 0, 50)

open.Name = "open"
open.Parent = openframe
open.BackgroundColor3 = Color3.new(0, 0, 0)
open.BackgroundTransparency = 0.5
open.Size = UDim2.new(1, 0, 0.5, 0)
open.Font = Enum.Font.SourceSansBold
open.Text = "Open"
open.TextColor3 = Color3.new(1, 0, 0)
open.TextSize = 12
open.Active = true
open.Draggable = true -- Enable dragging for the open button

-- Scripts

local guiOpened = false

-- Show GUI on first Open click
open.MouseButton1Click:Connect(function()
    if not guiOpened then
        guiframe.Position = UDim2.new(0, openframe.Position.X.Offset + openframe.Size.X.Offset + 10, 0, openframe.Position.Y.Offset)
        guiOpened = true
    end
    guiframe.Visible = true
end)

close.MouseButton1Click:Connect(function()
    guiframe.Visible = false
end)

clear.MouseButton1Click:Connect(function()
    script.Text = ""
end)

execute.MouseButton1Click:Connect(function()
    loadstring(script.Text)()
end)

-- Adjust CanvasSize based on text
script:GetPropertyChangedSignal("Text"):Connect(function()
    local textHeight = script.TextBounds.Y
    scriptContainer.CanvasSize = UDim2.new(0, 0, 0, textHeight + 10)
end)
