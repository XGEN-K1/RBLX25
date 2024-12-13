local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = LocalPlayer.PlayerGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- Створюємо основний Frame
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 300, 0, 400)
MainFrame.Position = UDim2.new(0.5, -150, 0.5, -200)
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
MainFrame.Parent = ScreenGui
MainFrame.Visible = true

-- Створюємо скролл-ліст
local ScrollFrame = Instance.new("ScrollingFrame")
ScrollFrame.Size = UDim2.new(1, -10, 1, -40)
ScrollFrame.Position = UDim2.new(0, 5, 0, 30)
ScrollFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
ScrollFrame.ScrollBarThickness = 6
--ScrollFrame.Rotation = 2
--ScrollFrame.VerticalScrollBarInset = -1
ScrollFrame.CanvasSize = UDim2.new(0, 0, 15, 0)
ScrollFrame.Parent = MainFrame

local currentlySpectating = nil -- Гравець, за яким слідкують
local isMenuVisible = true

local function refreshPlayerList()
    ScrollFrame:ClearAllChildren()

    for i, player in pairs(Players:GetPlayers()) do
        if player == LocalPlayer then continue end
        local playerButton = Instance.new("TextButton")
        playerButton.Size = UDim2.new(0.9, 0, 0, 25)
        playerButton.Position = UDim2.new(0.05, 0, 0, 30 * (i - 1))
        playerButton.Text = player.DisplayName .. " - " .. "@" .. player.Name
        playerButton.TextColor3 = currentlySpectating == player and Color3.new(0, 1, 0) or Color3.fromRGB(200, 200, 200)
        playerButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        playerButton.Parent = ScrollFrame

        playerButton.MouseButton1Click:Connect(function()
            if currentlySpectating == player then
                -- Переключити спостереження
                currentlySpectating = nil
                workspace.CurrentCamera.CameraSubject = LocalPlayer.Character
                print("Слідкування вимкнено")
            else
                currentlySpectating = player
                if player.Character then
                    workspace.CurrentCamera.CameraSubject = player.Character
                    print("Тепер спостерігаєте за:", player.Name)
                end
            end
            refreshPlayerList()
        end)
    end
end

-- Згорнути/розгорнути функція
local function toggleMenu()
    if isMenuVisible then
        MainFrame.Visible = false
    else
        MainFrame.Visible = true
    end
    isMenuVisible = not isMenuVisible
end

-- Обробляємо Alt+B
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.B and UserInputService:IsKeyDown(Enum.KeyCode.LeftAlt) then
        toggleMenu()
    end
end)

-- Створення кнопок
local minimizeButton = Instance.new("TextButton")
minimizeButton.Size = UDim2.new(0, 50, 0, 20)
minimizeButton.Position = UDim2.new(1, -105, 0, 5)
minimizeButton.Text = "_"
minimizeButton.TextColor3 = Color3.new(1, 1, 1)
minimizeButton.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
minimizeButton.Parent = MainFrame

minimizeButton.MouseButton1Click:Connect(toggleMenu)

local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0, 50, 0, 20)
closeButton.Position = UDim2.new(1, -55, 0, 5)
closeButton.Text = "X"
closeButton.TextColor3 = Color3.new(1, 0, 0)
closeButton.BackgroundColor3 = Color3.fromRGB(100, 0, 0)
closeButton.Parent = MainFrame

-- Завершуємо скрипт повністю
closeButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
    print("Скрипт завершено")
end)

-- Назва скрипта "Spectate"
local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, -120, 0, 20)
titleLabel.Position = UDim2.new(0, 10, 0, 5)
titleLabel.Text = "Spectate"
titleLabel.TextColor3 = Color3.new(1, 1, 1)
titleLabel.BackgroundTransparency = 1
titleLabel.Parent = MainFrame

-- Перетягування
local dragging = false
local dragStart = Vector2.new()
local frameStart = UDim2.new()

local function calculatePosition(mousePos)
    local screenSize = Vector2.new(workspace.CurrentCamera.ViewportSize.X, workspace.CurrentCamera.ViewportSize.Y)
    
    local offsetX = mousePos.X - 150
    local offsetY = mousePos.Y - 50

    local newPosX = math.clamp(offsetX / screenSize.X, 0, 1)
    local newPosY = math.clamp(offsetY / screenSize.Y, 0, 1)

    return UDim2.new(newPosX, 0, newPosY, 0)
end

MainFrame.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = UserInputService:GetMouseLocation()
        frameStart = MainFrame.Position
    end
end)

UserInputService.InputEnded:Connect(function(input, gameProcessed)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = false
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local mousePos = UserInputService:GetMouseLocation()
        MainFrame.Position = calculatePosition(mousePos)
    end
end)

-- Оновлюємо список кожні 0.5 секунди
Players.PlayerAdded:Connect(refreshPlayerList)
Players.PlayerRemoving:Connect(refreshPlayerList)
refreshPlayerList()
