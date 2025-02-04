--source loadstring(game:HttpGet("https://raw.githubusercontent.com/RedZenXYZ/TargetGui/main/TargetZenGui"))()
function tryexecuting(Source) loadstring(Source)() end
--- You Can Chance Anything You wanna BUT NOT CREDIT IF YOU CHANCE CREDIT I WILL BURN YOUR HOUSE DOWN!!!!!!!!!!!!!!



--- [ Instances ] ---

	local TGui = Instance.new("ScreenGui")
	local F = Instance.new("Frame")
	local F2 = Instance.new("Frame")
	local Close2 = Instance.new("TextButton")
	local Close = Instance.new("TextButton")
	local Remove = Instance.new("TextButton")
	local Remove2 = Instance.new("TextButton")
	local Open2 = Instance.new("TextButton")
	local Open = Instance.new("TextButton")
	local FixAll = Instance.new("TextButton")
	local Next = Instance.new("TextButton")
	local Back = Instance.new("TextButton")
	local Style = Instance.new("TextButton")
	local Down = Instance.new("TextButton")
	local Upper = Instance.new("TextButton")
	local Behide = Instance.new("TextButton")
	local Custom = Instance.new("TextButton")
	local Goto = Instance.new("TextButton")
	local Kill = Instance.new("TextButton")
	local Bring = Instance.new("TextButton")
	local Brazil = Instance.new("TextButton")
	local Fling = Instance.new("TextButton")
	local SWP = Instance.new("TextButton")
	local SSP = Instance.new("TextButton")
	local SpawnTitle = Instance.new("TextLabel")
	local SpawnDelay = Instance.new("TextBox")
	local GotoWP = Instance.new("TextButton")
	local View = Instance.new("TextButton")
	local Hunt = Instance.new("TextButton")
	local HuntOn = Instance.new("TextButton")
	local Aim = Instance.new("TextButton")
	local LocateOn = Instance.new("TextButton")
	local Locate = Instance.new("TextButton")
	local SpeedE = Instance.new("TextButton")
	local JumpNHentai = Instance.new("TextButton")
	local Noclip = Instance.new("TextButton")
	local SetGrav = Instance.new("TextButton")
	local SetHipHeight = Instance.new("TextButton")
	local ScrollingFrame = Instance.new("ScrollingFrame")
	local UIGrid = Instance.new("UIGridLayout")
	local AddScript = Instance.new("TextButton")
	local ScriptName = Instance.new("TextBox")
	local AddToScriptHub = Instance.new("TextButton")
	local SourceTextBox = Instance.new("TextBox")
	local ClearSource = Instance.new("TextButton")
	local TryExecute = Instance.new("TextButton")
	local SourceFrame = Instance.new("Frame")
	local CloseSource = Instance.new("TextButton")
	local UseToolsGui = Instance.new("TextButton")
	local DropToolsGui = Instance.new("TextButton")
	local DashGui = Instance.new("TextButton")
	local FlyGuiV3 = Instance.new("TextButton")
	local InfiniteYield = Instance.new("TextButton")
	local ReachGuiV3 = Instance.new("TextButton")
	local Next = Instance.new("TextButton")
	local Back = Instance.new("TextButton")
	local Next2 = Instance.new("TextButton")
	local Back2 = Instance.new("TextButton")
	local Target = Instance.new("TextBox")
	local Number1 = Instance.new("TextBox")
	local Number2 = Instance.new("TextBox")
	local Number3 = Instance.new("TextBox")
	local Speed = Instance.new("TextBox")
	local Jump = Instance.new("TextBox")
	local Grav = Instance.new("TextBox")
	local HipHeight = Instance.new("TextBox")
	local SetToNormal = Instance.new("TextButton")
	local ReCam = Instance.new("TextButton")
	local Image = Instance.new("ImageLabel")
	local A = Instance.new("TextLabel")
	local A2 = Instance.new("TextLabel")
	local B1 = Instance.new("TextLabel")
	local B2 = Instance.new("TextLabel")
	local B3 = Instance.new("TextLabel")
	local Page = Instance.new("TextLabel")
	local PlaceName = Instance.new("TextBox")
	local PlaceID = Instance.new("TextBox")
	local MaxPlayers = Instance.new("TextLabel")
	local PlayersInServer = Instance.new("TextLabel")
	local Time = Instance.new("TextLabel")
	local Rejoin = Instance.new("TextButton")
	local ReText = Instance.new("TextButton")
	local FindLowServer = Instance.new("TextButton")
	local FindBigServer = Instance.new("TextButton")
	local CopyPlaceId = Instance.new("TextButton")
	local CopyPlaceName = Instance.new("TextButton")
	local CheckPlayer = Instance.new("TextButton")
	local TargetId = Instance.new("TextBox")
	local TargetName = Instance.new("TextBox")
	local TargetDisplayName = Instance.new("TextBox")
	local TargetAccountAge = Instance.new("TextBox")
	local TargetJoinDate = Instance.new("TextBox")
	local MouthDayYear = Instance.new("TextLabel")
	local CopyTargetId = Instance.new("TextButton")
	local CopyTargetName = Instance.new("TextButton")
	local CopyTargetDisplayName = Instance.new("TextButton")
	local Youtube = Instance.new("TextButton")
	local ChannelLink = Instance.new("TextBox")
	local Discord = Instance.new("TextButton")
	local DiscordName = Instance.new("TextBox")
	local Tips = Instance.new("TextLabel")

--- [ End Of Instances ] ---



--- [ Stats ] ---

	pcall(function()
		walkspeed = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid").WalkSpeed
		jumppower = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid").JumpPower
		hipheight = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid").HipHeight
		gravity = Workspace.Gravity
	end)

--- [ End Of Stats ] ---



--- [ Scrips File ] ---

	local success, result = pcall(function()
		readfile("TargetGui_Scripts.txt")
		print("Scripts Loaded")
	end)
	if not success then
		writefile("TargetGui_Scripts.txt", "")
	end

--- [ End Of Scripts File ] ---



--- [ Functions ] ---

	_G.Rainbow = true
	spawn(function()
		num = 0
		while _G.Rainbow == true do wait()
			num = num + 0.005
			F.BackgroundColor3 = Color3.fromHSV(num, 1, 1)
			F2.BackgroundColor3 = Color3.fromHSV(num, 1, 1)
			if num >= 1 then
				num = 0
			end
		end
	end)

--- [ End Of Functions ] ---



TGui.Name = "TargetGui"
TGui.Parent = game.CoreGui

A.Name = "Pog"
A.Parent = TGui
A.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
A.Text = "Make by Red_BloxZ"
A.TextScaled = true
A.TextColor3 = Color3.fromRGB(255,255,255)
A.Position = UDim2.new(0, 300, 0, 200)
A.Size = UDim2.new(0, 400, 0, 34)
A.Draggable = true
A.Active = true
A.Visible = false

A2.Name = "Pog2"
A2.Parent = F
A2.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
A2.Text = "Target Gui (Page 1)"
A2.TextScaled = true
A2.TextColor3 = Color3.fromRGB(255,255,255)
A2.Position = UDim2.new(0, 34, 0, 0)
A2.Size = UDim2.new(0, 332, 0, 34)
A2.Draggable = false
A2.Active = false
A2.Visible = true

Image.Name = "ImagePlayer"
Image.Parent = F
Image.Size = UDim2.new(0, 96, 0, 96)
Image.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Image.Image = ""
Image.Position = UDim2.new(0, 20, 0, 40)

Open2.Name = "OpenSetting"
Open2.Parent = F
Open2.Size = UDim2.new(0, 34, 0, 34)
Open2.Position = UDim2.new(0, 0, 0, 250)
Open2.Text = "⚙️"
Open2.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Open2.TextScaled = true
Open2.MouseButton1Click:Connect(function()
	Close2.Visible = true
	Open2.Visible = false
	F2.Visible = true
end)

Style.Name = "Style (Show)"
Style.Parent = F2
Style.Size = UDim2.new(0, 50, 0, 50)
Style.Position = UDim2.new(0, 10, 0, 10)
Style.Text = "Up"
Style.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Style.TextColor3 = Color3.fromRGB(255, 255, 255)
Style.TextScaled = true
Style.MouseButton1Click:Connect(function()
	Upper.Visible = true
	Down.Visible = true
	Behide.Visible = true
	Custom.Visible = true
end)

Upper.Name = "Upper"
Upper.Parent = Style
Upper.Size = UDim2.new(0, 50, 0, 50)
Upper.Position = UDim2.new(0, 50, 0, 0)
Upper.Text = "Up"
Upper.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Upper.TextColor3 = Color3.fromRGB(255, 255, 255)
Upper.TextScaled = true
Upper.Visible = false
Upper.MouseButton1Click:Connect(function()
	Behide.Visible = false
	Down.Visible = false
	Upper.Visible = false
	Custom.Visible = false
	B1.Visible = true
	B1.Text = "Behide"
	B2.Visible = true
	B2.Text = "Up"
	B3.Visible = true
	B3.Text = "Down"
	Style.Text = "Up"
end)

Down.Name = "Down"
Down.Parent = Style
Down.Size = UDim2.new(0, 50, 0, 50)
Down.Position = UDim2.new(0, 100, 0, 0)
Down.Text = "Down"
Down.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Down.TextColor3 = Color3.fromRGB(255, 255, 255)
Down.TextScaled = true
Down.Visible = false
Down.MouseButton1Click:Connect(function()
	Behide.Visible = false
	Down.Visible = false
	Upper.Visible = false
	Custom.Visible = false
	B1.Visible = true
	B1.Text = "Behide"
	B2.Visible = true
	B2.Text = "Up"
	B3.Visible = true
	B3.Text = "Down"
	Style.Text = "Down"
end)

Behide.Name = "Behide"
Behide.Parent = Style
Behide.Size = UDim2.new(0, 50, 0, 50)
Behide.Position = UDim2.new(0, 150, 0, 0)
Behide.Text = "Behide"
Behide.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Behide.TextColor3 = Color3.fromRGB(255, 255, 255)
Behide.TextScaled = true
Behide.Visible = false
Behide.MouseButton1Click:Connect(function()
	Behide.Visible = false
	Down.Visible = false
	Upper.Visible = false
	Custom.Visible = false
	B1.Visible = true
	B1.Text = "Behide"
	B2.Visible = true
	B2.Text = "Up"
	B3.Visible = true
	B3.Text = "Down"
	Style.Text = "Behide"
end)

Custom.Name = "TextButton"
Custom.Parent = Style
Custom.Size = UDim2.new(0, 50, 0, 50)
Custom.Position = UDim2.new(0, 50, 0, 50)
Custom.Text = "Custom"
Custom.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Custom.TextColor3 = Color3.fromRGB(255, 255, 255)
Custom.TextScaled = true
Custom.Visible = false
Custom.MouseButton1Click:Connect(function()
	Behide.Visible = false
	Down.Visible = false
	Upper.Visible = false
	Custom.Visible = false
	B2.Text = "X"
	B3.Text = "Y"
	B1.Text = "Z"
	Style.Text = "Custom"
end)

Open.Name = "Open"
Open.Parent = A
Open.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
Open.Position = UDim2.new(0, 0, 0, 0)
Open.Size = UDim2.new(0, 34, 0, 34)
Open.Font = Enum.Font.SourceSans
Open.Text = "+"
Open.TextColor3 = Color3.fromRGB(0, 0, 0)
Open.TextSize = 50
Open.TextWrapped = true
Open.Visible = false
Open.MouseButton1Click:Connect(function()
	F.Visible = true
	Close.Visible = true
	Open.Visible = false
	A.Visible = false
	A.Transparency = 0
	Open.Transparency = 0
	Remove2.Transparency = 0
end)

Remove.Name = "RemoveGui"
Remove.Parent = F
Remove.Size = UDim2.new(0, 34, 0, 34)
Remove.Text = "Remove"
Remove.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
Remove.TextScaled = true
Remove.Position = UDim2.new(0, 366, 0, 0)
Remove.TextColor3 = Color3.fromRGB(0, 0, 0)
Remove.MouseButton1Click:Connect(function()
	pcall(function()
		TGui:destroy()
		_G.View = false
		workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character.Humanoid
		wait(0.1)
		workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character.Humanoid
		wait(0.1)
		workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character.Humanoid
	    _G.Hunt = false
		game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChildOfClass("BodyVelocity"):Destroy()
		game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChildOfClass("BodyGyro"):Destroy()
		local BV = Instance.new("BodyVelocity",game.Players.LocalPlayer.Character.HumanoidRootPart)
		local BG = Instance.new("BodyGyro",game.Players.LocalPlayer.Character.HumanoidRootPart)
		game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChildOfClass("BodyVelocity"):Destroy()
		game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChildOfClass("BodyGyro"):Destroy()
	end)
end)

Remove2.Name = "Remove2"
Remove2.Parent = A
Remove2.Size = UDim2.new(0, 34, 0, 34)
Remove2.Position = UDim2.new(0, 370, 0, 0)
Remove2.Text = "Remove"
Remove2.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
Remove2.TextColor3 = Color3.fromRGB(0,0,0)
Remove2.TextScaled = true
Remove2.Visible = true
Remove2.MouseButton1Click:Connect(function()
	pcall(function()
		TGui:destroy()
		_G.View = false
		workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character.Humanoid
		wait(0.1)
		workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character.Humanoid
		wait(0.1)
		workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character.Humanoid
	    _G.Hunt = false
		game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChildOfClass("BodyVelocity"):Destroy()
		game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChildOfClass("BodyGyro"):Destroy()
		local BV = Instance.new("BodyVelocity",game.Players.LocalPlayer.Character.HumanoidRootPart)
		local BG = Instance.new("BodyGyro",game.Players.LocalPlayer.Character.HumanoidRootPart)
		game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChildOfClass("BodyVelocity"):Destroy()
		game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChildOfClass("BodyGyro"):Destroy()
		if Noclipping then
			Noclipping:Disconnect()
		end
		Clip = true
	end)
end)

Close2.Name = "OpenSetting"
Close2.Parent = F2
Close2.Size = UDim2.new(0, 34, 0, 34)
Close2.Position = UDim2.new(0, 0, 0,116)
Close2.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Close2.BackgroundTransparency = 0.7
Close2.Text = "-"
Close2.TextSize = 60
Close2.TextColor3 = Color3.fromRGB(255,255,255)
Close2.Visible = false
Close2.MouseButton1Click:Connect(function()
	Close2.Visible = false
	Open2.Visible = true 
	F2.Visible = false
end)

Close.Name = "Close"
Close.Parent = F
Close.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
Close.Position = UDim2.new(0, 0, 0, 0)
Close.Size = UDim2.new(0, 34, 0, 34)
Close.Font = Enum.Font.SourceSans
Close.Text = "-"
Close.TextColor3 = Color3.fromRGB(0, 0, 0)
Close.TextSize = 80
Close.TextWrapped = true
Close.MouseButton1Click:Connect(function()
	F.Visible = false
	Close.Visible = false
	Open.Visible = true
	A.Visible = true
	A.Transparency = 0.75
	Open.Transparency = 0.5
	Remove2.Transparency = 0.5
	wait()
	A.TextTransparency = 0.25
	Open.TextTransparency = 0
	Remove2.TextTransparency =  0
end)

FixAll.Name = "TextButton"
FixAll.Parent = F2
FixAll.Size = UDim2.new(0, 34, 0, 34)
FixAll.Position = UDim2.new(0, 34, 0, 116)
FixAll.Text = "Fix All"
FixAll.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
FixAll.TextColor3 = Color3.fromRGB(255, 255, 255)
FixAll.TextScaled = true
FixAll.Visible = true
FixAll.BackgroundTransparency = 0.5
FixAll.MouseButton1Down:Connect(function()
	_G.View = false
		workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character.Humanoid
		wait(0.1)
		workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character.Humanoid
		wait(0.1)
		workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character.Humanoid
	_G.Hunt = false
		game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChildOfClass("BodyVelocity"):Destroy()
		game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChildOfClass("BodyGyro"):Destroy()
		local BV = Instance.new("BodyVelocity",game.Players.LocalPlayer.Character.HumanoidRootPart)
		local BG = Instance.new("BodyGyro",game.Players.LocalPlayer.Character.HumanoidRootPart)
		game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChildOfClass("BodyVelocity"):Destroy()
		game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChildOfClass("BodyGyro"):Destroy()
		View.Text = "View (Off)"
		View.TextColor3 = Color3.fromRGB(255,0,0)
		Hunt.Text = "Hunt (Off)"
		Hunt.TextColor3 = Color3.fromRGB(255,0,0)
	if Noclipping then
		Noclipping:Disconnect()
	end
	Clip = true
end)

