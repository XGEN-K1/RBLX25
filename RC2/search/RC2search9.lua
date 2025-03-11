--[[
  Script Name: Search
  Оновлений роблокс скрипт з GUI для редагування вайтліст/блекліст налаштувань.
  Для збереження та завантаження використовується файл "rc2search.txt" (за наявності функцій readfile/writefile та HttpService).
]]

local HttpService = game:GetService("HttpService")

local SETTINGS_FILE = "rc2search.txt"

local function getDefaultSettings()
	return {
		settings = {
			defaultHighlightColor = Color3.new(1, 1, 0),
			fillTransparency = 1,
			outlineTransparency = 0.5,
			activeInterval = 5,
			defaultMode = "Whitelist",
			defaultActive = false,
			defaultXray = false
		},
		whitelistConfigs = {
			{
				parent = "Trees", -- Ключ для визначення: Trees або Ores
				names = {
					{ name = "Goldwood Tree", active = true }
				},
				color = { r = 246/255, g = 115/255, b = 0 }
			},
			{
				parent = "Trees",
				names = {
					{ name = "Swamped", active = true }
				},
				color = { r = 102/255, g = 51/255, b = 0 }
			},
			{
				parent = "Ores",
				names = {
					{ name = "Gold", active = true }
				},
				color = { r = 246/255, g = 115/255, b = 0 }
			},
			{
				parent = "Ores",
				names = {
					{ name = "Silver", active = true }
				},
				color = { r = 230/255, g = 230/255, b = 230/255 }
			},
			{
				parent = "Ores",
				names = {
					{ name = "Flower Grass", active = true }
				},
				color = { r = 0, g = 1, b = 0 }
			},
			{
				parent = "Ores",
				names = {
					{ name = "Ancient Rune", active = true }
				},
				color = { r = 0, g = 154/255, b = 255/255 }
			},
			{
				parent = "Trees",
				names = {
					{ name = "Orewood Tree", active = true },
					{ name = "Orewood", active = false },
					{ name = "Glacial", active = true },
					{ name = "Glacial Tree", active = true },
					{ name = "Lumena", active = true },
					{ name = "Lumena Tree", active = true },
					{ name = "Vampiric Oak", active = true }
				},
				color = { r = 150/255, g = 0, b = 250/255 }
			},
			{
				parent = "Ores",
				names = {
					{ name = "Pink Diamond", active = true },
					{ name = "Pumpkin", active = false }
				},
				color = { r = 150/255, g = 0, b = 250/255 }
			}
		},
		blacklistTrees = {
			{ name = "Oak", active = true },
			{ name = "Fir", active = true },
			{ name = "Birch", active = true },
			{ name = "Acacia", active = true },
			{ name = "Cherry", active = true },
			{ name = "Lush Oak", active = true },
			{ name = "Palm", active = true },
			{ name = "Pine", active = true },
			{ name = "Redwood", active = true },
			{ name = "Willow", active = true },
			{ name = "Maple", active = true },
			{ name = "Kelp", active = true },
			{ name = "Silverwood Tree", active = true },
			{ name = "Scorched", active = true }
		},
		blacklistOres = {
			{ name = "Iron", active = true },
			{ name = "Copper", active = true },
			{ name = "Stone", active = true },
			{ name = "Aluminium", active = true },
			{ name = "Amber", active = true },
			{ name = "Bush", active = true },
			{ name = "Clay", active = true },
			{ name = "Cloudnite", active = true },
			{ name = "Deepslate", active = true },
			{ name = "Diamond", active = true },
			{ name = "Emerald", active = true },
			{ name = "Marble", active = true },
			{ name = "Null", active = true },
			{ name = "Quartz", active = true },
			{ name = "Tin", active = true },
			{ name = "Tall Grass", active = true },
			{ name = "Ice", active = true },
			{ name = "Coal", active = true },
			{ name = "Blastshard", active = true },
			{ name = "Voltshard", active = true },
			{ name = "Salt", active = true },
			{ name = "Jade", active = true },
			{ name = "Sand", active = true },
			{ name = "Scarlet", active = true },
			{ name = "Sapphire", active = true },
			{ name = "Ruby", active = true },
			{ name = "Topaz", active = true },
			{ name = "Snow", active = true },
			{ name = "Sandstone", active = true }
		}
	}
