if game.PlaceId ~= 12196278347 then
    warn("Цей скрипт можна використовувати лише в грі з ID 12196278347.")
    return
end

local groupId = 16751713 -- Нова ID групи
local groupName = "RC2 STAFF" -- Фіксована назва групи
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local StarterGui = game:GetService("StarterGui")
local SoundService = game:GetService("SoundService")

local function playNotificationSound()
    for i = 1, 10 do
        local sound = Instance.new("Sound")
        sound.SoundId = "rbxassetid://6026984224" -- Замініть на свій звук, якщо потрібно
        sound.Volume = 15 -- Гучність 15
        sound.Parent = SoundService
        sound:Play()
        game:GetService("Debris"):AddItem(sound, 5) -- Видаляємо звук через 5 секунд
        task.wait(0.2) -- Інтервал між повтореннями
    end
end

local function showNotification(text)
    local screenGui = Instance.new("ScreenGui")
    screenGui.Parent = LocalPlayer:FindFirstChildOfClass("PlayerGui")

    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0.35, 0, 0.12, 0)
    frame.Position = UDim2.new(0.325, 0, 0.05, 0)
    frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    frame.BackgroundTransparency = 0.4 -- Напівпрозорість
    frame.BorderSizePixel = 0
    frame.Parent = screenGui

    local textLabel = Instance.new("TextLabel")
    textLabel.Size = UDim2.new(1, 0, 1, 0)
    textLabel.BackgroundTransparency = 1
    textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    textLabel.TextScaled = true
    textLabel.Text = text
    textLabel.Parent = frame

    playNotificationSound()
    task.wait(999) -- Сповіщення залишається на екрані
    screenGui:Destroy()
end

local function checkPlayer(player)
    if player:IsInGroup(groupId) then
        local role = player:GetRoleInGroup(groupId) -- Отримуємо роль у групі
        showNotification("Гравець " .. player.Name .. " (" .. role .. ") з групи " .. groupName .. " зайшов на сервер!")
    end
end

-- Перевіряємо всіх гравців, які вже є на сервері при запуску скрипта
for _, player in pairs(Players:GetPlayers()) do
    checkPlayer(player)
end

-- Перевіряємо нових гравців, які заходять після запуску скрипта
Players.PlayerAdded:Connect(checkPlayer)
