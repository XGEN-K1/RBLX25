getgenv().VoicechatSpySettings = {
    TrackVoice3d = false,
    FollowDistance = 0
}

if not game:IsLoaded() then
    game.Loaded:Wait()
end

local VoicechatSpy = Instance.new('ScreenGui')
local BG = Instance.new('Frame')
local UICorner = Instance.new('UICorner')
local Title = Instance.new('TextLabel')
local Exit = Instance.new('TextButton')
local UICorner_2 = Instance.new('UICorner')
local Minimize = Instance.new('TextButton')
local UICorner_3 = Instance.new('UICorner')
local UICorner_4 = Instance.new('UICorner')
local PlayersSC = Instance.new('ScrollingFrame')
local UIListLayout = Instance.new('UIListLayout')
local CountLbl = Instance.new('TextLabel')
local PlayerFrame = Instance.new('Frame')
local UICorner_5 = Instance.new('UICorner')
local Button = Instance.new('TextButton')
local UICorner_6 = Instance.new('UICorner')
local AspectRatio = Instance.new('UIAspectRatioConstraint')

VoicechatSpy.Name = game:GetService('HttpService'):GenerateGUID():gsub('[^0-9^%a].-', '')
VoicechatSpy.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
VoicechatSpy.DisplayOrder = 999999999

if syn and syn.protect_gui then
    syn.protect_gui(VoicechatSpy); VoicechatSpy.Parent = game:GetService('CoreGui')
elseif gethui or gethiddenui then
    local Parent = gethui or gethiddenui; VoicechatSpy.Parent = Parent()
else
    VoicechatSpy.Parent = game:GetService('CoreGui')
end

BG.Name = 'BG'
BG.Parent = VoicechatSpy
BG.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
BG.Position = UDim2.new(0.39405942, 0, 0.2141058, 0)
BG.Selectable = true
BG.Size = UDim2.new(0.211881191, 0, 0.57178843, 0)

UICorner.CornerRadius = UDim.new(0, 5)
UICorner.Parent = BG

Title.Name = 'Title'
Title.Parent = BG
Title.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Title.BorderSizePixel = 0
Title.Size = UDim2.new(1, 0, 0.10105285, 0)
Title.ZIndex = 4
Title.Font = Enum.Font.Gotham
Title.Text = 'SoundSpy'
Title.TextColor3 = Color3.fromRGB(255, 102, 0)
Title.TextSize = 14.000

Exit.Name = 'Exit'
Exit.Parent = Title
Exit.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Exit.BorderSizePixel = 0
Exit.Position = UDim2.new(0.883586168, 0, 0.110390887, 0)
Exit.Size = UDim2.new(0.0960000008, 0, 0.744000018, 0)
Exit.ZIndex = 5
Exit.Font = Enum.Font.SourceSans
Exit.Text = 'X'
Exit.TextColor3 = Color3.fromRGB(255, 102, 0)
Exit.TextSize = 20.000

UICorner_2.CornerRadius = UDim.new(0, 360)
UICorner_2.Parent = Exit

Minimize.Name = 'Minimize'
Minimize.Parent = Title
Minimize.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Minimize.BorderSizePixel = 0
Minimize.Position = UDim2.new(0.787021339, 0, 0.110390887, 0)
Minimize.Size = UDim2.new(0.0960000008, 0, 0.744000018, 0)
Minimize.ZIndex = 5
Minimize.Font = Enum.Font.SourceSans
Minimize.LineHeight = 1.200
Minimize.Text = '-'
Minimize.TextColor3 = Color3.fromRGB(255, 102, 0)
Minimize.TextSize = 30.000

UICorner_3.CornerRadius = UDim.new(0, 360)
UICorner_3.Parent = Minimize

UICorner_4.CornerRadius = UDim.new(0, 5)
UICorner_4.Parent = Title

PlayersSC.Name = 'PlayersSC'
PlayersSC.Parent = BG
PlayersSC.Active = true
PlayersSC.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
PlayersSC.BackgroundTransparency = 1
PlayersSC.BorderSizePixel = 0
PlayersSC.Position = UDim2.new(0, 0, 0.096916303, 0)
PlayersSC.Size = UDim2.new(1, 0, 0.903083682, 0)

