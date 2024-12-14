-- [ Instances ]
local TGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local TitleLabel = Instance.new("TextLabel")
local CloseMainButton = Instance.new("TextButton")
local MinimizeButton = Instance.new("TextButton")
local ScrollFrame = Instance.new("ScrollingFrame")
local TargetGUIButton = Instance.new("TextButton")
local OpenSettingsButton = Instance.new("TextButton")
local SettingsFrame = Instance.new("Frame")
local TargetGUIFrame = Instance.new("Frame")
local CloseSettingsButton = Instance.new("TextButton")
local CloseTargetGUIButton = Instance.new("TextButton")
local SettingsTitle = Instance.new("TextLabel")
local TargetGUITitle = Instance.new("TextLabel")
local TestSettingsButton = Instance.new("TextButton")
local TestTargetGUIButton = Instance.new("TextButton")


-- [ ScreenGui Properties ]
TGui.Name = "TGui"
TGui.Parent = game.CoreGui

-- [ MainFrame Properties ]
MainFrame.Name = "MainFrame"
MainFrame.Parent = TGui
MainFrame.Size = UDim2.new(0, 400, 0, 300)
MainFrame.Position = UDim2.new(0.5, -200, 0.5, -150)
MainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
MainFrame.BackgroundTransparency = 0.1
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true

-- [ TitleLabel Properties ]
TitleLabel.Name = "TitleLabel"
TitleLabel.Parent = MainFrame
TitleLabel.Size = UDim2.new(1, -50, 0, 40)
TitleLabel.Position = UDim2.new(0, 10, 0, 0)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = "Gui"
TitleLabel.Font = Enum.Font.SourceSans
TitleLabel.TextSize = 28
TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left

-- [ CloseMainButton Properties ]
CloseMainButton.Name = "CloseMainButton"
CloseMainButton.Parent = MainFrame
CloseMainButton.Size = UDim2.new(0, 35, 0, 35)
CloseMainButton.Position = UDim2.new(1, -40, 0, 5)
CloseMainButton.BackgroundColor3 = Color3.fromRGB(169, 169, 169)
CloseMainButton.BackgroundTransparency = 0.9
CloseMainButton.Text = "❌"
CloseMainButton.Font = Enum.Font.SourceSans
CloseMainButton.TextSize = 24
CloseMainButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseMainButton.BorderSizePixel = 0

CloseMainButton.MouseButton1Click:Connect(function()
    TGui:Destroy()
end)

-- [ MinimizeButton Properties ]
MinimizeButton.Name = "MinimizeButton"
MinimizeButton.Parent = MainFrame
MinimizeButton.Size = UDim2.new(0, 35, 0, 35)
MinimizeButton.Position = UDim2.new(1, -80, 0, 5)
MinimizeButton.BackgroundColor3 = Color3.fromRGB(169, 169, 169)
MinimizeButton.BackgroundTransparency = 0.9
MinimizeButton.Text = "➖"
MinimizeButton.Font = Enum.Font.SourceSans
MinimizeButton.TextSize = 24
MinimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
MinimizeButton.BorderSizePixel = 0

-- [ ScrollFrame Properties ]
ScrollFrame.Name = "ScrollFrame"
ScrollFrame.Parent = MainFrame
ScrollFrame.Size = UDim2.new(1, -20, 1, -60)
ScrollFrame.Position = UDim2.new(0, 10, 0, 50)
ScrollFrame.CanvasSize = UDim2.new(0, 0, 0, 500) -- Adjust this based on content height
ScrollFrame.ScrollBarThickness = 10
ScrollFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
ScrollFrame.BackgroundTransparency = 0.9
ScrollFrame.BorderSizePixel = 0
ScrollFrame.ScrollBarImageColor3 = Color3.fromRGB(169, 169, 169)


-- [ TargetGUIButton Properties ]
TargetGUIButton.Name = "TargetGUIButton"
TargetGUIButton.Parent = ScrollFrame
TargetGUIButton.Size = UDim2.new(0, 150, 0, 50)
TargetGUIButton.Position = UDim2.new(0, 10, 0, 10)
TargetGUIButton.BackgroundColor3 = Color3.fromRGB(169, 169, 169)
TargetGUIButton.BackgroundTransparency = 0.9
TargetGUIButton.Text = "TargetGUI"
TargetGUIButton.Font = Enum.Font.SourceSans
TargetGUIButton.TextSize = 24
TargetGUIButton.TextColor3 = Color3.fromRGB(255, 255, 255)
TargetGUIButton.BorderSizePixel = 0

