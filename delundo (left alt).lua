
				-- KEY
				local Key = Enum.KeyCode.LeftAlt
				-- By axelloft1 pls dont skid
				local Plr = game:GetService("Players").LocalPlayer
				local Mouse = Plr:GetMouse()
				 
				local AltZ = {}
				local Object = nil
				Mouse.Button1Down:connect(function()
				if not game:GetService("UserInputService"):IsKeyDown(Key) then return end
				if not Mouse.Target then return end
				Object = Mouse.Target
				Object.Parent = game.ReplicatedStorage
				table.insert(AltZ,#AltZ + 1,Object)
				end)
				 
				game:GetService("UserInputService").InputBegan:Connect(function()
				if not game:GetService("UserInputService"):IsKeyDown(Key) then return end
				if not game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.Z) then return end
				local Bruh = AltZ[#AltZ]
				Bruh.Parent = game.Workspace
				table.remove(AltZ,#AltZ)
				end)
