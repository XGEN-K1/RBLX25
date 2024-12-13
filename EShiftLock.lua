local Players = game:GetService("Players")
				local NewLockKey = "E"
				local MouseLockController = Players.LocalPlayer.PlayerScripts:WaitForChild("PlayerModule"):WaitForChild("CameraModule"):WaitForChild("MouseLockController")
				local Object = MouseLockController:FindFirstChild("BoundKeys")
				if Object then
					Object.Value = NewLockKey
				else
					Object = Instance.new("StringValue")
					Object.Name = "BoundKeys"
					Object.Value = NewLockKey
					Object.Parent = MouseLockController
				end