TargetGUIButton.MouseButton1Click:Connect(function()
    -- Show the TargetGUIFrame right next to the MainFrame (right of it)
    TargetGUIFrame.Visible = true
    TargetGUIFrame.Position = MainFrame.Position + UDim2.new(0, MainFrame.Size.X.Offset + 10, 0, 0) -- Attach to the right of the MainFrame
end)


-- [ OpenSettingsButton Properties ]
OpenSettingsButton.Name = "OpenSettingsButton"
OpenSettingsButton.Parent = ScrollFrame
OpenSettingsButton.Size = UDim2.new(0, 150, 0, 50)
OpenSettingsButton.Position = UDim2.new(0, 10, 0, 70)
OpenSettingsButton.BackgroundColor3 = Color3.fromRGB(169, 169, 169)
OpenSettingsButton.BackgroundTransparency = 0.9
OpenSettingsButton.Text = "Open Settings"
OpenSettingsButton.Font = Enum.Font.SourceSans
OpenSettingsButton.TextSize = 24
OpenSettingsButton.TextColor3 = Color3.fromRGB(255, 255, 255)
OpenSettingsButton.BorderSizePixel = 0

OpenSettingsButton.MouseButton1Click:Connect(function()
    -- Show the SettingsFrame right next to the MainFrame (right of it)
    SettingsFrame.Visible = true
    SettingsFrame.Position = MainFrame.Position + UDim2.new(0, MainFrame.Size.X.Offset + 10, 0, 0) -- Attach to the right of the MainFrame
end)

-- [ SettingsFrame Properties ]
SettingsFrame.Name = "SettingsFrame"
SettingsFrame.Parent = MainFrame
SettingsFrame.Size = UDim2.new(0, 400, 0, 300)  -- Same size as MainFrame
SettingsFrame.Position = UDim2.new(0, MainFrame.Size.X.Offset + 10, 0, 0)  -- Initially hidden to the right of MainFrame
SettingsFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
SettingsFrame.BackgroundTransparency = 0.1
SettingsFrame.Visible = false
SettingsFrame.BorderSizePixel = 0
SettingsFrame.Active = true
SettingsFrame.Draggable = true  -- Make the SettingsFrame draggable as well

-- [ SettingsTitle Properties ]
SettingsTitle.Name = "SettingsTitle"
SettingsTitle.Parent = SettingsFrame
SettingsTitle.Size = UDim2.new(1, 0, 0, 40)
SettingsTitle.Position = UDim2.new(0, 10, 0, 0)
SettingsTitle.BackgroundTransparency = 1
SettingsTitle.Text = "Settings"
SettingsTitle.Font = Enum.Font.SourceSans
SettingsTitle.TextSize = 28
SettingsTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
SettingsTitle.TextXAlignment = Enum.TextXAlignment.Left

-- [ New Scrolling Frame inside SettingsFrame ]
local NewScrollFrame = Instance.new("ScrollingFrame")
NewScrollFrame.Name = "NewScrollFrame"
NewScrollFrame.Parent = SettingsFrame
NewScrollFrame.Size = UDim2.new(1, -20, 1, -80) -- Adjust size within SettingsFrame
NewScrollFrame.Position = UDim2.new(0, 10, 0, 60) -- Position under existing buttons
NewScrollFrame.CanvasSize = UDim2.new(0, 0, 0, 500) -- Adjust canvas size to fit content
NewScrollFrame.ScrollBarThickness = 10
NewScrollFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
NewScrollFrame.BackgroundTransparency = 0.9
NewScrollFrame.BorderSizePixel = 0
NewScrollFrame.ScrollBarImageColor3 = Color3.fromRGB(169, 169, 169)

