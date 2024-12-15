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


local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer

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
TargetTextBox.BackgroundTransparency = 0.7
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
local targetPlayer = nil -- Гравець, за яким будемо спостерігати

local function updateAvatar()
    local playerName = TargetTextBox.Text
    if playerName == "" then
        targetPlayer = nil
        AvatarImageLabel.Image = ""
        UsernameLabel.Text = "Username:"
        DisplaynameLabel.Text = "Displayname:"
        return
    end

    targetPlayer = nil -- Скидаємо попереднє значення

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


--

-- [ SpectateButton Properties ]
local SpectateButton = Instance.new("TextButton")

SpectateButton.Name = "SpectateButton"
SpectateButton.Parent = NewScrollFrame
SpectateButton.Size = UDim2.new(0, 115, 0, 35)
SpectateButton.Position = UDim2.new(0, 120, 0, 110)
SpectateButton.BackgroundColor3 = Color3.fromRGB(169, 169, 169)
SpectateButton.BackgroundTransparency = 0.9
SpectateButton.Text = "Spectate"
SpectateButton.Font = Enum.Font.SourceSans
SpectateButton.TextSize = 16
SpectateButton.TextColor3 = Color3.fromRGB(255, 255, 255)
SpectateButton.BorderSizePixel = 0

local currentlySpectating = nil -- Гравець, за яким ведеться спостереження

SpectateButton.MouseButton1Click:Connect(function()
    -- Якщо гравець не вибраний, просто повертаємо
    if not targetPlayer then
        print("Гравець не вибраний для спостереження")
        return
    end

    -- Перевіряємо, чи вже стежимо за цим гравцем
    if currentlySpectating == targetPlayer then
        -- Вимикаємо стеження
        currentlySpectating = nil
		
        -- Повертаємо камеру до локального гравця або до самого об'єкта LocalPlayer
        if LocalPlayer.Character then
            workspace.CurrentCamera.CameraSubject = LocalPlayer.Character
        else
            workspace.CurrentCamera.CameraSubject = LocalPlayer
        end

        SpectateButton.TextColor3 = Color3.fromRGB(255, 255, 255) -- Змінюємо колір тексту на сірий
        print("Слідкування вимкнено. Камера повернена до локального гравця.")
    else
        -- Починаємо стеження за обраним гравцем
        currentlySpectating = targetPlayer

        -- Перевіряємо, чи `targetPlayer.Character` доступний
        if targetPlayer.Character then
            workspace.CurrentCamera.CameraSubject = targetPlayer.Character -- Перемикаємо камеру на обраного гравця
            SpectateButton.TextColor3 = Color3.fromRGB(0, 255, 0) -- Змінюємо колір тексту на зелений
            print("Тепер спостерігаєте за:", targetPlayer.Name)
        else
            print("Персонаж гравця недоступний для спостереження")
            currentlySpectating = nil -- Скидаємо статус стеження
        end
    end
end)

--fling

