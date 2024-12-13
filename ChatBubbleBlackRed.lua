local ChatService = game:GetService("Chat")
				ChatService.BubbleChatEnabled = true
				local bubbleChatSettings = {
					--ImageColor3 = Color3.fromRGB(0, 0, 255)
					BackgroundColor3 = Color3.fromRGB(0, 0, 0),
					TextColor3 = Color3.fromRGB(255, 0, 0),
					TextSize = 10,
					Transparency = 0.1,
					TailVisible = false,
					CornerEnabled = true,
					Font = Enum.Font.Legacy,
					BubbleDuration = 10,
					Padding = 5,
					BubblesSpacing = 3,
					MaxBubbles = 7,
					MaxDistance = 300,
					MinimizeDistance = 300,
					CornerRadius = UDim.new(0, 10),
				}
				-- Apply the settings
				ChatService:SetBubbleChatSettings(bubbleChatSettings)
				game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("SayMessageRequest"):FireServer(" ","All")
