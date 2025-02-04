local P1000ToggleKey = "x" -- Змініть на потрібну клавішу: "t"

--[[
    Standing still will trick the hitbox, you won't be able to get hit.

    DO NOT EDIT BEYOND THIS POINT IF YOU DON'T UNDERSTAND WHAT IS GOING ON.
    
    ORIGINAL SOURCE PUT INTO SKID FRIENDLY FORMAT TAKE WHAT YOU LIKE AND MAKE MANY MORE OBLIVITIES CLONES WITH THIS OR EVEN YOUR VERY OWN DIY OBLIVITY!
    
    AND REMEMBER TO SAY, SO LOOOOONG OBLIVITYYYYYY!!!
--]]

--// Services
local checkcaller = checkcaller
local newcclosure = newcclosure
local hookmetamethod = hookmetamethod

local PastedSources = false
local BruhXD = game:GetService("RunService")
local LocalPlayer = game:GetService("Players").LocalPlayer
local Bullshit = LocalPlayer:GetMouse()

--// Camera Distance Settings
local cameraDistance = 10 -- Початкова відстань камери (буде перезаписано)
local minDistance = 5 -- Мінімальна відстань
local maxDistance = 50 -- Максимальна відстань (збільшено)
local zoomSpeed = 1 -- Швидкість збільшення/зменшення

--// Toggles
Bullshit.KeyDown:Connect(function(SayNoToOblivity)
    if SayNoToOblivity == string.lower(P1000ToggleKey) then
        pcall(function()
            if PastedSources == false then
                PastedSources = true
                -- Зчитуємо початкову відстань камери
                local camera = workspace.CurrentCamera
                local head = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Head")
                if head then
                    cameraDistance = (camera.CFrame.Position - head.Position).Magnitude
                end
                print("Enabled P1000 | Initial Camera Distance: " .. cameraDistance)
            elseif PastedSources == true then
                PastedSources = false
                print("Disabled P1000")
            end
        end)
    end
end)

Bullshit.KeyDown:Connect(function(SayNoToOblivity)
    if SayNoToOblivity == ("=") then
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

--// Desync_Source
function RandomNumberRange(a)
    return math.random(-a * 100, a * 100) / 100
end

function RandomVectorRange(a, b, c)
    return Vector3.new(RandomNumberRange(a), RandomNumberRange(b), RandomNumberRange(c))
end

local DesyncTypes = {}
local Camera = workspace.CurrentCamera

BruhXD.Heartbeat:Connect(function()
    if PastedSources == true then
        DesyncTypes[1] = LocalPlayer.Character.HumanoidRootPart.CFrame
        DesyncTypes[2] = LocalPlayer.Character.HumanoidRootPart.AssemblyLinearVelocity

        local SpoofThis = LocalPlayer.Character.HumanoidRootPart.CFrame

        SpoofThis = SpoofThis * CFrame.new(Vector3.new(0, 0, 0))
        SpoofThis = SpoofThis * CFrame.Angles(math.rad(RandomNumberRange(180)), math.rad(RandomNumberRange(180)), math.rad(RandomNumberRange(180)))

        LocalPlayer.Character.HumanoidRootPart.CFrame = SpoofThis

        LocalPlayer.Character.HumanoidRootPart.AssemblyLinearVelocity = Vector3.new(1, 1, 1) * 16384

        BruhXD.RenderStepped:Wait()

        LocalPlayer.Character.HumanoidRootPart.CFrame = DesyncTypes[1]
        LocalPlayer.Character.HumanoidRootPart.AssemblyLinearVelocity = DesyncTypes[2]
    end
end)

--// Camera Stabilization (Fixed Above Head with Zoom)
local function StabilizeCamera()
    if PastedSources == true and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        local rootPart = LocalPlayer.Character.HumanoidRootPart
        local camera = workspace.CurrentCamera
        local head = LocalPlayer.Character:FindFirstChild("Head")

        if head then
            -- Отримуємо поточну позицію та орієнтацію камери
            local cameraCFrame = camera.CFrame

            -- Визначаємо цільову позицію камери (в голові персонажа)
            local targetPosition = head.Position

            -- Зберігаємо орієнтацію камери (куди дивиться гравець)
            local cameraLookVector = cameraCFrame.LookVector

            -- Враховуємо відстань камери
            local cameraOffset = cameraLookVector * -cameraDistance

            -- Встановлюємо камеру зі збереженням орієнтації та відстані
            camera.CFrame = CFrame.new(targetPosition + cameraOffset, targetPosition)
        end
    end
end

BruhXD.RenderStepped:Connect(StabilizeCamera)

--// Hook_CFrame
local XDDDDDD = nil
XDDDDDD = hookmetamethod(game, "__index", newcclosure(function(self, key)
    if PastedSources == true then
        if not checkcaller() then
            if key == "CFrame" and PastedSources == true and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and LocalPlayer.Character:FindFirstChild("Humanoid") and LocalPlayer.Character:FindFirstChild("Humanoid").Health > 0 then
                if self == LocalPlayer.Character.HumanoidRootPart then
                    return DesyncTypes[1] or CFrame.new()
                elseif self == LocalPlayer.Character.Head then
                    return DesyncTypes[1] and DesyncTypes[1] + Vector3.new(0, LocalPlayer.Character.HumanoidRootPart.Size / 2 + 0.5, 0) or CFrame.new()
                end
            end
        end
    end
    return XDDDDDD(self, key)
end))