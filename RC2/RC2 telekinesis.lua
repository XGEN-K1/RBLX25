if game.PlaceId ~= 12196278347 then
    --warn("Цей скрипт можна використовувати лише в грі з ID 12196278347.")
    return
end

local player = game.Players.LocalPlayer
local mouse = player:GetMouse()
local tool = Instance.new("Tool")
tool.Name = "ObjectGrabber"
tool.RequiresHandle = false
tool.Parent = player.Backpack

local gui = Instance.new("ScreenGui")
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 200, 0, 150)
frame.Position = UDim2.new(0.5, -100, 0.5, -75)
frame.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
frame.Active = true
frame.Draggable = true
frame.Parent = gui

local modeLabel = Instance.new("TextLabel")
modeLabel.Size = UDim2.new(1, 0, 0.2, 0)
modeLabel.Position = UDim2.new(0, 0, 0, 0)
modeLabel.Text = "Mode: 1"
modeLabel.TextColor3 = Color3.new(1, 1, 1)
modeLabel.Parent = frame

local mode1Button = Instance.new("TextButton")
mode1Button.Size = UDim2.new(0.3, 0, 0.2, 0)
mode1Button.Position = UDim2.new(0, 0, 0.25, 0)
mode1Button.Text = "Mode 1"
mode1Button.Parent = frame

local mode2Button = Instance.new("TextButton")
mode2Button.Size = UDim2.new(0.3, 0, 0.2, 0)
mode2Button.Position = UDim2.new(0.35, 0, 0.25, 0)
mode2Button.Text = "Mode 2"
mode2Button.Parent = frame

local mode3Button = Instance.new("TextButton")
mode3Button.Size = UDim2.new(0.3, 0, 0.2, 0)
mode3Button.Position = UDim2.new(0.7, 0, 0.25, 0)
mode3Button.Text = "Mode 3"
mode3Button.Parent = frame

local clearButton = Instance.new("TextButton")
clearButton.Size = UDim2.new(0.6, 0, 0.2, 0)
clearButton.Position = UDim2.new(0.2, 0, 0.5, 0)
clearButton.Text = "Clear Targets"
clearButton.Parent = frame

local selectedObjects = {}
local currentMode = 1
local dragging = false
local dragConnection = nil
local dragHighlight = nil

local function highlightObject(obj, highlight, color)
    if highlight then
        local highlight = Instance.new("SelectionBox")
        highlight.Adornee = obj
        highlight.Color3 = color or Color3.new(1, 0.5, 0)
        highlight.LineThickness = 0.05 -- Тонкий аутлайн
        highlight.Parent = obj
        return highlight
    else
        for _, child in pairs(obj:GetChildren()) do
            if child:IsA("SelectionBox") then
                child:Destroy()
            end
        end
    end
end

local function selectModelParts(model)
    for _, part in pairs(model:GetDescendants()) do
        if part:IsA("BasePart") or part:IsA("MeshPart") then
            selectedObjects[part] = true
            highlightObject(part, true)
        end
    end
end

mode1Button.MouseButton1Click:Connect(function()
    currentMode = 1
    modeLabel.Text = "Mode: 1"
end)

mode2Button.MouseButton1Click:Connect(function()
    currentMode = 2
    modeLabel.Text = "Mode: 2"
end)

mode3Button.MouseButton1Click:Connect(function()
    currentMode = 3
    modeLabel.Text = "Mode: 3"
end)

clearButton.MouseButton1Click:Connect(function()
    for obj, _ in pairs(selectedObjects) do
        highlightObject(obj, false)
    end
    selectedObjects = {}
end)

tool.Activated:Connect(function()
    if currentMode == 1 then
        local target = mouse.Target
        if target and target:IsDescendantOf(workspace.Grab) then
            local model = target:FindFirstAncestorOfClass("Model")
            if model then
                if selectedObjects[model] then
                    for part, _ in pairs(selectedObjects) do
                        if part:IsDescendantOf(model) then
                            selectedObjects[part] = nil
                            highlightObject(part, false)
                        end
                    end
                    selectedObjects[model] = nil
                else
                    selectModelParts(model)
                    selectedObjects[model] = true
                end
            end
        end
    elseif currentMode == 2 then
        local pos = mouse.Hit.p + Vector3.new(0, 5, 0)
        for obj, _ in pairs(selectedObjects) do
            if obj:IsA("BasePart") or obj:IsA("MeshPart") then
                obj.Position = pos
            end
        end
    elseif currentMode == 3 then
        if not dragging then
            local target = mouse.Target
            if target and target:IsDescendantOf(workspace.Grab) and (target:IsA("BasePart") or target:IsA("MeshPart")) then
                local model = target:FindFirstAncestorOfClass("Model")
                if model then
                    dragging = true
                    dragHighlight = highlightObject(target, true, Color3.new(0, 0, 0)) -- Чорний аутлайн
                    selectModelParts(model) -- Вибираємо всі частини моделі
                    dragConnection = mouse.Move:Connect(function()
                        local ray = mouse.UnitRay
                        local newPosition = ray.Origin + ray.Direction * (ray.Origin - target.Position).Magnitude
                        for part, _ in pairs(selectedObjects) do
                            if part:IsDescendantOf(model) then
                                part.Position = part.Position + (newPosition - target.Position)
                            end
                        end
                    end)
                end
            end
        else
            dragging = false
            if dragConnection then
                dragConnection:Disconnect()
                dragConnection = nil
            end
            if dragHighlight then
                dragHighlight:Destroy()
                dragHighlight = nil
            end
        end
    end
end)

tool.Equipped:Connect(function()
    gui.Parent = player.PlayerGui
end)

tool.Unequipped:Connect(function()
    gui.Parent = nil
end)