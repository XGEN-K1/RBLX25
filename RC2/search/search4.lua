-- Налаштування (Settings)
local settings = {
	defaultHighlightColor = Color3.new(1, 1, 0),
	fillTransparency = 1,
	outlineTransparency = 0.5,
	activeInterval = 5,
	defaultMode = "Whitelist",
	defaultActive = false,
	defaultXray = false
}

local whitelistConfigs = {
	{
		parent = workspace.WorldSpawn.Trees,
		names = { "Goldwood Tree" },
		color = Color3.new(1, 0, 0)
	},
	{
		parent = workspace.WorldSpawn.Ores,
		names = { "Silver", "Gold", "Ancient Rune", "Flower Grass" },
		color = Color3.new(0, 0, 1)
	}
}

local blacklistTrees = { "Oak", "Fir", "Birch", "Acacia", "Cherry", "Lush Oak", "Palm", "Pine", "Redwood", "Willow", "Acacia", "Maple" }
local blacklistOres = { "Iron","Copper", "Stone", "Aluminium", "Amber", "Bush", "Clay", "Cloudnite", "Deepslate", "Diamond", "Emerald", "Marble", "Null", "Quartz", "Tin", "Tall Grass", "Ice", "Coal" }

local highlightsFolder = Instance.new("Folder")
highlightsFolder.Name = "HighlightsFolder"
highlightsFolder.Parent = workspace

local activeState = settings.defaultActive
local xrayState = settings.defaultXray
local modeState = settings.defaultMode

local function createHighlight(target, color)
	if not target then return end
	for _, child in ipairs(highlightsFolder:GetChildren()) do
		if child:IsA("Highlight") and child.Adornee == target then
			child:Destroy()
		end
	end
	local hl = Instance.new("Highlight")
	hl.Name = "AutoHighlight"
	hl.Adornee = target
	hl.FillTransparency = settings.fillTransparency
	hl.OutlineTransparency = settings.outlineTransparency
	hl.FillColor = color
	hl.OutlineColor = color
	if xrayState then
		hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
	else
		hl.DepthMode = Enum.HighlightDepthMode.Occluded
	end
	hl.Parent = highlightsFolder
end

local function clearHighlights()
	highlightsFolder:ClearAllChildren()
end

local function tableContains(tbl, val)
	for _, v in ipairs(tbl) do
		if v == val then
			return true
		end
	end
	return false
end

local function getTargetObjects()
	local targets = {}
	if modeState == "Whitelist" then
		for _, config in ipairs(whitelistConfigs) do
			if config.parent and config.parent:IsDescendantOf(workspace) then
				-- Обходимо лише безпосередніх дітей, щоб не дублювати об'єкти
				for _, obj in ipairs(config.parent:GetChildren()) do
					if tableContains(config.names, obj.Name) then
						local color = config.color or settings.defaultHighlightColor
						if obj:IsA("Model") or obj:IsA("BasePart") then
							table.insert(targets, {target = obj, color = color})
						end
					end
				end
			end
		end
	elseif modeState == "Blacklist" then
		-- Для дерев та руд шукаємо серед усіх нащадків, що дозволить обійти вкладені структури
		local treesParent = workspace.WorldSpawn.Trees
		if treesParent then
			for _, obj in ipairs(treesParent:GetDescendants()) do
				-- Фільтруємо лише моделі чи базові частини та виключаємо за назвою
				if (obj:IsA("Model") or obj:IsA("BasePart")) and not tableContains(blacklistTrees, obj.Name) then
					table.insert(targets, {target = obj, color = settings.defaultHighlightColor})
				end
			end
		end
		local oresParent = workspace.WorldSpawn.Ores
		if oresParent then
			for _, obj in ipairs(oresParent:GetDescendants()) do
				if (obj:IsA("Model") or obj:IsA("BasePart")) and not tableContains(blacklistOres, obj.Name) then
					table.insert(targets, {target = obj, color = settings.defaultHighlightColor})
				end
			end
		end
	end
	return targets
end

local function applyHighlights()
	local targets = getTargetObjects()
	for _, entry in ipairs(targets) do
		createHighlight(entry.target, entry.color)
	end
end

spawn(function()
	while true do
		if activeState then
			applyHighlights()
		end
		wait(settings.activeInterval)
	end
end)

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "OutlineGUI"
screenGui.ResetOnSpawn = false
screenGui.Parent = playerGui

local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 300, 0, 240)
mainFrame.Position = UDim2.new(0.5, -150, 0.5, -120)
mainFrame.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
mainFrame.BackgroundTransparency = 0.5
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Parent = screenGui

local closeButton = Instance.new("TextButton")
closeButton.Name = "CloseButton"
closeButton.Size = UDim2.new(0, 25, 0, 25)
closeButton.Position = UDim2.new(1, -30, 0, 5)
closeButton.BackgroundColor3 = Color3.new(1, 0, 0)
closeButton.BackgroundTransparency = 0.5
closeButton.Text = "X"
closeButton.Parent = mainFrame

closeButton.MouseButton1Click:Connect(function()
	mainFrame.Visible = false
end)

local function createButton(name, text, pos)
	local btn = Instance.new("TextButton")
	btn.Name = name
	btn.Size = UDim2.new(0, 100, 0, 30)
	btn.Position = pos
	btn.BackgroundColor3 = Color3.new(0.3, 0.3, 0.3)
	btn.BackgroundTransparency = 0.5
	btn.Text = text
	btn.Parent = mainFrame
	return btn
end

local paintButton = createButton("PaintButton", "Paint", UDim2.new(0, 20, 0, 50))
local activeButton = createButton("ActiveButton", "Active (off)", UDim2.new(0, 20, 0, 90))
local xrayButton = createButton("XrayButton", "Xray (off)", UDim2.new(0, 20, 0, 130))
local modeButton = createButton("ModeButton", "Mode ("..modeState..")", UDim2.new(0, 20, 0, 170))
local clearButton = createButton("ClearButton", "Clear", UDim2.new(0, 140, 0, 50))

paintButton.MouseButton1Click:Connect(function()
	applyHighlights()
end)

activeButton.MouseButton1Click:Connect(function()
	activeState = not activeState
	if activeState then
		activeButton.Text = "Active (on)"
		activeButton.BackgroundColor3 = Color3.new(0, 1, 0)
	else
		activeButton.Text = "Active (off)"
		activeButton.BackgroundColor3 = Color3.new(1, 0, 0)
	end
end)

xrayButton.MouseButton1Click:Connect(function()
	xrayState = not xrayState
	if xrayState then
		xrayButton.Text = "Xray (on)"
		xrayButton.BackgroundColor3 = Color3.new(0, 1, 0)
	else
		xrayButton.Text = "Xray (off)"
		xrayButton.BackgroundColor3 = Color3.new(1, 0, 0)
	end
	for _, hl in ipairs(highlightsFolder:GetChildren()) do
		if hl:IsA("Highlight") then
			if xrayState then
				hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
			else
				hl.DepthMode = Enum.HighlightDepthMode.Occluded
			end
		end
	end
end)

modeButton.MouseButton1Click:Connect(function()
	if modeState == "Whitelist" then
		modeState = "Blacklist"
	else
		modeState = "Whitelist"
	end
	modeButton.Text = "Mode ("..modeState..")"
	applyHighlights()
end)

clearButton.MouseButton1Click:Connect(function()
	clearHighlights()
end)