end

local SettingsData = nil
local function loadSettings()
	local success, data = pcall(function()
		return readfile(SETTINGS_FILE)
	end)
	if success and data then
		local decoded = HttpService:JSONDecode(data)
		return decoded
	else
		return getDefaultSettings()
	end
end

local function saveSettings()
	local data = HttpService:JSONEncode(SettingsData)
	writefile(SETTINGS_FILE, data)
end

SettingsData = loadSettings()

local settings = SettingsData.settings
local whitelistConfigs = SettingsData.whitelistConfigs
local blacklistTrees = SettingsData.blacklistTrees
local blacklistOres = SettingsData.blacklistOres

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
		if v.name == val or v == val then
			return true
		end
	end
	return false
end

local function getTargetObjects()
	local targets = {}
	if modeState == "Whitelist" then
		for _, config in ipairs(whitelistConfigs) do
			local parentObj = nil
			if config.parent == "Trees" then
				parentObj = workspace.WorldSpawn.Trees
			elseif config.parent == "Ores" then
				parentObj = workspace.WorldSpawn.Ores
			end
			if parentObj and parentObj:IsDescendantOf(workspace) then
				for _, obj in ipairs(parentObj:GetChildren()) do
					for _, entry in ipairs(config.names) do
						if entry.name == obj.Name and entry.active then
							local col = config.color or { r = settings.defaultHighlightColor.R, g = settings.defaultHighlightColor.G, b = settings.defaultHighlightColor.B }
							local color = Color3.new(col.r, col.g, col.b)
							if obj:IsA("Model") or obj:IsA("BasePart") then
								table.insert(targets, { target = obj, color = color })
							end
						end
					end
				end
			end
		end
	elseif modeState == "Blacklist" then
		local function processBlacklist(parent, blacklist)
			if parent then
				for _, obj in ipairs(parent:GetChildren()) do
					local skip = false
					for _, entry in ipairs(blacklist) do
						if obj.Name == entry.name and entry.active then
							skip = true
							break
						end
					end
					if (obj:IsA("Model") or obj:IsA("BasePart")) and not skip then
						table.insert(targets, { target = obj, color = settings.defaultHighlightColor })
					end
				end
			end
		end
		processBlacklist(workspace.WorldSpawn.Trees, blacklistTrees)
		processBlacklist(workspace.WorldSpawn.Ores, blacklistOres)
	end
	return targets
end

local function applyHighlights()
	clearHighlights()
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
mainFrame.Position = UDim2.new(0.24, -150, 0.9, -120)
mainFrame.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
mainFrame.BackgroundTransparency = 0.9
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Parent = screenGui

local titleLabel = Instance.new("TextLabel")
titleLabel.Name = "TitleLabel"
titleLabel.Size = UDim2.new(1, 0, 0, 30)
titleLabel.Position = UDim2.new(0, 0, 0, 0)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "Search"
titleLabel.TextColor3 = Color3.new(1, 1, 1)
titleLabel.TextScaled = true
titleLabel.Parent = mainFrame

local closeButton = Instance.new("TextButton")
closeButton.Name = "CloseButton"
closeButton.Size = UDim2.new(0, 25, 0, 25)
closeButton.Position = UDim2.new(1, -30, 0, 5)
closeButton.BackgroundColor3 = Color3.new(1, 0, 0)
closeButton.BackgroundTransparency = 0.5
closeButton.Text = "X"
closeButton.TextColor3 = Color3.new(1, 1, 1)
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
	btn.TextColor3 = Color3.new(1, 1, 1)
	btn.Parent = mainFrame
	return btn
