local P1000ToggleKey = "x" -- Змініть на потрібну клавішу для активації/деактивації

--// Services
local checkcaller = checkcaller
local newcclosure = newcclosure
local hookmetamethod = hookmetamethod

local PastedSources = false
local BruhXD = game:GetService("RunService")
local LocalPlayer = game:GetService("Players").LocalPlayer
local Bullshit = LocalPlayer:GetMouse()

--// Camera Distance Settings
local cameraDistance = 10 -- Початкова відстань камери
local minDistance = 5 -- Мінімальна відстань
local maxDistance = 50 -- Максимальна відстань
local zoomSpeed = 1 -- Швидкість зміни відстані

--// Desync Settings
local desyncEnabled = true
local desyncIntensity = 6000 -- У 10 разів більше значення
local desyncVelocity = Vector3.new(1, 1, 1) * 999999 -- Швидкість дезінхронізації

--// Toggles
Bullshit.KeyDown:Connect(function(SayNoToOblivity)
    if SayNoToOblivity == string.lower(P1000ToggleKey) then
        pcall(function()
            if not PastedSources then
                PastedSources = true
                local camera = workspace.CurrentCamera
                local head = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Head")
                if head then
                    cameraDistance = (camera.CFrame.Position - head.Position).Magnitude
                end
                print("Enabled P1000 | Initial Camera Distance: " .. cameraDistance)
            else
                PastedSources = false
                print("Disabled P1000")
            end
        end)
    end
end)

Bullshit.KeyDown:Connect(function(SayNoToOblivity)
    if SayNoToOblivity == "=" then
        game:GetService("TeleportService"):Teleport(game.PlaceId, LocalPlayer)
    end
end)

--// Zoom In/Out
Bullshit.WheelForward:Connect(function()
    cameraDistance = math.clamp(cameraDistance - zoomSpeed, minDistance, maxDistance)
end)

Bullshit.WheelBackward:Connect(function()
    cameraDistance = math.clamp(cameraDistance + zoomSpeed, minDistance, maxDistance)
end)

--// Desync Source
function RandomNumberRange(a)
    return math.random(-a * 100, a * 100) / 10 -- У 10 разів більші значення
end

local DesyncTypes = {}

BruhXD.Heartbeat:Connect(function()
    if PastedSources and desyncEnabled and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        local HumanoidRootPart = LocalPlayer.Character.HumanoidRootPart
        DesyncTypes[1] = HumanoidRootPart.CFrame
        DesyncTypes[2] = HumanoidRootPart.AssemblyLinearVelocity

        local SpoofThis = HumanoidRootPart.CFrame
        SpoofThis = SpoofThis * CFrame.Angles(
            math.rad(RandomNumberRange(desyncIntensity)),
            math.rad(RandomNumberRange(desyncIntensity)),
            math.rad(RandomNumberRange(desyncIntensity))
        ) * CFrame.new(
            RandomNumberRange(10), -- Додаємо ще й випадковий зсув по X
            RandomNumberRange(10), -- Додаємо ще й випадковий зсув по Y
            RandomNumberRange(10)  -- Додаємо ще й випадковий зсув по Z
        )

        HumanoidRootPart.CFrame = SpoofThis
        HumanoidRootPart.AssemblyLinearVelocity = desyncVelocity

        BruhXD.RenderStepped:Wait()

        HumanoidRootPart.CFrame = DesyncTypes[1]
        HumanoidRootPart.AssemblyLinearVelocity = DesyncTypes[2]
    end
end)

--// Camera Stabilization
local function StabilizeCamera()
    if PastedSources and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        local rootPart = LocalPlayer.Character.HumanoidRootPart
        local camera = workspace.CurrentCamera
        local head = LocalPlayer.Character:FindFirstChild("Head")

        if head then
            local cameraCFrame = camera.CFrame
            local targetPosition = head.Position
            local cameraLookVector = cameraCFrame.LookVector
            local cameraOffset = cameraLookVector * -cameraDistance

            camera.CFrame = CFrame.new(targetPosition + cameraOffset, targetPosition)
        end
    end
end

BruhXD.RenderStepped:Connect(StabilizeCamera)

--// Hook_CFrame
local XDDDDDD = nil
XDDDDDD = hookmetamethod(game, "__index", newcclosure(function(self, key)
    if PastedSources and not checkcaller() then
        if key == "CFrame" and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and LocalPlayer.Character:FindFirstChild("Humanoid") and LocalPlayer.Character:FindFirstChild("Humanoid").Health > 0 then
            if self == LocalPlayer.Character.HumanoidRootPart then
                return DesyncTypes[1] or CFrame.new()
            elseif self == LocalPlayer.Character.Head then
                return DesyncTypes[1] and DesyncTypes[1] + Vector3.new(0, LocalPlayer.Character.HumanoidRootPart.Size / 2 + 0.5, 0) or CFrame.new()
            end
        end
    end
    return XDDDDDD(self, key)
end))
