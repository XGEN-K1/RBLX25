getgenv().Speed = 0.05

local TweenService = game:GetService("TweenService")
local LocalPlayer = game:GetService("Players").LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local Animation = Instance.new("Animation")
Animation.AnimationId = "rbxassetid://698251653"

local Tween
local Reverse = false

local Track = Character:WaitForChild("Humanoid"):LoadAnimation(Animation)
Track.Looped = true
Track:Play()
Track:AdjustSpeed(0)
Track.TimePosition = 0.6

local function TweenTimePosition(From, To)
    local TweenInfo = TweenInfo.new(Speed, Enum.EasingStyle.Linear)
    Tween = TweenService:Create(Track, TweenInfo, {TimePosition = To})
    Tween:Play()

    Transitioner = Tween.Completed:Connect(function()
        Reverse = not Reverse
        TweenTimePosition(Reverse and To or From, Reverse and From or To)
    end)
end

TweenTimePosition(0.6, 0.7)