end

local paintButton = createButton("PaintButton", "Paint", UDim2.new(0, 20, 0, 50))
local activeButton = createButton("ActiveButton", "Active (off)", UDim2.new(0, 20, 0, 90))
local xrayButton = createButton("XrayButton", "Xray (off)", UDim2.new(0, 20, 0, 130))
local modeButton = createButton("ModeButton", "Mode ("..modeState..")", UDim2.new(0, 20, 0, 170))
local clearButton = createButton("ClearButton", "Clear", UDim2.new(0, 140, 0, 50))
local settingsButton = createButton("SettingsButton", "Settings", UDim2.new(0, 140, 0, 90))

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
	xrayButton.Text = "Xray ("..(xrayState and "on" or "off")..")"
	xrayButton.BackgroundColor3 = xrayState and Color3.new(0, 1, 0) or Color3.new(1, 0, 0)
	for _, hl in ipairs(highlightsFolder:GetChildren()) do
		if hl:IsA("Highlight") then
			hl.DepthMode = xrayState and Enum.HighlightDepthMode.AlwaysOnTop or Enum.HighlightDepthMode.Occluded
		end
	end
end)

modeButton.MouseButton1Click:Connect(function()
	modeState = modeState == "Whitelist" and "Blacklist" or "Whitelist"
	modeButton.Text = "Mode ("..modeState..")"
	applyHighlights()
end)

clearButton.MouseButton1Click:Connect(function()
	clearHighlights()
end)

--------------------------------------------------------------------------------
-- Налаштування GUI для редагування whitelist/blacklist

local settingsFrame = Instance.new("Frame")
settingsFrame.Name = "SettingsFrame"
settingsFrame.Size = UDim2.new(0, 400, 0, 400)
settingsFrame.Position = UDim2.new(0.5, -200, 0.5, -200)
settingsFrame.BackgroundColor3 = Color3.new(0.15, 0.15, 0.15)
settingsFrame.BackgroundTransparency = 0.2
settingsFrame.Visible = false
settingsFrame.Active = true
settingsFrame.Draggable = true
settingsFrame.Parent = screenGui

local settingsTitle = Instance.new("TextLabel")
settingsTitle.Name = "SettingsTitle"
settingsTitle.Size = UDim2.new(1, 0, 0, 30)
settingsTitle.Position = UDim2.new(0, 0, 0, 0)
settingsTitle.BackgroundTransparency = 1
settingsTitle.Text = "Налаштування Whitelist/Blacklist"
settingsTitle.TextColor3 = Color3.new(1, 1, 1)
settingsTitle.TextScaled = true
settingsTitle.Parent = settingsFrame

local closeSettingsButton = Instance.new("TextButton")
closeSettingsButton.Name = "CloseSettingsButton"
closeSettingsButton.Size = UDim2.new(0, 25, 0, 25)
closeSettingsButton.Position = UDim2.new(1, -30, 0, 5)
closeSettingsButton.BackgroundColor3 = Color3.new(1, 0, 0)
closeSettingsButton.BackgroundTransparency = 0.5
closeSettingsButton.Text = "X"
closeSettingsButton.TextColor3 = Color3.new(1, 1, 1)
closeSettingsButton.Parent = settingsFrame

closeSettingsButton.MouseButton1Click:Connect(function()
	settingsFrame.Visible = false
	SettingsData.settings = settings
	SettingsData.whitelistConfigs = whitelistConfigs
	SettingsData.blacklistTrees = blacklistTrees
	SettingsData.blacklistOres = blacklistOres
	saveSettings()
	applyHighlights()
end)

local currentTab = "Whitelist"

