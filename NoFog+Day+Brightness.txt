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