-- [ New Button (t1) inside NewScrollFrame ]
local t1Button = Instance.new("TextButton")
t1Button.Name = "t1Button"
t1Button.Parent = NewScrollFrame
t1Button.Size = UDim2.new(0, 150, 0, 50)
t1Button.Position = UDim2.new(0, 10, 0, 10)
t1Button.BackgroundColor3 = Color3.fromRGB(169, 169, 169)
t1Button.BackgroundTransparency = 0.9
t1Button.Text = "t1 Button"
t1Button.Font = Enum.Font.SourceSans
t1Button.TextSize = 24
t1Button.TextColor3 = Color3.fromRGB(255, 255, 255)
t1Button.BorderSizePixel = 0

t1Button.MouseButton1Click:Connect(function()
    print("t1 button clicked!")
end)


-- [ TestSettingsButton Properties ]
--[[ 
TestSettingsButton.Name = "TestSettingsButton"
TestSettingsButton.Parent = SettingsFrame
TestSettingsButton.Size = UDim2.new(0, 150, 0, 50)
TestSettingsButton.Position = UDim2.new(0, 10, 0, 60)
TestSettingsButton.BackgroundColor3 = Color3.fromRGB(169, 169, 169)
TestSettingsButton.BackgroundTransparency = 0.1
TestSettingsButton.Text = "Test Settings"
TestSettingsButton.Font = Enum.Font.SourceSans
TestSettingsButton.TextSize = 24
TestSettingsButton.TextColor3 = Color3.fromRGB(255, 255, 255)
TestSettingsButton.BorderSizePixel = 0

TestSettingsButton.MouseButton1Click:Connect(function()
    print("Test Settings button clicked!")
end)
]]
-- [ CloseSettingsButton Properties ]
CloseSettingsButton.Name = "CloseSettingsButton"
CloseSettingsButton.Parent = SettingsFrame
CloseSettingsButton.Size = UDim2.new(0, 35, 0, 35)
CloseSettingsButton.Position = UDim2.new(1, -40, 0, 5)
CloseSettingsButton.BackgroundColor3 = Color3.fromRGB(169, 169, 169)
CloseSettingsButton.BackgroundTransparency = 0.9
CloseSettingsButton.Text = "❌"
CloseSettingsButton.Font = Enum.Font.SourceSans
CloseSettingsButton.TextSize = 24
CloseSettingsButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseSettingsButton.BorderSizePixel = 0

CloseSettingsButton.MouseButton1Click:Connect(function()
    -- Hide the SettingsFrame
    SettingsFrame.Visible = false
end)

-- [ Dragging Logic for Settings and Main Menu Together ]
local dragging = false
local dragStart = Vector2.new()
local startPosMain = Vector2.new()
local startPosSettings = Vector2.new()

-- Detect dragging when clicking on the Settings frame
SettingsFrame.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPosMain = MainFrame.Position
        startPosSettings = SettingsFrame.Position
    end
end)

SettingsFrame.InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Position - dragStart
        local newPosMain = UDim2.new(0, startPosMain.X + delta.X, 0, startPosMain.Y + delta.Y)
        local newPosSettings = UDim2.new(0, startPosSettings.X + delta.X, 0, startPosSettings.Y + delta.Y)

        -- Update positions of both MainFrame and SettingsFrame
        MainFrame.Position = newPosMain
        SettingsFrame.Position = newPosSettings
    end
end)

SettingsFrame.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = false
    end
end)

-- [ TargetGUIFrame Properties ]
TargetGUIFrame.Name = "TargetGUIFrame"
TargetGUIFrame.Parent = MainFrame
TargetGUIFrame.Size = UDim2.new(0, 400, 0, 300)  -- Same size as MainFrame
TargetGUIFrame.Position = UDim2.new(0, MainFrame.Size.X.Offset + 10, 0, 0)  -- Initially hidden to the right of MainFrame
TargetGUIFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
TargetGUIFrame.BackgroundTransparency = 0.1
TargetGUIFrame.Visible = false
TargetGUIFrame.BorderSizePixel = 0
TargetGUIFrame.Active = true
TargetGUIFrame.Draggable = true  -- Make the TargetGUIFrame draggable as well

