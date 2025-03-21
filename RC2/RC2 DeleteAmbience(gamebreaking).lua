if game.PlaceId ~= 12196278347 then
    --warn("Цей скрипт можна використовувати лише в грі з ID 12196278347.")
    return
end


local player = game:GetService("Players").LocalPlayer
local ambienceHandler = player:FindFirstChild("PlayerScripts") and player.PlayerScripts:FindFirstChild("AmbienceHandler")

if ambienceHandler then
    ambienceHandler:Destroy()
end
