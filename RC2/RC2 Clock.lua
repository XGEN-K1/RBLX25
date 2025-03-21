if game.PlaceId ~= 12196278347 then
    --warn("Цей скрипт можна використовувати лише в грі з ID 12196278347.")
    return
end
-- Створення ScreenGui та основного фрейму
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "CustomClockGui"
screenGui.Parent = playerGui
screenGui.ResetOnSpawn = false

-- Висота верхньої панелі
local topBarHeight = 25
-- Висота тексту з годинником
local timeLabelHeight = 40
-- Висота панелі з додатковою інформацією
local extraInfoHeight = 60

-- Загальна висота фрейму у "згорнутому" стані = висота TopBar + висота TimeLabel
local collapsedHeight = topBarHeight + timeLabelHeight
-- Загальна висота фрейму у "розгорнутому" стані = collapsedHeight + extraInfoHeight
local expandedHeight = collapsedHeight + extraInfoHeight

-- Створюємо головний фрейм і виставляємо початковий розмір (згорнутий)
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Parent = screenGui
mainFrame.Size = UDim2.new(0, 200, 0, collapsedHeight)
mainFrame.Position = UDim2.new(0.70, -0, 0.0, -50)
mainFrame.BackgroundTransparency = 0.9
mainFrame.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
mainFrame.Active = true
mainFrame.Draggable = true

-- Панель управління (верхня частина для кнопок)
local topBar = Instance.new("Frame")
topBar.Name = "TopBar"
topBar.Parent = mainFrame
topBar.Size = UDim2.new(1, 0, 0, topBarHeight)
topBar.BackgroundTransparency = 0.9
topBar.BackgroundColor3 = Color3.new(0.15, 0.15, 0.15)

-- Кнопка закрити (праворуч)
local closeButton = Instance.new("TextButton")
closeButton.Name = "CloseButton"
closeButton.Parent = topBar
closeButton.Size = UDim2.new(0, 25, 1, 0)
closeButton.Position = UDim2.new(1, -25, 0, 0)
closeButton.BackgroundTransparency = 0.3
closeButton.BackgroundColor3 = Color3.new(1, 0, 0)
closeButton.Text = "X"
closeButton.TextColor3 = Color3.new(0, 0, 0)
closeButton.Font = Enum.Font.SourceSansBold
closeButton.TextScaled = true

-- Кнопка розгорнути/згорнути (зліва від кнопки закрити)
local toggleButton = Instance.new("TextButton")
toggleButton.Name = "ToggleButton"
toggleButton.Parent = topBar
toggleButton.Size = UDim2.new(0, 75, 1, 0)
toggleButton.Position = UDim2.new(1, -25-75, 0, 0)
toggleButton.BackgroundTransparency = 0.3
toggleButton.BackgroundColor3 = Color3.new(0.2, 0.6, 0.2)
toggleButton.Text = "Розгорнути"
toggleButton.TextColor3 = Color3.new(1, 1, 1)
toggleButton.Font = Enum.Font.SourceSansBold
toggleButton.TextScaled = true

-- Лейбл для показу часу
local timeLabel = Instance.new("TextLabel")
timeLabel.Name = "TimeLabel"
timeLabel.Parent = mainFrame
timeLabel.Size = UDim2.new(1, 0, 0, timeLabelHeight)
timeLabel.Position = UDim2.new(0, 0, 0, topBarHeight)
timeLabel.BackgroundTransparency = 0.9
timeLabel.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
timeLabel.Text = "00:00"
timeLabel.TextColor3 = Color3.new(1, 1, 1)
timeLabel.Font = Enum.Font.SourceSansBold
timeLabel.TextScaled = true

-- Панель для додаткової інформації (за замовчуванням схована)
local extraInfo = Instance.new("Frame")
extraInfo.Name = "ExtraInfo"
extraInfo.Parent = mainFrame
extraInfo.Size = UDim2.new(1, 0, 0, extraInfoHeight)
-- Щоб вона "приховувалась" за межами фрейму, розміщуємо її одразу під TimeLabel
-- Але оскільки вона поки що не видима, немає різниці, проте для наочності:
extraInfo.Position = UDim2.new(0, 0, 0, topBarHeight + timeLabelHeight)
extraInfo.BackgroundTransparency = 0.9
extraInfo.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
extraInfo.Visible = false

local infoLabel = Instance.new("TextLabel")
infoLabel.Name = "InfoLabel"
infoLabel.Parent = extraInfo
infoLabel.Size = UDim2.new(1, 0, 1, 0)
infoLabel.BackgroundTransparency = 0.9
infoLabel.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
infoLabel.Text = "FURNITURE: 04:30 - 23:00\nVi's logics 7:00 - 20:00\nCraig's dealership 17:00 - 07:00"
infoLabel.TextColor3 = Color3.new(1, 1, 1)
infoLabel.Font = Enum.Font.SourceSans
infoLabel.TextScaled = true
infoLabel.TextWrapped = true

local expanded = false

-- Функція для оновлення показу часу
local function updateTime()
	local clockObj = workspace:FindFirstChild("ServerData")
	if clockObj then
		clockObj = clockObj:FindFirstChild("CurrentCycle")
		if clockObj then
			clockObj = clockObj:FindFirstChild("ClockTime")
		end
	end
	if clockObj and clockObj.Value then
		local clockVal = clockObj.Value
		local timeStr = string.format("%.2f", clockVal):gsub("%.", ":")
		timeLabel.Text = timeStr
	else
		timeLabel.Text = "00:00"
	end
end

-- Запуск оновлення кожну секунду
local updateConnection
updateConnection = RunService.Heartbeat:Connect(function()
	updateTime()
end)

-- Обробка натиснення кнопки розгорнути/згорнути
toggleButton.MouseButton1Click:Connect(function()
	if not expanded then
		expanded = true
		toggleButton.Text = "Згорнути"
		extraInfo.Visible = true
		local tween = TweenService:Create(
			mainFrame,
			TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
			{Size = UDim2.new(0, 200, 0, expandedHeight)}
		)
		tween:Play()
	else
		expanded = false
		toggleButton.Text = "Розгорнути"
		local tween = TweenService:Create(
			mainFrame,
			TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
			{Size = UDim2.new(0, 200, 0, collapsedHeight)}
		)
		tween:Play()
		tween.Completed:Connect(function()
			extraInfo.Visible = false
		end)
	end
end)

-- Обробка натиснення кнопки закрити
closeButton.MouseButton1Click:Connect(function()
	if updateConnection then
		updateConnection:Disconnect()
	end
	screenGui:Destroy()
end)