-- [ TargetGUITitle Properties ]
TargetGUITitle.Name = "TargetGUITitle"
TargetGUITitle.Parent = TargetGUIFrame
TargetGUITitle.Size = UDim2.new(1, 0, 0, 40)
TargetGUITitle.Position = UDim2.new(0, 10, 0, 0)
TargetGUITitle.BackgroundTransparency = 1
TargetGUITitle.Text = "TargetGUI"
TargetGUITitle.Font = Enum.Font.SourceSans
TargetGUITitle.TextSize = 28
TargetGUITitle.TextColor3 = Color3.fromRGB(255, 255, 255)
TargetGUITitle.TextXAlignment = Enum.TextXAlignment.Left

-- [ New Scrolling Frame inside TargetGUIFrame ]
local NewScrollFrame = Instance.new("ScrollingFrame")
NewScrollFrame.Name = "NewScrollFrame"
NewScrollFrame.Parent = TargetGUIFrame
NewScrollFrame.Size = UDim2.new(1, -20, 1, -80) -- Adjust size within TargetGUIFrame
NewScrollFrame.Position = UDim2.new(0, 10, 0, 60) -- Position under existing buttons
NewScrollFrame.CanvasSize = UDim2.new(0, 0, 0, 500) -- Adjust canvas size to fit content
NewScrollFrame.ScrollBarThickness = 10
NewScrollFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
NewScrollFrame.BackgroundTransparency = 0.9
NewScrollFrame.BorderSizePixel = 0
NewScrollFrame.ScrollBarImageColor3 = Color3.fromRGB(169, 169, 169)



-- [ CloseTargetGUIButton Properties ]
CloseTargetGUIButton.Name = "CloseTargetGUIButton"
CloseTargetGUIButton.Parent = TargetGUIFrame
CloseTargetGUIButton.Size = UDim2.new(0, 35, 0, 35)
CloseTargetGUIButton.Position = UDim2.new(1, -40, 0, 5)
CloseTargetGUIButton.BackgroundColor3 = Color3.fromRGB(169, 169, 169)
CloseTargetGUIButton.BackgroundTransparency = 0.9
CloseTargetGUIButton.Text = "❌"
CloseTargetGUIButton.Font = Enum.Font.SourceSans
CloseTargetGUIButton.TextSize = 24
CloseTargetGUIButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseTargetGUIButton.BorderSizePixel = 0

CloseTargetGUIButton.MouseButton1Click:Connect(function()
    -- Hide the TargetGUIFrame
    TargetGUIFrame.Visible = false
end)

-- [ Dragging Logic for TargetGUI and Main Menu Together ]
local dragging = false
local dragStart = Vector2.new()
local startPosMain = Vector2.new()
local startPosTargetGUI = Vector2.new()

-- Detect dragging when clicking on the TargetGUI frame
TargetGUIFrame.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPosMain = MainFrame.Position
        startPosTargetGUI = TargetGUIFrame.Position
    end
end)

TargetGUIFrame.InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Position - dragStart
        local newPosMain = UDim2.new(0, startPosMain.X + delta.X, 0, startPosMain.Y + delta.Y)
        local newPosTargetGUI = UDim2.new(0, startPosTargetGUI.X + delta.X, 0, startPosTargetGUI.Y + delta.Y)

        -- Update positions of both MainFrame and TargetGUIFrame
        MainFrame.Position = newPosMain
        TargetGUIFrame.Position = newPosTargetGUI
    end
end)

TargetGUIFrame.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = false
    end
end)



--loadstring(game:HttpGet("https://raw.githubusercontent.com/XGEN-K1/RBLX25/refs/heads/main/SearchTargetModule.lua"))()

-- Створення GUI для пошуку та відображення аватара цілі
local TargetTextBox = Instance.new("TextBox")
local AvatarImageLabel = Instance.new("ImageLabel")
local UsernameLabel = Instance.new("TextLabel")
local DisplaynameLabel = Instance.new("TextLabel")

-- Налаштування TargetTextBox
TargetTextBox.Name = "TargetInputBox"
TargetTextBox.Parent = NewScrollFrame
TargetTextBox.Size = UDim2.new(0, 345, 0, 30)
TargetTextBox.Position = UDim2.new(0, 10, 0, 5) -- Розташування у NewScrollFrame
TargetTextBox.PlaceholderText = "Enter player name"
TargetTextBox.Text = ""
TargetTextBox.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
TargetTextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
TargetTextBox.Font = Enum.Font.SourceSans
TargetTextBox.TextSize = 18

