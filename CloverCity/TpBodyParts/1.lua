local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local mouse = player:GetMouse()

-- Задайте імена частин тіла, які потрібно телепортувати
local teleportPartNames = {"HumanoidRootPart"} 

local teleportActive = false
local updateConnection = nil

local originalAnchoredStates = {}   -- зберігає початковий стан Anchored для частин, які не телепортуємо
local teleportParts = {}            -- список частин, що телепортуються
local weldData = {}                 -- зберігає дані зварок для телепортованих частин
local offsets = {}                  -- зберігає офсети для додаткових телепортованих частин

local function isTeleportPart(part)
    for _, name in ipairs(teleportPartNames) do
        if part.Name == name then
            return true
        end
    end
    return false
end

local function setupTeleportMode(character)
    -- Проходимось по всіх елементах персонажа
    for _, item in ipairs(character:GetDescendants()) do
        if item:IsA("BasePart") then
            if isTeleportPart(item) then
                table.insert(teleportParts, item)
                -- Спробуємо знайти Motor6D, який кріпить цю частину до тіла
                local weld = nil
                if item.Parent then
                    for _, child in ipairs(item.Parent:GetChildren()) do
                        if child:IsA("Motor6D") and (child.Part1 == item or child.Part0 == item) then
                            weld = child
                            break
                        end
                    end
                end
                if weld then
                    weldData[item] = {
                        Parent = weld.Parent,
                        ClassName = weld.ClassName,
                        Part0 = weld.Part0,
                        Part1 = weld.Part1,
                        C0 = weld.C0,
                        C1 = weld.C1
                    }
                    weld:Destroy()
                end
            else
                originalAnchoredStates[item] = item.Anchored
                item.Anchored = true
            end
        end
    end
    -- Якщо більше однієї телепортованої частини, обчислюємо офсет для кожної відносно першої
    if #teleportParts > 0 then
        local mainPart = teleportParts[1]
        for i = 2, #teleportParts do
            offsets[teleportParts[i]] = mainPart.CFrame:ToObjectSpace(teleportParts[i].CFrame)
        end
    end
end

local function restoreTeleportMode(character)
    -- Відновлюємо початковий стан Anchored для всіх частин, що не телепортувалися
    for part, anchored in pairs(originalAnchoredStates) do
        if part and part.Parent then
            part.Anchored = anchored
        end
    end
    -- Відновлюємо зварки для телепортованих частин
    for _, part in ipairs(teleportParts) do
        if weldData[part] then
            local newWeld = Instance.new(weldData[part].ClassName)
            newWeld.Part0 = weldData[part].Part0
            newWeld.Part1 = weldData[part].Part1
            newWeld.C0 = weldData[part].C0
            newWeld.C1 = weldData[part].C1
            newWeld.Parent = weldData[part].Parent
        end
    end
    -- Очищуємо дані
    teleportParts = {}
    weldData = {}
    offsets = {}
    originalAnchoredStates = {}
end

local function onUpdate()
    if #teleportParts > 0 then
        local mainPart = teleportParts[1]
        local targetCF = mouse.Hit
        if targetCF then
            mainPart.CFrame = targetCF
            for i = 2, #teleportParts do
                local part = teleportParts[i]
                local offset = offsets[part]
                if offset then
                    part.CFrame = mainPart.CFrame * offset
                end
            end
        end
    end
end

local function toggleTeleport()
    local character = player.Character
    if not character then return end

    if not teleportActive then
        setupTeleportMode(character)
        updateConnection = RunService.RenderStepped:Connect(onUpdate)
        teleportActive = true
    else
        if updateConnection then
            updateConnection:Disconnect()
            updateConnection = nil
        end
        restoreTeleportMode(character)
        teleportActive = false
    end
end

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.T then
        toggleTeleport()
    end
end)
