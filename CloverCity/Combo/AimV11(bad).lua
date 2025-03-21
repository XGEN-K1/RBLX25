﻿local Settings = {
    rewrittenmain = {
        Enabled = true,
        Key = "e", -- Кнопка для вибору цілі
        DeselectKey = "j", -- Кнопка для дезактивації цілі
        ShootKey = "v", -- Кнопка для стрільби (використовується лише, якщо UseVKey = true)
        UseVKey = true, -- Вмикає/вимикає використання букви v для стрільби
        TriggerKey = "h", -- Тригерна кнопка (H) для активації/деактивації режиму стрільби ЛКМ
        SwitchTargetKey = "b", -- Кнопка для переключення на найближчу ціль (до локального персонажа)
        AutoSwitchKey = "u", -- Тригерна кнопка (U) для автоматичного перемикання цілі (до курсора)
        DOT = true, -- Підсвічування цілі
        NOTIF = true, -- Повідомлення про вибір цілі
        FOV = math.huge, -- Поле зору для вибору цілі
        interval = 0, -- Інтервал стрільби (якщо 0, використовується 0.03 сек)
        LeadFactor = 1.05, -- Коефіцієнт для розрахунку упередження
        wallcheck = true, -- Перевірка на перешкоди (стіни) між tool і ціллю
        walldetectedmshoot = true -- Якщо перешкода виявлена: true – стріляти в напрямку курсора, false – не стріляти
    }
}

local SelectedPart = "HumanoidRootPart"
local Plr
local enabled = false
local shooting = false
local triggerMode = false  -- Режим, коли стрільба здійснюється ЛКМ, а локальні скрипти вимикаються в tool
local autoSwitch = false   -- Режим автоматичного перемикання цілі (до курсора) перед кожним вистрілом
local disabledToolScripts = {}  -- Таблиця для збереження скриптів, які були відключені в певних tool
local overheadUI = nil -- Змінна для зберігання BillboardGui

local CC = game:GetService("Workspace").CurrentCamera
local mouse = game.Players.LocalPlayer:GetMouse()
local placemarker = Instance.new("Part", game.Workspace)
placemarker.Anchored = true
placemarker.CanCollide = false
placemarker.Size = Vector3.new(0, 0, 0)
placemarker.Transparency = 0.75

local lineBeam -- Лінія для Beam

-------------------------------------------------
-- Функції для відключення/активації локальних скриптів в tool

local function disableLocalScriptsInTool(tool)
    if disabledToolScripts[tool] then return end -- Якщо вже відключено, нічого не робимо
    if tool:FindFirstChild("Stats") and tool.Stats:FindFirstChild("ClipSize") then
        disabledToolScripts[tool] = {}
        for _, child in ipairs(tool:GetDescendants()) do
            if child:IsA("LocalScript") and not child.Disabled then
                child.Disabled = true
                table.insert(disabledToolScripts[tool], child)
            end
        end
        if #disabledToolScripts[tool] > 0 then
            print("Disabled local scripts in tool: " .. tool.Name)
        end
    end
end

local function reenableLocalScriptsInTool(tool)
    if disabledToolScripts[tool] then
        for _, script in ipairs(disabledToolScripts[tool]) do
            if script and script.Parent then
                script.Disabled = false
            end
        end
        disabledToolScripts[tool] = nil
        print("Re-enabled local scripts in tool: " .. tool.Name)
    end
end

-------------------------------------------------
-- Функції для роботи зі стрільбою та інтерфейсом

local function isCursorPositionValid()
    return mouse.X > 0 and mouse.Y > 0
end

function makemarker(Parent, Adornee, Color, Size, Size2)
    local e = Instance.new("BillboardGui", Parent)
    e.Name = "PP"
    e.Adornee = Adornee
    e.Size = UDim2.new(Size, Size2, Size, Size2)
    e.AlwaysOnTop = Settings.rewrittenmain.DOT
    local a = Instance.new("Frame", e)
    a.Size = UDim2.new(0.7, 0, 2.5, 0)
    a.Transparency = 0
    a.BackgroundTransparency = 0
    a.BackgroundColor3 = Color
    local g = Instance.new("UICorner", a)
    g.CornerRadius = UDim.new(1, 1)
    return e
