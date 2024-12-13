local Animate = game.Players.LocalPlayer.Character.Animate
				Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=616158929"
				Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=616160636"
				Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=616168032"
				Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=616163682"
				Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=616161997"
				Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=616156119"
				Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=616157476"
				game.Players.LocalPlayer.Character.Humanoid.Jump = true
				game.Players.LocalPlayer.CharacterAdded:Connect(function()
					wait(1)
					local Animate = game.Players.LocalPlayer.Character.Animate
					Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=616158929"
					Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=616160636"
					Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=616168032"
					Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=616163682"
					Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=616161997"
					Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=616156119"
					Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=616157476"
					game.Players.LocalPlayer.Character.Humanoid.Jump = true
				end)