UIListLayout.Parent = PlayersSC
UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

CountLbl.Name = 'CountLbl'
CountLbl.Parent = BG
CountLbl.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
CountLbl.BackgroundTransparency = 1.000
CountLbl.BorderSizePixel = 0
CountLbl.Position = UDim2.new(0.0280373823, 0, 0, 0)
CountLbl.Size = UDim2.new(0.17757009, 0, 0.10105285, 0)
CountLbl.ZIndex = 4
CountLbl.Font = Enum.Font.Gotham
CountLbl.Text = 'Spying: ----'
CountLbl.TextColor3 = Color3.fromRGB(255, 102, 0)

PlayerFrame.Name = 'PlayerFrame'
PlayerFrame.Parent = VoicechatSpy
PlayerFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
PlayerFrame.Size = UDim2.new(0.851000011, 0, 0.149000004, 0)
PlayerFrame.Visible = false

UICorner_5.CornerRadius = UDim.new(0, 5)
UICorner_5.Parent = PlayerFrame

Button.Name = 'Button'
Button.Parent = PlayerFrame
Button.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Button.BorderSizePixel = 0
Button.Size = UDim2.new(0.999823034, 0, 1, 0)
Button.ZIndex = 5
Button.Font = Enum.Font.Gotham
Button.Text = 'Builderman'
Button.TextColor3 = Color3.fromRGB(255, 102, 0)
Button.TextSize = 12.000
Button.TextWrapped = true

UICorner_6.CornerRadius = UDim.new(0, 5)
UICorner_6.Parent = Button

AspectRatio.Name = 'AspectRatio'
AspectRatio.Parent = PlayerFrame
AspectRatio.AspectRatio = 7.000

---- Dragging/UI

PlayersSC.ScrollBarImageColor3 = Color3.fromRGB(255, 102, 0)

local SpiedPlayers, SpiedPlayersCount = {}, 0

local function Tween(...)
    return game:GetService('TweenService'):Create(...)
end

local UIS, Dragging, Dragging2, DragInput, DragStart, StartPos = game:GetService('UserInputService')

local function Update(Input)
    if BG and BG.Parent and (BG.Active and BG.Selectable) or Dragging2 then
    	local DT = Input.Position - DragStart
    	BG.Position = UDim2.new(StartPos.X.Scale, StartPos.X.Offset + DT.X, StartPos.Y.Scale, StartPos.Y.Offset + DT.Y)
    end
end

BG.InputBegan:Connect(function(Input)
	if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
		Dragging = true
		DragStart = Input.Position
		StartPos = BG.Position
		
		Input.Changed:Connect(function()
			if Input.UserInputState == Enum.UserInputState.End then
				Dragging = false
			end
		end)
	end
end)

Title.InputBegan:Connect(function(Input)
	if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
		Dragging2 = true
		
		Input.Changed:Connect(function()
			if Input.UserInputState == Enum.UserInputState.End then
				Dragging2 = false
			end
		end)
	end
end)

BG.InputChanged:Connect(function(Input)
	if Input.UserInputType == Enum.UserInputType.MouseMovement or Input.UserInputType == Enum.UserInputType.Touch then
		DragInput = Input
	end
end)

UIS.InputChanged:Connect(function(Input)
	if Input == DragInput and Dragging then
		Update(Input)
	end
end)

PlayersSC.UIListLayout:GetPropertyChangedSignal('AbsoluteContentSize'):Connect(function()
    PlayersSC.CanvasSize = UDim2.new(0, 0, 0, PlayersSC.UIListLayout.AbsoluteContentSize.Y)
end)

-- Exit/Minimize

local Exiting, Minimizing, Minimized = false, false, false