Fling.Name = "Fling"
Fling.Parent = F
Fling.Visible = false
Fling.Size = UDim2.new(0, 100, 0, 40)
Fling.TextScaled = true
Fling.Text = "Fling"
Fling.Position = UDim2.new(0, 150, 0, 100)
Fling.TextColor3 = Color3.fromRGB(255, 255, 255)
Fling.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Fling.MouseButton1Click:Connect(function()
	if Target.Text == "" then
		game:GetService("StarterGui"):SetCore("SendNotification",{
		    Title = "Fail To Fling/Target TextBox Is Empty";
		    Text = "Fail To Fling/Target TextBox Is Empty";
		    Duration = 10;
		})
	else
		Fling(Target.Text)
	end
end)

Next.Name = "Next"
Next.Parent = F
Next.Size = UDim2.new(0, 25, 0, 40)
Next.Position = UDim2.new(0, 225, 0, 200)
Next.Text = ">"
Next.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Next.TextColor3 = Color3.fromRGB(255, 255, 255)
Next.TextScaled = true
Next.MouseButton1Down:Connect(function()
	if Page.Text == "1" then
		Page.Text = "2"
		A2.Text = "Target Gui (Page 2)"
		Hunt.Visible = false
		Goto.Visible = false
		Kill.Visible = false
		Bring.Visible = false
		Aim.Visible = false
		View.Visible = false
		Locate.Visible = false
		LocateOn.Visible = false
		Brazil.Visible = true
		SSP.Visible = true
		F.Fling.Visible = true
	else
		if Page.Text == "2" then
			A2.Text = "LocalPlayer Stats"
			Page.Text = "3"
			SpeedE.Visible = true
			SetToNormal.Visible = true
			ReCam.Visible = true
			Speed.Visible = true
			Target.Visible = false
			Image.Visible = false
			GotoWP.Visible = false
			SWP.Visible = false
			JumpNHentai.Visible = true
			Jump.Visible = true
			Brazil.Visible = false
			SSP.Visible = false
			Grav.Visible = true
			Noclip.Visible = true
			SetGrav.Visible = true
			SetHipHeight.Visible = true
			HipHeight.Visible = true
			F.Fling.Visible = false
		else
			if Page.Text == "3" then
				Page.Text = "4"
				A2.Text = "Random Gui"
				AddScript.Visible = true
				ScrollingFrame.Visible = true
				SpeedE.Visible = false
				SetToNormal.Visible = false
				ReCam.Visible = false
				Speed.Visible = false
				JumpNHentai.Visible = false
				Jump.Visible = false
				Grav.Visible = false
				SetGrav.Visible = false
				SetHipHeight.Visible = false
				HipHeight.Visible = false
				Noclip.Visible = false
			else
				if Page.Text == "4" then
					Page.Text = "5"
					A2.Text = "Server Info"
					SourceFrame.Visible = false
					TryExecute.Visible = false
					ClearSource.Visible = false
					AddScript.Visible = false
					ScrollingFrame.Visible = false
					PlaceName.Visible = true
					PlaceID.Visible = true
					MaxPlayers.Visible = true
					PlayersInServer.Visible = true
					Time.Visible = true
					Rejoin.Visible = true
					ReText.Visible = true
					FindBigServer.Visible = true
					FindLowServer.Visible = true
				else
					if Page.Text == "5" then
						Page.Text = "6"
						A2.Text = "Target Info"
						FindLowServer.Visible = false
						FindBigServer.Visible = false
						PlaceName.Visible = false
						PlaceID.Visible = false
						MaxPlayers.Visible = false
						PlayersInServer.Visible = false
						Time.Visible = false
						Rejoin.Visible = false
						ReText.Visible = false
						Target.Visible = true
						Image.Visible = true
						CheckPlayer.Visible = true
						TargetId.Visible = true
						TargetName.Visible = true
						TargetDisplayName.Visible = true
						TargetJoinDate.Visible = true
						TargetAccountAge.Visible = true
						MouthDayYear.Visible = true
					else
						if Page.Text == "6" then
							Page.Text = "7"
							A2.Text = "Credit"
							Target.Visible = false
							Image.Visible = false
							CheckPlayer.Visible = false
							TargetId.Visible = false
							TargetName.Visible = false
							TargetDisplayName.Visible = false
							TargetJoinDate.Visible = false
							TargetAccountAge.Visible = false
							MouthDayYear.Visible = false
							ChannelLink.Visible = true
							Youtube.Visible = true
							DiscordName.Visible = true
							Discord.Visible = true
							Tips.Visible = true
						end
					end
				end
			end
		end
	end
end)

Back.Name = "Back"
Back.Parent = F
Back.Size = UDim2.new(0, 25, 0, 40)
Back.Position = UDim2.new(0, 150, 0, 200)
Back.Text = "<"
Back.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Back.TextColor3 = Color3.fromRGB(255, 255, 255)
Back.TextScaled = true
Back.MouseButton1Down:Connect(function()
	if Page.Text == "2" then
		A2.Text = "Target Gui (Page 1)"
		Page.Text = "1"
		Hunt.Visible = true
		Goto.Visible = true
		Kill.Visible = true
		Bring.Visible = true
		Aim.Visible = true
		View.Visible = true
		Locate.Visible = true
		Image.Visible = true
		SpeedE.Visible = false
		Brazil.Visible = false
		SSP.Visible = false
		F.Fling.Visible = false
	else
		if Page.Text == "3" then
			Page.Text = "2"
			A2.Text = "Target Gui (Page 2)"
			ReCam.Visible = false
			SetToNormal.Visible = false
			SpeedE.Visible = false
			Speed.Visible = false
			Jump.Visible = false
			JumpNHentai.Visible = false
			Target.Visible = true
			Image.Visible = true
			GotoWP.Visible = true
			SWP.Visible = true
			Brazil.Visible = true
			SSP.Visible = true
			Grav.Visible = false
			SetGrav.Visible = false
			Noclip.Visible = false
			SetHipHeight.Visible = false
			HipHeight.Visible = false
			F.Fling.Visible = true
		else
			if Page.Text == "4" then
				Page.Text = "3"
				A2.Text = "LocalPlayer Stats"
				AddScript.Visible = false
				ClearSource.Visible = false
				TryExecute.Visible = false
				SourceFrame.Visible = false
				ScrollingFrame.Visible = false
				Speed.Visible = true
				SetToNormal.Visible = true
				SpeedE.Visible = true
				JumpNHentai.Visible = true
				Jump.Visible = true
				Grav.Visible = true
				ReCam.Visible = true
				SetGrav.Visible = true
				Noclip.Visible = true
				HipHeight.Visible = true
				SetHipHeight.Visible = true
			else
				if Page.Text == "5" then
					Page.Text = "4"
					A2.Text = "Random Gui"
					AddScript.Visible = true
					ScrollingFrame.Visible = true
					PlaceName.Visible = false
					PlaceID.Visible = false
					MaxPlayers.Visible = false
					PlayersInServer.Visible = false
					Time.Visible = false
					Rejoin.Visible = false
					ReText.Visible = false
					FindBigServer.Visible = false
					FindLowServer.Visible = false
				else
					if Page.Text == "6" then
						A2.Text = "Server Info"
						Page.Text = "5"
						PlaceName.Visible = true
						PlaceID.Visible = true
						MaxPlayers.Visible = true
						PlayersInServer.Visible = true
						Time.Visible = true
						Rejoin.Visible = true
						ReText.Visible = true
						FindBigServer.Visible = true
						FindLowServer.Visible = true
						CheckPlayer.Visible = false
						Image.Visible = false
						Target.Visible = false
						TargetId.Visible = false
						TargetName.Visible = false
						TargetJoinDate.Visible = false
						TargetAccountAge.Visible = false
						MouthDayYear.Visible = false
						TargetDisplayName.Visible = false
					else
						if Page.Text == "7" then
							Page.Text = "6"
							A2.Text = "Target Info"
							Target.Visible = true
							Image.Visible = true
							CheckPlayer.Visible = true
							TargetId.Visible = true
							TargetName.Visible = true
							TargetDisplayName.Visible = true
							TargetJoinDate.Visible = true
							TargetAccountAge.Visible = true
							MouthDayYear.Visible = true
							ChannelLink.Visible = false
							Youtube.Visible = false
							DiscordName.Visible = false
							Discord.Visible = false
							Tips.Visible = false
						end
					end
				end
			end
		end
	end
end)

Next2.Name = "Next2"
Next2.Parent = F2
Next2.Size = UDim2.new(0, 34, 0, 34)
Next2.Position = UDim2.new(0, 68, 0, 116)
Next2.Text = ">"
Next2.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
Next2.TextColor3 = Color3.fromRGB(255, 255, 255)
Next2.TextScaled = true
Next2.BackgroundTransparency = 0.5
Next2.TextSize = 20
Next2.Visible = true
Next2.MouseButton1Down:Connect(function()
	if Style.Name == "Style (Show)" then
		Style.Name = "Style (Hidden)"
		Next2.Position = UDim2.new(0,102,0,116)
		Style.Visible = false
		Back2.Visible = true
		SpawnDelay.Visible = true
	end
end)

Back2.Name = "Back2"
Back2.Parent = F2
Back2.Size = UDim2.new(0, 34, 0, 34)
Back2.Position = UDim2.new(0, 68, 0, 116)
Back2.Text = "<"
Back2.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
Back2.TextColor3 = Color3.fromRGB(255, 255, 255)
Back2.TextScaled = true
Back2.TextSize = 20
Back2.BackgroundTransparency = 0.5
Back2.Visible = false
Back2.MouseButton1Down:Connect(function()
	if Style.Name == "Style (Hidden)" then
		Style.Name = "Style (Show)"
		Next2.Position = UDim2.new(0,68,0,116)
		Style.Visible = true
		Back2.Visible = false
		SpawnDelay.Visible = false
	end
end)

Page.Name = "Page"
Page.Parent = F
Page.Size = UDim2.new(0, 40, 0, 40)
Page.Position = UDim2.new(0, 180, 0, 200)
Page.Text = "1"
Page.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Page.TextColor3 = Color3.fromRGB(255, 255, 255)
Page.TextScaled = true

F.Name = "Frame"
F.Parent = TGui
F.Size = UDim2.new(0, 400, 0, 250)
F.Position = UDim2.new(0, 300, 0, 100)
F.BackgroundColor3 = Color3.fromHSV(0, 1, 1)
F.BackgroundTransparency = 0.5
F.Draggable = true
F.Active = true

F2.Name = "SettingFrame"
F2.Parent = F
F2.Size = UDim2.new(0, 400, 0, 150)
F2.Position = UDim2.new(0, 0, 0, 250)
F2.BackgroundColor3 = Color3.fromHSV(0, 1, 1)
F2.BackgroundTransparency = 0.5
F2.Visible = false

Number1.Name = "SetUpper"
Number1.Parent = Style
Number1.Size = UDim2.new(0, 50, 0, 50)
Number1.Position = UDim2.new(0, 230, 0, 0)
Number1.Text = "5"
Number1.PlaceholderText = "Num"
Number1.PlaceholderColor3 = Color3.fromRGB(175, 175, 175)
Number1.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Number1.TextColor3 = Color3.fromRGB(255, 255, 255)
Number1.TextSize = 20
Number1.ClearTextOnFocus = true
Number1.TextScaled = true

Number2.Name = "SetDown"
Number2.Parent = Style
Number2.Size = UDim2.new(0, 50, 0, 50)
Number2.Position = UDim2.new(0, 280, 0, 0)
Number2.Text = "5"
Number2.PlaceholderText = "Num"
Number2.PlaceholderColor3 = Color3.fromRGB(175, 175, 175)
Number2.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Number2.TextColor3 = Color3.fromRGB(255, 255, 255)
Number2.TextSize = 20
Number2.ClearTextOnFocus = true
Number2.TextScaled = true

Number3.Name = "SetBehide"
Number3.Parent = Style
Number3.Size = UDim2.new(0, 50, 0, 50)
Number3.Position = UDim2.new(0, 330, 0, 0)
Number3.Text = "5"
Number3.PlaceholderText = "Num"
Number3.PlaceholderColor3 = Color3.fromRGB(175, 175, 175)
Number3.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Number3.TextColor3 = Color3.fromRGB(255, 255, 255)
Number3.TextSize = 20
Number3.ClearTextOnFocus = true
Number3.TextScaled = true

Speed.Name = "TextBox"
Speed.Parent = F
Speed.Size = UDim2.new(0, 100, 0, 40)
Speed.Position = UDim2.new(0, 150, 0, 80)
Speed.Text = "50"
Speed.PlaceholderText = "Enter Speed"
Speed.PlaceholderColor3 = Color3.fromRGB(175, 175, 175)
Speed.ClearTextOnFocus = true
Speed.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Speed.TextColor3 = Color3.fromRGB(255, 255, 255)
Speed.TextSize = 20
Speed.Visible = false
Speed.TextScaled = true

Jump.Name = "TextBox"
Jump.Parent = F
Jump.Size = UDim2.new(0, 100, 0, 40)
Jump.Position = UDim2.new(0, 280, 0, 80)
Jump.Text = "100"
Jump.PlaceholderText = "Enter JumpPower"
Jump.PlaceholderColor3 = Color3.fromRGB(175, 175, 175)
Jump.ClearTextOnFocus = true
Jump.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Jump.TextColor3 = Color3.fromRGB(255, 255, 255)
Jump.TextSize = 20
Jump.Visible = false
Jump.TextScaled = true

Grav.Name = "TextBox"
Grav.Parent = F
Grav.Size = UDim2.new(0, 100, 0, 40)
Grav.Position = UDim2.new(0, 280, 0, 170)
Grav.Text = "100"
Grav.PlaceholderText = "Enter Gravity"
Grav.PlaceholderColor3 = Color3.fromRGB(175, 175, 175)
Grav.ClearTextOnFocus = true
Grav.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Grav.TextColor3 = Color3.fromRGB(255, 255, 255)
Grav.TextSize = 20
Grav.Visible = false
Grav.TextScaled = true

HipHeight.Name = "TextBox"
HipHeight.Parent = F
HipHeight.Size = UDim2.new(0, 100, 0, 40)
HipHeight.Position = UDim2.new(0, 20, 0, 170)
HipHeight.Text = "2"
HipHeight.PlaceholderText = "Enter HipHeight"
HipHeight.PlaceholderColor3 = Color3.fromRGB(175, 175, 175)
HipHeight.ClearTextOnFocus = true
HipHeight.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
HipHeight.TextColor3 = Color3.fromRGB(255, 255, 255)
HipHeight.TextSize = 20
HipHeight.Visible = false
HipHeight.TextScaled = true

B1.Name = "TitleBehide"
B1.Parent = Number3
B1.Size = UDim2.new(0, 50, 0, 50)
B1.Position = UDim2.new(0, 0, 0, 50)
B1.Text = "Behide"
B1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
B1.TextColor3 = Color3.fromRGB(0, 0, 0)
B1.TextScaled = true

B2.Name = "TitleUp"
B2.Parent = Number1
B2.Size = UDim2.new(0, 50, 0, 50)
B2.Position = UDim2.new(0, 0, 0, 50)
B2.Text = "Up"
B2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
B2.TextColor3 = Color3.fromRGB(0, 0, 0)
B2.TextScaled = true

B3.Name = "TitleDown"
B3.Parent = Number2
B3.Size = UDim2.new(0, 50, 0, 50)
B3.Position = UDim2.new(0, 0, 0, 50)
B3.Text = "Down"
B3.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
B3.BorderColor3 = Color3.fromRGB(255, 255, 255)
B3.BorderSizePixel = 1
B3.TextColor3 = Color3.fromRGB(255, 255, 255)
B3.TextScaled = true

