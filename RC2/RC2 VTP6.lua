if game.PlaceId ~= 12196278347 then
    --warn("Цей скрипт можна використовувати лише в грі з ID 12196278347.")
    return
end

getgenv().game = workspace.Parent
local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- Задані точки
local teleportPoints = {
    {"Silver's SellZone", Vector3.new(1442, 22, 174)},
    {"NF SellZone", Vector3.new(2223, 49, -710)},
    {"Abyss", Vector3.new(-7255, -623, 945)},
    {"UCS", Vector3.new(1902, 19, -209)},
    {"FurnitureS", Vector3.new(-611, 89, 274)},
    {"Dealership", Vector3.new(-6904, 13, -4302)},
    {"Sarcophagus", Vector3.new(-7881, 27, -3239)},
    {"Vi'sLogics", Vector3.new(-5141, 82, -2796)},
    {"Vi'sLab UP", Vector3.new(-4478, 163, -1912)},
    {"Vi'sLab", Vector3.new(-4406, -185, -2028)},
    {"Wizard", Vector3.new(2023, -423, -282)},
    {"LushShop", Vector3.new(2267, -465, -22)},
    {"NauticFinds", Vector3.new(2197, 19, -742)},
    {"Enchant", Vector3.new(3150, -567, -1586)},
    --{"Zik", Vector3.new(-462, 73, 712)},
    --{"Mountain Adam Elf", Vector3.new(-7579, 720, -3647)},
    {"Cloudnite", Vector3.new(-7237, 795, -3258)},
    {"Scarlet&Coal", Vector3.new(-6195, 73, -2279)},
    
    {"Rpsawell Mines", Vector3.new(-5549, 49, -1685)},
    {"SaltCave", Vector3.new(-6000, -146, -2029)},
    {"Shack", Vector3.new(-5304, 201, -3441)},
    {"LumenaHill", Vector3.new(-5633, 390, -2216)},
    {"Mountain Eve(skill)", Vector3.new(-5638, 398, -3193)},
    {"SwampIsland", Vector3.new(874, 86, -2990)},
    {"RIsland1", Vector3.new(4082, 72, -2189)},
    {"RIsland2", Vector3.new(3803, 80, 677)},
    {"NovabayFerry", Vector3.new(-356, 21, 1326)},
    {"RosewellFerry", Vector3.new(-3801, 40, -852)},
    {"NovaBay", Vector3.new(522, 98, -84)},
    {"BlueRoom", Vector3.new(326, 23, 634)},
    {"SecretCola", Vector3.new(10004, -491, 5030)},
    --{"MyBase", Vector3.new(522, 98, -84)},
    --{"Friend1", Vector3.new(522, 98, -84)},
    {"Plot1", Vector3.new(1711, 33, -250)},
    {"Plot2", Vector3.new(1315, 49, 516)},
    {"Plot3", Vector3.new(1564, 42, 607)},
    {"Plot4", Vector3.new(626, 107, 535)},
    {"Plot5", Vector3.new(254, 100, 187)},
    {"Plot6", Vector3.new(434, 103, -203)},
    {"Plot7", Vector3.new(1572, 60, 192)},
    {"Plot8", Vector3.new(1010, 60, 70)}
}

-- Функція для телепортації без машини
local function teleportPlayer(targetPosition)
    if not player.Character or not player.Character:FindFirstChild("HumanoidRootPart") then
        warn("Персонаж не знайдений")
        return
    end
    player.Character.HumanoidRootPart.CFrame = CFrame.new(targetPosition)
    print("Гравець телепортований!")
end

-- Функція для телепортації машини разом із гравцем
local function teleportCar(targetPosition)
    if not player.Character or not player.Character:FindFirstChild("HumanoidRootPart") then
        warn("Персонаж не знайдений")
        return
    end

    local character = player.Character
    local vehicleSeat = nil

    -- Пошук VehicleSeat
    for _, part in pairs(workspace:GetDescendants()) do
        if part:IsA("VehicleSeat") and part.Occupant == character.Humanoid then
            vehicleSeat = part
            break
        end
    end

    if vehicleSeat then
        local carModel = vehicleSeat:FindFirstAncestorOfClass("Model")
        if carModel then
            carModel:SetPrimaryPartCFrame(CFrame.new(targetPosition))
            print("Машина телепортована!")
        else
            warn("Модель машини не знайдена")
        end
    else
        warn("Транспортний засіб не знайдено")
    end
end

-- Створення GUI
local screenGui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
screenGui.Name = "TeleportGUI"
screenGui.ResetOnSpawn = false

local frame = Instance.new("Frame", screenGui)
frame.Size = UDim2.new(0, 300, 0, 400)
frame.Position = UDim2.new(0, 10, 0, 500)

frame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
frame.BackgroundTransparency = 0.9
frame.Draggable = true
frame.Active = true
frame.Selectable = true

local titleLabel = Instance.new("TextLabel", frame)
titleLabel.Size = UDim2.new(1, -20, 0, 30)
titleLabel.Position = UDim2.new(0, 10, 0, 10)
titleLabel.Text = "              TP"
titleLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
titleLabel.BackgroundTransparency = 0.5
titleLabel.TextColor3 = Color3.new(1, 1, 1)
titleLabel.TextXAlignment = Enum.TextXAlignment.Left
titleLabel.TextScaled = true

local closeButton = Instance.new("TextButton", frame)
closeButton.Size = UDim2.new(0, 30, 0, 30)
closeButton.Position = UDim2.new(1, -40, 0, 10)
closeButton.Text = "X"
closeButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
closeButton.BackgroundTransparency = 0.5
closeButton.TextColor3 = Color3.new(1, 1, 1)

