local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")

local LocalPlayer = Players.LocalPlayer
local Active = false
local ScriptDisabled = false
local inputConnection

local settings = {
    ToggleKey = Enum.KeyCode.K
}

-- Функція для відключення стандартного відображення DisplayName
local function disableDisplayName(player)
    local char = player.Character
    if char then
        local humanoid = char:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
        end
    end
end

-- Функція для включення стандартного відображення DisplayName
local function enableDisplayName(player)
    local char = player.Character
    if char then
        local humanoid = char:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.Viewer
        end
    end
end

local function createMarker(player)
    local char = player.Character
    if char and char:FindFirstChild("Head") then
        local head = char.Head
        local billboard = Instance.new("BillboardGui")
        billboard.Name = "PlayerMarker"
        billboard.Adornee = head
        billboard.Size = UDim2.new(4, 0, 1.5, 0)
        billboard.StudsOffset = Vector3.new(0, 2, 0)
        billboard.AlwaysOnTop = true
        billboard.Parent = head
        
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(1, 0, 1, 0)
        frame.BackgroundTransparency = 1
        frame.Parent = billboard
        
        local displayNameLabel = Instance.new("TextLabel")
        displayNameLabel.Size = UDim2.new(1, 0, 0.3, 0)
        displayNameLabel.Position = UDim2.new(0, 0, 0, 0)
        displayNameLabel.BackgroundTransparency = 1
        displayNameLabel.Text = player.DisplayName
        displayNameLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
		displayNameLabel.TextStrokeColor3 = Color3.new(1, 1, 1) -- Біла обводка
		displayNameLabel.TextStrokeTransparency = 0 -- Видима обводка
        displayNameLabel.TextScaled = true
        displayNameLabel.Font = Enum.Font.SourceSansBold
        displayNameLabel.Parent = frame
        
        local usernameLabel = Instance.new("TextLabel")
        usernameLabel.Size = UDim2.new(1, 0, 0.3, 0)
        usernameLabel.Position = UDim2.new(0, 0, 0.21, 0)
        usernameLabel.BackgroundTransparency = 1
        usernameLabel.Text = "@" .. player.Name .. ""
        usernameLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
		usernameLabel.TextStrokeColor3 = Color3.new(1, 1, 1) -- Біла обводка
		usernameLabel.TextStrokeTransparency = 0.2 -- Видима обводка
        usernameLabel.TextScaled = true
        usernameLabel.Font = Enum.Font.SourceSans
        usernameLabel.Parent = frame

        local healthBarBackground = Instance.new("Frame")
        healthBarBackground.Size = UDim2.new(0.8, 0, 0.15, 0)
        healthBarBackground.Position = UDim2.new(0.1, 0, 0.51, 0)
        healthBarBackground.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        healthBarBackground.BorderSizePixel = 0
        healthBarBackground.Parent = frame

        local healthBar = Instance.new("Frame")
        healthBar.Name = "HealthBar"
        healthBar.Size = UDim2.new(1, 0, 1, 0)
        healthBar.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
        healthBar.BorderSizePixel = 0
        healthBar.Parent = healthBarBackground
        
        local healthLabel = Instance.new("TextLabel")
        healthLabel.Name = "HealthLabel"
        healthLabel.Size = UDim2.new(1, 0, 1, 0)
        healthLabel.BackgroundTransparency = 1
        healthLabel.TextScaled = true
        healthLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
		healthLabel.TextStrokeColor3 = Color3.new(1, 1, 1) -- Біла обводка
		healthLabel.TextStrokeTransparency = 0 -- Видима обводка
        healthLabel.Font = Enum.Font.SourceSansBold
        healthLabel.Parent = healthBar
        
        local highlight = Instance.new("Highlight", char)
        highlight.Name = "PlayerHighlight"
        highlight.FillTransparency = 1
        highlight.Enabled = true
        highlight.OutlineColor = player.TeamColor.Color
    end
end

local function updateHealth(player)
    local char = player.Character
    if char and char:FindFirstChild("Humanoid") then
        local humanoid = char.Humanoid
        local head = char:FindFirstChild("Head")
        if head then
            local billboard = head:FindFirstChild("PlayerMarker")
            if billboard then
                local frame = billboard:FindFirstChildOfClass("Frame")
                if frame then
                    local healthBarBackground = frame:FindFirstChildOfClass("Frame")
                    if healthBarBackground then
                        local healthBar = healthBarBackground:FindFirstChild("HealthBar")
                        local healthLabel = healthBar and healthBar:FindFirstChild("HealthLabel")
                        if healthBar and healthLabel then
                            local healthRatio = humanoid.Health / humanoid.MaxHealth
                            healthBar.Size = UDim2.new(healthRatio, 0, 1, 0)
                            healthLabel.Text = math.floor(humanoid.Health) .. " / " .. math.floor(humanoid.MaxHealth)
                            if healthRatio > 0.5 then
                                healthBar.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
                            elseif healthRatio > 0.2 then
                                healthBar.BackgroundColor3 = Color3.fromRGB(255, 165, 0)
                            else
                                healthBar.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
                            end
                        end
                    end
                end
            end
        end
    end
end

local function removeMarker(player)
    local char = player.Character
    if char then
        if char:FindFirstChild("Head") then
            local marker = char.Head:FindFirstChild("PlayerMarker")
            if marker then
                marker:Destroy()
            end
        end
        local highlight = char:FindFirstChild("PlayerHighlight")
        if highlight then
            highlight:Destroy()
        end
    end
end

local function checkPlayers()
    while Active do
        for _, player in pairs(Players:GetPlayers()) do
            if player ~= LocalPlayer then
                local char = player.Character
                if char and char:FindFirstChild("Head") then
                    if not char.Head:FindFirstChild("PlayerMarker") then
                        createMarker(player)
                        disableDisplayName(player) -- Відключення стандартного відображення DisplayName
                    end
                    updateHealth(player)
                end
            end
        end
        wait(0.2)
    end
    for _, player in pairs(Players:GetPlayers()) do
        removeMarker(player)
        enableDisplayName(player) -- Повернення стандартного відображення DisplayName
    end
end

local function showNotification(message)
    game.StarterGui:SetCore("SendNotification", {
        Title = "SS Script",
        Text = message,
        Duration = 2
    })
end

inputConnection = UserInputService.InputBegan:Connect(function(input, gameProcessedEvent)
    if gameProcessedEvent or ScriptDisabled then return end
    if input.KeyCode == settings.ToggleKey then
        Active = not Active
        if Active then
            spawn(checkPlayers)
            showNotification("SSOn")
        else
            showNotification("SSOff")
        end
    end
end)

_G.SSDestroy = function()
    Active = false
    ScriptDisabled = true
    for _, player in pairs(Players:GetPlayers()) do
        removeMarker(player)
        enableDisplayName(player) -- Повернення стандартного відображення DisplayName при знищенні скрипта
    end
    if inputConnection then
        inputConnection:Disconnect()
        inputConnection = nil
    end
    _G.SSDestroy = nil
    showNotification("SSDestroyed")
end