Hunt.Name = "Hunt"
Hunt.Parent = F
Hunt.Size = UDim2.new(0, 100, 0, 40)
Hunt.Position = UDim2.new(0, 270, 0, 100)
Hunt.Text = "Hunt (Off)"
Hunt.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Hunt.TextColor3 = Color3.fromRGB(255, 0, 0)
Hunt.TextScaled = true
Hunt.MouseButton1Click:Connect(function()
	if Target.Text == "" then
		game:GetService("StarterGui"):SetCore("SendNotification",{
		    Title = "Fail To Hunt/Target TextBox Is Empty";
		    Text = "Fail To Hunt/Target TextBox Is Empty";
		    Duration = 10;
		})
	else
		if Hunt.Text == "Hunt (Off)" then
			Hunt.Text = "Hunt (On)"
			Hunt.TextColor3 = Color3.fromRGB(0,255,0)
			local BV = Instance.new("BodyVelocity",game.Players.LocalPlayer.Character.HumanoidRootPart)
			local BG = Instance.new("BodyGyro",game.Players.LocalPlayer.Character.HumanoidRootPart)
			BG.MaxTorque = Vector3.new(math.huge,math.huge,math.huge)
			BG.D = 5000
			BG.P = 50000
			BG.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
			BV.MaxForce = Vector3.new(math.huge,math.huge,math.huge)
			BV.Velocity = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector * 0.0000000001
			if Style.Text == "Up" then
				_G.Hunt = true
				while _G.Hunt == true do wait()
					for i,v in pairs(GetPlayer(Target.Text))do
						pcall(function()
							game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[v.Name].Character.HumanoidRootPart.CFrame * CFrame.new(0, Number1.Text, 0)
						end)
					end
				end
			else
				if Style.Text == "Down" then
					_G.Hunt = true
					while _G.Hunt == true do wait()
						for i,v in pairs(GetPlayer(Target.Text))do
							pcall(function()
								game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[v.Name].Character.HumanoidRootPart.CFrame * CFrame.new(0, "-"..Number2.Text, 0)
							end)
						end
					end
				else
					if Style.Text == "Behide" then
						_G.Hunt = true
						while _G.Hunt == true do wait()
							for i,v in pairs(GetPlayer(Target.Text))do
								pcall(function()
									game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[v.Name].Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, Number3.Text)
								end)
							end
						end
					else
						if Style.Text == "Custom" then
							_G.Hunt = true
							while _G.Hunt == true do wait()
								for i,v in pairs(GetPlayer(Target.Text))do
									pcall(function()
										game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[v.Name].Character.HumanoidRootPart.CFrame * CFrame.new(Number1.Text, Number2.Text, Number3.Text)
									end)
								end
							end
						end
					end
				end
			end
		else
	end
		if Hunt.Text == "Hunt (On)" then
			Hunt.Text = "Hunt (Off)"
			Hunt.TextColor3 = Color3.fromRGB(255,0,0)
			wait(.1)
			for i = 1, 5 do
				_G.Hunt = false
			end
			game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChildOfClass("BodyVelocity"):Destroy()
			game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChildOfClass("BodyGyro"):Destroy()
			local BV = Instance.new("BodyVelocity",game.Players.LocalPlayer.Character.HumanoidRootPart)
			local BG = Instance.new("BodyGyro",game.Players.LocalPlayer.Character.HumanoidRootPart)
			game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChildOfClass("BodyVelocity"):Destroy()
			game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChildOfClass("BodyGyro"):Destroy()
		end
	end
end)

SWP.Name = "SetWayPoint"
SWP.Parent = F
SWP.Size = UDim2.new(0, 70, 0, 30)
SWP.Position = UDim2.new(0, -70, 0, 35)
SWP.Text = "MakeWayPoint"
SWP.TextScaled = true
SWP.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SWP.TextColor3 = Color3.fromRGB(0, 0, 0)
SWP.MouseButton1Click:Connect(function()
	for i,v in pairs(Workspace:GetDescendants()) do
		if v.Name == "WayPointPart" then
			v:Destroy()
		end
	end
	local WayPointPart = Instance.new("Part")
	WayPointPart.Name = "WayPointPart"
	WayPointPart.Parent = Workspace
	WayPointPart.Size = Vector3.new(1, 1, 1)
	WayPointPart.Transparency = 1
	WayPointPart.Anchored = true
	WayPointPart.CanCollide = false
	WayPointPart.CFrame = game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame
		game.StarterGui:SetCore("SendNotification",  {
			 Title = "Set Way Point";
			 Text = "Done!, Set Way Point";
		})
end)

SSP.Name = "TextButton"
SSP.Parent = F
SSP.Size = UDim2.new(0, 100, 0, 40)
SSP.Position = UDim2.new(0, 270, 0, 50)
SSP.Text = "SetSpawnPoint"
SSP.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
SSP.TextColor3 = Color3.fromRGB(0, 255, 0)
SSP.TextScaled = true
SSP.Visible = false
SSP.MouseButton1Down:Connect(function()
	if SSP.Text == "SetSpawnPoint" then
		SSP.Text = "No SpawnPoint"
		SSP.TextColor3 = Color3.fromRGB(255,0,0)
		for i,v in pairs(Workspace:GetDescendants()) do
			if v.Name == "SpawnPointPart" then
				v:Destroy()
			end
		end
		local SpawnPointPart = Instance.new("Part")
		SpawnPointPart.Name = "SpawnPointPart"
		SpawnPointPart.Parent = Workspace
		SpawnPointPart.Size = Vector3.new(1, 1, 1)
		SpawnPointPart.Transparency = 1
		SpawnPointPart.Anchored = true
		SpawnPointPart.CanCollide = false
		SpawnPointPart.CFrame = game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame
		game.StarterGui:SetCore("SendNotification",  {
			Title = "Set Spawn Point";
			Text = "Done!, Set Spawn Point";
		})
		_G.Spawn = true
		while _G.Spawn == true do wait()
			pcall(function()
				if game.Players.LocalPlayer.Character.Humanoid.Health == 0 then
					wait(SpawnDelay.Text)
					game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = game:GetService("Workspace"):FindFirstChild("SpawnPointPart").CFrame
				end
			end)
		end
	else
		if SSP.Text == "No SpawnPoint" then
			_G.Spawn = false
			SSP.Text = "SetSpawnPoint"
			SSP.TextColor3 = Color3.fromRGB(0, 255,0)
			for i,v in pairs(Workspace:GetDescendants()) do
				if v.Name == "SpawnPointPart" then
					v:Destroy()
				end
			end
		end
	end
end)

SpawnDelay.Name = "SpawnDelay"
SpawnDelay.Parent = F2
SpawnDelay.Size = UDim2.new(0, 100, 0, 40)
SpawnDelay.Position = UDim2.new(0, 10, 0, 50)
SpawnDelay.Text = game:GetService("Players").RespawnTime+1
SpawnDelay.ClearTextOnFocus = true
SpawnDelay.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
SpawnDelay.TextColor3 = Color3.fromRGB(255, 255, 255)
SpawnDelay.TextSize = 20
SpawnDelay.Visible = false
SpawnDelay.TextScaled = true
SpawnDelay.PlaceholderText = "Spawn Delay type any number"
SpawnDelay.PlaceholderColor3 = Color3.fromRGB(255,255,255)

SpawnTitle.Name = "SpawnTitle"
SpawnTitle.Parent = SpawnDelay
SpawnTitle.Size = UDim2.new(0, 100, 0, 40)
SpawnTitle.Position = UDim2.new(0, 0, 0, -40)
SpawnTitle.Text = "Spawn Delay"
SpawnTitle.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
SpawnTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
SpawnTitle.TextSize = 20
SpawnTitle.Visible = true
SpawnTitle.TextScaled = true
SpawnTitle.BackgroundTransparency = 0

GotoWP.Name = "Goto waypoint"
GotoWP.Parent = F
GotoWP.Size = UDim2.new(0, 100, 0, 40)
GotoWP.Position = UDim2.new(0, 20, 0, 200)
GotoWP.Text = "GotoWayPoint"
GotoWP.TextScaled = true
GotoWP.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
GotoWP.TextColor3 = Color3.fromRGB(255,255,255)
GotoWP.MouseButton1Click:Connect(function()
	game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame = game:GetService("Workspace"):FindFirstChild("WayPointPart").CFrame
end)

Goto.Name = "Goto"
Goto.Parent = F
Goto.Size = UDim2.new(0, 100, 0, 40)
Goto.TextScaled = true
Goto.Text = "Goto"
Goto.Position = UDim2.new(0, 150, 0, 50)
Goto.TextColor3 = Color3.fromRGB(255, 255, 255)
Goto.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Goto.MouseButton1Click:Connect(function()
	if Target.Text == "" then
		game:GetService("StarterGui"):SetCore("SendNotification",{
				    Title = "[ Fail To Goto ]";
				    Text = "Fail To Goto/Target TextBox Is Empty";
				    Duration = 10;
		})
	else
		for i,v in pairs(GetPlayer(Target.Text))do
			game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame = game:GetService("Players")[v.Name].Character:FindFirstChild("HumanoidRootPart").CFrame
		end
	end
end)

Kill.Name = "Kill"
Kill.Parent = F
Kill.Size = UDim2.new(0, 100, 0, 40)
Kill.TextScaled = true
Kill.Text = "Kill"
Kill.Position = UDim2.new(0, 150, 0, 100)
Kill.TextColor3 = Color3.fromRGB(255, 255, 255)
Kill.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Kill.MouseButton1Click:Connect(function()
	if Target.Text == "" then
		game:GetService("StarterGui"):SetCore("SendNotification",{
				    Title = "[ Fail To Kill ]";
				    Text = "Fail To Kill/Target TextBox Is Empty";
				    Duration = 10;
		})
	else
	    local NOW = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
		for i,v in pairs(GetPlayer(Target.Text))do
			game.Players.LocalPlayer.Character.Humanoid.Name = 1
			local l = game.Players.LocalPlayer.Character["1"]:Clone()
			l.Parent = game.Players.LocalPlayer.Character
			l.Name = "Humanoid"
			wait(0.1)
			game.Players.LocalPlayer.Character["1"]:Destroy()
			game.Workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character
			game.Players.LocalPlayer.Character.Animate.Disabled = true
			wait(0.1)
			game.Players.LocalPlayer.Character.Animate.Disabled = false
			game.Players.LocalPlayer.Character.Humanoid.DisplayDistanceType = "None"
		for i,v in pairs(game.Players.LocalPlayer:FindFirstChildOfClass("Backpack"):GetChildren()) do
				if v:IsA("Tool") then
					v.Parent = game.Players.LocalPlayer.Character
					end
		end
			game.Players[v.Name].Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
			wait(0.2)
			game.Players[v.Name].Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
			wait(0.4)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(0, -499, 0))
		wait(SpawnDelay.Text)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = NOW
		end
	end
end)

Bring.Name = "Bring"
Bring.Parent = F
Bring.Size = UDim2.new(0, 100, 0, 40)
Bring.TextScaled = true
Bring.Text = "Bring"
Bring.Position = UDim2.new(0, 150, 0, 150)
Bring.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Bring.TextColor3 = Color3.fromRGB(255, 255, 255)
Bring.MouseButton1Click:Connect(function()
	if Target.Text == "" then
		game:GetService("StarterGui"):SetCore("SendNotification",{
				    Title = "[ Fail To Bring ]";
				    Text = "Fail To Bring/Target TextBox Is Empty";
				    Duration = 10;
		})
	else
		local NOW = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
		game.Players.LocalPlayer.Character.Humanoid.Name = 1
		local l = game.Players.LocalPlayer.Character["1"]:Clone()
		l.Parent = game.Players.LocalPlayer.Character
		l.Name = "Humanoid"
		wait(0.1)
		game.Players.LocalPlayer.Character["1"]:Destroy()
		game.Workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character
		game.Players.LocalPlayer.Character.Animate.Disabled = true
		wait(0.1)
		game.Players.LocalPlayer.Character.Animate.Disabled = false
		game.Players.LocalPlayer.Character.Humanoid.DisplayDistanceType = "None"
		for i,v in pairs(game.Players.LocalPlayer:FindFirstChildOfClass("Backpack"):GetChildren()) do
			if v:IsA("Tool") then
				v.Parent = game.Players.LocalPlayer.Character
			end
		end
		local function tp(player,player2)
			local char1,char2=player.Character,player2.Character
			if char1 and char2 then
				char1.HumanoidRootPart.CFrame = char2.HumanoidRootPart.CFrame
			end
		end
		local function getout(player,player2)
			local char1,char2=player.Character,player2.Character
			if char1 and char2 then
			end
		end
		for i,v in pairs(GetPlayer(Target.Text))do
			tp(game.Players[v.Name], game.Players.LocalPlayer)
			wait(0.2)
			tp(game.Players[v.Name], game.Players.LocalPlayer)
			wait(0.5)
			getout(game.Players.LocalPlayer, game.Players[v.Name])
			wait(SpawnDelay.Text)
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = NOW
		end
	end
end)

Brazil.Name = "TextButton"
Brazil.Parent = F
Brazil.Size = UDim2.new(0, 100, 0, 40)
Brazil.Position = UDim2.new(0, 150, 0, 50)
Brazil.Text = "Send to Brazil"
Brazil.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Brazil.TextColor3 = Color3.fromRGB(255, 255, 255)
Brazil.TextScaled = true
Brazil.Visible = false
Brazil.MouseButton1Click:Connect(function()
	if Target.Text == "" then
		game:GetService("StarterGui"):SetCore("SendNotification",{
			Title = "[ Fail To Brazil ]";
			Text = "Fail To Brazil/Target TextBox Is Empty";
			Duration = 10;
		})
	else
	    local NOW = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
		for i,v in pairs(GetPlayer(Target.Text))do
			game.Players.LocalPlayer.Character.Humanoid.Name = 1
			local l = game.Players.LocalPlayer.Character["1"]:Clone()
			l.Parent = game.Players.LocalPlayer.Character
			l.Name = "Humanoid"
			wait(0.1)
			game.Players.LocalPlayer.Character["1"]:Destroy()
			game.Workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character
			game.Players.LocalPlayer.Character.Animate.Disabled = true
			wait(0.1)
			game.Players.LocalPlayer.Character.Animate.Disabled = false
			game.Players.LocalPlayer.Character.Humanoid.DisplayDistanceType = "None"
			for i,v in pairs(game.Players.LocalPlayer:FindFirstChildOfClass("Backpack"):GetChildren()) do
					if v:IsA("Tool") then
						v.Parent = game.Players.LocalPlayer.Character
					end
			end
			for i = 1, 10 do
				wait()
				game.Players[v.Name].Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
			end
			wait(1)
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(0, 9999999999999999999999, 0))
			wait(SpawnDelay.Text)
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = NOW
		end
	end
end)

View.Name = "View"
View.Parent = F
View.Size = UDim2.new(0, 100, 0, 40)
View.TextScaled = false
View.TextScaled = true
View.Text = "View (Off)"
View.Position = UDim2.new(0, 270, 0, 150)
View.TextColor3 = Color3.fromRGB(255, 0, 0)
View.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
View.MouseButton1Click:Connect(function()
	if Target.Text == "" then
		game:GetService("StarterGui"):SetCore("SendNotification",{
				    Title = "[ Fail To View ]";
				    Text = "Fail To View/Target TextBox Is Empty";
				    Duration = 10;
		})
	else
		if View.Text == "View (Off)" then
			View.TextColor3 = Color3.fromRGB(0, 255, 0)
			View.Text = "View (On)"
			_G.View = true
			while _G.View == true do wait()
				pcall(function()
					for i,v in pairs(GetPlayer(Target.Text)) do
						game:GetService("Workspace").CurrentCamera.CameraSubject = game:GetService("Players")[v.Name].Character:FindFirstChildOfClass("Humanoid")
					end
				end)
			end
		else
			if View.Text == "View (On)" then
				_G.View = false
				View.TextColor3 = Color3.fromRGB(255,0,0)
				View.Text = "View (Off)"
				for i = 1, 5 do
			                    wait()
					game:GetService("Workspace").CurrentCamera.CameraSubject = game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
				end
			end
		end
	end
end)

Aim.Name = "Aim"
Aim.Parent = F
Aim.Size = UDim2.new(0, 100, 0, 40)
Aim.Position = UDim2.new(0, 270, 0, 50)
Aim.Text = "Aim (Off)"
Aim.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Aim.TextColor3 = Color3.fromRGB(255, 0, 0)
Aim.TextScaled = true
Aim.MouseButton1Click:Connect(function()
	if Target.Text == "" then
		game:GetService("StarterGui"):SetCore("SendNotification",{
			Title = "[ Fail To Aim ]";
			Text = "Fail To Aim/Target TextBox Is Empty";
			Duration = 10;
		})
	else
		if Aim.Text == "Aim (Off)" then
			Aim.Text = "Aim (On)"
			Aim.TextColor3 = Color3.fromRGB(0,255,0)
			local Aiming = nil
			AimLock = false
			wait(0.1)
			local function AimLoop()
				if AimLock == false then
					for i,v in pairs(GetPlayer(Target.Text)) do
						local target = game.Players[v.Name].Character
						if target and target:FindFirstChild('Head') then
							Workspace.CurrentCamera.CFrame = CFrame.new(Workspace.CurrentCamera.CFrame.p, target.Head.CFrame.p)
						end
					end
				end
			end
			Aiming = game:GetService('RunService').Stepped:Connect(AimLoop)
		else
			if Aim.Text == "Aim (On)" then
				Aim.Text = "Aim (Off)"
				Aim.TextColor3 = Color3.fromRGB(255,0,0)
				if Aiming then
					Aiming:Disconnect()
				end
				AimLock = true
			end
		end
	end
end)

