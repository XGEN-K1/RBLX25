-- Налаштування
local HOLD_DURATION = 0.5 -- скільки секунд потрібно зажимати RESTORE_KEY для повернення всіх видалених частин
local REMOVE_KEY = Enum.KeyCode.LeftAlt -- клавіша, яку потрібно тримати для видалення частин при кліку миші
local RESTORE_KEY = Enum.KeyCode.Z       -- клавіша, яку потрібно натиснути (разом з REMOVE_KEY) для повернення частин

-- Сервіси та об'єкти
local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local Plr = Players.LocalPlayer
local Mouse = Plr:GetMouse()

local AltZ = {} -- таблиця для зберігання видалених частин

-- Видалення об'єкта при кліку миші з натиснутою клавішею REMOVE_KEY
Mouse.Button1Down:Connect(function()
	if not UIS:IsKeyDown(REMOVE_KEY) then return end
	if not Mouse.Target then return end
	local Object = Mouse.Target
	Object.Parent = game.ReplicatedStorage
	table.insert(AltZ, Object)
end)

-- Змінні для визначення часу зажаття RESTORE_KEY
local holdStart = 0
local isHolding = false

-- Обробка натискання клавіші RESTORE_KEY
UIS.InputBegan:Connect(function(input, gameProcessed)
	-- Перевіряємо, чи натиснуто RESTORE_KEY та чи тримається REMOVE_KEY
	if input.KeyCode == RESTORE_KEY and UIS:IsKeyDown(REMOVE_KEY) then
		holdStart = tick()
		isHolding = true
		-- Запускаємо перевірку часу зажаття
		spawn(function()
			while isHolding do
				if tick() - holdStart >= HOLD_DURATION then
					-- Якщо зажато на HOLD_DURATION секунд, повертаємо всі видалені частини
					for i, part in ipairs(AltZ) do
						part.Parent = workspace
					end
					AltZ = {}  -- очищаємо таблицю
					isHolding = false
					break
				end
				wait(0.1)
			end
		end)
	end
end)

-- Обробка відпускання клавіші RESTORE_KEY
UIS.InputEnded:Connect(function(input, gameProcessed)
	-- Якщо відпущено RESTORE_KEY і зажаття було менше HOLD_DURATION, повертаємо останню видалену частину
	if input.KeyCode == RESTORE_KEY then
		if isHolding then
			if tick() - holdStart < HOLD_DURATION then
				if #AltZ > 0 then
					local lastPart = AltZ[#AltZ]
					lastPart.Parent = workspace
					table.remove(AltZ, #AltZ)
				end
			end
			isHolding = false
		end
	end
end)