end

function createOverheadUI(target)
    if overheadUI then
        overheadUI:Destroy()
    end

    overheadUI = Instance.new("BillboardGui", target.Character.Head)
    overheadUI.Name = "OverheadUI"
    overheadUI.Adornee = target.Character.Head
    overheadUI.Size = UDim2.new(0, 200, 0, 100)
    overheadUI.StudsOffset = Vector3.new(0, 2, 0)
    overheadUI.AlwaysOnTop = true

    local displayName = Instance.new("TextLabel", overheadUI)
    displayName.Name = "DisplayName"
    displayName.Text = target.DisplayName
    displayName.Size = UDim2.new(1, 0, 0.3, 0)
    displayName.Position = UDim2.new(0, 0, 0, 0)
    displayName.TextColor3 = Color3.new(1, 1, 1)
    displayName.BackgroundTransparency = 1
    displayName.Font = Enum.Font.SourceSansBold
    displayName.TextSize = 18

    local username = Instance.new("TextLabel", overheadUI)
    username.Name = "Username"
    username.Text = "@" .. target.Name
    username.Size = UDim2.new(1, 0, 0.3, 0)
    username.Position = UDim2.new(0, 0, 0.3, 0)
    username.TextColor3 = Color3.new(0.7, 0.7, 0.7)
    username.BackgroundTransparency = 1
    username.Font = Enum.Font.SourceSans
    username.TextSize = 16

    local healthBar = Instance.new("Frame", overheadUI)
    healthBar.Name = "HealthBar"
    healthBar.Size = UDim2.new(0.8, 0, 0.1, 0)
    healthBar.Position = UDim2.new(0.1, 0, 0.6, 0)
    healthBar.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
    healthBar.BorderSizePixel = 0

    local healthFill = Instance.new("Frame", healthBar)
    healthFill.Name = "HealthFill"
    healthFill.Size = UDim2.new(1, 0, 1, 0)
    healthFill.BackgroundColor3 = Color3.new(0, 1, 0)
    healthFill.BorderSizePixel = 0

    local healthText = Instance.new("TextLabel", healthBar)
    healthText.Name = "HealthText"
    healthText.Text = "100"
    healthText.Size = UDim2.new(1, 0, 1, 0)
    healthText.Position = UDim2.new(0, 0, 0, 0)
    healthText.TextColor3 = Color3.new(1, 1, 1)
    healthText.BackgroundTransparency = 1
    healthText.Font = Enum.Font.SourceSansBold
    healthText.TextSize = 14

    return overheadUI
end

function updateHealthBar(overheadUI, health, maxHealth)
    local healthBar = overheadUI:FindFirstChild("HealthBar")
    if healthBar then
        local healthFill = healthBar:FindFirstChild("HealthFill")
        local healthText = healthBar:FindFirstChild("HealthText")
        if healthFill and healthText then
            local healthPercent = health / maxHealth
            healthFill.Size = UDim2.new(healthPercent, 0, 1, 0)
            healthText.Text = tostring(math.floor(health))

            if healthPercent > 0.75 then
                healthFill.BackgroundColor3 = Color3.new(0, 1, 0)
            elseif healthPercent > 0.5 then
                healthFill.BackgroundColor3 = Color3.new(1, 1, 0)
            elseif healthPercent > 0.25 then
                healthFill.BackgroundColor3 = Color3.new(1, 0.5, 0)
            else
                healthFill.BackgroundColor3 = Color3.new(1, 0, 0)
            end
        end
    end
end

