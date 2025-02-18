local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local camera = workspace.CurrentCamera
local TOGGLE_KEY = Enum.KeyCode.Z
local TELEPORT_OFFSET_Y = -6

local isFakeMode = false
local originalCharacter = nil
local originalHRP = nil
local walkPart = nil
local fakeHumanoid = nil
local heartbeatConn = nil

local function createWalkPart()
    local model = Instance.new("Model")
    model.Name = "FakeCharacter"

    local part = Instance.new("Part")
    part.Size = Vector3.new(2, 3, 2)
    part.Position = player.Character.HumanoidRootPart.Position
    part.Color = Color3.fromRGB(255, 255, 255)
    part.Anchored = false
    part.CanCollide = true
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

    walkPart, fakeHRP, fakeHumanoid = createWalkPart()
    fakeHRP.CFrame = originalHRP.CFrame

    player.Character = walkPart
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

    if walkPart and originalHRP then
        originalHRP.CFrame = walkPart.PrimaryPart.CFrame
        walkPart:Destroy()
    end

    player.Character = originalCharacter
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
    end
end

UserInputService.InputBegan:Connect(onInputBegan)
