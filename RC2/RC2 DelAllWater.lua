if game.PlaceId ~= 12196278347 then
    --warn("Цей скрипт можна використовувати лише в грі з ID 12196278347.")
    return
end

-- Скрипт для видалення об'єктів із "water" у назві та створення нових частин
local function replaceWaterObjects()
    -- Рекурсивна функція для пошуку всіх об'єктів у Workspace
    local function processDescendants(parent)
        for _, child in ipairs(parent:GetDescendants()) do
            -- Перевірка, чи є "water" у назві об'єкта (незалежно від регістру)
            if child:IsA("BasePart") and string.match(string.lower(child.Name), "water") then
                -- Збереження розміру та позиції об'єкта
                local size = child.Size
                local position = child.Position

                -- Створення нового Part із заданими параметрами
                local newPart = Instance.new("Part")
                newPart.Size = size
                newPart.Position = position
                newPart.Anchored = true
                newPart.CanCollide = false
                newPart.Material = Enum.Material.ForceField
                newPart.Transparency = 0.9
                newPart.Color = Color3.fromRGB(255, 255, 255)

                -- Додавання нового Part до Workspace
                newPart.Parent = workspace

                -- Видалення старого об'єкта
                child:Destroy()
            end
        end
    end

    -- Викликаємо функцію для Workspace
    processDescendants(workspace)
end

-- Виконання функції
replaceWaterObjects()