local whitelistTabButton = Instance.new("TextButton")
whitelistTabButton.Name = "WhitelistTabButton"
whitelistTabButton.Size = UDim2.new(0, 100, 0, 30)
whitelistTabButton.Position = UDim2.new(0, 20, 0, 40)
whitelistTabButton.BackgroundColor3 = Color3.new(0.3, 0.3, 0.3)
whitelistTabButton.BackgroundTransparency = 0.5
whitelistTabButton.Text = "Whitelist"
whitelistTabButton.TextColor3 = Color3.new(1, 1, 1)
whitelistTabButton.Parent = settingsFrame

local blacklistTabButton = Instance.new("TextButton")
blacklistTabButton.Name = "BlacklistTabButton"
blacklistTabButton.Size = UDim2.new(0, 100, 0, 30)
blacklistTabButton.Position = UDim2.new(0, 130, 0, 40)
blacklistTabButton.BackgroundColor3 = Color3.new(0.3, 0.3, 0.3)
blacklistTabButton.BackgroundTransparency = 0.5
blacklistTabButton.Text = "Blacklist"
blacklistTabButton.TextColor3 = Color3.new(1, 1, 1)
blacklistTabButton.Parent = settingsFrame

local entriesFrame = Instance.new("ScrollingFrame")
entriesFrame.Name = "EntriesFrame"
entriesFrame.Size = UDim2.new(1, -40, 1, -100)
entriesFrame.Position = UDim2.new(0, 20, 0, 80)
entriesFrame.BackgroundTransparency = 0.5
entriesFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
entriesFrame.ScrollBarThickness = 5
entriesFrame.Parent = settingsFrame

local function clearEntries()
	for _, child in ipairs(entriesFrame:GetChildren()) do
		if child:IsA("Frame") or child:IsA("TextLabel") then
			child:Destroy()
		end
	end
	entriesFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
end

local function createWhitelistHeader(config, yPosition)
	local header = Instance.new("TextLabel")
	header.Size = UDim2.new(1, -5, 0, 25)
	header.Position = UDim2.new(0, 0, 0, yPosition)
	header.BackgroundTransparency = 0.5
	header.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
	header.Text = "Whitelist: " .. config.parent .. " | Колір: ("..math.floor(config.color.r*255)..","..math.floor(config.color.g*255)..","..math.floor(config.color.b*255)..")"
	header.TextColor3 = Color3.new(1, 1, 1)
	header.TextXAlignment = Enum.TextXAlignment.Left
	header.Parent = entriesFrame
	return yPosition + 30
end

local function createEntryRow(parentList, index, entry, tab, yPosition)
	local row = Instance.new("Frame")
	row.Size = UDim2.new(1, -5, 0, 30)
	row.Position = UDim2.new(0, 0, 0, yPosition)
	row.BackgroundTransparency = 0.5
	row.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
	row.Parent = entriesFrame

	local nameLabel = Instance.new("TextLabel")
	nameLabel.Size = UDim2.new(0.5, 0, 1, 0)
	nameLabel.BackgroundTransparency = 1
	nameLabel.Text = entry.name
	nameLabel.TextColor3 = Color3.new(1, 1, 1)
	nameLabel.TextXAlignment = Enum.TextXAlignment.Left
	nameLabel.Parent = row

	local activeButton = Instance.new("TextButton")
	activeButton.Size = UDim2.new(0.2, 0, 1, 0)
	activeButton.Position = UDim2.new(0.5, 0, 0, 0)
	activeButton.BackgroundColor3 = entry.active and Color3.new(0, 1, 0) or Color3.new(1, 0, 0)
	activeButton.Text = entry.active and "On" or "Off"
	activeButton.TextColor3 = Color3.new(1, 1, 1)
	activeButton.Parent = row
	activeButton.MouseButton1Click:Connect(function()
		entry.active = not entry.active
		activeButton.BackgroundColor3 = entry.active and Color3.new(0, 1, 0) or Color3.new(1, 0, 0)
		activeButton.Text = entry.active and "On" or "Off"
	end)

	local deleteButton = Instance.new("TextButton")
	deleteButton.Size = UDim2.new(0.2, 0, 1, 0)
	deleteButton.Position = UDim2.new(0.7, 0, 0, 0)
	deleteButton.BackgroundColor3 = Color3.new(0.5, 0, 0)
	deleteButton.Text = "Del"
	deleteButton.TextColor3 = Color3.new(1, 1, 1)
	deleteButton.Parent = row
	deleteButton.MouseButton1Click:Connect(function()
		table.remove(parentList, index)
		clearEntries()
		populateEntries()
	end)

	return yPosition + 35