-- Налаштування AvatarImageLabel
AvatarImageLabel.Name = "TargetAvatarImage"
AvatarImageLabel.Parent = NewScrollFrame
AvatarImageLabel.Size = UDim2.new(0, 100, 0, 100)
AvatarImageLabel.Position = UDim2.new(0, 10, 0, 45) -- Розташування під TargetTextBox
AvatarImageLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
AvatarImageLabel.BackgroundTransparency = 1
AvatarImageLabel.Image = ""

-- Налаштування UsernameLabel
UsernameLabel.Name = "UsernameLabel"
UsernameLabel.Parent = NewScrollFrame
UsernameLabel.Size = UDim2.new(0, 200, 0, 30)
UsernameLabel.Position = UDim2.new(0, 120, 0, 45) -- Розташування справа від AvatarImageLabel
UsernameLabel.BackgroundTransparency = 1
UsernameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
UsernameLabel.Font = Enum.Font.SourceSans
UsernameLabel.TextSize = 18
UsernameLabel.Text = "Username:"

-- Налаштування DisplaynameLabel
DisplaynameLabel.Name = "DisplaynameLabel"
DisplaynameLabel.Parent = NewScrollFrame
DisplaynameLabel.Size = UDim2.new(0, 200, 0, 30)
DisplaynameLabel.Position = UDim2.new(0, 120, 0, 80) -- Розташування під UsernameLabel
DisplaynameLabel.BackgroundTransparency = 1
DisplaynameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
DisplaynameLabel.Font = Enum.Font.SourceSans
DisplaynameLabel.TextSize = 18
DisplaynameLabel.Text = "Displayname:"

-- Функція пошуку гравця та оновлення аватара та інформації
local function updateAvatar()
    local playerName = TargetTextBox.Text
    if playerName == "" then
        AvatarImageLabel.Image = ""
        UsernameLabel.Text = "Username:"
        DisplaynameLabel.Text = "Displayname:"
        return
    end

    local targetPlayer = nil

    -- Спочатку шукаємо за username
    for _, player in pairs(game.Players:GetPlayers()) do
        if string.find(string.lower(player.Name), string.lower(playerName)) then
            targetPlayer = player
            break
        end
    end

    -- Якщо не знайдено, шукаємо за displayname
    if not targetPlayer then
        for _, player in pairs(game.Players:GetPlayers()) do
            if string.find(string.lower(player.DisplayName), string.lower(playerName)) then
                targetPlayer = player
                break
            end
        end
    end

    -- Оновлюємо аватар та інформацію або очищуємо
    if targetPlayer then
        local userId = targetPlayer.UserId
        AvatarImageLabel.Image = "https://www.roblox.com/headshot-thumbnail/image?userId=" .. userId .. "&width=150&height=150&format=png"
        UsernameLabel.Text = "Username: " .. targetPlayer.Name
        DisplaynameLabel.Text = "Displayname: " .. targetPlayer.DisplayName
    else
        AvatarImageLabel.Image = ""
        UsernameLabel.Text = "Username:"
        DisplaynameLabel.Text = "Displayname:"
    end
end

-- Виконувати пошук при зміні тексту в TargetTextBox
TargetTextBox:GetPropertyChangedSignal("Text"):Connect(updateAvatar)



--кінець
-- [ ToggleMenu Function to Handle Minimize and Alt + B ]
local menuIsVisible = true

local function toggleMenu()
    menuIsVisible = not menuIsVisible
    MainFrame.Visible = menuIsVisible
end

-- [ Keybind to Toggle Menu (Alt + B) ]
local UIS = game:GetService("UserInputService")
UIS.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.B and UIS:IsKeyDown(Enum.KeyCode.LeftAlt) then
        toggleMenu() -- Use common function for both button and keybind
    end
end)

-- [ Minimize Button Behavior ]
MinimizeButton.MouseButton1Click:Connect(function()
    toggleMenu() -- Minimize button triggers the same function
end)
