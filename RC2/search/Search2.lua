if game.PlaceId ~= 12196278347 then
    warn("Цей скрипт можна використовувати лише в грі з ID 12196278347.")
    return
end

local RunService = game:GetService("RunService")

-- Налаштування пошуку об'єктів
local searchConfigs = {
    {
        parent = workspace.WorldSpawn.Trees,
        names = { "Goldwood Tree" }
    },
    {
        parent = workspace.WorldSpawn.Ores,
        names = { "Silver", "Gold", "Ancient Rune" }
    }
}

-- Таблиця для збереження активних аутлайнів (ключ – частина, значення – Highlight)
local activeHighlights = {}

local xrayEnabled = false      -- Перемикач Xray (false: стандартний режим, true: через стіни)
local activeCheck = false      -- Перемикач автоматичної перевірки нових об'єктів
local activeCheckInterval = 5  -- Інтервал перевірки (в секундах)

-- Функція для створення Highlight для частини
local function applyOutlineToPart(part)
    if activeHighlights[part] then
        return
    end
    local highlight = Instance.new("Highlight")
    highlight.Adornee = part
    highlight.OutlineColor = Color3.new(1, 1, 1) -- білий аутлайн
    highlight.FillTransparency = 1            -- прозорий Fill
    if xrayEnabled then
        highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    else
        highlight.DepthMode = Enum.HighlightDepthMode.Occluded
    end
    highlight.Parent = part
    activeHighlights[part] = highlight
end

-- Функція для пошуку об'єктів і додавання їм аутлайнів
local function addOutlines()
    local count = 0
    for _, config in ipairs(searchConfigs) do
        if config.parent then
            for _, model in ipairs(config.parent:GetChildren()) do
                if model:IsA("Model") then
                    for _, name in ipairs(config.names) do
                        if model.Name == name then
                            -- Обходимо всі частини в моделі
                            for _, descendant in ipairs(model:GetDescendants()) do
                                if descendant:IsA("BasePart") then
                                    applyOutlineToPart(descendant)
                                    count = count + 1
                                end
                            end
                        end
                    end
                end
            end
        end
    end
    print("Кількість доданих аутлайнів: " .. count)
end

-- Функція для оновлення режиму Xray для всіх аутлайнів
local function updateHighlightsXray()
    for part, highlight in pairs(activeHighlights) do
        if highlight and highlight:IsA("Highlight") then
            if xrayEnabled then
                highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
            else
                highlight.DepthMode = Enum.HighlightDepthMode.Occluded
            end
        end
    end
    print("Xray " .. (xrayEnabled and "увімкнено" or "вимкнено"))
end

-- Функція для видалення всіх аутлайнів
local function removeAllHighlights()
    for part, highlight in pairs(activeHighlights) do
        if highlight and highlight.Parent then
            highlight:Destroy()
        end
    end
    activeHighlights = {}
    print("Видалено всі аутлайни")
end

-- Функція автоматичної перевірки нових об'єктів
local function startActiveCheck()
    spawn(function()
        while activeCheck do
            addOutlines()
            wait(activeCheckInterval)
        end
    end)
end

-- Створення інтерфейсу
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 220, 0, 150)
frame.Position = UDim2.new(0, 300, 0, 970)
frame.BorderSizePixel = 2
frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
frame.BackgroundTransparency = 0.9
frame.Parent = screenGui

-- Додавання можливості перетягування
local dragging = false
local dragInput, dragStart, startPos

frame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = frame.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

frame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        dragInput = input
    end
end)

RunService.RenderStepped:Connect(function()
    if dragging and dragInput then
        local delta = dragInput.Position - dragStart
        frame.Position = UDim2.new(
            startPos.X.Scale, startPos.X.Offset + delta.X,
            startPos.Y.Scale, startPos.Y.Offset + delta.Y
        )
    end
end)

-- Створення кнопки для додавання аутлайнів
local colorButton = Instance.new("TextButton")
colorButton.Size = UDim2.new(0, 60, 0, 20)
colorButton.Position = UDim2.new(0, 5, 0, 5)
colorButton.Text = "Paint"
colorButton.TextColor3 = Color3.new(1, 1, 1)
colorButton.BackgroundColor3 = Color3.fromRGB(100, 100, 255)
colorButton.BackgroundTransparency = 0.5
colorButton.Parent = frame

colorButton.MouseButton1Click:Connect(function()
    addOutlines()
end)

-- Створення кнопки для перемикання Xray
local xrayButton = Instance.new("TextButton")
xrayButton.Size = UDim2.new(0, 60, 0, 20)
xrayButton.Position = UDim2.new(0, 5, 0, 30)
xrayButton.Text = "Xray: Off"
xrayButton.TextColor3 = Color3.new(1, 1, 1)
xrayButton.BackgroundColor3 = Color3.fromRGB(100, 255, 100)
xrayButton.BackgroundTransparency = 0.5
xrayButton.Parent = frame

xrayButton.MouseButton1Click:Connect(function()
    xrayEnabled = not xrayEnabled
    xrayButton.Text = "Xray: " .. (xrayEnabled and "On" or "Off")
    updateHighlightsXray()
end)

-- Створення кнопки для перемикання активного режиму перевірки
local activeButton = Instance.new("TextButton")
activeButton.Size = UDim2.new(0, 60, 0, 20)
activeButton.Position = UDim2.new(0, 5, 0, 55)
activeButton.Text = "Active: Off"
activeButton.TextColor3 = Color3.new(1, 1, 1)
activeButton.BackgroundColor3 = Color3.fromRGB(255, 255, 100)
activeButton.BackgroundTransparency = 0.5
activeButton.Parent = frame

activeButton.MouseButton1Click:Connect(function()
    activeCheck = not activeCheck
    activeButton.Text = "Active: " .. (activeCheck and "On" or "Off")
    if activeCheck then
        startActiveCheck()
    end
end)

-- Створення кнопки для видалення всіх аутлайнів
local removeButton = Instance.new("TextButton")
removeButton.Size = UDim2.new(0, 60, 0, 20)
removeButton.Position = UDim2.new(0, 5, 0, 80)
removeButton.Text = "Remove All"
removeButton.TextColor3 = Color3.new(1, 1, 1)
removeButton.BackgroundColor3 = Color3.fromRGB(255, 100, 100)
removeButton.BackgroundTransparency = 0.5
removeButton.Parent = frame

removeButton.MouseButton1Click:Connect(function()
    removeAllHighlights()
end)

-- Кнопка для закриття меню
local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0, 20, 0, 20)
closeButton.Position = UDim2.new(0, 190, 0, 5)
closeButton.Text = "X"
closeButton.TextColor3 = Color3.new(1, 1, 1)
closeButton.BackgroundColor3 = Color3.fromRGB(255, 100, 100)
closeButton.BackgroundTransparency = 0.5
closeButton.Parent = frame

closeButton.MouseButton1Click:Connect(function()
    screenGui:Destroy()
end)