Locate.Name = "Locate"
Locate.Parent = F
Locate.Size = UDim2.new(0, 100, 0, 40)
Locate.Position = UDim2.new(0, 270, 0, 200)
Locate.Text = "Locate (Off)"
Locate.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Locate.TextColor3 = Color3.fromRGB(255, 0, 0)
Locate.TextScaled = true
Locate.MouseButton1Click:Connect(function()
	if Target.Text == "" then
		game:GetService("StarterGui"):SetCore("SendNotification",{
			Title = "[ Fail To Locate ]";
			Text = "Fail To Locate/Target TextBox Is Empty";
			Duration = 10;
		})
	else
		for i,t in pairs(GetPlayer(Target.Text)) do
			if Locate.Text == "Locate (Off)" then
				Locate.Text = "Locate (On)"
				Locate.TextColor3 = Color3.fromRGB(0,255,0)
				local Folder = Instance.new("Folder")
				Folder.Name = "Red_BloxZBoard"
				Folder.Parent = game.Workspace
				local BillboardGui = Instance.new("BillboardGui")
				local TextLabel = Instance.new("TextLabel")
				BillboardGui.Adornee = game.Players[t.Name].Character.Head
				BillboardGui.Name = "B"
				BillboardGui.Parent = Folder
				BillboardGui.Size = UDim2.new(0, 100, 0, 150)
				BillboardGui.StudsOffset = Vector3.new(0, 1, 0)
				BillboardGui.AlwaysOnTop = true
				TextLabel.Name = "BillRedZ"
				TextLabel.Parent = BillboardGui
				TextLabel.BackgroundTransparency = 1
				TextLabel.Position = UDim2.new(0, 0, 0, -50)
				TextLabel.Size = UDim2.new(0, 100, 0, 100)
				TextLabel.Font = Enum.Font.SourceSansSemibold
				TextLabel.TextSize = 20
				TextLabel.TextColor3 = Color3.new(1, 1, 1)
				TextLabel.TextStrokeTransparency = 0
				TextLabel.TextYAlignment = Enum.TextYAlignment.Bottom
				TextLabel.Text = 'Name: '..game.Players[t.Name].Name..' | Health: '..game.Players[t.Name].Character.Humanoid.Health
				TextLabel.ZIndex = 10
				for i,v in pairs(game.Players[t.Name].Character:GetChildren()) do
					if v:IsA("BasePart") then
						local a = Instance.new("BoxHandleAdornment")
						a.Name = v.Name
						a.Parent = Folder
						a.Adornee = v
						a.AlwaysOnTop = true
						a.ZIndex = 10
						a.Size = v.Size
						a.Transparency = 0.3
						a.Color = game.Players[t.Name].TeamColor
					end
				end
				_G.Ayo = true
				while _G.Ayo == true do wait(0.1)
					for i,t in pairs(GetPlayer(Target.Text)) do
						for i,a in pairs(game.Workspace:GetDescendants()) do
							if a.Name == "BillRedZ" then
								a.Text = 'Name: ' .. game.Players[t.Name].Name .. ' | Health: ' .. math.floor(game.Players[t.Name].Character.Humanoid.Health)
							end
						end
					end
				end
			else
				if Locate.Text == "Locate (On)" then
					Locate.Text = "Locate (Off)"
					Locate.TextColor3 = Color3.fromRGB(255,0,0)
					_G.Ayo = false
					for i,d in pairs(game.Workspace:GetDescendants()) do
						if d.Name == "Red_BloxZBoard" then
							d:Destroy()
						end
					end
				end
				for i,e in pairs(game.Workspace:GetDescendants()) do
					if e.Name == "Red_BloxZBoard" then
						e:Destroy()
					end
				end
			end
		end
	end
end)

SpeedE.Name = "SpeedE"
SpeedE.Parent = F
SpeedE.Size = UDim2.new(0, 100, 0, 40)
SpeedE.Position = UDim2.new(0, 150, 0, 40)
SpeedE.Text = "Speed (Off)"
SpeedE.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
SpeedE.TextColor3 = Color3.fromRGB(255, 0, 0)
SpeedE.TextScaled = true
SpeedE.Visible = false
SpeedE.MouseButton1Click:Connect(function()
	if SpeedE.Text == "Speed (Off)" then
		SpeedE.Text = "Speed (On)"
		SpeedE.TextColor3 = Color3.fromRGB(0,255,0)
		_G.Speed = true
		while _G.Speed == true do wait()
			pcall(function()
				game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = Speed.Text
			end)
		end
	else
	end
	if SpeedE.Text == "Speed (On)" then
		SpeedE.Text = "Speed (Off)"
		SpeedE.TextColor3 = Color3.fromRGB(255,0,0)
		_G.Speed = false
	end
end)

JumpNHentai.Name = "TextButton"
JumpNHentai.Parent = F
JumpNHentai.Size = UDim2.new(0, 100, 0, 40)
JumpNHentai.Position = UDim2.new(0, 280, 0, 40)
JumpNHentai.Text = "Jump (Off)"
JumpNHentai.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
JumpNHentai.TextColor3 = Color3.fromRGB(255, 0, 0)
JumpNHentai.TextScaled = true
JumpNHentai.Visible = false
JumpNHentai.MouseButton1Click:Connect(function()
	if JumpNHentai.Text == "Jump (Off)" then
		JumpNHentai.Text = "Jump (On)"
		JumpNHentai.TextColor3 = Color3.fromRGB(0,255,0)
		_G.Jump = true
		while _G.Jump == true do wait()
			pcall(function()
				game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid").JumpPower = Jump.Text
			end)
		end
	else
	end
	if JumpNHentai.Text == "Jump (On)" then
		JumpNHentai.Text = "Jump (Off)"
		JumpNHentai.TextColor3 = Color3.fromRGB(255,0,0)
		_G.Jump = false
	end
end)

SetGrav.Name = "TextButton"
SetGrav.Parent = F
SetGrav.Size = UDim2.new(0, 100, 0, 40)
SetGrav.Position = UDim2.new(0, 280, 0, 130)
SetGrav.Text = "Set Gravity"
SetGrav.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
SetGrav.TextColor3 = Color3.fromRGB(255, 255, 255)
SetGrav.TextScaled = true
SetGrav.Visible = false
SetGrav.MouseButton1Click:Connect(function()
	game:GetService("Workspace").Gravity = Grav.Text
end)

SetHipHeight.Name = "TextButton"
SetHipHeight.Parent = F
SetHipHeight.Size = UDim2.new(0, 100, 0, 40)
SetHipHeight.Position = UDim2.new(0, 20, 0, 130)
SetHipHeight.Text = "SetHipHeight"
SetHipHeight.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
SetHipHeight.TextColor3 = Color3.fromRGB(255, 255, 255)
SetHipHeight.TextScaled = true
SetHipHeight.Visible = false
SetHipHeight.MouseButton1Click:Connect(function()
	game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid").HipHeight = HipHeight.Text
end)

Noclip.Name = "TextButton"
Noclip.Parent = F
Noclip.Size = UDim2.new(0, 100, 0, 40)
Noclip.Position = UDim2.new(0, 20, 0, 40)
Noclip.Text = "Noclip (Off)"
Noclip.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Noclip.TextColor3 = Color3.fromRGB(255, 0, 0)
Noclip.TextScaled = true
Noclip.Visible = false
Noclip.MouseButton1Click:Connect(function()
	if Noclip.Text == "Noclip (Off)" then
		Noclip.Text = "Noclip (On)"
		Noclip.TextColor3 = Color3.fromRGB(0, 255, 0)
		local Noclipping = nil
		local speaker = game:GetService("Players").LocalPlayer
			Clip = false
			wait(0.1)
			local function NoclipLoop()
				if Clip == false and speaker.Character ~= nil then
					for _, child in pairs(speaker.Character:GetDescendants()) do
						if child:IsA("BasePart") and child.CanCollide == true and child.Name ~= floatName then
							child.CanCollide = false
						end
					end
				end
			end
			Noclipping = game:GetService('RunService').Stepped:Connect(NoclipLoop)
	else
		if Noclip.Text == "Noclip (On)" then
			Noclip.Text = "Noclip (Off)"
			Noclip.TextColor3 = Color3.fromRGB(255, 0, 0)
				if Noclipping then
					Noclipping:Disconnect()
				end
				Clip = true
		end
	end
end)

SetToNormal.Name = "SetToNormal"
SetToNormal.Parent = F
SetToNormal.Size = UDim2.new(0, 100, 0, 40)
SetToNormal.Position = UDim2.new(0, 150, 0, 140)
SetToNormal.Text = "SetToNormal"
SetToNormal.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
SetToNormal.TextColor3 = Color3.fromRGB(255, 255, 255)
SetToNormal.TextScaled = true
SetToNormal.Visible = false
SetToNormal.MouseButton1Click:Connect(function()
	game:GetService("Workspace").Gravity = gravity
	if game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid").RigType == Enum.HumanoidRigType.R6 then
		game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid").HipHeight = 0
	end
	if game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid").RigType == Enum.HumanoidRigType.R15 then
		game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid").HipHeight = hipheight
	end
	game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = walkspeed
	game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid").JumpPower = jumppower
end)

ReCam.Name = "ReCam"
ReCam.Parent = F
ReCam.Size = UDim2.new(0, 100, 0, 40)
ReCam.Position = UDim2.new(0, 20, 0, 80)
ReCam.Text = "FixCam"
ReCam.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
ReCam.TextColor3 = Color3.fromRGB(255, 255, 255)
ReCam.TextScaled = true
ReCam.Visible = false
ReCam.MouseButton1Click:Connect(function()
	game:GetService("Workspace").CurrentCamera.CameraType = "Fixed"
	wait(.1)
	game:GetService("Workspace").CurrentCamera.CameraType = "Custom"
end)

PlaceID.Name = "PlaceID"
PlaceID.Parent = F
PlaceID.Size = UDim2.new(0, 130, 0, 40)
PlaceID.Position = UDim2.new(0, 10, 0, 40)
PlaceID.Text = "Place ID: " .. tostring(game.PlaceId)
PlaceID.ClearTextOnFocus = false
PlaceID.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
PlaceID.TextColor3 = Color3.fromRGB(255, 255, 255)
PlaceID.TextScaled = true
PlaceID.TextSize = 15
PlaceID.Visible = false

CopyPlaceId.Name = "CopyPlaceId"
CopyPlaceId.Parent = PlaceID
CopyPlaceId.Size = UDim2.new(0, 40, 0, 15)
CopyPlaceId.Position = UDim2.new(0, 90, 0, 25)
CopyPlaceId.Text = "Copy"
CopyPlaceId.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
CopyPlaceId.BorderColor3 = Color3.fromRGB(255, 255, 255)
CopyPlaceId.BorderSizePixel = 1
CopyPlaceId.TextColor3 = Color3.fromRGB(255, 255, 255)
CopyPlaceId.TextScaled = true
CopyPlaceId.TextSize = 20
CopyPlaceId.Visible = true
CopyPlaceId.BackgroundTransparency = 0
CopyPlaceId.MouseButton1Click:Connect(function()
	toClipboard(tostring(game.PlaceId))
	CopyPlaceId.Text = "Copied!"
	wait(1)
	CopyPlaceId.Text = "Copy"
end)

MaxPlayers.Name = "MaxPlayers"
MaxPlayers.Parent = F
MaxPlayers.Size = UDim2.new(0, 130, 0, 40)
MaxPlayers.Position = UDim2.new(0, 155, 0, 40)
MaxPlayers.Text = "Max Players: "..game.Players.MaxPlayers
MaxPlayers.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
MaxPlayers.TextColor3 = Color3.fromRGB(255, 255, 255)
MaxPlayers.TextScaled = true
MaxPlayers.Visible = false

players = game:GetService("Players"):GetPlayers()
PlayersInServer.Name = "PlayersInServer"
PlayersInServer.Parent = F
PlayersInServer.Size = UDim2.new(0, 130, 0, 40)
PlayersInServer.Position = UDim2.new(0, 155, 0, 100)
PlayersInServer.Text = "PlayersInServer: "..#players
PlayersInServer.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
PlayersInServer.TextColor3 = Color3.fromRGB(255, 255, 255)
PlayersInServer.TextScaled = true
PlayersInServer.Visible = false

Time.Name = "Time"
Time.Parent = F
Time.Size = UDim2.new(0, 380, 0, 40)
Time.Position = UDim2.new(0, 10, 0, 150)
Time.Text = "Loading..."
Time.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Time.TextColor3 = Color3.fromRGB(255, 255, 255)
Time.TextSize = 10
Time.TextScaled = true
Time.Visible = false

Rejoin.Name = "Rejoin"
Rejoin.Parent = F
Rejoin.Size = UDim2.new(0, 87, 0, 38)
Rejoin.Position = UDim2.new(0, 301, 0, 41)
Rejoin.Text = "Rejoin"
Rejoin.BorderColor3 = Color3.fromRGB(0, 0, 0)
Rejoin.BorderSizePixel = 2
Rejoin.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Rejoin.TextColor3 = Color3.fromRGB(255, 255, 255)
Rejoin.TextScaled = true
Rejoin.TextSize = 20
Rejoin.Visible = false
Rejoin.MouseButton1Click:Connect(function()
	if Rejoin.Text == "Rejoin" then
		Rejoin.Text = "Are You Sure?"
		Rejoin.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
		Rejoin.TextColor3 = Color3.fromRGB(0, 0, 0)
		wait(3)
		Rejoin.Text = "Rejoin"
		Rejoin.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		Rejoin.TextColor3 = Color3.fromRGB(255, 255, 255)
	else
		if Rejoin.Text == "Are You Sure?" then
			Rejoin.Text = "Please Wait..."
			Rejoin.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
			Rejoin.TextColor3 = Color3.fromRGB(255, 255, 255)
			game:GetService("TeleportService"):Teleport(game.PlaceId)
		end
	end
end)

ReText.Name = "ReText"
ReText.Parent = F
ReText.Size = UDim2.new(0, 90, 0, 40)
ReText.Position = UDim2.new(0, 300, 0, 100)
ReText.Text = "ReText"
ReText.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
ReText.TextColor3 = Color3.fromRGB(255, 255, 255)
ReText.TextScaled = true
ReText.Visible = false
ReText.MouseButton1Down:Connect(function()
	PlaceName.Text = "Place Name: " .. game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
	PlaceID.Text = "Place ID: "..game.PlaceId
end)

FindBigServer.Name = "FindBigServer"
FindBigServer.Parent = F
FindBigServer.Size = UDim2.new(0, 97, 0, 38)
FindBigServer.Position = UDim2.new(0, 291, 0, 201)
FindBigServer.Text = "Find Big Server"
FindBigServer.BorderColor3 = Color3.fromRGB(0, 0, 0)
FindBigServer.BorderSizePixel = 2
FindBigServer.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
FindBigServer.TextColor3 = Color3.fromRGB(255, 255,255)
FindBigServer.TextScaled = true
FindBigServer.Visible = false
FindBigServer.MouseButton1Click:Connect(function()
	if FindBigServer.Text == "Find Big Server" then
		FindBigServer.Text = "Are You Sure?"
		FindBigServer.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
		FindBigServer.TextColor3 = Color3.fromRGB(0, 0, 0)
		wait(3)
		FindBigServer.Text = "Find Big Server"
		FindBigServer.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		FindBigServer.TextColor3 = Color3.fromRGB(255, 255,255)
	else
		if FindBigServer.Text == "Are You Sure?" then
			FindBigServer.Text = "Please Wait..."
			FindBigServer.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
			FindBigServer.TextColor3 = Color3.fromRGB(255, 255,255)
			Max = game:GetService("Players").MaxPlayers - 1
			local Http = game:GetService("HttpService")
			local TPS = game:GetService("TeleportService")
			local Api = "https://games.roblox.com/v1/games/"
			local _place = game.PlaceId
			local _servers = Api.._place.."/servers/Public?sortOrder=Asc&limit=100"
			function ListServers(cursor)
			local Raw = game:HttpGet(_servers .. ((cursor and "&cursor="..cursor) or ""))
				return Http:JSONDecode(Raw)
			end
			local Server, Next; repeat
				local Servers = ListServers(Next)
				Server = Servers.data[Max]
				Next = Servers.nextPageCursor
			until Server
			TPS:TeleportToPlaceInstance(_place,Server.id,game.Players.LocalPlayer)
		end
	end
end)

