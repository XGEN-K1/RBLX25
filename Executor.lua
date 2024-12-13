-- Objects

local ScreenGui = Instance.new("ScreenGui")
local guiframe = Instance.new("Frame")
local topbar = Instance.new("Frame")
local filename = Instance.new("TextLabel")
local execute = Instance.new("TextButton")
local close = Instance.new("TextButton")
local clear = Instance.new("TextButton")
local script = Instance.new("TextBox")
local openframe = Instance.new("Frame")
local open = Instance.new("TextButton")

-- Properties

ScreenGui.Parent = game.CoreGui

guiframe.Name = "guiframe"
guiframe.Parent = ScreenGui
guiframe.Active = true
guiframe.BackgroundColor3 = Color3.new(0.117647, 0.117647, 0.117647)
guiframe.BorderSizePixel = 0
guiframe.Draggable = true
guiframe.Position = UDim2.new(0.502894282, 0, 0.0338921137, 0)
guiframe.Selectable = true
guiframe.Size = UDim2.new(0, 494, 0, 319)

topbar.Name = "topbar"
topbar.Parent = guiframe
topbar.BackgroundColor3 = Color3.new(0, 0, 0)
topbar.BorderSizePixel = 0
topbar.Position = UDim2.new(-0.00101214577, 0, 0, 0)
topbar.Size = UDim2.new(0, 494, 0, 38)

filename.Name = "filename"
filename.Parent = topbar
filename.BackgroundColor3 = Color3.new(1, 1, 1)
filename.BackgroundTransparency = 1
filename.BorderSizePixel = 0
filename.Position = UDim2.new(0.0241935477, 0, 0, 0)
filename.Size = UDim2.new(0, 200, 0, 38)
filename.Font = Enum.Font.SourceSansBold
filename.FontSize = Enum.FontSize.Size24
filename.Text = "Script Executor"
filename.TextColor3 = Color3.new(255, 0, 0)
filename.TextSize = 24
filename.TextStrokeColor3 = Color3.new(1, 1, 1)
filename.TextXAlignment = Enum.TextXAlignment.Left

execute.Name = "execute"
execute.Parent = guiframe
execute.BackgroundColor3 = Color3.new(0.0588235, 0.0588235, 0.0588235)
execute.BorderColor3 = Color3.new(0, 0, 0)
execute.BorderSizePixel = 4
execute.Position = UDim2.new(0.0910931155, 0, 0.813421905, 0)
execute.Size = UDim2.new(0, 134, 0, 40)
execute.Font = Enum.Font.SourceSansBold
execute.FontSize = Enum.FontSize.Size32
execute.Text = "Execute"
execute.TextColor3 = Color3.new(1, 1, 1)
execute.TextSize = 30

close.Name = "close"
close.Parent = guiframe
close.BackgroundColor3 = Color3.new(1, 1, 1)
close.BackgroundTransparency = 1
close.BorderSizePixel = 0
close.Position = UDim2.new(0.923076868, 0, 0, 0)
close.Size = UDim2.new(0, 38, 0, 38)
close.Font = Enum.Font.SourceSansBold
close.FontSize = Enum.FontSize.Size32
close.Text = "X"
close.TextSize = 30

clear.Name = "clear"
clear.Parent = guiframe
clear.BackgroundColor3 = Color3.new(0.0588235, 0.0588235, 0.0588235)
clear.BorderColor3 = Color3.new(0, 0, 0)
clear.BorderSizePixel = 4
clear.Position = UDim2.new(0.641700387, 0, 0.813421905, 0)
clear.Size = UDim2.new(0, 134, 0, 40)
clear.Font = Enum.Font.SourceSansBold
clear.FontSize = Enum.FontSize.Size32
clear.Text = "Clear"
clear.TextColor3 = Color3.new(1, 1, 1)
clear.TextSize = 30

script.Name = "script"
script.Parent = guiframe
script.BackgroundColor3 = Color3.new(0.686275, 0.686275, 0.686275)
script.Position = UDim2.new(0.0880566761, 0, 0.160612524, 0)
script.Size = UDim2.new(0, 407, 0, 189)
script.Font = Enum.Font.Fantasy
script.FontSize = Enum.FontSize.Size18
script.Text = "print(\"Works\")"
script.TextColor3 = Color3.new(0, 0, 0)
script.TextSize = 16
script.TextXAlignment = Enum.TextXAlignment.Left
script.TextYAlignment = Enum.TextYAlignment.Top

openframe.Name = "openframe"
openframe.Parent = ScreenGui
openframe.BackgroundColor3 = Color3.new(1, 1, 1)
openframe.BackgroundTransparency = 1
openframe.Position = UDim2.new(0.105540894, 0, 0.778873265, 0)
openframe.Size = UDim2.new(0, 100, 0, 100)

open.Name = "open"
open.Parent = openframe
open.BackgroundColor3 = Color3.new(0, 0, 0)
open.BorderSizePixel = 0
open.Draggable = true
open.Position = UDim2.new(-0.709999979, 0, 0.790000021, 0)
open.Size = UDim2.new(0, 99, 0, 50)
open.Font = Enum.Font.SourceSansBold
open.FontSize = Enum.FontSize.Size48
open.Text = "Executor"
open.TextColor3 = Color3.new(255, 0, 0)
open.TextSize = 20

open.MouseButton1Click:connect(function()
guiframe.Visible = true
end)

close.MouseButton1Click:connect(function()
guiframe.Visible = false
end)

clear.MouseButton1Click:connect(function()
script.Text = ""
end)

open.MouseButton1Click:connect(function()
guiframe.Visible = true
end)

execute.MouseButton1Click:connect(function()
loadstring(script.Text)()
end)
