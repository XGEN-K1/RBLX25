if game.PlaceId ~= 12196278347 then
    --warn("Цей скрипт можна використовувати лише в грі з ID 12196278347.")
    return
end

local drownDamage = workspace.ServerData.Configuration:FindFirstChild("DrownDamage")
drownDamage.Value = 0