FindLowServer.Name = "FindLowServer"
FindLowServer.Parent = F
FindLowServer.Size = UDim2.new(0, 97, 0, 38)
FindLowServer.Position = UDim2.new(0, 11, 0, 201)
FindLowServer.Text = "Find Low Server"
FindLowServer.BorderColor3 = Color3.fromRGB(0, 0, 0)
FindLowServer.BorderSizePixel = 2
FindLowServer.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
FindLowServer.TextColor3 = Color3.fromRGB(255, 255,255)
FindLowServer.TextScaled = true
FindLowServer.Visible = false
FindLowServer.MouseButton1Click:Connect(function()
	if FindLowServer.Text == "Find Low Server" then
		FindLowServer.Text = "Are You Sure?"
		FindLowServer.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
		FindLowServer.TextColor3 = Color3.fromRGB(0, 0, 0)
		wait(3)
		FindLowServer.Text = "Find Low Server"
		FindLowServer.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		FindLowServer.TextColor3 = Color3.fromRGB(255, 255,255)
	else
		if FindLowServer.Text == "Are You Sure?" then
			FindLowServer.Text = "Please Wait..."
			FindLowServer.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
			FindLowServer.TextColor3 = Color3.fromRGB(255, 255,255)
			local Http = game:GetService("HttpService")
			local TPS = game:GetService("TeleportService")
			local Api = "https://games.roblox.com/v1/games/"
			local _place = game.PlaceId
			local _servers = Api.._place.."/servers/Public?sortOrder=Asc&limit=100"
			function ListServers(cursor)
				local Raw = game:HttpGet(_servers .. ((cursor and "&cursor="..cursor) or ""))
				return Http:JSONDecode(Raw)
			end
			local Server, Next; repeat
				local Servers = ListServers(Next)
				Server = Servers.data[1]
				Next = Servers.nextPageCursor
			until Server
			TPS:TeleportToPlaceInstance(_place,Server.id,game.Players.LocalPlayer)
		end
	end
end)

ScrollingFrame.Name = "ScriptsHub"
ScrollingFrame.Parent = F
ScrollingFrame.Position = UDim2.new(0, 10, 0, 43)
ScrollingFrame.Size = UDim2.new(0, 380, 0, 150)
ScrollingFrame.BackgroundColor3 = Color3.fromRGB(220, 220, 220)
ScrollingFrame.BackgroundTransparency = 0
ScrollingFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
ScrollingFrame.BorderSizePixel = 2
ScrollingFrame.Visible = false
ScrollingFrame.ScrollBarThickness = 0
ScrollingFrame.VerticalScrollBarPosition = Enum.VerticalScrollBarPosition.Right
ScrollingFrame.CanvasSize = UDim2.new(0,0,0,0)
ScrollingFrame.ScrollingDirection = Enum.ScrollingDirection.Y
ScrollingFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y

UIGrid.Name = "UIGrid"
UIGrid.Parent = ScrollingFrame
UIGrid.CellPadding = UDim2.new(0, 39, 0, 20)
UIGrid.CellSize = UDim2.new(0, 100, 0, 40)

SourceFrame.Parent = F
SourceFrame.Name = "SourceFrame"
SourceFrame.Position = UDim2.new(0, 10, 0, 43)
SourceFrame.Size = UDim2.new(0, 380, 0, 25)
SourceFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
SourceFrame.BackgroundTransparency = 0
SourceFrame.BorderColor3 = Color3.fromRGB(255, 255, 255)
SourceFrame.BorderSizePixel = 1
SourceFrame.Active = true
SourceFrame.Visible = false

ScriptName.Parent = SourceFrame
ScriptName.Name = "ScriptName"
ScriptName.Size = UDim2.new(0, 70, 0, 15)
ScriptName.Position = UDim2.new(0, 5, 0, 5)
ScriptName.Text = ""
ScriptName.TextColor3 = Color3.fromRGB(255, 255, 255)
ScriptName.TextSize = 20
ScriptName.TextScaled = true
ScriptName.PlaceholderText = "Script Name"
ScriptName.PlaceholderColor3 = Color3.fromRGB(200, 200, 200)
ScriptName.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
ScriptName.BorderColor3 = Color3.fromRGB(255, 255, 255)
ScriptName.BorderSizePixel = 1

SourceTextBox.Name = "SourceTextBox"
SourceTextBox.Parent = SourceFrame
SourceTextBox.Position = UDim2.new(0, 0, 0, 26)
SourceTextBox.Size = UDim2.new(0, 380, 0, 125)
SourceTextBox.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
SourceTextBox.TextColor3 = Color3.fromRGB(0, 255, 0)
SourceTextBox.BackgroundTransparency = 0
SourceTextBox.BorderColor3 = Color3.fromRGB(255, 255, 255)
SourceTextBox.BorderSizePixel = 1
SourceTextBox.TextSize = 15
SourceTextBox.Text = ""
SourceTextBox.PlaceholderText = "Paste Script Here"
SourceTextBox.PlaceholderColor3 = Color3.fromRGB(200, 200, 200)
SourceTextBox.TextXAlignment = Enum.TextXAlignment.Left
SourceTextBox.TextYAlignment = Enum.TextYAlignment.Top
SourceTextBox.ClearTextOnFocus = false
SourceTextBox.MultiLine = true
SourceTextBox.Font = Enum.Font.Code
SourceTextBox.ClipsDescendants = true

CloseSource.Parent = SourceFrame
CloseSource.Name = "CloseSource"
CloseSource.Size = UDim2.new(0, 40, 0, 15)
CloseSource.Position = UDim2.new(0, 335, 0, 5)
CloseSource.Text = "Close"
CloseSource.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseSource.TextScaled = true
CloseSource.TextSize = 20
CloseSource.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
CloseSource.BackgroundTransparency = 0
CloseSource.BorderColor3 = Color3.fromRGB(255, 255, 255)
CloseSource.BorderSizePixel = 1
CloseSource.MouseButton1Click:Connect(function()
	SourceFrame.Visible = false
	TryExecute.Visible = false
	ClearSource.Visible = false
	AddScript.Visible = true
end)

TryExecute.Name = "Goto waypoint"
TryExecute.Parent = F
TryExecute.Size = UDim2.new(0, 100, 0, 40)
TryExecute.Position = UDim2.new(0, 8, 0, 200)
TryExecute.Text = "Try Execute"
TryExecute.TextScaled = true
TryExecute.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
TryExecute.TextColor3 = Color3.fromRGB(255,255,255)
TryExecute.Visible = false
TryExecute.MouseButton1Click:Connect(function()
	local success, result = pcall(function()
		TryExecute.Text = "Running..."
		tryexecuting(SourceTextBox.Text)
		TryExecute.Text = "Done!"
		wait(1.5)
		TryExecute.Text = "Try Execute"
	end)
	if not success then
		TryExecute.Text = "Error."
		wait(0.5)
		TryExecute.Text = "Try Execute"
		ErrorOrResults(tostring(result))
	end
end)

AddScript.Name = "Add Script"
AddScript.Parent = F
AddScript.Size = UDim2.new(0, 40, 0, 17)
AddScript.BorderColor3 = Color3.fromRGB(255, 255, 255)
AddScript.Position = UDim2.new(0, 350, 0, 176)
AddScript.Text = "Add Script"
AddScript.TextScaled = true
AddScript.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
AddScript.TextColor3 = Color3.fromRGB(255,255,255)
AddScript.Visible = false
AddScript.MouseButton1Click:Connect(function()
	SourceFrame.Visible = true
	TryExecute.Visible = true
	ClearSource.Visible = true
	AddScript.Visible = false
end)

ClearSource.Name = "Add Script"
ClearSource.Parent = F
ClearSource.Size = UDim2.new(0, 40, 0, 17)
ClearSource.BorderColor3 = Color3.fromRGB(255, 0, 0)
ClearSource.Position = UDim2.new(0, 350, 0, 176)
ClearSource.Text = "Clear"
ClearSource.TextScaled = true
ClearSource.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
ClearSource.TextColor3 = Color3.fromRGB(255,255,255)
ClearSource.Visible = false
ClearSource.MouseButton1Click:Connect(function()
	SourceTextBox.Text = ""
end)

AddToScriptHub.Parent = SourceFrame
AddToScriptHub.Name = "AddToScriptHub"
AddToScriptHub.Size = UDim2.new(0, 40, 0, 15)
AddToScriptHub.Position = UDim2.new(0, 80, 0, 5)
AddToScriptHub.Text = "Added"
AddToScriptHub.TextColor3 = Color3.fromRGB(255, 255, 255)
AddToScriptHub.TextScaled = true
AddToScriptHub.TextSize = 20
AddToScriptHub.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
AddToScriptHub.BackgroundTransparency = 0
AddToScriptHub.BorderColor3 = Color3.fromRGB(255, 255, 255)
AddToScriptHub.BorderSizePixel = 1
AddToScriptHub.MouseButton1Click:Connect(function()
	FileScriptName = ScriptName.Text
	SourceOrScript = SourceTextBox.Text
	Add(FileScriptName, SourceOrScript)
	AddedButton(FileScriptName, SourceOrScript)
	game.StarterGui:SetCore("SendNotification",
	{
		Title = "Script Added!";
		Text = "Script Has Been Added!";
		Duration = 5
	})
end)

function Add(Name, Script)
	read = readfile("TargetGui_Scripts.txt")
	writefile("TargetGui_Scripts.txt", read .. " " .. "AddedButton('" .. Name .. "', " .. "[[" .. Script .. "]])")
end

function ErrorOrResults(result)
	game.StarterGui:SetCore("SendNotification",
	{
		Title = "Results";
		Text = "[" .. tostring(result) .. "]";
		Duration = 5
	})
end

function AddedButton(Text, Source)
	local CreateButton = Instance.new("TextButton")
	CreateButton.Name = Text
	CreateButton.Parent = ScrollingFrame
	CreateButton.Size = UDim2.new(0, 100, 0, 40)
	CreateButton.Position = UDim2.new(0, 150, 0, 100)
	CreateButton.Text = Text
	CreateButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	CreateButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	CreateButton.TextScaled = true
	CreateButton.TextSize = 20
	CreateButton.Visible = true
	CreateButton.BackgroundTransparency = 0
	CreateButton.MouseButton1Click:Connect(function()
		loadstring(Source)()
	end)
end

function NewBtn(Text, Script)
	local CreateButton = Instance.new("TextButton")
	CreateButton.Name = Text
	CreateButton.Parent = ScrollingFrame
	CreateButton.Size = UDim2.new(0, 100, 0, 40)
	CreateButton.Position = UDim2.new(0, 150, 0, 100)
	CreateButton.Text = Text
	CreateButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	CreateButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	CreateButton.TextScaled = true
	CreateButton.TextSize = 20
	CreateButton.Visible = true
	CreateButton.BackgroundTransparency = 0
	CreateButton.MouseButton1Click:Connect(Script)
end

NewBtn("Reach Gui V3", function()
	loadstring(game:HttpGet('https://pastebin.com/raw/SiftLKeh'))()
end)

NewBtn("Infinite Yield", function()
	loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end)

NewBtn("Fly Gui V3", function()
	loadstring(game:HttpGet('https://pastebin.com/raw/FBkucarG'))()
end)

NewBtn("Dash Gui", function()
	loadstring(game:HttpGet("https://pastebin.com/raw/beQVN8wZ"))();
end)

NewBtn("Hitbox V1", function()
	
end)

NewBtn("Hitbox V5", function()
	loadstring(game:HttpGet('https://pastebin.com/raw/fq5UvWNm', true))()
end)

