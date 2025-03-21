-- Створення GUI для пошуку та відображення аватара цілі
local TargetTextBox = Instance.new("TextBox")
local AvatarImageLabel = Instance.new("ImageLabel")

-- Налаштування TargetTextBox
TargetTextBox.Name = "TargetInputBox"
TargetTextBox.Parent = NewScrollFrame
TargetTextBox.Size = UDim2.new(0, 200, 0, 30)
TargetTextBox.Position = UDim2.new(0, 10, 0, 70) -- Розташування у NewScrollFrame
TargetTextBox.PlaceholderText = "Enter player name"
TargetTextBox.Text = ""
TargetTextBox.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
TargetTextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
TargetTextBox.Font = Enum.Font.SourceSans
TargetTextBox.TextSize = 18

-- Налаштування AvatarImageLabel
AvatarImageLabel.Name = "TargetAvatarImage"
AvatarImageLabel.Parent = NewScrollFrame
AvatarImageLabel.Size = UDim2.new(0, 100, 0, 100)
AvatarImageLabel.Position = UDim2.new(0, 10, 0, 110) -- Розташування під TargetTextBox
AvatarImageLabel.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
AvatarImageLabel.Image = ""

-- Функція пошуку гравця та оновлення аватара
local function updateAvatar()
    local playerName = TargetTextBox.Text
    if playerName == "" then
        AvatarImageLabel.Image = ""
        return
    end

    local targetPlayer = nil

    -- Спочатку шукаємо за username
    for _, player in pairs(game.Players:GetPlayers()) do
        if string.find(string.lower(player.Name), string.lower(playerName)) then
            targetPlayer = player
            break
        end
    end

    -- Якщо не знайдено, шукаємо за displayname
    if not targetPlayer then
        for _, player in pairs(game.Players:GetPlayers()) do
            if string.find(string.lower(player.DisplayName), string.lower(playerName)) then
                targetPlayer = player
                break
            end
        end
    end

    -- Оновлюємо аватар або очищуємо
    if targetPlayer then
        local userId = targetPlayer.UserId
        AvatarImageLabel.Image = "https://www.roblox.com/headshot-thumbnail/image?userId=" .. userId .. "&width=150&height=150&format=png"
    else
        AvatarImageLabel.Image = ""
    end
end

-- Виконувати пошук при зміні тексту в TargetTextBox
TargetTextBox:GetPropertyChangedSignal("Text"):Connect(updateAvatar)
