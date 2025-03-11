local playerNameToTeleport = "" -- Якщо порожнє, використовуємо локального гравця; або вкажіть інше ім’я
local parentFolder = workspace.Grab
local targetPosition = Vector3.new(1581, 20, -346) -- Точка призначення для телепортації
local teleportDuration = 1 -- Тривалість телепортації (секунди)
local teleportInterval = 0.2 -- Інтервал між перевірками (секунди)

local checkAnchored = true -- Якщо true, перевіряємо, чи об’єкт не заанкерований

-- Налаштування: чи телепортувати, якщо власник = локальний гравець, і чи телепортувати, якщо власник відсутній (nil або немає властивості Owner)
local teleportLocalOwner = false
local teleportNilOwner = true

local function teleportObjects()
    local playerName = (playerNameToTeleport == "" and game.Players.LocalPlayer.Name) or playerNameToTeleport
    local startTime = tick()
    local endTime = startTime + teleportDuration

    while tick() < endTime do
        for _, child in ipairs(parentFolder:GetChildren()) do
            if tick() >= endTime then
                return
            end

            if child:IsA("Model") then
                local ownerObj = child:FindFirstChild("Owner")
                local owner = nil
                if ownerObj then
                    if ownerObj.Value ~= nil then
                        owner = tostring(ownerObj.Value)
                    end
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
                        child:SetPrimaryPartCFrame(CFrame.new(targetPosition))
                    end
                end
            end
        end
        wait(teleportInterval)
    end
end

teleportObjects()
print("Телепортація завершена.")
