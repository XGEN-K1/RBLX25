-- Налаштування (Settings)
local settings = {
	-- Налаштування для аутлайнів (Highlights)
	highlightColor = Color3.new(1, 1, 0), -- Жовтий колір
	fillTransparency = 1, -- Немає заливки
	outlineTransparency = 0.5, -- 50% прозорість контуру
	-- Налаштування інтервалу для кнопки Active
	activeInterval = 5,
	-- Режим роботи: "Whitelist" або "Blacklist"
	defaultMode = "Whitelist",
	-- Початковий стан для кнопок on/off
	defaultActive = false,
	defaultXray = false
}

-- Налаштування whitelist
local whitelistConfigs = {
	{
		parent = workspace.WorldSpawn.Trees,
		names = { "Goldwood Tree" }
	},
	{
		parent = workspace.WorldSpawn.Ores,
		names = { "Silver", "Gold", "Ancient Rune" }
	}
}

-- Налаштування blacklist для дерев та руд
local blacklistTrees = { "Oak" }
local blacklistOres = { "Iron" }

-- Створюємо папку для всіх хайлайтів
local highlightsFolder = Instance.new("Folder")
highlightsFolder.Name = "HighlightsFolder"
highlightsFolder.Parent = workspace

-- Змінні для стану кнопок
local activeState = settings.defaultActive
local xrayState = settings.defaultXray
local modeState = settings.defaultMode

-- Функція створення хайлайту для об'єкта
local function createHighlight(target)
	if not target then return end
	-- Якщо вже є хайлайт, то видаляємо його
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
	hl.FillColor = settings.highlightColor
	hl.OutlineColor = settings.highlightColor
	-- Налаштування Xray: якщо увімкнуто, хайлайт завжди поверх, інакше за замовчуванням
	if xrayState then
		hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
	else
		hl.DepthMode = Enum.HighlightDepthMode.Occluded
	end
	hl.Parent = highlightsFolder
end

-- Функція для очищення всіх хайлайтів
local function clearHighlights()
	highlightsFolder:ClearAllChildren()
end

-- Функція для перевірки чи міститься значення в таблиці
local function tableContains(tbl, val)
	for _, v in ipairs(tbl) do
		if v == val then
			return true
		end
	end
	return false
end

-- Функція, що визначає цільові об'єкти для додавання хайлайтів згідно режиму
local function getTargetObjects()
	local targets = {}
	if modeState == "Whitelist" then
		for _, config in ipairs(whitelistConfigs) do
			if config.parent and config.parent:IsDescendantOf(workspace) then
				for _, obj in ipairs(config.parent:GetChildren()) do
					if tableContains(config.names, obj.Name) then
						-- Для об'єктів типу Model або BasePart
						if obj:IsA("Model") then
							table.insert(targets, obj)
						elseif obj:IsA("BasePart") then
							table.insert(targets, obj)
						end
					end
				end
			end
		end
	elseif modeState == "Blacklist" then
		-- Для дерев: parent = workspace.WorldSpawn.Trees, blacklistTrees
		local treesParent = workspace.WorldSpawn.Trees
		if treesParent then
			for _, obj in ipairs(treesParent:GetChildren()) do
				if not tableContains(blacklistTrees, obj.Name) then
					if obj:IsA("Model") or obj:IsA("BasePart") then
						table.insert(targets, obj)
					end
				end
			end
		end
		-- Для руд: parent = workspace.WorldSpawn.Ores, blacklistOres
		local oresParent = workspace.WorldSpawn.Ores
		if oresParent then
			for _, obj in ipairs(oresParent:GetChildren()) do
				if not tableContains(blacklistOres, obj.Name) then
					if obj:IsA("Model") or obj:IsA("BasePart") then
						table.insert(targets, obj)
					end
				end
			end
		end
	end
	return targets
end

-- Функція що застосовує хайлайти до всіх цільових об'єктів
local function applyHighlights()
	local targets = getTargetObjects()
	for _, target in ipairs(targets) do
		createHighlight(target)
	end
end

-- Обробка Active кнопки: якщо увімкнено, кожні activeInterval секунд оновлюємо хайлайти
spawn(function()
	while true do
		if activeState then
			applyHighlights()
		end
		wait(settings.activeInterval)
	end
end)

-- Створення GUI
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "OutlineGUI"
screenGui.ResetOnSpawn = false
screenGui.Parent = playerGui

local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 300, 0, 200)
mainFrame.Position = UDim2.new(0.5, -150, 0.5, -100)
mainFrame.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
mainFrame.BackgroundTransparency = 0.5
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Parent = screenGui

-- Закриваюча кнопка X (правий верхній кут)
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

-- Функція створення кнопок GUI
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

-- Кнопки функцій
local paintButton = createButton("PaintButton", "Paint", UDim2.new(0, 20, 0, 50))
local activeButton = createButton("ActiveButton", "Active (off)", UDim2.new(0, 20, 0, 90))
local xrayButton = createButton("XrayButton", "Xray (off)", UDim2.new(0, 20, 0, 130))
local modeButton = createButton("ModeButton", "Mode ("..modeState..")", UDim2.new(0, 20, 0, 170))
local clearButton = createButton("ClearButton", "Clear", UDim2.new(0, 140, 0, 50))

-- Обробка натискання кнопок
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
	-- Оновлюємо всі існуючі хайлайти, щоб змінити режим відображення
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
end)

clearButton.MouseButton1Click:Connect(function()
	clearHighlights()
end)

-- Для зручного редагування whitelist та blacklist можна додати окремий розділ налаштувань,
-- наприклад, через ModuleScript або через інший GUI. Це залишено для подальшої розробки.