NewBtn("DropTool Gui", function()
	local DropToolsGui = Instance.new("ScreenGui")
	local main = Instance.new("Frame")
	local MoreFrame = Instance.new("Frame")
	local DropToolsOn = Instance.new("TextButton")
	local DropToolsOff = Instance.new("TextButton")
	local More = Instance.new("TextButton")
	local Low = Instance.new("TextButton")
	local Close = Instance.new("TextButton")
	local Droptool = Instance.new("TextButton")
	local Tools = Instance.new("TextBox")
	local Tools2 = Instance.new("TextBox")
	local Tools3 = Instance.new("TextBox")
	local Tools4 = Instance.new("TextBox")
	local Tools1 = Instance.new("TextBox")
	local Delay = Instance.new("TextBox")
	local ToolsName = Instance.new("TextBox")
	local Set = Instance.new("TextButton")
	local Set2 = Instance.new("TextButton")
	local Set3 = Instance.new("TextButton")
	local Set4 = Instance.new("TextButton")
	local Set1 = Instance.new("TextButton")
	
	
	DropToolsGui.Name = "DropToolsGui"
	DropToolsGui.Parent = game.CoreGui
	DropToolsGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	
	main.Name = "main"
	main.Parent = DropToolsGui
	main.BackgroundColor3 = Color3.fromRGB(0, 100, 200)
	main.Position = UDim2.new(0, 100, 0, 100)
	main.Size = UDim2.new(0, 150, 0, 160)
	main.Active = true
	main.Draggable = true
	
	MoreFrame.Name = "MoreFrame"
	MoreFrame.Parent = main
	MoreFrame.Size = UDim2.new(0, 150, 0, 200)
	MoreFrame.Position = UDim2.new(0, 0, 0, 160)
	MoreFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	MoreFrame.BackgroundTransparency = 0.5
	MoreFrame.Visible = false
	
	Close.Name = "Close"
	Close.Parent = main
	Close.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
	Close.Position = UDim2.new(0, -34, -0.266169071, 34)
	Close.Size = UDim2.new(0, 34, 0, 34)
	Close.Font = Enum.Font.SourceSans
	Close.Text = "X"
	Close.TextColor3 = Color3.fromRGB(0, 0, 0)
	Close.TextScaled = true
	Close.TextSize = 14.000
	Close.TextWrapped = true
	Close.MouseButton1Down:Connect(function()
	    _G.S = false
		DropToolsGui:Destroy()
	end)
	
	Low.Name = "Low"
	Low.Parent = MoreFrame
	Low.Size = UDim2.new(0, 30, 0, 30)
	Low.Position = UDim2.new(0, 0, 0, 170)
	Low.Text = "-"
	Low.BackgroundColor3 = Color3.fromRGB(255, 255, 355)
	Low.TextColor3 = Color3.fromRGB(255, 255, 255)
	Low.TextSize = 70
	Low.BackgroundTransparency = 0.9
	Low.Visible = false
	Low.MouseButton1Down:Connect(function()
		MoreFrame.Visible = false
		More.Visible = true
	end)
	
	More.Name = "More"
	More.Parent = main
	More.Size = UDim2.new(0, 30, 0, 30)
	More.Position = UDim2.new(0, 0, 0, 130)
	More.Text = "+"
	More.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	More.TextColor3 = Color3.fromRGB(0, 0, 0)
	More.TextSize = 25
	More.BackgroundTransparency = 0.96
	More.MouseButton1Down:Connect(function()
		MoreFrame.Visible = true
		More.Visible = false
		Low.Visible = true
	end)
	
	DropToolsOn.Name = "Drop Tool"
	DropToolsOn.Parent = main
	DropToolsOn.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	DropToolsOn.Position = UDim2.new(0, 81, 0, 35)
	DropToolsOn.Size = UDim2.new(0, 55, 0, 50)
	DropToolsOn.Font = Enum.Font.SourceSans
	DropToolsOn.Text = "DropTools (On)"
	DropToolsOn.TextColor3 = Color3.fromRGB(0, 255, 0)
	DropToolsOn.TextScaled = true
	DropToolsOn.TextSize = 14.000
	DropToolsOn.TextWrapped = true
	DropToolsOn.Visible = false
	DropToolsOn.MouseButton1Down:Connect(function()
		DropToolsOn.Visible = false
		DropToolsOff.Visible = true
		_G.Drop = false
		_G.Drop = false
		_G.Drop = false
		_G.Drop = false
		_G.Drop = false
		_G.Drop = false
	end)
	
	DropToolsOff.Name = "DropToolsOff"
	DropToolsOff.Parent = main
	DropToolsOff.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	DropToolsOff.Position = UDim2.new(0, 81, 0, 35)
	DropToolsOff.Size = UDim2.new(0, 58, 0, 50)
	DropToolsOff.Font = Enum.Font.SourceSans
	DropToolsOff.Text = "DropTools (Off)"
	DropToolsOff.TextColor3 = Color3.fromRGB(255, 0, 0)
	DropToolsOff.TextScaled = true
	DropToolsOff.TextSize = 14.000
	DropToolsOff.TextWrapped = true
	DropToolsOff.MouseButton1Down:Connect(function()
		DropToolsOff.Visible = false
		DropToolsOn.Visible = true
		_G.Drop = true
		while _G.Drop == true do wait(Delay.Text)
		    if Tools1.Text == "all" or Tools.Text == "all" or Tools2.Text == "all" or Tools3.Text == "all" or Tools4.Text == "all" then
				for i,v in pairs(game.Players.LocalPlayer:FindFirstChildOfClass("Backpack"):GetChildren()) do
					if v:IsA("Tool") then
						v.Parent = game.Players.LocalPlayer.Character
					end
				end
				for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
					if v:IsA("Tool") then
						v.Parent = Workspace
					end
				end
			end
			for i,v in pairs(game.Players.LocalPlayer:FindFirstChildOfClass("Backpack"):GetChildren()) do
				if v.Name == Tools.Text or v.Name == Tools1.Text or v.Name == Tools2.Text or v.Name == Tools3.Text or v.Name == Tools4.Text then
					v.Parent = game.Players.LocalPlayer.Character
				end
			end
			for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
				if v.Name == Tools.Text or v.Name == Tools1.Text or v.Name == Tools2.Text or v.Name == Tools3.Text or v.Name == Tools4.Text then
					v.Parent = Workspace
				end
			end
		end
	end)
	
	Droptool.Name = "Droptool"
	Droptool.Parent = main
	Droptool.Size = UDim2.new(0, 58, 0, 50)
	Droptool.Position = UDim2.new(0, 10, 0, 35)
	Droptool.Text = "Drop Tool"
	Droptool.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	Droptool.TextColor3 = Color3.fromRGB(255, 255, 255)
	Droptool.TextScaled = true
	Droptool.MouseButton1Down:Connect(function()
		for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
			if v:IsA("Tool") then
				v.Parent = Workspace
			end
		end
	end)
	
	Tools.Name = "Tools"
	Tools.Parent = MoreFrame
	Tools.Size = UDim2.new(0, 100, 0, 30)
	Tools.Position = UDim2.new(0, 10, 0, 5)
	Tools.Text = "Tools Name"
	Tools.BackgroundColor3 = Color3.fromRGB(255,255, 255)
	Tools.TextColor3 = Color3.fromRGB(0, 0, 0)
	Tools.TextSize = 15
	Tools.TextScaled = true
	Tools.PlaceholderText = "Tools Name"
	Tools.PlaceholderColor3 = Color3.fromRGB(0,0,0)
	Tools.ClearTextOnFocus = true
	
	Set.Name = "Set"
	Set.Parent = Tools
	Set.Size = UDim2.new(0, 30, 0, 30)
	Set.Position = UDim2.new(0, 100, 0, 0)
	Set.Text = "Set"
	Set.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	Set.TextColor3 = Color3.fromRGB(255, 255, 255)
	Set.TextScaled = true
	Set.TextSize = 20
	Set.Visible = true
	Set.BackgroundTransparency = 0
	Set.MouseButton1Down:Connect(function()
		Tools.Text = ToolsName.Text
	end)
	
	Tools2.Name = "Tools2"
	Tools2.Parent = MoreFrame
	Tools2.Size = UDim2.new(0, 100, 0, 30)
	Tools2.Position = UDim2.new(0, 10, 0, 40)
	Tools2.Text = "Tools Name"
	Tools2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Tools2.TextColor3 = Color3.fromRGB(0, 0, 0)
	Tools2.PlaceholderText = "Tools Name"
	Tools2.TextSize = 15
	Tools2.TextScaled = true
	Tools2.PlaceholderColor3 = Color3.fromRGB(0,0,0)
	Tools2.ClearTextOnFocus = true
	
	Set2.Name = "Set"
	Set2.Parent = Tools2
	Set2.Size = UDim2.new(0, 30, 0, 30)
	Set2.Position = UDim2.new(0, 100, 0, 0)
	Set2.Text = "Set"
	Set2.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	Set2.TextColor3 = Color3.fromRGB(255, 255, 255)
	Set2.TextScaled = true
	Set2.TextSize = 20
	Set2.Visible = true
	Set2.BackgroundTransparency = 0
	Set2.MouseButton1Down:Connect(function()
		Tools2.Text = ToolsName.Text
	end)
	
	Tools3.Name = "Tools3"
	Tools3.Parent = MoreFrame
	Tools3.Size = UDim2.new(0, 100, 0, 30)
	Tools3.Position = UDim2.new(0, 10, 0, 75)
	Tools3.Text = "Tools Name"
	Tools3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Tools3.TextColor3 = Color3.fromRGB(0, 0, 0)
	Tools3.TextSize = 15
	Tools3.TextScaled = true
	Tools3.PlaceholderText = "Tools Name"
	Tools3.PlaceholderColor3 = Color3.fromRGB(0,0,0)
	Tools3.ClearTextOnFocus = true
	
	Set3.Name = "Set"
	Set3.Parent = Tools3
	Set3.Size = UDim2.new(0, 30, 0, 30)
	Set3.Position = UDim2.new(0, 100, 0, 0)
	Set3.Text = "Set"
	Set3.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	Set3.TextColor3 = Color3.fromRGB(255, 255, 255)
	Set3.TextScaled = true
	Set3.TextSize = 20
	Set3.Visible = true
	Set3.BackgroundTransparency = 0
	Set3.MouseButton1Down:Connect(function()
		Tools3.Text = ToolsName.Text
	end)
	
	Tools4.Name = "Tools4"
	Tools4.Parent = MoreFrame
	Tools4.Size = UDim2.new(0, 100, 0, 30)
	Tools4.Position = UDim2.new(0, 10, 0, 110)
	Tools4.Text = "Tools Name"
	Tools4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Tools4.TextColor3 = Color3.fromRGB(0, 0, 0)
	Tools4.TextSize = 15
	Tools4.TextScaled = true
	Tools4.PlaceholderText = "Tools Name"
	Tools4.PlaceholderColor3 = Color3.fromRGB(0,0,0)
	Tools4.ClearTextOnFocus = true
	
	Set4.Name = "Set"
	Set4.Parent = Tools4
	Set4.Size = UDim2.new(0, 30, 0, 30)
	Set4.Position = UDim2.new(0, 100, 0, 0)
	Set4.Text = "Set"
	Set4.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	Set4.TextColor3 = Color3.fromRGB(255, 255, 255)
	Set4.TextScaled = true
	Set4.TextSize = 20
	Set4.Visible = true
	Set4.BackgroundTransparency = 0
	Set4.MouseButton1Down:Connect(function()
		Tools4.Text = ToolsName.Text
	end)
	
	Tools1.Name = "Tools1"
	Tools1.Parent = main
	Tools1.Size = UDim2.new(0, 90, 0, 40)
	Tools1.Position = UDim2.new(0, 10, 0, 90)
	Tools1.Text = ""
	Tools1.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	Tools1.TextColor3 = Color3.fromRGB(255, 0, 0)
	Tools1.TextSize = 15
	Tools1.TextScaled = true
	Tools1.PlaceholderText = "type all to drop all tools"
	Tools1.PlaceholderColor3 = Color3.fromRGB(255, 0, 0)
	Tools1.ClearTextOnFocus = true
	
	Set1.Name = "Set"
	Set1.Parent = Tools1
	Set1.Size = UDim2.new(0, 40, 0, 40)
	Set1.Position = UDim2.new(0, 90, 0, 0)
	Set1.Text = "Set"
	Set1.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	Set1.TextColor3 = Color3.fromRGB(255, 255, 255)
	Set1.TextScaled = true
	Set1.TextSize = 20
	Set1.Visible = true
	Set1.BackgroundTransparency = 0
	Set1.MouseButton1Down:Connect(function()
		Tools1.Text = ToolsName.Text
	end)
	
	Delay.Name = "Delay"
	Delay.Parent = main
	Delay.Size = UDim2.new(0, 33, 0, 34)
	Delay.Position = UDim2.new(0, -34, 0, 26)
	Delay.Text = "0.2"
	Delay.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	Delay.TextColor3 = Color3.fromRGB(255, 255, 255)
	Delay.TextSize = 15
	Delay.TextScaled = true
	Delay.PlaceholderText = "Delay"
	Delay.PlaceholderColor3 = Color3.fromRGB(255, 255, 255)
	
	ToolsName.Name = "ToolsName"
	ToolsName.Parent = main
	ToolsName.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	ToolsName.Position = UDim2.new(0, 0, -0.266169071, 34)
	ToolsName.Size = UDim2.new(0, 150, 0, 34)
	ToolsName.Font = Enum.Font.SourceSans
	ToolsName.Text = ""
	ToolsName.TextColor3 = Color3.fromRGB(255, 255, 255)
	ToolsName.TextSize = 17.5
	ToolsName.TextScaled = true
	ToolsName.PlaceholderText = "This will show tool name"
	ToolsName.PlaceholderColor3 = Color3.fromRGB(255, 255, 255)
	ToolsName.ClearTextOnFocus = false
	
	game:GetService('RunService').RenderStepped:connect(function()
		for i,t in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
			if t:IsA("Tool") then
				ToolsName.Text = (t.Name)
			end
		end
	end)
end)

NewBtn("UseTools Gui", function()
	local UseToolsGui = Instance.new("ScreenGui")
	local main = Instance.new("Frame")
	local MoreFrame = Instance.new("Frame")
	local UseToolsOn = Instance.new("TextButton")
	local UseToolsOff = Instance.new("TextButton")
	local More = Instance.new("TextButton")
	local Low = Instance.new("TextButton")
	local Close = Instance.new("TextButton")
	local Usetools = Instance.new("TextButton")
	local Tools = Instance.new("TextBox")
	local Tools2 = Instance.new("TextBox")
	local Tools3 = Instance.new("TextBox")
	local Tools4 = Instance.new("TextBox")
	local Tools1 = Instance.new("TextBox")
	local Delay = Instance.new("TextBox")
	local ToolsName = Instance.new("TextBox")
	local Set = Instance.new("TextButton")
	local Set2 = Instance.new("TextButton")
	local Set3 = Instance.new("TextButton")
	local Set4 = Instance.new("TextButton")
	local Set1 = Instance.new("TextButton")
	
	UseToolsGui.Name = "UseToolsGui"
	UseToolsGui.Parent = game.CoreGui
	UseToolsGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	
	main.Name = "main"
	main.Parent = UseToolsGui
	main.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	main.Position = UDim2.new(0, 100, 0, 100)
	main.Size = UDim2.new(0, 150, 0, 160)
	main.Active = true
	main.Draggable = true
	
	MoreFrame.Name = "MoreFrame"
	MoreFrame.Parent = main
	MoreFrame.Size = UDim2.new(0, 150, 0, 200)
	MoreFrame.Position = UDim2.new(0, 0, 0, 160)
	MoreFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	MoreFrame.BackgroundTransparency = 0.5
	MoreFrame.Visible = false
	
	Close.Name = "Close"
	Close.Parent = main
	Close.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
	Close.Position = UDim2.new(0, -34, -0.266169071, 34)
	Close.Size = UDim2.new(0, 34, 0, 34)
	Close.Font = Enum.Font.SourceSans
	Close.Text = "X"
	Close.TextColor3 = Color3.fromRGB(0, 0, 0)
	Close.TextScaled = true
	Close.TextSize = 14.000
	Close.TextWrapped = true
	Close.MouseButton1Down:Connect(function()
	    _G.S = false
		UseToolsGui:Destroy()
	end)
	
	Low.Name = "Low"
	Low.Parent = MoreFrame
	Low.Size = UDim2.new(0, 30, 0, 30)
	Low.Position = UDim2.new(0, 0, 0, 170)
	Low.Text = "-"
	Low.BackgroundColor3 = Color3.fromRGB(255, 255, 355)
	Low.TextColor3 = Color3.fromRGB(255, 255, 255)
	Low.TextSize = 70
	Low.BackgroundTransparency = 0.9
	Low.Visible = false
	Low.MouseButton1Down:Connect(function()
		MoreFrame.Visible = false
		More.Visible = true
	end)
	
	More.Name = "More"
	More.Parent = main
	More.Size = UDim2.new(0, 30, 0, 30)
	More.Position = UDim2.new(0, 0, 0, 130)
	More.Text = "+"
	More.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	More.TextColor3 = Color3.fromRGB(0, 0, 0)
	More.TextSize = 25
	More.BackgroundTransparency = 0.96
	More.MouseButton1Down:Connect(function()
		MoreFrame.Visible = true
		More.Visible = false
		Low.Visible = true
	end)
	
	UseToolsOn.Name = "UseTools"
	UseToolsOn.Parent = main
	UseToolsOn.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	UseToolsOn.Position = UDim2.new(0, 81, 0, 35)
	UseToolsOn.Size = UDim2.new(0, 55, 0, 50)
	UseToolsOn.Font = Enum.Font.SourceSans
	UseToolsOn.Text = "UseTools (On)"
	UseToolsOn.TextColor3 = Color3.fromRGB(0, 255, 0)
	UseToolsOn.TextScaled = true
	UseToolsOn.TextSize = 14.000
	UseToolsOn.TextWrapped = true
	UseToolsOn.Visible = false
	UseToolsOn.MouseButton1Down:Connect(function()
		UseToolsOn.Visible = false
		UseToolsOff.Visible = true
		_G.S = false
		_G.S = false
		_G.S = false
		_G.S = false
		_G.S = false
		_G.S = false
	end)
	
	UseToolsOff.Name = "UseToolsOff"
	UseToolsOff.Parent = main
	UseToolsOff.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	UseToolsOff.Position = UDim2.new(0, 81, 0, 35)
	UseToolsOff.Size = UDim2.new(0, 58, 0, 50)
	UseToolsOff.Font = Enum.Font.SourceSans
	UseToolsOff.Text = "UseTool (Off)"
	UseToolsOff.TextColor3 = Color3.fromRGB(255, 0, 0)
	UseToolsOff.TextScaled = true
	UseToolsOff.TextSize = 14.000
	UseToolsOff.TextWrapped = true
	UseToolsOff.MouseButton1Down:Connect(function()
		UseToolsOff.Visible = false
		UseToolsOn.Visible = true
		_G.S = true
		while _G.S == true do wait(Delay.Text)
		    if Tools1.Text == "all" or Tools.Text == "all" or Tools2.Text == "all" or Tools3.Text == "all" or Tools4.Text == "all" then
				for i,v in pairs(game.Players.LocalPlayer:FindFirstChildOfClass("Backpack"):GetChildren()) do
					if v:IsA("Tool") then
						v.Parent = game.Players.LocalPlayer.Character
					end
				end
				for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
					if v:IsA("Tool") then
						v:Activate()
					end
				end
			end
			for i,v in pairs(game.Players.LocalPlayer:FindFirstChildOfClass("Backpack"):GetChildren()) do
				if v.Name == Tools.Text or v.Name == Tools1.Text or v.Name == Tools2.Text or v.Name == Tools3.Text or v.Name == Tools4.Text then
					v.Parent = game.Players.LocalPlayer.Character
				end
			end
			for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
				if v.Name == Tools.Text or v.Name == Tools1.Text or v.Name == Tools2.Text or v.Name == Tools3.Text or v.Name == Tools4.Text then
					v:Activate()
				end
			end
		end
	end)
	
	Usetools.Name = "Usetools"
	Usetools.Parent = main
	Usetools.Size = UDim2.new(0, 58, 0, 50)
	Usetools.Position = UDim2.new(0, 10, 0, 35)
	Usetools.Text = "Use Tools"
	Usetools.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	Usetools.TextColor3 = Color3.fromRGB(255, 255, 255)
	Usetools.TextScaled = true
	Usetools.MouseButton1Down:Connect(function()
		for i,v in pairs(game.Players.LocalPlayer:FindFirstChildOfClass("Backpack"):GetChildren()) do
			if v:IsA("Tool") then
				v.Parent = game.Players.LocalPlayer.Character
			end
		end
		for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
			if v:IsA("Tool") then
				v:Activate()
			end
		end
	end)
	
	Tools.Name = "Tools"
	Tools.Parent = MoreFrame
	Tools.Size = UDim2.new(0, 100, 0, 30)
	Tools.Position = UDim2.new(0, 10, 0, 5)
	Tools.Text = "Tools Name"
	Tools.BackgroundColor3 = Color3.fromRGB(255,255, 255)
	Tools.TextColor3 = Color3.fromRGB(0, 0, 0)
	Tools.TextSize = 15
	Tools.TextScaled = true
	Tools.PlaceholderText = "Tools Name"
	Tools.PlaceholderColor3 = Color3.fromRGB(0,0,0)
	Tools.ClearTextOnFocus = true
	
	Set.Name = "Set"
	Set.Parent = Tools
	Set.Size = UDim2.new(0, 30, 0, 30)
	Set.Position = UDim2.new(0, 100, 0, 0)
	Set.Text = "Set"
	Set.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	Set.TextColor3 = Color3.fromRGB(255, 255, 255)
	Set.TextScaled = true
	Set.TextSize = 20
	Set.Visible = true
	Set.BackgroundTransparency = 0
	Set.MouseButton1Down:Connect(function()
		Tools.Text = ToolsName.Text
	end)
	
	Tools2.Name = "Tools2"
	Tools2.Parent = MoreFrame
	Tools2.Size = UDim2.new(0, 100, 0, 30)
	Tools2.Position = UDim2.new(0, 10, 0, 40)
	Tools2.Text = "Tools Name"
	Tools2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Tools2.TextColor3 = Color3.fromRGB(0, 0, 0)
	Tools2.PlaceholderText = "Tools Name"
	Tools2.TextSize = 15
	Tools2.TextScaled = true
	Tools2.PlaceholderColor3 = Color3.fromRGB(0,0,0)
	Tools2.ClearTextOnFocus = true
	
	Set2.Name = "Set"
	Set2.Parent = Tools2
	Set2.Size = UDim2.new(0, 30, 0, 30)
	Set2.Position = UDim2.new(0, 100, 0, 0)
	Set2.Text = "Set"
	Set2.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	Set2.TextColor3 = Color3.fromRGB(255, 255, 255)
	Set2.TextScaled = true
	Set2.TextSize = 20
	Set2.Visible = true
	Set2.BackgroundTransparency = 0
	Set2.MouseButton1Down:Connect(function()
		Tools2.Text = ToolsName.Text
	end)
	
	Tools3.Name = "Tools3"
	Tools3.Parent = MoreFrame
	Tools3.Size = UDim2.new(0, 100, 0, 30)
	Tools3.Position = UDim2.new(0, 10, 0, 75)
	Tools3.Text = "Tools Name"
	Tools3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Tools3.TextColor3 = Color3.fromRGB(0, 0, 0)
	Tools3.TextSize = 15
	Tools3.TextScaled = true
	Tools3.PlaceholderText = "Tools Name"
	Tools3.PlaceholderColor3 = Color3.fromRGB(0,0,0)
	Tools3.ClearTextOnFocus = true
	
	Set3.Name = "Set"
	Set3.Parent = Tools3
	Set3.Size = UDim2.new(0, 30, 0, 30)
	Set3.Position = UDim2.new(0, 100, 0, 0)
	Set3.Text = "Set"
	Set3.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	Set3.TextColor3 = Color3.fromRGB(255, 255, 255)
	Set3.TextScaled = true
	Set3.TextSize = 20
	Set3.Visible = true
	Set3.BackgroundTransparency = 0
	Set3.MouseButton1Down:Connect(function()
		Tools3.Text = ToolsName.Text
	end)
	
	Tools4.Name = "Tools4"
	Tools4.Parent = MoreFrame
	Tools4.Size = UDim2.new(0, 100, 0, 30)
	Tools4.Position = UDim2.new(0, 10, 0, 110)
	Tools4.Text = "Tools Name"
	Tools4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Tools4.TextColor3 = Color3.fromRGB(0, 0, 0)
	Tools4.TextSize = 15
	Tools4.TextScaled = true
	Tools4.PlaceholderText = "Tools Name"
	Tools4.PlaceholderColor3 = Color3.fromRGB(0,0,0)
	Tools4.ClearTextOnFocus = true
	
	Set4.Name = "Set"
	Set4.Parent = Tools4
	Set4.Size = UDim2.new(0, 30, 0, 30)
	Set4.Position = UDim2.new(0, 100, 0, 0)
	Set4.Text = "Set"
	Set4.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	Set4.TextColor3 = Color3.fromRGB(255, 255, 255)
	Set4.TextScaled = true
	Set4.TextSize = 20
	Set4.Visible = true
	Set4.BackgroundTransparency = 0
	Set4.MouseButton1Down:Connect(function()
		Tools4.Text = ToolsName.Text
	end)
	
	Tools1.Name = "Tools1"
	Tools1.Parent = main
	Tools1.Size = UDim2.new(0, 90, 0, 40)
	Tools1.Position = UDim2.new(0, 10, 0, 90)
	Tools1.Text = ""
	Tools1.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	Tools1.TextColor3 = Color3.fromRGB(255, 0, 0)
	Tools1.TextSize = 15
	Tools1.TextScaled = true
	Tools1.PlaceholderText = "type all to use all tools"
	Tools1.PlaceholderColor3 = Color3.fromRGB(255, 0, 0)
	Tools1.ClearTextOnFocus = true
	
	Set1.Name = "Set"
	Set1.Parent = Tools1
	Set1.Size = UDim2.new(0, 40, 0, 40)
	Set1.Position = UDim2.new(0, 90, 0, 0)
	Set1.Text = "Set"
	Set1.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	Set1.TextColor3 = Color3.fromRGB(255, 255, 255)
	Set1.TextScaled = true
	Set1.TextSize = 20
	Set1.Visible = true
	Set1.BackgroundTransparency = 0
	Set1.MouseButton1Down:Connect(function()
		Tools1.Text = ToolsName.Text
	end)
	
	Delay.Name = "Delay"
	Delay.Parent = main
	Delay.Size = UDim2.new(0, 33, 0, 34)
	Delay.Position = UDim2.new(0, -34, 0, 26)
	Delay.Text = "0.2"
	Delay.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	Delay.TextColor3 = Color3.fromRGB(255, 255, 255)
	Delay.TextSize = 15
	Delay.TextScaled = true
	Delay.PlaceholderText = "Delay"
	Delay.PlaceholderColor3 = Color3.fromRGB(255, 255, 255)
	
	ToolsName.Name = "ToolsName"
	ToolsName.Parent = main
	ToolsName.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	ToolsName.Position = UDim2.new(0, 0, -0.266169071, 34)
	ToolsName.Size = UDim2.new(0, 150, 0, 34)
	ToolsName.Font = Enum.Font.SourceSans
	ToolsName.Text = ""
	ToolsName.TextColor3 = Color3.fromRGB(255, 255, 255)
	ToolsName.TextSize = 17.5
	ToolsName.TextScaled = true
	ToolsName.PlaceholderText = "This will show tool name"
	ToolsName.PlaceholderColor3 = Color3.fromRGB(255, 255, 255)
	ToolsName.ClearTextOnFocus = false
	
	game:GetService('RunService').RenderStepped:connect(function()
		for i,t in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
			if t:IsA("Tool") then
				ToolsName.Text = (t.Name)
			end
		end
	end)
end)

