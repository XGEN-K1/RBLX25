local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer
local camera = workspace.CurrentCamera

local TOGGLE_KEY = Enum.KeyCode.Z
local TELEPORT_OFFSET = Vector3.new(0, -5, 0)

local isFakeMode = false
local originalCharacter = nil
local fakeCharacter = nil
local originalHRP = nil
local fakeHRP = nil
local heartbeatConn = nil

local function setModelTransparency(model, transparency)
	for _, obj in ipairs(model:GetDescendants()) do
		if obj:IsA("BasePart") then
			obj.Transparency = transparency
			obj.CastShadow = false
		end
	end
end

local function enterFakeMode()
	originalCharacter = player.Character or player.CharacterAdded:Wait()
	if not originalCharacter then
		warn("Основний персонаж не знайдено!")
		return
	end

	originalCharacter.Archivable = true

	local hrp = originalCharacter:FindFirstChild("HumanoidRootPart") or originalCharacter:WaitForChild("HumanoidRootPart", 5)
	if not hrp then
		warn("HumanoidRootPart не знайдено в основному персонажі!")
		return
	end

	local success, clone = pcall(function() return originalCharacter:Clone() end)
	if not success or not clone then
		warn("Не вдалося створити копію персонажа!")
		return
	end
	fakeCharacter = clone
	fakeCharacter.Name = "FakeCharacter"
	fakeCharacter.Parent = workspace

	fakeHRP = fakeCharacter:FindFirstChild("HumanoidRootPart") or fakeCharacter:WaitForChild("HumanoidRootPart", 5)
	originalHRP = originalCharacter:FindFirstChild("HumanoidRootPart")
	if not fakeHRP or not originalHRP then
		warn("HumanoidRootPart не знайдено!")
		return
	end

	setModelTransparency(fakeCharacter, 0.5)

	player.Character = fakeCharacter
	local fakeHumanoid = fakeCharacter:FindFirstChildOfClass("Humanoid")
	if fakeHumanoid then
		camera.CameraSubject = fakeHumanoid
	end

	heartbeatConn = RunService.Heartbeat:Connect(function()
		if fakeHRP and originalHRP then
			originalHRP.CFrame = fakeHRP.CFrame * CFrame.new(0, TELEPORT_OFFSET.Y, 0)
		end
	end)
	isFakeMode = true
end

local function exitFakeMode()
	if heartbeatConn then
		heartbeatConn:Disconnect()
		heartbeatConn = nil
	end

	if fakeCharacter then
		if originalHRP and fakeHRP then
			originalHRP.CFrame = fakeHRP.CFrame
		end

		player.Character = originalCharacter
		local origHumanoid = originalCharacter:FindFirstChildOfClass("Humanoid")
		if origHumanoid then
			camera.CameraSubject = origHumanoid
		end

		fakeCharacter:Destroy()
		fakeCharacter = nil
	end
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

player.CharacterAdded:Connect(function(char)
	originalCharacter = char
	if not isFakeMode then
		local hum = char:WaitForChild("Humanoid")
		if hum then
			camera.CameraSubject = hum
		end
	end
end)
