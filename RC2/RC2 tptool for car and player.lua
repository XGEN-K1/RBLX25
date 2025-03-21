if game.PlaceId ~= 12196278347 then
    --warn("Цей скрипт можна використовувати лише в грі з ID 12196278347.")
    return
end

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local mouse = player:GetMouse()

-- Функція для телепортації гравця
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
        warn("Транспортний засіб не знайдено, телепортується лише гравець")
        teleportPlayer(targetPosition)
    end
end

-- Створення інструмента
local tool = Instance.new("Tool")
tool.Name = "Teleport Tool"
tool.RequiresHandle = false
tool.Parent = player.Backpack

-- Використання інструмента
tool.Activated:Connect(function()
    if not mouse then
        warn("Миша не знайдена")
        return
    end

    local target = mouse.Hit
    if target then
        local targetPosition = target.Position
        teleportCar(targetPosition)
    else
        warn("Місце натискання не знайдено")
    end
end)
