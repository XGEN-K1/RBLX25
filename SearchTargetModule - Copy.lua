-- Створення GUI для пошуку та відображення аватара цілі
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local TextBox = Instance.new("TextBox")
local ImageLabel = Instance.new("ImageLabel")

-- Налаштування GUI
ScreenGui.Name = "TargetGui"
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

Frame.Name = "MainFrame"
Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Frame.Size = UDim2.new(0, 300, 0, 200)
Frame.Position = UDim2.new(0.5, -150, 0.5, -100)
Frame.AnchorPoint = Vector2.new(0.5, 0.5)

TextBox.Name = "InputBox"
TextBox.Parent = Frame
TextBox.Size = UDim2.new(0, 200, 0, 30)
TextBox.Position = UDim2.new(0.5, -100, 0, 20)
TextBox.PlaceholderText = "Enter player name"
TextBox.Text = ""
TextBox.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
TextBox.Font = Enum.Font.SourceSans
TextBox.TextSize = 18

ImageLabel.Name = "AvatarImage"
ImageLabel.Parent = Frame
ImageLabel.Size = UDim2.new(0, 100, 0, 100)
ImageLabel.Position = UDim2.new(0.5, -50, 0, 70)
ImageLabel.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
ImageLabel.Image = ""

-- Функція пошуку гравця та оновлення аватара
local function updateAvatar()
    local playerName = TextBox.Text
    if playerName == "" then
        ImageLabel.Image = ""
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
        ImageLabel.Image = "https://www.roblox.com/headshot-thumbnail/image?userId=" .. userId .. "&width=150&height=150&format=png"
    else
        ImageLabel.Image = ""
    end
end

-- Виконувати пошук при зміні тексту в TextBox
TextBox:GetPropertyChangedSignal("Text"):Connect(updateAvatar)