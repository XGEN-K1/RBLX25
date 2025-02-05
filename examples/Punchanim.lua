local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local punchKey = Enum.KeyCode.F
local punchPower = 100 -- Налаштуйте силу відштовхування

local function onCharacterAdded(char)
    character = char
    humanoid = character:WaitForChild("Humanoid")
end

local function onInputBegan(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == punchKey then
        local animation
        if humanoid.RigType == Enum.HumanoidRigType.R6 then
            animation = Instance.new("Animation")
            animation.AnimationId = "rbxassetid://204062532" -- Анімація для R6
        else
            animation = Instance.new("Animation")
            animation.AnimationId = "rbxassetid://567480369" -- Анімація для R15
        end

        local animTrack = humanoid:LoadAnimation(animation)
        animTrack:Play()

        local function onTouch(otherPart)
            local otherHumanoid = otherPart.Parent:FindFirstChildOfClass("Humanoid")
            if otherHumanoid and otherHumanoid ~= humanoid then
                local otherHRP = otherPart.Parent:FindFirstChild("HumanoidRootPart")
                if otherHRP then
                    local direction = (otherHRP.Position - character.HumanoidRootPart.Position).unit
                    otherHRP.Velocity = direction * punchPower
                end
            end
        end

        local connection
        connection = character.HumanoidRootPart.Touched:Connect(function(hit)
            onTouch(hit)
            connection:Disconnect()
        end)
    end
end

UserInputService.InputBegan:Connect(onInputBegan)
player.CharacterAdded:Connect(onCharacterAdded)

humanoid.Died:Connect(function()
    UserInputService.InputBegan:Disconnect(onInputBegan)
end)