CheckPlayer.Name = "CheckPlayer"
CheckPlayer.Parent = F
CheckPlayer.Size = UDim2.new(0, 100, 0, 40)
CheckPlayer.Position = UDim2.new(0, 20, 0, 200)
CheckPlayer.Text = "CheckPlayer"
CheckPlayer.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
CheckPlayer.TextColor3 = Color3.fromRGB(255, 255, 255)
CheckPlayer.TextScaled = true
CheckPlayer.TextSize = 20
CheckPlayer.Visible = false
CheckPlayer.MouseButton1Click:Connect(function()
	for i,v in pairs(GetPlayer(Target.Text))do
		TargetName.Text = "UserName: "..game.Players[v.Name].Name
		TargetDisplayName.Text = "DisplayName: "..game.Players[v.Name].DisplayName
		TargetId.Text = "Id: "..game.Players[v.Name].UserId
		TargetAccountAge.Text = "AccountAge: "..game.Players[v.Name].AccountAge
			local players = game.Players[v.Name]
			local dates = {}
				local user = game:HttpGet("https://users.roblox.com/v1/users/"..players.UserId)
				local json = game:GetService("HttpService"):JSONDecode(user)
				local date = json["created"]:sub(1,10)
				local splitDates = string.split(date,"-")
			    table.insert(dates,"joined in: "..splitDates[3].."/"..splitDates[2].."/"..splitDates[1])
		TargetJoinDate.Text = (table.concat(dates, ',\n'))
	end
end)

TargetId.Name = "TargetId"
TargetId.Parent = F
TargetId.Size = UDim2.new(0, 130, 0, 40)
TargetId.Position = UDim2.new(0, 130, 0, 95)
TargetId.Text = "Id: "
TargetId.ClearTextOnFocus = false
TargetId.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
TargetId.TextColor3 = Color3.fromRGB(255, 255, 255)
TargetId.TextSize = 20
TargetId.Visible = false
TargetId.TextScaled = true
TargetId.PlaceholderText = "Id: "
TargetId.PlaceholderColor3 = Color3.fromRGB(255, 255, 255)

TargetName.Name = "TargetName"
TargetName.Parent = F
TargetName.Size = UDim2.new(0, 130, 0, 40)
TargetName.Position = UDim2.new(0, 130, 0, 40)
TargetName.Text = "UserName: "
TargetName.ClearTextOnFocus = false
TargetName.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
TargetName.TextColor3 = Color3.fromRGB(255, 255, 255)
TargetName.TextSize = 20
TargetName.Visible = false
TargetName.TextScaled = true
TargetName.PlaceholderText = "UserName: "
TargetName.PlaceholderColor3 = Color3.fromRGB(255, 255, 255)

TargetDisplayName.Name = "TargetDisplayName"
TargetDisplayName.Parent = F
TargetDisplayName.Size = UDim2.new(0, 130, 0, 40)
TargetDisplayName.Position = UDim2.new(0, 265, 0, 40)
TargetDisplayName.Text = "DisplayName: "
TargetDisplayName.ClearTextOnFocus = false
TargetDisplayName.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
TargetDisplayName.TextColor3 = Color3.fromRGB(255, 255, 255)
TargetDisplayName.TextSize = 20
TargetDisplayName.Visible = false
TargetDisplayName.TextScaled = true
TargetDisplayName.PlaceholderText = "DisplayName: "
TargetDisplayName.PlaceholderColor3 = Color3.fromRGB(255, 255, 255)

TargetAccountAge.Name = "TargetAccountAge"
TargetAccountAge.Parent = F
TargetAccountAge.Size = UDim2.new(0, 130, 0, 40)
TargetAccountAge.Position = UDim2.new(0, 265, 0, 95)
TargetAccountAge.Text = "AccountAge: "
TargetAccountAge.ClearTextOnFocus = false
TargetAccountAge.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
TargetAccountAge.TextColor3 = Color3.fromRGB(255, 255, 255)
TargetAccountAge.TextSize = 20
TargetAccountAge.Visible = false
TargetAccountAge.TextScaled = true
TargetAccountAge.PlaceholderText = "AccountAge: "
TargetAccountAge.PlaceholderColor3 = Color3.fromRGB(255, 255, 255)

TargetJoinDate.Name = "TargetJoinDate"
TargetJoinDate.Parent = F
TargetJoinDate.Size = UDim2.new(0, 265, 0, 40)
TargetJoinDate.Position = UDim2.new(0, 130, 0, 150)
TargetJoinDate.Text = "Joined in: "
TargetJoinDate.ClearTextOnFocus = false
TargetJoinDate.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
TargetJoinDate.TextColor3 = Color3.fromRGB(255, 255, 255)
TargetJoinDate.TextSize = 20
TargetJoinDate.Visible = false
TargetJoinDate.TextScaled = true
TargetJoinDate.PlaceholderText = "Joined in: "
TargetJoinDate.PlaceholderColor3 = Color3.fromRGB(255, 255, 255)

MouthDayYear.Name = "MouthDayYear"
MouthDayYear.Parent = F
MouthDayYear.Size = UDim2.new(0, 120, 0, 40)
MouthDayYear.Position = UDim2.new(0, 270, 0, 200)
MouthDayYear.Text = "Days/Mouths/Years"
MouthDayYear.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
MouthDayYear.TextColor3 = Color3.fromRGB(255, 255, 255)
MouthDayYear.Visible = false
MouthDayYear.TextScaled = true

CopyTargetId.Name = "CopyTargetId"
CopyTargetId.Parent = TargetId
CopyTargetId.Size = UDim2.new(0, 40, 0, 15)
CopyTargetId.Position = UDim2.new(0, 90, 0, 25)
CopyTargetId.Text = "Copy"
CopyTargetId.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
CopyTargetId.BorderColor3 = Color3.fromRGB(255, 255, 255)
CopyTargetId.BorderSizePixel = 1
CopyTargetId.TextColor3 = Color3.fromRGB(255, 255, 255)
CopyTargetId.TextScaled = true
CopyTargetId.TextSize = 20
CopyTargetId.Visible = true
CopyTargetId.BackgroundTransparency = 0
CopyTargetId.MouseButton1Click:Connect(function()
	if Target.Text == "" then
		CopyTargetId.Text = "nil"
		wait(1)
		CopyTargetId.Text = "Copy"
	else
		for i,v in pairs(GetPlayer(Target.Text))do
			toClipboard(""..game.Players[v.Name].UserId)
			CopyTargetId.Text = "Copied!"
			wait(1)
			CopyTargetId.Text = "Copy"
		end
	end
end)

CopyTargetName.Name = "CopyTargetName"
CopyTargetName.Parent = TargetName
CopyTargetName.Size = UDim2.new(0, 40, 0, 15)
CopyTargetName.Position = UDim2.new(0, 90, 0, 25)
CopyTargetName.Text = "Copy"
CopyTargetName.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
CopyTargetName.BorderColor3 = Color3.fromRGB(255, 255, 255)
CopyTargetName.BorderSizePixel = 1
CopyTargetName.TextColor3 = Color3.fromRGB(255, 255, 255)
CopyTargetName.TextScaled = true
CopyTargetName.TextSize = 20
CopyTargetName.Visible = true
CopyTargetName.BackgroundTransparency = 0
CopyTargetName.MouseButton1Click:Connect(function()
	if Target.Text == "" then
		CopyTargetName.Text = "nil"
		wait(1)
		CopyTargetName.Text = "Copy"
	else
		for i,v in pairs(GetPlayer(Target.Text))do
			toClipboard(""..game.Players[v.Name].Name)
			CopyTargetName.Text = "Copied!"
			wait(1)
			CopyTargetName.Text = "Copy"
		end
	end
end)

CopyTargetDisplayName.Name = "CopyTargetDisplayName"
CopyTargetDisplayName.Parent = TargetDisplayName
CopyTargetDisplayName.Size = UDim2.new(0, 40, 0, 15)
CopyTargetDisplayName.Position = UDim2.new(0, 90, 0, 25)
CopyTargetDisplayName.Text = "Copy"
CopyTargetDisplayName.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
CopyTargetDisplayName.BorderColor3 = Color3.fromRGB(255, 255, 255)
CopyTargetDisplayName.BorderSizePixel = 1
CopyTargetDisplayName.TextColor3 = Color3.fromRGB(255, 255, 255)
CopyTargetDisplayName.TextScaled = true
CopyTargetDisplayName.TextSize = 20
CopyTargetDisplayName.Visible = true
CopyTargetDisplayName.BackgroundTransparency = 0
CopyTargetDisplayName.MouseButton1Click:Connect(function()
	if Target.Text == "" then
		CopyTargetDisplayName.Text = "nil"
		wait(1)
		CopyTargetDisplayName.Text = "Copy"
	else
		for i,v in pairs(GetPlayer(Target.Text))do
			toClipboard(""..game.Players[v.Name].DisplayName)
			CopyTargetDisplayName.Text = "Copied!"
			wait(1)
			CopyTargetDisplayName.Text = "Copy"
		end
	end
end)

Youtube.Name = "Youtube"
Youtube.Parent = F
Youtube.Size = UDim2.new(0, 100, 0, 40)
Youtube.Position = UDim2.new(0, 10, 0, 40)
Youtube.Text = "Channel Link"
Youtube.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Youtube.TextColor3 = Color3.fromRGB(255, 255, 255)
Youtube.TextSize = 20
Youtube.Visible = false
Youtube.TextScaled = true
Youtube.BackgroundTransparency = 0
Youtube.MouseButton1Down:connect(function()
	ChannelLink.Text = "https://youtube.com/channel/UC_dmh5P-22smsxebMpBWQMA"
	toClipboard("https://youtube.com/channel/UC_dmh5P-22smsxebMpBWQMA")
	Youtube.Text = "Copied!"
	wait(1)
	Youtube.Text = "Channel Link"
end)

