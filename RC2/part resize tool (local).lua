local tool = Instance.new("Tool") -- Створюємо новий інструмент
tool.Name = "ResizeTool" -- Назва інструмента
tool.Parent = game.Players.LocalPlayer.Backpack -- Додаємо до рюкзака гравця

local handle = Instance.new("Part") -- Створюємо частину, яка буде інструментом
handle.Size = Vector3.new(1, 1, 1)
handle.Name = "Handle"
handle.Parent = tool
tool.Grip = CFrame.new(0, 0, 0)

-- Змінна для зберігання стану інструмента
local isToolActive = false

-- Коли інструмент активується
tool.Activated:Connect(function()
    isToolActive = true
end)

-- Коли інструмент деактивується
tool.Deactivated:Connect(function()
    isToolActive = false
end)

-- Функція для обробки кліків по об'єктах
local function onMouseClick()
    local mouse = game.Players.LocalPlayer:GetMouse()
    mouse.Button1Down:Connect(function()
        if isToolActive and mouse.Target and mouse.Target:IsA("Part") then
            local targetPart = mouse.Target
            targetPart.Size = targetPart.Size * 1.5 -- Збільшуємо розмір на 50%
        end
    end)
end

-- Запускаємо обробку кліків
onMouseClick()
