local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local CoreGui = game:GetService("CoreGui")

-- Функція для створення GUI
local function createGUI()
    -- Створення GUI в CoreGui
    local ScreenGui = Instance.new("ScreenGui", CoreGui)
    ScreenGui.Name = "TargetSelectorGUI"

    local MainFrame = Instance.new("Frame", ScreenGui)
    MainFrame.Size = UDim2.new(0, 300, 0, 200)
    MainFrame.Position = UDim2.new(0.5, -150, 0.5, -100)
    MainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    MainFrame.BackgroundTransparency = 0.5
    MainFrame.BorderSizePixel = 0

    local UICorner = Instance.new("UICorner", MainFrame)
    UICorner.CornerRadius = UDim.new(0, 10)

    local TargetInput = Instance.new("TextBox", MainFrame)
    TargetInput.Size = UDim2.new(0.9, 0, 0.2, 0)
    TargetInput.Position = UDim2.new(0.05, 0, 0.1, 0)
    TargetInput.PlaceholderText = "Enter Player Name"
    TargetInput.Text = ""
    TargetInput.TextColor3 = Color3.fromRGB(255, 255, 255)
    TargetInput.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    TargetInput.ClearTextOnFocus = false

    local TargetNameLabel = Instance.new("TextLabel", MainFrame)
    TargetNameLabel.Size = UDim2.new(0.9, 0, 0.15, 0)
    TargetNameLabel.Position = UDim2.new(0.05, 0, 0.35, 0)
    TargetNameLabel.Text = "Target Username: N/A"
    TargetNameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    TargetNameLabel.BackgroundTransparency = 1

    local TargetDisplayNameLabel = Instance.new("TextLabel", MainFrame)
    TargetDisplayNameLabel.Size = UDim2.new(0.9, 0, 0.15, 0)
    TargetDisplayNameLabel.Position = UDim2.new(0.05, 0, 0.5, 0)
    TargetDisplayNameLabel.Text = "Target Display Name: N/A"
    TargetDisplayNameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    TargetDisplayNameLabel.BackgroundTransparency = 1

    local AvatarImage = Instance.new("ImageLabel", MainFrame)
    AvatarImage.Size = UDim2.new(0.3, 0, 0.3, 0)
    AvatarImage.Position = UDim2.new(0.35, 0, 0.65, 0)
    AvatarImage.BackgroundTransparency = 1

    -- Збереження вибраного гравця
    getgenv().SelectedPlayer = LocalPlayer -- За замовчуванням локальний гравець

    local function UpdateTargetInfo(player)
        if player then
            TargetNameLabel.Text = "Target Username: " .. player.Name
            TargetDisplayNameLabel.Text = "Target Display Name: " .. player.DisplayName

            local userId = player.UserId
            local thumbType = Enum.ThumbnailType.HeadShot
            local thumbSize = Enum.ThumbnailSize.Size420x420
            local content, isReady = Players:GetUserThumbnailAsync(userId, thumbType, thumbSize)
            if isReady then
                AvatarImage.Image = content
            else
                AvatarImage.Image = ""
            end

            getgenv().SelectedPlayer = player -- Оновлення глобальної змінної
        else
            TargetNameLabel.Text = "Target Username: N/A"
            TargetDisplayNameLabel.Text = "Target Display Name: N/A"
            AvatarImage.Image = ""
            getgenv().SelectedPlayer = LocalPlayer -- Повернення до локального гравця
        end
    end

    -- Оновлення цілі при зміні тексту
    TargetInput:GetPropertyChangedSignal("Text"):Connect(function()
        local text = TargetInput.Text:lower()
        local matchedPlayer = nil

        for _, player in ipairs(Players:GetPlayers()) do
            if player.Name:lower():find(text) or player.DisplayName:lower():find(text) then
                matchedPlayer = player
                break
            end
        end

        UpdateTargetInfo(matchedPlayer)
    end)

    -- Ініціалізація з локальним гравцем
    UpdateTargetInfo(nil)

    -- Логіка перетягування MainFrame
    local dragging
    local dragInput
    local dragStart
    local startPos

    local function update(input)
        local delta = input.Position - dragStart
        MainFrame.Position = UDim2.new(
            startPos.X.Scale,
            startPos.X.Offset + delta.X,
            startPos.Y.Scale,
            startPos.Y.Offset + delta.Y
        )
    end

    MainFrame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = MainFrame.Position

            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    MainFrame.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)

    game:GetService("UserInputService").InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            update(input)
        end
    end)

    return ScreenGui
end

-- Створення GUI тільки один раз
if not CoreGui:FindFirstChild("TargetSelectorGUI") then
    createGUI()
end
