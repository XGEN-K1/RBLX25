local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local rootPart = character:FindFirstChild("HumanoidRootPart")

if not rootPart then
    warn("HumanoidRootPart not found!")
    return
end

local groundLoot = workspace:FindFirstChild("GroundLoot")
if not groundLoot then
    warn("GroundLoot not found!")
    return
end

for _, item in ipairs(groundLoot:GetChildren()) do
    local tixonia = item:FindFirstChild("Tixonia [1]")
    if tixonia then
        for _, obj in ipairs(tixonia:GetChildren()) do
            if obj:IsA("TouchTransmitter") then
                local parent = obj.Parent
                if parent and parent:IsA("BasePart") then
                    parent.Position = rootPart.Position + Vector3.new(math.random(-2, 2), 1, math.random(-2, 2))
                end
            end
        end
    end
end