local SkidFling = function(TargetPlayer)

   local Character = LocalPlayer.Character
   local Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")
   local RootPart = Humanoid and Humanoid.RootPart

   local TCharacter = TargetPlayer.Character
   local THumanoid
   local TRootPart
   local THead
   local Accessory
   local Handle

   if TCharacter:FindFirstChildOfClass("Humanoid") then
       THumanoid = TCharacter:FindFirstChildOfClass("Humanoid")
   end
   if THumanoid and THumanoid.RootPart then
       TRootPart = THumanoid.RootPart
   end
   if TCharacter:FindFirstChild("Head") then
       THead = TCharacter.Head
   end
   if TCharacter:FindFirstChildOfClass("Accessory") then
       Accessory = TCharacter:FindFirstChildOfClass("Accessory")
   end
   if Accessoy and Accessory:FindFirstChild("Handle") then
       Handle = Accessory.Handle
   end

   if Character and Humanoid and RootPart then
       if RootPart.Velocity.Magnitude < 50 then
           getgenv().OldPos = RootPart.CFrame
       end
       if THumanoid and THumanoid.Sit and not AllBool then
       end
       if THead then
           workspace.CurrentCamera.CameraSubject = THead
       elseif not THead and Handle then
           workspace.CurrentCamera.CameraSubject = Handle
       elseif THumanoid and TRootPart then
           workspace.CurrentCamera.CameraSubject = THumanoid
       end
       if not TCharacter:FindFirstChildWhichIsA("BasePart") then
           return
       end
       
       local FPos = function(BasePart, Pos, Ang)
           RootPart.CFrame = CFrame.new(BasePart.Position) * Pos * Ang
           Character:SetPrimaryPartCFrame(CFrame.new(BasePart.Position) * Pos * Ang)
           RootPart.Velocity = Vector3.new(9e7, 9e7 * 10, 9e7)
           RootPart.RotVelocity = Vector3.new(9e8, 9e8, 9e8)
       end
       
       local SFBasePart = function(BasePart)
           local TimeToWait = 2
           local Time = tick()
           local Angle = 0

           repeat
               if RootPart and THumanoid then
                   if BasePart.Velocity.Magnitude < 50 then
                       Angle = Angle + 100

                       FPos(BasePart, CFrame.new(0, 1.5, 0) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle),0 ,0))
                       task.wait()

                       FPos(BasePart, CFrame.new(0, -1.5, 0) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle), 0, 0))
                       task.wait()

                       FPos(BasePart, CFrame.new(2.25, 1.5, -2.25) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle), 0, 0))
                       task.wait()

                       FPos(BasePart, CFrame.new(-2.25, -1.5, 2.25) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle), 0, 0))
                       task.wait()

                       FPos(BasePart, CFrame.new(0, 1.5, 0) + THumanoid.MoveDirection,CFrame.Angles(math.rad(Angle), 0, 0))
                       task.wait()

                       FPos(BasePart, CFrame.new(0, -1.5, 0) + THumanoid.MoveDirection,CFrame.Angles(math.rad(Angle), 0, 0))
                       task.wait()
                   else
                       FPos(BasePart, CFrame.new(0, 1.5, THumanoid.WalkSpeed), CFrame.Angles(math.rad(90), 0, 0))
                       task.wait()

                       FPos(BasePart, CFrame.new(0, -1.5, -THumanoid.WalkSpeed), CFrame.Angles(0, 0, 0))
                       task.wait()

                       FPos(BasePart, CFrame.new(0, 1.5, THumanoid.WalkSpeed), CFrame.Angles(math.rad(90), 0, 0))
                       task.wait()
                       
                       FPos(BasePart, CFrame.new(0, 1.5, TRootPart.Velocity.Magnitude / 1.25), CFrame.Angles(math.rad(90), 0, 0))
                       task.wait()

                       FPos(BasePart, CFrame.new(0, -1.5, -TRootPart.Velocity.Magnitude / 1.25), CFrame.Angles(0, 0, 0))
                       task.wait()

                       FPos(BasePart, CFrame.new(0, 1.5, TRootPart.Velocity.Magnitude / 1.25), CFrame.Angles(math.rad(90), 0, 0))
                       task.wait()

                       FPos(BasePart, CFrame.new(0, -1.5, 0), CFrame.Angles(math.rad(90), 0, 0))
                       task.wait()

                       FPos(BasePart, CFrame.new(0, -1.5, 0), CFrame.Angles(0, 0, 0))
                       task.wait()

                       FPos(BasePart, CFrame.new(0, -1.5 ,0), CFrame.Angles(math.rad(-90), 0, 0))
                       task.wait()

                       FPos(BasePart, CFrame.new(0, -1.5, 0), CFrame.Angles(0, 0, 0))
                       task.wait()
                   end
               else
                   break
               end
           until BasePart.Velocity.Magnitude > 500 or BasePart.Parent ~= TargetPlayer.Character or TargetPlayer.Parent ~= Players or not TargetPlayer.Character == TCharacter or THumanoid.Sit or Humanoid.Health <= 0 or tick() > Time + TimeToWait
       end
       
       workspace.FallenPartsDestroyHeight = 0/0
       
       local BV = Instance.new("BodyVelocity")
       BV.Name = "EpixVel"
       BV.Parent = RootPart
       BV.Velocity = Vector3.new(9e8, 9e8, 9e8)
       BV.MaxForce = Vector3.new(1/0, 1/0, 1/0)
       
       Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
       
       if TRootPart and THead then
           if (TRootPart.CFrame.p - THead.CFrame.p).Magnitude > 5 then
               SFBasePart(THead)
           else
               SFBasePart(TRootPart)
           end
       elseif TRootPart and not THead then
           SFBasePart(TRootPart)
       elseif not TRootPart and THead then
           SFBasePart(THead)
       elseif not TRootPart and not THead and Accessory and Handle then
           SFBasePart(Handle)
       else
       end
       
       BV:Destroy()
       Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
       workspace.CurrentCamera.CameraSubject = Humanoid
       
       repeat
           RootPart.CFrame = getgenv().OldPos * CFrame.new(0, .5, 0)
           Character:SetPrimaryPartCFrame(getgenv().OldPos * CFrame.new(0, .5, 0))
           Humanoid:ChangeState("GettingUp")
           table.foreach(Character:GetChildren(), function(_, x)
               if x:IsA("BasePart") then
                   x.Velocity, x.RotVelocity = Vector3.new(), Vector3.new()
               end
           end)
           task.wait()
       until (RootPart.Position - getgenv().OldPos.p).Magnitude < 25
       workspace.FallenPartsDestroyHeight = getgenv().FPDH
   else
   end
