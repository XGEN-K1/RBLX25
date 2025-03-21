if game.PlaceId ~= 12196278347 then
    --warn("Цей скрипт можна використовувати лише в грі з ID 12196278347.")
    return
end


-- Локальний скрипт
local lighting = game.Lighting

-- Функція для оновлення налаштувань туману
local function updateFogSettings()
    lighting.FogEnd = 100000
    lighting.FogStart = 0
    lighting.ClockTime = 14
    lighting.Brightness = 2
    lighting.GlobalShadows = false
end

-- Слухаємо події зміни властивостей
lighting:GetPropertyChangedSignal("FogEnd"):Connect(updateFogSettings)
lighting:GetPropertyChangedSignal("FogStart"):Connect(updateFogSettings)
lighting:GetPropertyChangedSignal("ClockTime"):Connect(updateFogSettings)
lighting:GetPropertyChangedSignal("Brightness"):Connect(updateFogSettings)
lighting:GetPropertyChangedSignal("GlobalShadows"):Connect(updateFogSettings)

-- Оновлюємо налаштування при запуску
updateFogSettings()