end

local function populateEntries()
	clearEntries()
	local yOffset = 0

	if currentTab == "Whitelist" then
		for configIndex, config in ipairs(whitelistConfigs) do
			yOffset = createWhitelistHeader(config, yOffset)
			for entryIndex, entry in ipairs(config.names) do
				yOffset = createEntryRow(config.names, entryIndex, entry, "Whitelist", yOffset)
			end
		end
	else
		local headerTrees = Instance.new("TextLabel")
		headerTrees.Size = UDim2.new(1, -5, 0, 25)
		headerTrees.Position = UDim2.new(0, 0, 0, yOffset)
		headerTrees.BackgroundTransparency = 0.5
		headerTrees.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
		headerTrees.Text = "Blacklist Trees"
		headerTrees.TextColor3 = Color3.new(1, 1, 1)
		headerTrees.Parent = entriesFrame
		yOffset += 30

		for i, entry in ipairs(blacklistTrees) do
			yOffset = createEntryRow(blacklistTrees, i, entry, "Blacklist", yOffset)
		end

		local headerOres = Instance.new("TextLabel")
		headerOres.Size = UDim2.new(1, -5, 0, 25)
		headerOres.Position = UDim2.new(0, 0, 0, yOffset)
		headerOres.BackgroundTransparency = 0.5
		headerOres.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
		headerOres.Text = "Blacklist Ores"
		headerOres.TextColor3 = Color3.new(1, 1, 1)
		headerOres.Parent = entriesFrame
		yOffset += 30

		for i, entry in ipairs(blacklistOres) do
			yOffset = createEntryRow(blacklistOres, i, entry, "Blacklist", yOffset)
		end
	end

	entriesFrame.CanvasSize = UDim2.new(0, 0, 0, yOffset + 10)
end

whitelistTabButton.MouseButton1Click:Connect(function()
	currentTab = "Whitelist"
	populateEntries()
end)

blacklistTabButton.MouseButton1Click:Connect(function()
	currentTab = "Blacklist"
	populateEntries()
end)

local addEntryButton = Instance.new("TextButton")
addEntryButton.Name = "AddEntryButton"
addEntryButton.Size = UDim2.new(0, 100, 0, 30)
addEntryButton.Position = UDim2.new(1, -120, 1, -40)
addEntryButton.BackgroundColor3 = Color3.new(0, 0.5, 1)
addEntryButton.BackgroundTransparency = 0.5
addEntryButton.Text = "Add Entry"
addEntryButton.TextColor3 = Color3.new(1, 1, 1)
addEntryButton.Parent = settingsFrame

addEntryButton.MouseButton1Click:Connect(function()
	local newName = "NewEntry"
	local newEntry = { name = newName, active = true }
	if currentTab == "Whitelist" then
		if #whitelistConfigs > 0 then
			table.insert(whitelistConfigs[1].names, newEntry)
		else
			table.insert(whitelistConfigs, {
				parent = "Trees",
				names = {newEntry},
				color = {r = 1, g = 1, b = 0}
			})
		end
	else
		table.insert(blacklistTrees, newEntry)
	end
	populateEntries()
end)

settingsButton.MouseButton1Click:Connect(function()
	currentTab = "Whitelist"
	populateEntries()
	settingsFrame.Visible = true
end)