function getClosestPlayerToCursor()
    local closestPlayer
    local shortestDistance = Settings.rewrittenmain.FOV

    for i, v in pairs(game.Players:GetPlayers()) do
        if v ~= game.Players.LocalPlayer and v.Character and v.Character:FindFirstChild("Humanoid") 
           and v.Character.Humanoid.Health ~= 0 and v.Character:FindFirstChild("HumanoidRootPart") then
            local pos = CC:WorldToViewportPoint(v.Character.PrimaryPart.Position)
            local magnitude = (Vector2.new(pos.X, pos.Y) - Vector2.new(mouse.X, mouse.Y)).magnitude
            if magnitude < shortestDistance then
                closestPlayer = v
                shortestDistance = magnitude
            end
        end
    end
    return closestPlayer
end

function getClosestPlayerToLocalPlayer()
    local closestPlayer
    local shortestDistance = math.huge
    local localPlayer = game.Players.LocalPlayer
    local localPosition = localPlayer.Character and localPlayer.Character.PrimaryPart and localPlayer.Character.PrimaryPart.Position

    if not localPosition then
        return nil
    end

    for i, v in pairs(game.Players:GetPlayers()) do
        if v ~= localPlayer and v.Character and v.Character:FindFirstChild("Humanoid") 
           and v.Character.Humanoid.Health ~= 0 and v.Character:FindFirstChild("HumanoidRootPart") then
            local targetPosition = v.Character.PrimaryPart.Position
            local distance = (targetPosition - localPosition).Magnitude
            if distance < shortestDistance then
                closestPlayer = v
                shortestDistance = distance
            end
        end
    end
    return closestPlayer
end

function TargetNotif()
    if Plr then
        setclipboard(Plr.Name)
        local FinalNotifString = tostring(
            " Name: " .. tostring(Plr.Name) ..
            " DName: " .. tostring(Plr.DisplayName) ..
            " Health: " .. tostring(math.floor(Plr.Character:WaitForChild("Humanoid").Health)) ..
            " Id: " .. tostring(Plr.UserId)
        )
        game.StarterGui:SetCore("SendNotification", {
            Title = "Display: " .. tostring(Plr.Character.Humanoid.DisplayName),
            Text = FinalNotifString,
            Duration = 40
        })
    end
end

function calculateLeadPosition(target, ping)
    local targetVelocity = target.Character.PrimaryPart.Velocity
    local distance = (target.Character.PrimaryPart.Position - CC.CFrame.Position).Magnitude
    local timeToHit = distance / 1000 + ping / 1000
    local leadPosition = target.Character.PrimaryPart.Position + targetVelocity * timeToHit * Settings.rewrittenmain.LeadFactor
    return leadPosition
end

local function shootAtTarget()
    if Plr and Plr.Character and Plr.Character:FindFirstChild("Head") then
        local ping = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue()
        local leadPosition = calculateLeadPosition(Plr, ping)
        
        if Settings.rewrittenmain.wallcheck then
            local localPlayer = game.Players.LocalPlayer
            local character = localPlayer.Character
            local tool = workspace[localPlayer.Name]:FindFirstChildOfClass("Tool")
            local origin

            if tool and tool:FindFirstChild("Handle") then
                origin = tool.Handle.Position
            elseif character and character:FindFirstChild("HumanoidRootPart") then
                origin = character.HumanoidRootPart.Position
            else
                origin = CC.CFrame.Position
            end

            local direction = leadPosition - origin
            local raycastParams = RaycastParams.new()
            local filter = {}
            if character then table.insert(filter, character) end
            if tool then table.insert(filter, tool) end
            raycastParams.FilterDescendantsInstances = filter
            raycastParams.FilterType = Enum.RaycastFilterType.Blacklist

            local raycastResult = workspace:Raycast(origin, direction, raycastParams)
            if raycastResult then
                local hitPart = raycastResult.Instance
                if Plr.Character and not Plr.Character:IsAncestorOf(hitPart) then
                    if Settings.rewrittenmain.walldetectedmshoot then
                        local cursorPos = getCursorTargetPosition()
                        if cursorPos then
                            leadPosition = cursorPos
                        end
                    else
                        return -- не стріляємо, якщо перешкода є і walldetectedmshoot = false
                    end
                end
            end
        end

        local Parent_upvr = workspace[game.Players.LocalPlayer.Name]:FindFirstChildOfClass("Tool")
        if Parent_upvr then
            local ShootGun_upvr = game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("ShootGun")
            ShootGun_upvr:FireServer(leadPosition, Parent_upvr)
        end
    end
