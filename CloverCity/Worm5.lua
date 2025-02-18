local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local camera = workspace.CurrentCamera
local TOGGLE_KEY = Enum.KeyCode.V
local TELEPORT_OFFSET_Y = -5

-- Налаштування для підйому та спуску
local RAISE_KEY = Enum.KeyCode.X
local LOWER_KEY = Enum.KeyCode.C
local MOVE_SPEED = 0.15  -- Швидкість руху
local RAISE_SPEED = 0.0  -- Швидкість підйому
local LOWER_SPEED = 0.0  -- Швидкість спуску
local MOVE_INTERVAL = 0.0  -- Інтервал для руху

local isFakeMode = false
local originalCharacter = nil
local originalHRP = nil
local walkPart = nil
local fakeHumanoid = nil
local heartbeatConn = nil

local partHeight = 0  -- Висота walkPart

local movingForward = false
local movingBackward = false
local movingLeft = false
local movingRight = false

local function createWalkPart()
    local model = Instance.new("Model")
    model.Name = "FakeCharacter"

    local part = Instance.new("Part")
    part.Size = Vector3.new(2, 3, 2)
    part.Position = player.Character.HumanoidRootPart.Position
    part.Color = Color3.fromRGB(255, 255, 255)
    part.Anchored = true  -- Додаємо закріплення, щоб не падало
    part.CanCollide = false  -- Вимкнено колізію
    part.Transparency = 0.5
    part.Material = Enum.Material.SmoothPlastic
    part.Name = "HumanoidRootPart"

    local humanoid = Instance.new("Humanoid")
    humanoid.Parent = model

    part.Parent = model
    model.PrimaryPart = part
    model.Parent = workspace

    return model, part, humanoid
end

local function enterFakeMode()
    if isFakeMode then return end

    originalCharacter = player.Character or player.CharacterAdded:Wait()
    if not originalCharacter then
        warn("Персонаж не знайдено!")
        return
    end

    originalHRP = originalCharacter:FindFirstChild("HumanoidRootPart") or originalCharacter:WaitForChild("HumanoidRootPart", 5)
    if not originalHRP then
        warn("HumanoidRootPart не знайдено!")
        return
    end

    -- Створюємо нову модель, не змінюючи оригінального персонажа
    walkPart, fakeHRP, fakeHumanoid = createWalkPart()
    fakeHRP.CFrame = originalHRP.CFrame

    -- Переміщаємо камеру до фейкового гуманоїда, не змінюючи оригінального персонажа
    camera.CameraSubject = fakeHumanoid

    heartbeatConn = RunService.Heartbeat:Connect(function()
        if fakeHRP and originalHRP then
            originalHRP.CFrame = fakeHRP.CFrame * CFrame.new(0, TELEPORT_OFFSET_Y, 0)
        end
    end)

    isFakeMode = true
end

local function exitFakeMode()
    if not isFakeMode then return end

    if heartbeatConn then
        heartbeatConn:Disconnect()
        heartbeatConn = nil
    end

    if walkPart then
        walkPart:Destroy()
    end

    camera.CameraSubject = originalCharacter:FindFirstChild("Humanoid") or originalCharacter:WaitForChild("Humanoid", 5)

    isFakeMode = false
end

local function onInputBegan(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == TOGGLE_KEY then
        if not isFakeMode then
            enterFakeMode()
        else
            exitFakeMode()
        end
    elseif input.KeyCode == Enum.KeyCode.W then
        movingForward = true
    elseif input.KeyCode == Enum.KeyCode.S then
        movingBackward = true
    elseif input.KeyCode == Enum.KeyCode.A then
        movingLeft = true
    elseif input.KeyCode == Enum.KeyCode.D then
        movingRight = true
    elseif input.KeyCode == RAISE_KEY then
        walkPart.HumanoidRootPart.Position = walkPart.HumanoidRootPart.Position + Vector3.new(0, RAISE_SPEED, 0)
    elseif input.KeyCode == LOWER_KEY then
        walkPart.HumanoidRootPart.Position = walkPart.HumanoidRootPart.Position - Vector3.new(0, LOWER_SPEED, 0)
    end
end

local function onInputEnded(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.W then
        movingForward = false
    elseif input.KeyCode == Enum.KeyCode.S then
        movingBackward = false
    elseif input.KeyCode == Enum.KeyCode.A then
        movingLeft = false
    elseif input.KeyCode == Enum.KeyCode.D then
        movingRight = false
    end
end

local function updateMovement()
    local moveDirection = Vector3.new()

    if movingForward then
        moveDirection = camera.CFrame.LookVector * MOVE_SPEED
    elseif movingBackward then
        moveDirection = -camera.CFrame.LookVector * MOVE_SPEED
    end

    if movingLeft then
        moveDirection = moveDirection - camera.CFrame.RightVector * MOVE_SPEED
    elseif movingRight then
        moveDirection = moveDirection + camera.CFrame.RightVector * MOVE_SPEED
    end

    if moveDirection.Magnitude > 0 then
        walkPart.HumanoidRootPart.Position = walkPart.HumanoidRootPart.Position + moveDirection
    end
end

UserInputService.InputBegan:Connect(onInputBegan)
UserInputService.InputEnded:Connect(onInputEnded)

-- Інтервал для руху
RunService.Heartbeat:Connect(function()
    updateMovement()
end)
