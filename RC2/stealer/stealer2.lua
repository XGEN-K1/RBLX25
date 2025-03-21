local playerNameToTeleport = "" -- Якщо порожнє, використовуємо локального гравця; або вкажіть інше ім’я
local parentFolder = workspace.Grab
local targetPosition = Vector3.new(326, 66, -381) -- Точка призначення для телепортації
local teleportDuration = 1 -- Тривалість телепортації (секунди)
local teleportInterval = 0.2 -- Інтервал між перевірками (секунди)

local checkAnchored = true -- Якщо true, перевіряємо, чи об’єкт не заанкерований

local teleportLocalOwner = false
local teleportNilOwner = true

local maxTeleportCount = 300 -- Ліміт на кількість об’єктів для телепортації
local searchRadius = 200 -- Радіус пошуку від локального гравця

local function teleportObjects()
    local player = game.Players.LocalPlayer
    local character = player.Character
    if not character or not character:FindFirstChild("HumanoidRootPart") then
        warn("Не вдалося знайти персонажа локального гравця або його HumanoidRootPart")
        return
    end
    local localPosition = character.HumanoidRootPart.Position
    local playerName = (playerNameToTeleport == "" and player.Name) or playerNameToTeleport
    local startTime = tick()
    local endTime = startTime + teleportDuration
    local teleportedCount = 0

    while tick() < endTime do
        for _, child in ipairs(parentFolder:GetChildren()) do
            if tick() >= endTime then
                return
            end
            if teleportedCount >= maxTeleportCount then
                return
            end

            if child:IsA("Model") then
                local ownerObj = child:FindFirstChild("Owner")
                local owner = nil
                if ownerObj and ownerObj.Value ~= nil then
                    owner = tostring(ownerObj.Value)
                end

                local shouldTeleport = false
                if owner == nil then
                    if teleportNilOwner then
                        shouldTeleport = true
                    end
                else
                    if owner == playerName then
                        if teleportLocalOwner then
                            shouldTeleport = true
                        end
                    else
                        shouldTeleport = true
                    end
                end

                if shouldTeleport then
                    local primaryPart = child.PrimaryPart or child:FindFirstChildWhichIsA("BasePart")
                    if primaryPart and (not primaryPart.Anchored or checkAnchored) then
                        if (primaryPart.Position - localPosition).Magnitude <= searchRadius then
                            child:SetPrimaryPartCFrame(CFrame.new(targetPosition))
                            teleportedCount = teleportedCount + 1
                            if teleportedCount >= maxTeleportCount then
                                return
                            end
                        end
                    end
                end
            end
        end
        wait(teleportInterval)
    end
end

teleportObjects()
print("Телепортація завершена.")