ChannelLink.Name = "ChannelLink"
ChannelLink.Parent = F
ChannelLink.Size = UDim2.new(0, 275, 0, 40)
ChannelLink.Position = UDim2.new(0, 111.5, 0, 40)
ChannelLink.Text = "https://youtube.com/channel/UC_dmh5P-22smsxebMpBWQMA"
ChannelLink.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
ChannelLink.TextColor3 = Color3.fromRGB(255, 255, 255)
ChannelLink.TextSize = 20
ChannelLink.TextScaled = true
ChannelLink.Visible = false
ChannelLink.BackgroundTransparency = 0
ChannelLink.ClearTextOnFocus = false

Discord.Name = "Discord"
Discord.Parent = F
Discord.Size = UDim2.new(0, 100, 0, 40)
Discord.Position = UDim2.new(0, 10, 0, 90)
Discord.Text = "Discord"
Discord.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Discord.TextColor3 = Color3.fromRGB(255, 255, 255)
Discord.TextScaled = true
Discord.TextSize = 20
Discord.Visible = false
Discord.BackgroundTransparency = 0
Discord.MouseButton1Down:Connect(function()
	DiscordName.Text = "Red_BloxZ#6378"
	toClipboard("Red_BloxZ#6378")
	Discord.Text = "Copied!"
	wait(1)
	Discord.Text = "Discord"
end)

DiscordName.Name = "DiscordName"
DiscordName.Parent = F
DiscordName.Size = UDim2.new(0, 275, 0, 40)
DiscordName.Position = UDim2.new(0, 111.5, 0, 90)
DiscordName.Text = "Red_BloxZ#6378"
DiscordName.ClearTextOnFocus = false
DiscordName.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
DiscordName.TextColor3 = Color3.fromRGB(255, 255, 255)
DiscordName.TextSize = 30
DiscordName.Visible = false
DiscordName.TextScaled = true
DiscordName.BackgroundTransparency = 0

Tips.Name = "Tips"
Tips.Parent = F
Tips.Size = UDim2.new(0, 380, 0, 50)
Tips.Position = UDim2.new(0, 10, 0, 140)
Tips.Text = "You can message me in discord about how to make aim lock script or tell what should i add in this target gui or report the bug"
Tips.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Tips.TextColor3 = Color3.fromRGB(255, 255, 255)
Tips.TextSize = 20
Tips.Visible = false
Tips.TextScaled = true
Tips.BackgroundTransparency = 0

Target.Name = "Target"
Target.Parent = F
Target.Size = UDim2.new(0, 100, 0, 40)
Target.TextScaled = true
Target.Position = UDim2.new(0, 20, 0, 150)
Target.TextSize = 12
Target.Text = ""
Target.TextColor3 = Color3.fromRGB(255, 0, 0)
Target.PlaceholderText = "Target Name"
Target.PlaceholderColor3 = Color3.fromRGB(255, 0, 0)
Target.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Target.ClearTextOnFocus = true

PlaceName.Name = "PlaceName"
PlaceName.Parent = F
PlaceName.Size = UDim2.new(0, 130, 0, 40)
PlaceName.Position = UDim2.new(0, 10, 0, 100)
PlaceName.Text = "Error."
PlaceName.ClearTextOnFocus = false
PlaceName.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
PlaceName.TextColor3 = Color3.fromRGB(255, 255, 255)
PlaceName.TextSize = 15
PlaceName.TextScaled = true
PlaceName.Visible = false
PlaceName.Text = "Place Name: " .. game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name

CopyPlaceName.Name = "CopyPlaceName"
CopyPlaceName.Parent = PlaceName
CopyPlaceName.Size = UDim2.new(0, 40, 0, 15)
CopyPlaceName.Position = UDim2.new(0, 90, 0, 25)
CopyPlaceName.Text = "Copy"
CopyPlaceName.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
CopyPlaceName.BorderColor3 = Color3.fromRGB(255, 255, 255)
CopyPlaceName.BorderSizePixel = 1
CopyPlaceName.TextColor3 = Color3.fromRGB(255, 255, 255)
CopyPlaceName.TextScaled = true
CopyPlaceName.TextSize = 20
CopyPlaceName.Visible = true
CopyPlaceName.BackgroundTransparency = 0
CopyPlaceName.MouseButton1Click:Connect(function()
	toClipboard("" .. game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name)
	CopyPlaceName.Text = "Copied!"
	wait(1)
	CopyPlaceName.Text = "Copy"
end)

--- [ Load Scripts ] ---

	spawn(function()
		pcall(function()
			loadstring(readfile("TargetGui_Scripts.txt"))()
		end)
	end)
	
--- [ End Of Load Scripts ] ---

function toClipboard(String)
	local clipBoard = setclipboard or toclipboard or set_clipboard or (Clipboard and Clipboard.set)
	if clipBoard then
		clipBoard(String)
		print("Copy To ClipBoard")
	else
	game:GetService("StarterGui"):SetCore("SendNotification",{
		Title = "Your exploit Don't Support!",
		Text = "Your exploit doesn't have the ability to use the clipboard",
		Duration = 10})
	end
end

function GetPlayer(String)
	local Found = {}
	local strl = String:lower()
	if strln== "" then
		return table.insert(Found, nil)
	elseif strl == "all" then
		for i,v in pairs(game.Players:GetPlayers()) do
			table.insert(Found,v)
		end
	elseif strl == "others" then
		for i,v in pairs(game.Players:GetPlayers()) do
			if v.Name ~= game.Players.LocalPlayer.Name then
				table.insert(Found,v)
			end
		end
	elseif strl == "me" then
		for i,v in pairs(game:FindService("Players"):GetPlayers()) do
			if v.Name == game.Players.LocalPlayer.Name then
				table.insert(Found,v)
			end
		end 
	elseif strl == "random" then
		local players = game.Players:GetPlayers()
		local localplayer = game.Players.LocalPlayer
		table.remove(players, table.find(players, localplayer))
		return {players[math.random(1,#players)]}
	elseif strl == "nearest" then
		local player = game.Players.LocalPlayer
		local character = player.Character or player.CharacterAdded:Wait()
		local ohVector32 = character.HumanoidRootPart.Position
		local closestPlayer, closestDistance
		for _, p in pairs(game.Players:GetPlayers()) do
			if p ~= player and p.Character then
				local distance = (ohVector32 - p.Character.HumanoidRootPart.Position).Magnitude
				if not closestDistance or distance < closestDistance then
					closestDistance = distance
					closestPlayer = Found,p
					table.insert(Found,p)
				end
			end
		end
		return Found
	else
		for i,v in pairs(game.Players:GetPlayers()) do
			if v.Name:lower():sub(1, #String) == String:lower() or v.DisplayName:lower():sub(1, #String) == String:lower() then
				table.insert(Found,v)
			end
		end
	end
	return Found    
end

local EA = function(Ev)
		for _, v in pairs(game:GetService("Players"):GetPlayers()) do
			if v.Name:lower():sub(1, #Ev) == Ev:lower() or v.DisplayName:lower():sub(1, #Ev) == Ev:lower() then
				return v
			end
		end
end
game:GetService('RunService').RenderStepped:connect(function()
	local seconds = math.floor(Workspace.DistributedGameTime)
	local minutes = math.floor(Workspace.DistributedGameTime / 60)
	local hours = math.floor(Workspace.DistributedGameTime / 60 / 60)
	local seconds = seconds - (minutes * 60)
	local minutes = minutes - (hours * 60)
	if hours < 1 then if minutes < 1 then
		Time.Text = "Play Time: " .. seconds .. " Seconds"
	else
		Time.Text = "Play Time: " .. minutes .. " Minutes, " .. seconds .. " Seconds"
	end
	else
		Time.Text = "Play Time: " .. hours .. " Hours, " ..  minutes .. " Minutes, " .. seconds .. " Seconds"
	end
	A.Text = "Make by Red_BloxZ"
	players = game.Players:GetPlayers()
	PlayersInServer.Text = "PlayersInServer: "..#players
end)

Target.Changed:Connect(function()
		local User = EA(Target.Text)
		if User ~= nil then
			Image.Image = game:GetService("Players"):GetUserThumbnailAsync(User.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
		end
		if User == nil or Target.Text == "" then
			Image.Image = ""
		end
end)

game:GetService("StarterGui"):SetCore("SendNotification",{
			    Title = "Credit";
			    Text = "Make by Red_BloxZ";
			    Duration = 10;
})

function Fling(plr)
local player = game.Players.LocalPlayer
local mouse = player:GetMouse()
local Targets = {plr}

local Players = game:GetService("Players")
local Player = Players.LocalPlayer

local AllBool = false

local GetPlayer = function(Name)
   Name = Name:lower()
   if Name == "all" or Name == "others" then
       AllBool = true
       return
   elseif Name == "random" then
       local GetPlayers = Players:GetPlayers()
       if table.find(GetPlayers,Player) then table.remove(GetPlayers,table.find(GetPlayers,Player)) end
	       return GetPlayers[math.random(#GetPlayers)]
	   elseif Name ~= "random" and Name ~= "all" and Name ~= "others" then
	       for _,x in next, Players:GetPlayers() do
	           if x ~= Player then
	               if x.Name:lower():match("^"..Name) then
	                   return x;
	               elseif x.DisplayName:lower():match("^"..Name) then
	                   return x;
	               end
	           end
	       end
	   else
       return
   end
end

local Message = function(_Title, _Text, Time)
   game:GetService("StarterGui"):SetCore("SendNotification", {Title = _Title, Text = _Text, Duration = Time})
end

local SkidFling = function(TargetPlayer)
   local Character = Player.Character
   local Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")
   local RootPart = Humanoid and Humanoid.RootPart

   local TCharacter = TargetPlayer.Character
   local THumanoid
   local TRootPart
   local THead
   local Accessory
   local Handle

   if TCharacter:FindFirstChildOfClass("Humanoid") then
       THumanoid = TCharacter:FindFirstChildOfClass("Humanoid")
   end
   if THumanoid and THumanoid.RootPart then
       TRootPart = THumanoid.RootPart
   end
   if TCharacter:FindFirstChild("Head") then
       THead = TCharacter.Head
   end
   if TCharacter:FindFirstChildOfClass("Accessory") then
       Accessory = TCharacter:FindFirstChildOfClass("Accessory")
   end
   if Accessoy and Accessory:FindFirstChild("Handle") then
       Handle = Accessory.Handle
   end

   if Character and Humanoid and RootPart then
       if RootPart.Velocity.Magnitude < 50 then
           getgenv().OldPos = RootPart.CFrame
       end
       if THumanoid and THumanoid.Sit and not AllBool then
       end
       if THead then
           workspace.CurrentCamera.CameraSubject = THead
       elseif not THead and Handle then
           workspace.CurrentCamera.CameraSubject = Handle
       elseif THumanoid and TRootPart then
           workspace.CurrentCamera.CameraSubject = THumanoid
       end
       if not TCharacter:FindFirstChildWhichIsA("BasePart") then
           return
       end
       
       local FPos = function(BasePart, Pos, Ang)
           RootPart.CFrame = CFrame.new(BasePart.Position) * Pos * Ang
           Character:SetPrimaryPartCFrame(CFrame.new(BasePart.Position) * Pos * Ang)
           RootPart.Velocity = Vector3.new(9e7, 9e7 * 10, 9e7)
           RootPart.RotVelocity = Vector3.new(9e8, 9e8, 9e8)
       end
       
       local SFBasePart = function(BasePart)
           local TimeToWait = 2
           local Time = tick()
           local Angle = 0

           repeat
               if RootPart and THumanoid then
                   if BasePart.Velocity.Magnitude < 50 then
                       Angle = Angle + 100

                       FPos(BasePart, CFrame.new(0, 1.5, 0) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle),0 ,0))
                       task.wait()

                       FPos(BasePart, CFrame.new(0, -1.5, 0) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle), 0, 0))
                       task.wait()

                       FPos(BasePart, CFrame.new(2.25, 1.5, -2.25) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle), 0, 0))
                       task.wait()

                       FPos(BasePart, CFrame.new(-2.25, -1.5, 2.25) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle), 0, 0))
                       task.wait()

                       FPos(BasePart, CFrame.new(0, 1.5, 0) + THumanoid.MoveDirection,CFrame.Angles(math.rad(Angle), 0, 0))
                       task.wait()

                       FPos(BasePart, CFrame.new(0, -1.5, 0) + THumanoid.MoveDirection,CFrame.Angles(math.rad(Angle), 0, 0))
                       task.wait()
                   else
                       FPos(BasePart, CFrame.new(0, 1.5, THumanoid.WalkSpeed), CFrame.Angles(math.rad(90), 0, 0))
                       task.wait()

                       FPos(BasePart, CFrame.new(0, -1.5, -THumanoid.WalkSpeed), CFrame.Angles(0, 0, 0))
                       task.wait()

                       FPos(BasePart, CFrame.new(0, 1.5, THumanoid.WalkSpeed), CFrame.Angles(math.rad(90), 0, 0))
                       task.wait()
                       
                       FPos(BasePart, CFrame.new(0, 1.5, TRootPart.Velocity.Magnitude / 1.25), CFrame.Angles(math.rad(90), 0, 0))
                       task.wait()

                       FPos(BasePart, CFrame.new(0, -1.5, -TRootPart.Velocity.Magnitude / 1.25), CFrame.Angles(0, 0, 0))
                       task.wait()

                       FPos(BasePart, CFrame.new(0, 1.5, TRootPart.Velocity.Magnitude / 1.25), CFrame.Angles(math.rad(90), 0, 0))
                       task.wait()

                       FPos(BasePart, CFrame.new(0, -1.5, 0), CFrame.Angles(math.rad(90), 0, 0))
                       task.wait()

                       FPos(BasePart, CFrame.new(0, -1.5, 0), CFrame.Angles(0, 0, 0))
                       task.wait()

                       FPos(BasePart, CFrame.new(0, -1.5 ,0), CFrame.Angles(math.rad(-90), 0, 0))
                       task.wait()

                       FPos(BasePart, CFrame.new(0, -1.5, 0), CFrame.Angles(0, 0, 0))
                       task.wait()
                   end
               else
                   break
               end
           until BasePart.Velocity.Magnitude > 500 or BasePart.Parent ~= TargetPlayer.Character or TargetPlayer.Parent ~= Players or not TargetPlayer.Character == TCharacter or THumanoid.Sit or Humanoid.Health <= 0 or tick() > Time + TimeToWait
       end
       
       workspace.FallenPartsDestroyHeight = 0/0
       
       local BV = Instance.new("BodyVelocity")
       BV.Name = "EpixVel"
       BV.Parent = RootPart
       BV.Velocity = Vector3.new(9e8, 9e8, 9e8)
       BV.MaxForce = Vector3.new(1/0, 1/0, 1/0)
       
       Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
       
       if TRootPart and THead then
           if (TRootPart.CFrame.p - THead.CFrame.p).Magnitude > 5 then
               SFBasePart(THead)
           else
               SFBasePart(TRootPart)
           end
       elseif TRootPart and not THead then
           SFBasePart(TRootPart)
       elseif not TRootPart and THead then
           SFBasePart(THead)
       elseif not TRootPart and not THead and Accessory and Handle then
           SFBasePart(Handle)
       else
       end
       
       BV:Destroy()
       Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
       workspace.CurrentCamera.CameraSubject = Humanoid
       
       repeat
           RootPart.CFrame = getgenv().OldPos * CFrame.new(0, .5, 0)
           Character:SetPrimaryPartCFrame(getgenv().OldPos * CFrame.new(0, .5, 0))
           Humanoid:ChangeState("GettingUp")
           table.foreach(Character:GetChildren(), function(_, x)
               if x:IsA("BasePart") then
                   x.Velocity, x.RotVelocity = Vector3.new(), Vector3.new()
               end
           end)
           task.wait()
       until (RootPart.Position - getgenv().OldPos.p).Magnitude < 25
       workspace.FallenPartsDestroyHeight = getgenv().FPDH
   else
   end
end

getgenv().Welcome = true
if Targets[1] then for _,x in next, Targets do GetPlayer(x) end else return end

if AllBool then
   for _,x in next, Players:GetPlayers() do
       SkidFling(x)
   end
end

for _,x in next, Targets do
   if GetPlayer(x) and GetPlayer(x) ~= Player then
       if GetPlayer(x).UserId ~= 1414978355 then
           local TPlayer = GetPlayer(x)
           if TPlayer then
               SkidFling(TPlayer)
           end
       else
       end
   elseif not GetPlayer(x) and not AllBool then
   end
end
end

--loadstring(game:HttpGet("https://raw.githubusercontent.com/RedZenXYZ/RedCommands/main/RedAdmin"))()