end


-- [ FlingButton Properties ]
local FlingButton = Instance.new("TextButton")

FlingButton.Name = "FlingButton"
FlingButton.Parent = NewScrollFrame
FlingButton.Size = UDim2.new(0, 115, 0, 35)
FlingButton.Position = UDim2.new(0, 240, 0, 110)
FlingButton.BackgroundColor3 = Color3.fromRGB(169, 169, 169)
FlingButton.BackgroundTransparency = 0.9
FlingButton.Text = "Fling"
FlingButton.Font = Enum.Font.SourceSans
FlingButton.TextSize = 16
FlingButton.TextColor3 = Color3.fromRGB(255, 255, 255)
FlingButton.BorderSizePixel = 0


FlingButton.MouseButton1Click:Connect(function()
    SkidFling(targetPlayer)
end)


-- [ GotoButton Properties ]
local GotoButton = Instance.new("TextButton")

GotoButton.Name = "GotoButton"
GotoButton.Parent = NewScrollFrame
GotoButton.Size = UDim2.new(0, 115, 0, 35)
GotoButton.Position = UDim2.new(0, 120, 0, 150)
GotoButton.BackgroundColor3 = Color3.fromRGB(169, 169, 169)
GotoButton.BackgroundTransparency = 0.9
GotoButton.Text = "Goto"
GotoButton.Font = Enum.Font.SourceSans
GotoButton.TextSize = 16
GotoButton.TextColor3 = Color3.fromRGB(255, 255, 255)
GotoButton.BorderSizePixel = 0



GotoButton.MouseButton1Click:Connect(function()
    -- Check if a target player is selected
    if not targetPlayer or not targetPlayer.Character or not LocalPlayer.Character then
        print("No valid target player selected or target player does not have a character.")
        return
    end

    -- Get the position of the target player's character
    local targetCharacter = targetPlayer.Character
    local targetPosition = targetCharacter:FindFirstChild("HumanoidRootPart")

    -- Get the local player's character
    local localCharacter = LocalPlayer.Character
    local localHumanoidRootPart = localCharacter:FindFirstChild("HumanoidRootPart")

    if targetPosition and localHumanoidRootPart then
        -- Teleport the local player to the target player's position
        localHumanoidRootPart.CFrame = targetPosition.CFrame
        print("Teleported to " .. targetPlayer.Name)
    else
        print("Teleportation failed. Make sure both characters have HumanoidRootParts.")
    end
end)


-- [ AimButton Properties ]
local AimButton = Instance.new("TextButton")

AimButton.Name = "AimButton"
AimButton.Parent = NewScrollFrame
AimButton.Size = UDim2.new(0, 115, 0, 35)
AimButton.Position = UDim2.new(0, 240, 0, 150)
AimButton.BackgroundColor3 = Color3.fromRGB(169, 169, 169)
AimButton.BackgroundTransparency = 0.9
AimButton.Text = "Aim"
AimButton.Font = Enum.Font.SourceSans
AimButton.TextSize = 16
AimButton.TextColor3 = Color3.fromRGB(255, 255, 255)
AimButton.BorderSizePixel = 0


AimButton.MouseButton1Click:Connect(function()
    SkidAim(targetPlayer)
end)






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
