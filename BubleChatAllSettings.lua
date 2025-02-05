local TextChatService = game:GetService("TextChatService")
local BubbleChatConfig = TextChatService.BubbleChatConfiguration

BubbleChatConfig.Enabled = true -- Вмикаємо чат-баббли
BubbleChatConfig.AdorneeName = "Head" -- Об'єкт, до якого прив'язаний чат-баббл (зазвичай "Head")
BubbleChatConfig.BackgroundColor3 = Color3.new(0, 0, 0) -- Чорний фон
BubbleChatConfig.BackgroundTransparency = 0 -- Непрозорий фон (0 = непрозорий, 1 = прозорий)
BubbleChatConfig.TextColor3 = Color3.new(1, 1, 1) -- Білий текст
BubbleChatConfig.TextSize = 14 -- Розмір тексту
BubbleChatConfig.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold) -- Шрифт
BubbleChatConfig.TailVisible = true -- Видимість "хвостика" чат-баббла
BubbleChatConfig.VerticalStudsOffset = 0 -- Вертикальне зміщення чат-баббла відносно голови гравця
BubbleChatConfig.BubbleDuration = 15 -- Час відображення чат-баббла (у секундах)
BubbleChatConfig.BubblesSpacing = 6
BubbleChatConfig.MaxBubbles = 5 -- Максимальна кількість одночасних чат-бабблів
BubbleChatConfig.MaxDistance = 1000
BubbleChatConfig.MinimizeDistance = 1000 -- Відстань, на якій чат-баббли зменшуються
BubbleChatConfig.LocalPlayerStudsOffset = Vector3.new(0, 0, 0)
