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
		whitelist = {
			Trees = {
				{ name = "Goldwood Tree", active = true, color = { r = 246/255, g = 115/255, b = 0 } },
				{ name = "Swamped", active = true, color = { r = 102/255, g = 51/255, b = 0 } },
				{ name = "Orewood Tree", active = true, color = { r = 150/255, g = 0, b = 250/255 } },
				{ name = "Glacial Tree", active = true, color = { r = 150/255, g = 0, b = 250/255 } },
				{ name = "Lumena Tree", active = true, color = { r = 150/255, g = 0, b = 250/255 } },
				{ name = "Vampiric Oak", active = true, color = { r = 150/255, g = 0, b = 250/255 } }
			},
			Ores = {
				{ name = "Gold", active = true, color = { r = 246/255, g = 115/255, b = 0 } },
				{ name = "Silver", active = true, color = { r = 230/255, g = 230/255, b = 230/255 } },
				{ name = "Flower Grass", active = true, color = { r = 0, g = 1, b = 0 } },
				{ name = "Ancient Rune", active = true, color = { r = 0, g = 154/255, b = 255/255 } },
				{ name = "Pink Diamond", active = true, color = { r = 150/255, g = 0, b = 250/255 } }
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
local whitelist = SettingsData.whitelist
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
		for category, items in pairs(whitelist) do
			local parentObj = workspace.WorldSpawn[category]
			if parentObj and parentObj:IsDescendantOf(workspace) then
				for _, obj in ipairs(parentObj:GetChildren()) do
					for _, entry in ipairs(items) do
						if entry.name == obj.Name and entry.active then
							local col = entry.color or settings.defaultHighlightColor
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
settingsFrame.Size = UDim2.new(0, 600, 0, 500)  -- Збільшено ширину до 600
settingsFrame.Position = UDim2.new(0.5, -300, 0.5, -250)  -- Відповідна корекція позиції
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
entriesFrame.Size = UDim2.new(1, -40, 1, -140)
entriesFrame.Position = UDim2.new(0, 20, 0, 80)
entriesFrame.BackgroundTransparency = 0.5
entriesFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
entriesFrame.ScrollBarThickness = 5
entriesFrame.Parent = settingsFrame

local function clearEntries()
	for _, child in ipairs(entriesFrame:GetChildren()) do
		if child:IsA("Frame") then
			child:Destroy()
		end
	end
	entriesFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
end

local function createColorInputs(frame, color, onChange)
    local colorContainer = Instance.new("Frame")
    colorContainer.Size = UDim2.new(0, 160, 1, 0)
    colorContainer.Position = UDim2.new(0.6, 0, 0, 0)
    colorContainer.BackgroundTransparency = 1
    colorContainer.Parent = frame

    -- Color Preview
    local colorPreview = Instance.new("TextButton")
    colorPreview.Size = UDim2.new(0, 20, 0, 20)
    colorPreview.Position = UDim2.new(0, 0, 0.5, -10)
    colorPreview.BackgroundColor3 = Color3.new(color.r, color.g, color.b)
    colorPreview.Text = ""
    colorPreview.Parent = colorContainer

    -- R Input
    local rBox = Instance.new("TextBox")
    rBox.Size = UDim2.new(0, 40, 0, 20)
    rBox.Position = UDim2.new(0, 25, 0.5, -10)
    rBox.BackgroundColor3 = Color3.new(1, 1, 1)
    rBox.Text = math.floor(color.r * 255)
    rBox.PlaceholderText = "R"
    rBox.Parent = colorContainer

    -- G Input
    local gBox = Instance.new("TextBox")
    gBox.Size = UDim2.new(0, 40, 0, 20)
    gBox.Position = UDim2.new(0, 70, 0.5, -10)
    gBox.BackgroundColor3 = Color3.new(1, 1, 1)
    gBox.Text = math.floor(color.g * 255)
    gBox.PlaceholderText = "G"
    gBox.Parent = colorContainer

    -- B Input
    local bBox = Instance.new("TextBox")
    bBox.Size = UDim2.new(0, 40, 0, 20)
    bBox.Position = UDim2.new(0, 115, 0.5, -10)
    bBox.BackgroundColor3 = Color3.new(1, 1, 1)
    bBox.Text = math.floor(color.b * 255)
    bBox.PlaceholderText = "B"
    bBox.Parent = colorContainer

    local function updateColor()
        local r = tonumber(rBox.Text) or 0
        local g = tonumber(gBox.Text) or 0
        local b = tonumber(bBox.Text) or 0
        local newColor = {
            r = math.clamp(r, 0, 255)/255,
            g = math.clamp(g, 0, 255)/255,
            b = math.clamp(b, 0, 255)/255
        }
        colorPreview.BackgroundColor3 = Color3.new(newColor.r, newColor.g, newColor.b)
        if onChange then onChange(newColor) end
    end

    rBox.FocusLost:Connect(updateColor)
    gBox.FocusLost:Connect(updateColor)
    bBox.FocusLost:Connect(updateColor)
end

local function createEntryRow(parentList, index, entry, yPosition)
    local row = Instance.new("Frame")
    row.Size = UDim2.new(1, -5, 0, 30)
    row.Position = UDim2.new(0, 0, 0, yPosition)
    row.BackgroundTransparency = 0.5
    row.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
    row.Parent = entriesFrame

    -- Name Input
    local nameBox = Instance.new("TextBox")
    nameBox.Size = UDim2.new(0.3, 0, 1, 0)
    nameBox.BackgroundTransparency = 1
    nameBox.Text = entry.name
    nameBox.TextColor3 = Color3.new(1, 1, 1)
    nameBox.TextXAlignment = Enum.TextXAlignment.Left
    nameBox.Parent = row

    -- Active Toggle
    local activeButton = Instance.new("TextButton")
    activeButton.Size = UDim2.new(0.15, 0, 1, 0)
    activeButton.Position = UDim2.new(0.3, 0, 0, 0)
    activeButton.BackgroundColor3 = entry.active and Color3.new(0, 1, 0) or Color3.new(1, 0, 0)
    activeButton.Text = entry.active and "ON" or "OFF"
    activeButton.TextColor3 = Color3.new(1, 1, 1)
    activeButton.Parent = row

    -- Color Inputs
    if currentTab == "Whitelist" then
        createColorInputs(row, entry.color, function(newColor)
            entry.color = newColor
        end)
    end

    -- Delete Button
    local deleteButton = Instance.new("TextButton")
    deleteButton.Size = UDim2.new(0.1, 0, 1, 0)
    deleteButton.Position = UDim2.new(0.9, 0, 0, 0)
    deleteButton.BackgroundColor3 = Color3.new(0.5, 0, 0)
    deleteButton.Text = "X"
    deleteButton.TextColor3 = Color3.new(1, 1, 1)
    deleteButton.Parent = row

    -- Events
    nameBox.FocusLost:Connect(function()
        entry.name = nameBox.Text
    end)

    activeButton.MouseButton1Click:Connect(function()
        entry.active = not entry.active
        activeButton.BackgroundColor3 = entry.active and Color3.new(0, 1, 0) or Color3.new(1, 0, 0)
        activeButton.Text = entry.active and "ON" or "OFF"
    end)

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
		for _, category in pairs({"Trees", "Ores"}) do
			for i, entry in ipairs(whitelist[category]) do
				yOffset = createEntryRow(whitelist[category], i, entry, yOffset)
			end
		end
	else
		for i, entry in ipairs(blacklistTrees) do
			yOffset = createEntryRow(blacklistTrees, i, entry, yOffset)
		end
		for i, entry in ipairs(blacklistOres) do
			yOffset = createEntryRow(blacklistOres, i, entry, yOffset)
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

local addTreeButton = Instance.new("TextButton")
addTreeButton.Name = "AddTreeButton"
addTreeButton.Size = UDim2.new(0, 100, 0, 30)
addTreeButton.Position = UDim2.new(0, 20, 1, -40)
addTreeButton.BackgroundColor3 = Color3.new(0, 0.5, 1)
addTreeButton.BackgroundTransparency = 0.5
addTreeButton.Text = "Add Tree"
addTreeButton.TextColor3 = Color3.new(1, 1, 1)
addTreeButton.Parent = settingsFrame

local addOresButton = Instance.new("TextButton")
addOresButton.Name = "AddOresButton"
addOresButton.Size = UDim2.new(0, 100, 0, 30)
addOresButton.Position = UDim2.new(0, 130, 1, -40)
addOresButton.BackgroundColor3 = Color3.new(0, 0.5, 1)
addOresButton.BackgroundTransparency = 0.5
addOresButton.Text = "Add Ore"
addOresButton.TextColor3 = Color3.new(1, 1, 1)
addOresButton.Parent = settingsFrame

addTreeButton.MouseButton1Click:Connect(function()
	local newEntry = {
		name = "NewTree",
		active = true,
		color = { r = 1, g = 0, b = 0 }
	}
	if currentTab == "Whitelist" then
		table.insert(whitelist.Trees, newEntry)
	else
		table.insert(blacklistTrees, newEntry)
	end
	populateEntries()
end)

addOresButton.MouseButton1Click:Connect(function()
	local newEntry = {
		name = "NewOre",
		active = true,
		color = { r = 0, g = 0, b = 1 }
	}
	if currentTab == "Whitelist" then
		table.insert(whitelist.Ores, newEntry)
	else
		table.insert(blacklistOres, newEntry)
	end
	populateEntries()
end)

settingsButton.MouseButton1Click:Connect(function()
	currentTab = "Whitelist"
	populateEntries()
	settingsFrame.Visible = true
end)