closeButton.MouseButton1Click:Connect(function()
    screenGui:Destroy()
end)

local scrollFrame = Instance.new("ScrollingFrame", frame)
scrollFrame.Size = UDim2.new(1, -20, 1, -80)
scrollFrame.Position = UDim2.new(0, 10, 0, 50)
scrollFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
scrollFrame.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
scrollFrame.BackgroundTransparency = 1
scrollFrame.ScrollBarThickness = 10
scrollFrame.ScrollBarImageColor3 = Color3.new(0, 0, 0)
scrollFrame.ScrollBarImageTransparency = 0.1


local layout = Instance.new("UIListLayout", scrollFrame)
layout.Padding = UDim.new(0, 5)
layout.SortOrder = Enum.SortOrder.LayoutOrder

local function calculateTextSize(button)
    -- Розмір шрифта пропорційно до висоти кнопки
    return math.floor(button.Size.Y.Offset * 0.4)  -- 40% від висоти кнопки
end

local function createPointUI(pointName, position)
    if not scrollFrame then
        warn("scrollFrame не знайдено! Перевірте ініціалізацію.")
        return
    end

    local pointFrame = Instance.new("Frame", scrollFrame)
    pointFrame.Size = UDim2.new(1, -10, 0, 50)
    pointFrame.BackgroundColor3 = Color3.fromRGB(90, 90, 90)
	pointFrame.BackgroundTransparency = 0.9

    local nameBox = Instance.new("TextBox", pointFrame)
    nameBox.Size = UDim2.new(0.25, -5, 0, 30)
    nameBox.Position = UDim2.new(0, 5, 0.5, -15)
    nameBox.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    nameBox.BackgroundTransparency = 0.5
    nameBox.TextColor3 = Color3.new(255, 255, 255)
    nameBox.Text = pointName
    nameBox.TextScaled = true

    local posBox = Instance.new("TextBox", pointFrame)
    posBox.Size = UDim2.new(0.3, -5, 0, 30)
    posBox.Position = UDim2.new(0.27, 0, 0.5, -15)
    posBox.Text = tostring(position)
    posBox.TextScaled = true
	posBox.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	posBox.BackgroundTransparency = 0.5
	posBox.TextColor3 = Color3.new(255, 255, 255)

    local tpButton = Instance.new("TextButton", pointFrame)
    tpButton.Size = UDim2.new(0.2, -5, 0, 30)
    tpButton.Position = UDim2.new(0.57, 0, 0.5, -15)
    tpButton.Text = "TP"
    tpButton.TextSize = calculateTextSize(tpButton)
	tpButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	tpButton.BackgroundTransparency = 0.5
	tpButton.TextColor3 = Color3.new(255, 255, 255)

    tpButton.MouseButton1Click:Connect(function()
        local x, y, z = string.match(posBox.Text, "([%d%.%-]+),[%s]*([%d%.%-]+),[%s]*([%d%.%-]+)")
        if x and y and z then
            local targetPosition = Vector3.new(tonumber(x), tonumber(y), tonumber(z))
            teleportCar(targetPosition)
        else
            warn("Неправильний формат координат")
        end
    end)

    -- Створення кнопки Ptp
    local ptpButton = Instance.new("TextButton", pointFrame)
    ptpButton.Size = UDim2.new(0.2, -5, 0, 30)
    ptpButton.Position = UDim2.new(0.77, 0, 0.5, -15)
    ptpButton.Text = "Ptp"
    ptpButton.TextSize = calculateTextSize(ptpButton)
	ptpButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	ptpButton.BackgroundTransparency = 0.5
	ptpButton.TextColor3 = Color3.new(255, 255, 255)

    ptpButton.MouseButton1Click:Connect(function()
        local x, y, z = string.match(posBox.Text, "([%d%.%-]+),[%s]*([%d%.%-]+),[%s]*([%d%.%-]+)")
        if x and y and z then
            local targetPosition = Vector3.new(tonumber(x), tonumber(y), tonumber(z))
            teleportPlayer(targetPosition)
        else
            warn("Неправильний формат координат")
        end
    end)

    local deleteButton = Instance.new("TextButton", pointFrame)
    deleteButton.Size = UDim2.new(0.1, -5, 0, 30)
    deleteButton.Position = UDim2.new(1, 0, 0.5, -15)
    deleteButton.Text = "X"
    deleteButton.TextSize = calculateTextSize(deleteButton)

    deleteButton.MouseButton1Click:Connect(function()
        pointFrame:Destroy()
        teleportPoints[pointName] = nil
        scrollFrame.CanvasSize = UDim2.new(0, 0, 0, scrollFrame.CanvasSize.Y.Offset - 55)
    end)

    scrollFrame.CanvasSize = UDim2.new(0, 0, 0, scrollFrame.CanvasSize.Y.Offset + 55)
end

local addButton = Instance.new("TextButton", frame)
addButton.Size = UDim2.new(1, -31.5, 0, 30)
addButton.Position = UDim2.new(0.003, 10, 1, -25)
addButton.Text = "Add"
addButton.TextSize = calculateTextSize(addButton)
addButton.BackgroundColor3 = Color3.fromRGB(100, 200, 100)
addButton.BackgroundTransparency = 0.5
addButton.TextColor3 = Color3.new(1, 1, 1)

addButton.MouseButton1Click:Connect(function()
    local newName = "Point" .. tostring(#teleportPoints + 1)
    local newPosition = player.Character.HumanoidRootPart.Position
    table.insert(teleportPoints, {newName, newPosition})
    createPointUI(newName, newPosition)
end)


-- Створення кнопок для точок з координатами
for _, point in ipairs(teleportPoints) do
    createPointUI(point[1], point[2])
end
