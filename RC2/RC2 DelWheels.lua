if game.PlaceId ~= 12196278347 then
    return
end

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local guiEnabled = true

-- Функція для створення GUI
local function createVehicleGUI()
    -- Створення основного GUI
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "VehicleControlGUI"
    screenGui.ResetOnSpawn = false
    screenGui.Parent = player.PlayerGui

    -- Основне вікно
    local mainFrame = Instance.new("Frame")
    mainFrame.Size = UDim2.new(0, 200, 0, 150)
    mainFrame.Position = UDim2.new(0.32, 0, 0.783, 0)
    mainFrame.BackgroundColor3 = Color3.new(0, 0, 0)
    mainFrame.BackgroundTransparency = 0.9
    mainFrame.Active = true
    mainFrame.Draggable = true
    mainFrame.ClipsDescendants = true
    mainFrame.Parent = screenGui

    -- Заголовок для перетягування
    local dragHandle = Instance.new("TextLabel")
    dragHandle.Size = UDim2.new(1, 0, 0, 20)
    dragHandle.BackgroundTransparency = 1
    dragHandle.Text = "Vehicle Controls"
    dragHandle.TextColor3 = Color3.new(1, 1, 1)
    dragHandle.Parent = mainFrame

    -- Кнопка закриття
    local closeButton = Instance.new("TextButton")
    closeButton.Size = UDim2.new(0, 20, 0, 20)
    closeButton.Position = UDim2.new(1, -20, 0, 0)
    closeButton.BackgroundColor3 = Color3.new(1, 0, 0)
    closeButton.BackgroundTransparency = 0.7
    closeButton.Text = "X"
    closeButton.TextColor3 = Color3.new(1, 1, 1)
    closeButton.Parent = mainFrame

    closeButton.MouseButton1Click:Connect(function()
        screenGui:Destroy()
        guiEnabled = false
    end)

    -- Кнопка видалення коліс
    local wheelsButton = Instance.new("TextButton")
    wheelsButton.Size = UDim2.new(0.9, 0, 0, 30)
    wheelsButton.Position = UDim2.new(0.05, 0, 0.25, 0)
    wheelsButton.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
    wheelsButton.BackgroundTransparency = 0.7
    wheelsButton.Text = "Delete Wheels"
    wheelsButton.TextColor3 = Color3.new(1, 1, 1)
    wheelsButton.Parent = mainFrame

    -- Кнопка зміни Anchored
    local anchorButton = Instance.new("TextButton")
    anchorButton.Size = UDim2.new(0.9, 0, 0, 30)
    anchorButton.Position = UDim2.new(0.05, 0, 0.55, 0)
    anchorButton.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
    anchorButton.BackgroundTransparency = 0.7
    anchorButton.Text = "Toggle Seat Anchored"
    anchorButton.TextColor3 = Color3.new(1, 1, 1)
    anchorButton.Parent = mainFrame

    -- Функція для отримання поточного транспорту
    local function getCurrentVehicle()
        if not player.Character then return nil end
        
        local humanoid = player.Character:FindFirstChild("Humanoid")
        if not humanoid then return nil end
        
        for _, seat in pairs(workspace:GetDescendants()) do
            if seat:IsA("VehicleSeat") and seat.Occupant == humanoid then
                return seat:FindFirstAncestorOfClass("Model")
            end
        end
        return nil
    end

    -- Обробник для кнопки видалення коліс
    wheelsButton.MouseButton1Click:Connect(function()
        if not guiEnabled then return end
        
        local vehicle = getCurrentVehicle()
        if vehicle then
            local wheelsFolder = vehicle:FindFirstChild("_Wheels")
            if wheelsFolder then
                wheelsFolder:Destroy()
                print("Колеса видалені!")
            else
                warn("Папка з колесами не знайдена")
            end
        else
            warn("Транспорт не знайдений")
        end
    end)

    -- Обробник для кнопки Anchored
    anchorButton.MouseButton1Click:Connect(function()
        if not guiEnabled then return end
        
        local vehicle = getCurrentVehicle()
        if vehicle then
            local seat = vehicle:FindFirstChildOfClass("VehicleSeat")
            if seat then
                seat.Anchored = not seat.Anchored
                print("Anchored змінено на: "..tostring(seat.Anchored))
            else
                warn("Сидіння не знайдено")
            end
        else
            warn("Транспорт не знайдений")
        end
    end)
end

-- Створюємо GUI при підключенні гравця
if player then
    createVehicleGUI()
else
    Players.PlayerAdded:Connect(createVehicleGUI)
end