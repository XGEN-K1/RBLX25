-- Global variable: true to enable, false to disable
getgenv().afk = true

-- Get necessary services
local virtualInputManager = game:GetService("VirtualInputManager")
local userInputService = game:GetService("UserInputService")
local player = game:GetService("Players").LocalPlayer

-- Function to check if the right mouse button is being held
-- Avoids the annoying bug of getting the right mouse button stuck
local function isRightMouseButtonHeld()
    return userInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton2)
end

-- Loop to perform continuous right-click actions
while getgenv().afk do
    if not isRightMouseButtonHeld() then
        -- Perform a right-click and release immediately
        virtualInputManager:SendMouseButtonEvent(1, 1, Enum.UserInputType.MouseButton2.Value, true, game, 1)
        virtualInputManager:SendMouseButtonEvent(1, 1, Enum.UserInputType.MouseButton2.Value, false, game, 1)
        --print("click")
        wait(300)
    else
        print("Temporarily disabling anti-afk as the user is holding the right mouse button.")
        wait(600)
    end
end

print("The loop has stopped because getgenv().afk is set to false.")