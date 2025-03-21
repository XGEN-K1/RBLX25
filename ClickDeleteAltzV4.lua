-- Налаштування
local HOLD_DURATION = 0.5
local ALT_KEY = Enum.KeyCode.LeftAlt
local RESTORE_KEY = Enum.KeyCode.Z
local TOGGLE_MODE_KEY = Enum.KeyCode.Backspace

-- Початковий режим: 1 – режим uncollide, 2 – режим delete
local currentMode = 1

-- Сервіси та об'єкти
local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local StarterGui = game:GetService("StarterGui")
local Camera = workspace.CurrentCamera
local Plr = Players.LocalPlayer
local Mouse = Plr:GetMouse()

-- Контейнер для видалених частин у режимі 2
local deletionStorage = game:GetService("ReplicatedStorage")

-- Таблиця для збереження змінених/видалених частин та їхніх початкових властивостей
local actions = {}

-- Функція для відправки повідомлення (notification)
local function sendNotification(title, text)
	StarterGui:SetCore("SendNotification", {
		Title = title,
		Text = text,
		Duration = 3
	})
end

-- Перемикання режиму за alt+Backspace
UIS.InputBegan:Connect(function(input, gameProcessed)
	if gameProcessed then return end
	if input.KeyCode == TOGGLE_MODE_KEY and UIS:IsKeyDown(ALT_KEY) then
		if currentMode == 1 then
			currentMode = 2
			sendNotification("Mode 2", "part delete")
		else
			currentMode = 1
			sendNotification("Mode 1", "part uncollide")
		end
	end
end)

-- Функція для проведення променевого пошуку, ігноруючи вже змінені частини
local function raycastIgnoringModified()
	local rayOrigin = Camera.CFrame.Position
	local mousePos = UIS:GetMouseLocation()
	local unitRay = Camera:ScreenPointToRay(mousePos.X, mousePos.Y)
	local rayDirection = unitRay.Direction * 1000
	local raycastParams = RaycastParams.new()
	local ignoreList = {}
	for _, record in ipairs(actions) do
		if record.part and record.part.Parent then
			table.insert(ignoreList, record.part)
		end
	end
	raycastParams.FilterDescendantsInstances = ignoreList
	raycastParams.FilterType = Enum.RaycastFilterType.Blacklist
	local result = workspace:Raycast(rayOrigin, rayDirection, raycastParams)
	return result
end

-- Функція для збереження поточного стану частини та застосування нових властивостей (режим uncollide)
local function modifyPart(part, newTransparency)
	if part:IsA("BasePart") then
		local alreadyModified = false
		for _, record in ipairs(actions) do
			if record.part == part then
				alreadyModified = true
				break
			end
		end
		if not alreadyModified then
			table.insert(actions, {
				part = part,
				oldTransparency = part.Transparency,
				oldCanCollide = part.CanCollide,
				oldCanQuery = part.CanQuery,
				oldMaterial = part.Material,
				oldColor = part.Color,
				mode = 1
			})
		end
		part.Transparency = newTransparency
		part.CanCollide = false
		part.CanQuery = false
		part.Material = Enum.Material.DiamondPlate
		--part.Color = Color3.new(0, 0, 0)
	end
end

-- Функція для видалення частини (режим delete)
local function deletePart(part)
	if part:IsA("BasePart") then
		local alreadyModified = false
		for _, record in ipairs(actions) do
			if record.part == part then
				alreadyModified = true
				break
			end
		end
		if not alreadyModified then
			table.insert(actions, {
				part = part,
				oldTransparency = part.Transparency,
				oldCanCollide = part.CanCollide,
				oldCanQuery = part.CanQuery,
				oldMaterial = part.Material,
				oldColor = part.Color,
				mode = 2
			})
		end
		part.Parent = deletionStorage
	end
end

-- Обробка натискання alt + лівої кнопки миші
Mouse.Button1Down:Connect(function()
	if not UIS:IsKeyDown(ALT_KEY) then return end
	local result = raycastIgnoringModified()
	if result and result.Instance then
		if currentMode == 1 then
			modifyPart(result.Instance, 0.5)
		elseif currentMode == 2 then
			deletePart(result.Instance)
		end
	end
end)

-- Обробка натискання alt + середньої кнопки миші
UIS.InputBegan:Connect(function(input, gameProcessed)
	if gameProcessed then return end
	if input.UserInputType == Enum.UserInputType.MouseButton3 and UIS:IsKeyDown(ALT_KEY) then
		-- Функція uncollide працює завжди як раніше незалежно від режиму
		local result = raycastIgnoringModified()
		if result and result.Instance then
			modifyPart(result.Instance, 1)
		end
	end
end)

-- Змінні для визначення часу зажаття RESTORE_KEY
local holdStart = 0
local isHolding = false

-- Функція для відновлення властивостей частини
local function restoreAction(record)
	if record.part then
		-- Якщо частина була видалена (режим delete), повертаємо її в workspace
		if record.mode == 2 and record.part.Parent ~= workspace then
			record.part.Parent = workspace
		end
		-- Відновлюємо початкові властивості
		record.part.Transparency = record.oldTransparency
		record.part.CanCollide = record.oldCanCollide
		record.part.CanQuery = record.oldCanQuery
		record.part.Material = record.oldMaterial
		record.part.Color = record.oldColor
	end
end

-- Обробка натискання клавіші RESTORE_KEY (альт+z)
UIS.InputBegan:Connect(function(input, gameProcessed)
	if gameProcessed then return end
	if input.KeyCode == RESTORE_KEY and UIS:IsKeyDown(ALT_KEY) then
		holdStart = tick()
		isHolding = true
		spawn(function()
			while isHolding do
				if tick() - holdStart >= HOLD_DURATION then
					for i = #actions, 1, -1 do
						local record = table.remove(actions, i)
						restoreAction(record)
					end
					isHolding = false
					break
				end
				wait(0.05)
			end
		end)
	end
end)

-- Обробка відпускання клавіші RESTORE_KEY
UIS.InputEnded:Connect(function(input, gameProcessed)
	if input.KeyCode == RESTORE_KEY then
		if isHolding then
			if tick() - holdStart < HOLD_DURATION then
				while #actions > 0 do
					local record = table.remove(actions)
					if record.part and record.part.Parent then
						restoreAction(record)
						break
					end
				end
			end
			isHolding = false
		end
	end
end)