Exit.MouseButton1Click:Connect(function()
    BG.ClipsDescendants = true
    
    if not Exiting then
        Exiting = true
        
        local T = Tween(BG, TweenInfo.new(.25, Enum.EasingStyle.Sine), {Size = UDim2.new(BG.Size.X.Scale, 0, 0, 0)})
        T:Play(); T.Completed:wait()
        
        VoicechatSpy:Destroy()
        
        for _, v in next, SpiedPlayers do
            SpiedPlayers[_] = nil
        end
    end
end)

Minimize.MouseButton1Click:Connect(function()
    local List = {'Title', 'CountLbl', 'Exit', 'Minimize'};
    
    if not Minimizing and not Exiting then
        Minimizing = true; BG.Visible = true
        
        if not Minimized then
            BG.ClipsDescendants = true
            
            for _, v in next, BG:GetChildren() do
                if not table.find(List, v.Name) and v:IsA('GuiObject') and type(v['Visible']) == 'boolean' then
                    v.Visible = false
                end
            end
            
            local T = Tween(BG, TweenInfo.new(.25, Enum.EasingStyle.Sine), {Transparency = 1})
            T:Play(); T.Completed:wait()
            
            BG.Selectable = false
            BG.Active = false
            
            Minimized = true
        elseif Minimized then
            BG.ClipsDescendants = true
            
            local T = Tween(BG, TweenInfo.new(.25, Enum.EasingStyle.Sine), {Transparency = 0})
            T:Play(); T.Completed:wait()
            
            for _, v in next, BG:GetChildren() do
                if not table.find(List, v.Name) and v:IsA('GuiObject') and type(v['Visible']) == 'boolean' then
                    v.Visible = true
                end
            end
            
            BG.Selectable = true
            BG.Active = true
            
            Minimized = false
        end
        Minimizing = false
    end
end)

---- Scripting

local LP, Players, RunService, SoundService = game:GetService('Players').LocalPlayer, game:GetService('Players'), game:GetService('RunService'), game:GetService('SoundService'); SpiedPlayers = {}

local function IsPlayerSpied(Player)
    if typeof(Player) == 'Instance' and Player:IsA('Player') then
        for _, v in next, SpiedPlayers do
            if v == Player then
                return true
            end
        end
    end
    return false
end

local function UnspyVoicechat(Player)
    if typeof(Player) == 'Instance' and Player:IsA('Player') then
        for _, v in next, SpiedPlayers do
            if v == Player then
                SpiedPlayers[_] = nil; break
            end
        end
    end
end