end

local function getCursorTargetPosition()
    if not isCursorPositionValid() then
        return nil
    end

    local ray = CC:ScreenPointToRay(mouse.X, mouse.Y)
    local raycastParams = RaycastParams.new()
    raycastParams.FilterType = Enum.RaycastFilterType.Blacklist
    raycastParams.FilterDescendantsInstances = {game.Players.LocalPlayer.Character}

    local raycastResult = workspace:Raycast(ray.Origin, ray.Direction * 1000, raycastParams)
    if raycastResult then
        return raycastResult.Position
    else
        return ray.Origin + ray.Direction * 1000
    end
end

local function shootAtCursor()
    local targetPosition = getCursorTargetPosition()
    if not targetPosition then
        return
    end

    local Parent_upvr = workspace[game.Players.LocalPlayer.Name]:FindFirstChildOfClass("Tool")
    if Parent_upvr then
        local ShootGun_upvr = game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("ShootGun")
        ShootGun_upvr:FireServer(targetPosition, Parent_upvr)
    end
end

-- Функція стрільби, яка виконується кожну ітерацію (якщо autoSwitch увімкнено – оновлюємо ціль перед wall‑check)
local function startShooting()
    shooting = true
    local interval = (Settings.rewrittenmain.interval > 0 and Settings.rewrittenmain.interval) or 0.03
    while shooting do
        if autoSwitch then
            local newTarget = getClosestPlayerToCursor()
            if newTarget then
                -- Оновлюємо ціль кожну ітерацію (навіть якщо вона не змінилась)
                Plr = newTarget
                enabled = true
                if Settings.rewrittenmain.NOTIF then
                    TargetNotif()
                end
                if overheadUI then
                    overheadUI:Destroy()
                end
                overheadUI = createOverheadUI(Plr)
                createLineBeam(game.Players.LocalPlayer.Character.HumanoidRootPart, Plr.Character.HumanoidRootPart)
            else
                enabled = false
                Plr = nil
            end
        end

        if enabled and Plr then
            shootAtTarget()
        else
            shootAtCursor()
        end
        wait(interval)
    end
end

function createLineBeam(from, to)
    if lineBeam then
        lineBeam:Destroy()
    end

    local fromAttachment = Instance.new("Attachment")
    fromAttachment.Parent = from

    local toAttachment = Instance.new("Attachment")
    toAttachment.Parent = to

    lineBeam = Instance.new("Beam")
    lineBeam.Parent = game.Workspace
    lineBeam.Attachment0 = fromAttachment
    lineBeam.Attachment1 = toAttachment
    lineBeam.Color = ColorSequence.new(Color3.fromRGB(255, 0, 0))
    lineBeam.FaceCamera = true
    lineBeam.Width0 = 0.2
    lineBeam.Width1 = 0.2
end

local function switchToClosestTarget()
    local newTarget = getClosestPlayerToLocalPlayer()
    if newTarget then
        if Plr and Plr == newTarget then return end
        Plr = newTarget
        enabled = true
        if Settings.rewrittenmain.NOTIF then
            TargetNotif()
        end
        if Plr and Plr.Character and Plr.Character:FindFirstChild("Head") then
            overheadUI = createOverheadUI(Plr)
            Plr.Character.Humanoid.HealthChanged:Connect(function()
                updateHealthBar(overheadUI, Plr.Character.Humanoid.Health, Plr.Character.Humanoid.MaxHealth)
            end)
            createLineBeam(game.Players.LocalPlayer.Character.HumanoidRootPart, Plr.Character.HumanoidRootPart)
        end
    end
