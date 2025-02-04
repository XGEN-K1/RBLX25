local updateInterval = 0.3 -- Інтервал оновлення FPS і Ping (у секундах)

local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui")
local frame = Instance.new("Frame")
local textLabel = Instance.new("TextLabel")

-- Налаштування GUI
gui.Parent = player:WaitForChild("PlayerGui")
gui.ResetOnSpawn = false
frame.Parent = gui
frame.Size = UDim2.new(0, 150, 0, 30)
frame.Position = UDim2.new(0, 10, 0, 10)
frame.BackgroundColor3 = Color3.new(0, 0, 0.2)
frame.BackgroundTransparency = 1
frame.Active = true
frame.Draggable = true

textLabel.Parent = frame
textLabel.Size = UDim2.new(1, 0, 1, 0)
textLabel.TextColor3 = Color3.new(1, 1, 1)
textLabel.BackgroundTransparency = 1
textLabel.Font = Enum.Font.SourceSansBold
textLabel.TextSize = 16
textLabel.TextScaled = true  -- Увімкнення TextScaled
textLabel.Text = "FPS: -- | Ping: --"
textLabel.TextWrapped = false  -- Текст не буде переноситися

-- Налаштування обводки
textLabel.TextStrokeTransparency = 0  -- Обводка чорного кольору, прозорість 0.5
textLabel.TextStrokeColor3 = Color3.new(0, 0, 0)  -- Чорний колір обводки

-- Оновлення FPS і Ping
local runService = game:GetService("RunService")
local stats = game:GetService("Stats")

local fps = 0
local frameCount = 0
local lastTime = tick()

runService.RenderStepped:Connect(function()
    frameCount = frameCount + 1
    local currentTime = tick()
    if currentTime - lastTime >= updateInterval then
        fps = math.round(frameCount / updateInterval)  -- Усереднення за заданий інтервал та округлення
        frameCount = 0
        lastTime = currentTime
        local ping = stats.Network.ServerStatsItem["Data Ping"]:GetValueString()
        -- Додав символ нового рядка \n перед Ping
        textLabel.Text = "FPS: " .. fps .. "\nPing: " .. ping
    end
end)