local function SpyVoicechat(Player, Settings)
    local ContinueLoop = false
    local Player = assert(typeof(Player) == 'Instance' and Player:IsA('Player'), 'invalid argument #1 to \'SpyVoicechat\' (Instance [Player] expected, got '..tostring(typeof(Player))..')') and Player or nil
    local CurrentCamera, Character, VoiceOrigin = workspace.CurrentCamera, Player and Player.Character and Player.Character.Parent and Player.Character or nil, Player and Player.Character and Player.Character.Parent and Player.Character:FindFirstChild('HumanoidRootPart')
    local NewFrame = PlayerFrame:Clone()
    local Settings = assert(type(getgenv().VoicechatSpySettings) == 'table', 'invalid argument #2 to \'SpyVoicechat\' (table [VoicechatSpySettings] expected, got '..tostring(type(getgenv().VoicechatSpySettings))..')') and assert(getgenv().VoicechatSpySettings.TrackVoice3d ~= nil and getgenv().VoicechatSpySettings.FollowDistance ~= nil, ((getgenv().VoicechatSpySettings.TrackVoice3d == nil and 'invalid argument #2 to \'SpyVoicechat\' (option \'TrackVoice3d\' expected, got nil)') or (getgenv().VoicechatSpySettings.FollowDistance == nil and 'invalid argument #2 to \'SpyVoicechat\' (option \'FollowDistance\' expected, got nil)')) or '') and (table.foreach(getgenv().VoicechatSpySettings, function(Option, Value)
        return assert((Option == 'TrackVoice3d' and type(Value) == 'boolean' or Option == 'FollowDistance' and type(Value) == 'number') and (Option == 'TrackVoice3d' or Option == 'FollowDistance'), 'invalid argument #2 to \'SpyVoicechat\' ('..(Option == 'TrackVoice3d' and 'boolean' or Option == 'FollowDistance' and 'number')..' \''..tostring(Option)..'\' expected, got '..tostring(type(Value))..')') and getgenv().VoicechatSpySettings or nil
    end))
    
    if CurrentCamera and Character and VoiceOrigin then
        CountLbl.Text = 'Spying: '..SpiedPlayersCount
    end
    
    if NewFrame and NewFrame:FindFirstChild('Button') then
        NewFrame.Button.Text = Player.DisplayName..(Player.DisplayName ~= Player.Name and ' @'..Player.Name or '')
        
        NewFrame.Parent = PlayersSC; NewFrame.Visible = true
        
        NewFrame.Button.MouseButton1Click:Connect(function()
            CurrentCamera, Character, VoiceOrigin = workspace.CurrentCamera, Player and Player.Character and Player.Character.Parent and Player.Character or nil, Player and Player.Character and Player.Character.Parent and Player.Character:FindFirstChild('HumanoidRootPart')
            
            if ContinueLoop then
                NewFrame.Button.TextColor3 = Color3.fromRGB(255, 102, 0); ContinueLoop = false
                
                UnspyVoicechat(Player)
            elseif not ContinueLoop and CurrentCamera and Character and VoiceOrigin then
                table.insert(SpiedPlayers, Player); SpiedPlayersCount = SpiedPlayersCount + 1; CountLbl.Text = 'Spying: '..SpiedPlayersCount
                
                NewFrame.Button.TextColor3 = Color3.fromRGB(0, 255, 0); ContinueLoop = true
    
                if CurrentCamera and Character and VoiceOrigin then
                    task.spawn(function()
                        while true do
                            if ContinueLoop and IsPlayerSpied(Player) and Player.Parent and CurrentCamera.Parent and Character.Parent and VoiceOrigin.Parent then
                                if getgenv().VoicechatSpySettings.TrackVoice3d == true then
                                    SoundService:SetListener(Enum.ListenerType.CFrame, VoiceOrigin.CFrame * (CFrame.new((VoiceOrigin.Velocity + VoiceOrigin.RotVelocity) + (CFrame.new(VoiceOrigin.Velocity + VoiceOrigin.RotVelocity).lookVector * getgenv().VoicechatSpySettings.FollowDistance))))
                                elseif getgenv().VoicechatSpySettings.TrackVoice3d == false then
                                    SoundService:SetListener(Enum.ListenerType.CFrame, (VoiceOrigin.CFrame))
                                end
                                
                                RunService.Heartbeat:wait()
                                
                                SoundService:SetListener(Enum.ListenerType.Camera)
                            else
                                SoundService:SetListener(Enum.ListenerType.Camera); SpiedPlayersCount = SpiedPlayersCount - 1; CountLbl.Text = 'Spying: '..SpiedPlayersCount
                                
                                if NewFrame.Parent then
                                    NewFrame.Button.TextColor3 = Color3.fromRGB(255, 102, 0); ContinueLoop = false
                                    
                                    if not Player or not Player.Parent then
                                        Button:Destroy(); UnspyVoicechat(Player)
                                    end
                                end
                                
                                break
                            end
                            
                            RunService.RenderStepped:wait()
                        end
                    end)
                end
            end
        end)
    end
end

for _, v in next, Players:GetPlayers() do
    if v ~= LP then
        SpyVoicechat(v, {TrackVoice3d = TrackVoice3d, FollowDistance = FollowDistance})
    end
end

local PlayerAdded; PlayerAdded = Players.PlayerAdded:Connect(function(Player)
    if not Exiting then
        SpyVoicechat(Player, {TrackVoice3d = TrackVoice3d, FollowDistance = FollowDistance})
    else
        PlayerAdded:Disconnect()
    end
end)

local PlayerRemoving; PlayerRemoving = Players.PlayerRemoving:Connect(function(Player)
    if not Exiting then
        UnspyVoicechat(Player)
    else
        PlayerRemoving:Disconnect()
    end
end)
