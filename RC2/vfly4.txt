-- Roblox GUI для контролю польоту з можливістю зміни швидкості
local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local FLYING = false
local vehicleflyspeed = 2  -- Стандартна швидкість польоту
local CONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
local SPEED = 0

-- Створення основного фрейму GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = Players.LocalPlayer:WaitForChild("PlayerGui")

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 300, 0, 200)
MainFrame.Position = UDim2.new(0, 10, 0, 10)
MainFrame.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
MainFrame.BackgroundTransparency = 0.9
MainFrame.Parent = ScreenGui

-- Робимо MainFrame перетягуваним за допомогою властивості Draggable
MainFrame.Draggable = true
MainFrame.Active = true

-- Функція для створення текстових полів і кнопок для швидкості
local function createSpeedControl()
    local speedInputs = {}
    local speedButtons = {}

    -- Створення полів введення для швидкості
    for i = 1, 3 do
        local inputField = Instance.new("TextBox")
        inputField.Size = UDim2.new(0, 80, 0, 30)
        inputField.Position = UDim2.new(0, 10 + (i - 1) * 100, 0, 40)
        inputField.PlaceholderText = "Speed " .. i
        inputField.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		inputField.BackgroundTransparency = 0.5
        -- Встановлення стандартних значень швидкості
        inputField.Text = i == 1 and "2" or (i == 2 and "5" or "10")
		inputField.TextColor3 = Color3.fromRGB(255, 255, 255)
        inputField.Parent = MainFrame
        table.insert(speedInputs, inputField)
    end

    -- Створення кнопок для активації швидкості
    for i = 1, 3 do
        local speedButton = Instance.new("TextButton")
        speedButton.Size = UDim2.new(0, 80, 0, 30)
        speedButton.Position = UDim2.new(0, 10 + (i - 1) * 100, 0, 80)
        speedButton.Text = "Set Speed " .. i
		speedButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        speedButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		speedButton.BackgroundTransparency = 0.5
        speedButton.Parent = MainFrame
        table.insert(speedButtons, speedButton)
    end

    -- Додавання кнопки для активації/деактивації польоту
    local flyButton = Instance.new("TextButton")
    flyButton.Size = UDim2.new(0, 280, 0, 30)
    flyButton.Position = UDim2.new(0, 10, 0, 130)
    flyButton.Text = "Toggle Fly"
	flyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    flyButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	flyButton.BackgroundTransparency = 0.5
    flyButton.Parent = MainFrame

    return speedInputs, speedButtons, flyButton
end

local speedInputs, speedButtons, flyButton = createSpeedControl()

-- Функція для зміни швидкості
local function updateSpeed(speedIndex)
    local speedValue = tonumber(speedInputs[speedIndex].Text)
    if speedValue then
        vehicleflyspeed = speedValue
    end
end

-- Додавання подій для кнопок зміни швидкості
for i = 1, 3 do
    speedButtons[i].MouseButton1Click:Connect(function()
        updateSpeed(i)
    end)
end

-- Створення функції для польоту
local function sFLY(vfly)
    repeat wait() until Players.LocalPlayer and Players.LocalPlayer.Character and 
        Players.LocalPlayer.Character:FindFirstChild("Humanoid")
    repeat wait() until game:GetService("Players").LocalPlayer:GetMouse()

    local T = Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
    local BG = Instance.new("BodyGyro")
    local BV = Instance.new("BodyVelocity")
    BG.P = 9e4
    BG.Parent = T
    BV.Parent = T
    BG.maxTorque = Vector3.new(9e9, 9e9, 9e9)
    BG.cframe = T.CFrame
    BV.velocity = Vector3.new(0, 0, 0)
    BV.maxForce = Vector3.new(9e9, 9e9, 9e9)

    task.spawn(function()
        repeat wait()
            if not vfly and Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
                Players.LocalPlayer.Character:FindFirstChild("Humanoid").PlatformStand = true
            end

            SPEED = (CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0 or CONTROL.Q + CONTROL.E ~= 0) and vehicleflyspeed or 0

            if SPEED > 0 then
                BV.velocity = (workspace.CurrentCamera.CoordinateFrame.lookVector * (CONTROL.F + CONTROL.B) + 
                workspace.CurrentCamera.CoordinateFrame.RightVector * (CONTROL.L + CONTROL.R)) * SPEED
            else
                BV.velocity = Vector3.new(0, 0, 0)
            end
            BG.cframe = workspace.CurrentCamera.CoordinateFrame
        until not FLYING

        BG:Destroy()
        BV:Destroy()
    end)
end

-- Функція для управління клавіатурою
local function FlyControls(KEY, isDown)
    if KEY:lower() == 'w' then
        CONTROL.F = isDown and (vehicleflyspeed * 50) or 0
    elseif KEY:lower() == 's' then
        CONTROL.B = isDown and (-vehicleflyspeed * 50) or 0
    elseif KEY:lower() == 'a' then
        CONTROL.L = isDown and (-vehicleflyspeed * 50) or 0
    elseif KEY:lower() == 'd' then
        CONTROL.R = isDown and (vehicleflyspeed * 50) or 0
    end
end

-- Події для клавіатури
UIS.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Keyboard then
        FlyControls(input.KeyCode.Name, true)
    end
end)

UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Keyboard then
        FlyControls(input.KeyCode.Name, false)
    end
end)

-- Подія для активації/деактивації польоту
flyButton.MouseButton1Click:Connect(function()
    if FLYING then
        FLYING = false
    else
        FLYING = true
        sFLY(true)
    end
end)