end

-------------------------------------------------
-- Обробка клавіш

mouse.KeyDown:Connect(function(k)
    if k == Settings.rewrittenmain.Key and Settings.rewrittenmain.Enabled then
        local newTarget = getClosestPlayerToCursor()
        if newTarget then
            if Plr and Plr == newTarget then return end
            Plr = newTarget
            enabled = true
            if Settings.rewrittenmain.NOTIF then
                TargetNotif()
            end
            if Plr and Plr.Character and Plr.Character:FindFirstChild("Head") then
                overheadUI = createOverheadUI(Plr)
                Plr.Character.Humanoid.HealthChanged:Connect(function()
                    updateHealthBar(overheadUI, Plr.Character.Humanoid.Health, Plr.Character.Humanoid.MaxHealth)
                end)
                createLineBeam(game.Players.LocalPlayer.Character.HumanoidRootPart, Plr.Character.HumanoidRootPart)
            end
        end
    elseif k == Settings.rewrittenmain.DeselectKey then
        enabled = false
        Plr = nil
        if overheadUI then
            overheadUI:Destroy()
            overheadUI = nil
        end
        if lineBeam then
            lineBeam:Destroy()
            lineBeam = nil
        end
        if Settings.rewrittenmain.NOTIF then
            game.StarterGui:SetCore("SendNotification", {
                Title = "Aim",
                Text = "Target deselected",
                Duration = 5
            })
        end
    elseif k == Settings.rewrittenmain.SwitchTargetKey then
        switchToClosestTarget()
    end
end)

mouse.KeyDown:Connect(function(k)
    if k == Settings.rewrittenmain.ShootKey and not shooting and Settings.rewrittenmain.UseVKey and not triggerMode then
        startShooting()
    end
end)

mouse.KeyDown:Connect(function(k)
    if k == Settings.rewrittenmain.TriggerKey then
        triggerMode = not triggerMode
        if triggerMode then
            local character = game.Players.LocalPlayer.Character
            if character then
                local tool = character:FindFirstChildOfClass("Tool")
                if tool then
                    disableLocalScriptsInTool(tool)
                end
                character.ChildAdded:Connect(function(child)
                    if child:IsA("Tool") then
                        child.Equipped:Connect(function()
                            if triggerMode then
                                disableLocalScriptsInTool(child)
                            end
                        end)
                    end
                end)
            end
            game.StarterGui:SetCore("SendNotification", {
                Title = "Trigger Mode",
                Text = "Trigger mode activated",
                Duration = 5
            })
        else
            for tool, _ in pairs(disabledToolScripts) do
                reenableLocalScriptsInTool(tool)
            end
            disabledToolScripts = {}
            game.StarterGui:SetCore("SendNotification", {
                Title = "Trigger Mode",
                Text = "Trigger mode deactivated",
                Duration = 5
            })
        end
    end
end)

mouse.KeyDown:Connect(function(k)
    if k == Settings.rewrittenmain.AutoSwitchKey then
        autoSwitch = not autoSwitch
        if autoSwitch then
            game.StarterGui:SetCore("SendNotification", {
                Title = "AutoSwitch",
                Text = "Auto target switch activated",
                Duration = 5
            })
        else
            game.StarterGui:SetCore("SendNotification", {
                Title = "AutoSwitch",
                Text = "Auto target switch deactivated",
                Duration = 5
            })
        end
    end
end)

mouse.Button1Down:Connect(function()
    if triggerMode and not shooting then
        startShooting()
    end
end)

mouse.Button1Up:Connect(function()
    if triggerMode then
        shooting = false
    end
end)

game:GetService("RunService").RenderStepped:Connect(function()
    if enabled and Plr and Plr.Character and Plr.Character:FindFirstChild(SelectedPart) then
        placemarker.CFrame = Plr.Character[SelectedPart].CFrame
    else
        placemarker.CFrame = CFrame.new(0, 9999, 0)
    end
end)
