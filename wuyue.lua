-- ============================================================
--  五月力量传奇  ——  卡密 + 加载 + 悬浮窗 + 功能
-- ============================================================

local TweenService = game:GetService("TweenService")
local SoundService = game:GetService("SoundService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local player = LocalPlayer

-- ============================================================
--  统一配色
-- ============================================================
local THEME = {
	Bg          = Color3.fromRGB(20, 20, 30),
	BgTrans     = 0.1,
	Accent      = Color3.fromRGB(0, 220, 255),
	Text        = Color3.fromRGB(230, 230, 230),
	SubText     = Color3.fromRGB(150, 150, 160),
	Button      = Color3.fromRGB(35, 35, 50),
	ButtonHover = Color3.fromRGB(50, 50, 70),
	ButtonClick = Color3.fromRGB(0, 180, 220),
	Stroke      = Color3.fromRGB(0, 220, 255),
	StrokeDim   = Color3.fromRGB(70, 70, 95),
	Divider     = Color3.fromRGB(60, 60, 80),
	Error       = Color3.fromRGB(255, 80, 80),
}

-- ============================================================
--  〇、卡密验证
-- ============================================================

local KEY_PASSWORD = "五月很帅"

task.wait(3)

local t0 = tick()
while tick() - t0 < 3 do end

local keyGui = Instance.new("ScreenGui")
keyGui.Name = "KeyVerify"
keyGui.ResetOnSpawn = false
keyGui.IgnoreGuiInset = true
keyGui.Parent = game.CoreGui

local keyOverlay = Instance.new("Frame")
keyOverlay.Size = UDim2.new(1, 0, 1, 0)
keyOverlay.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
keyOverlay.BackgroundTransparency = 0.3
keyOverlay.BorderSizePixel = 0
keyOverlay.Parent = keyGui

local keyBox = Instance.new("Frame")
keyBox.Size = UDim2.new(0, 340, 0, 220)
keyBox.Position = UDim2.new(0.5, -170, 0.5, -110)
keyBox.BackgroundColor3 = THEME.Bg
keyBox.BackgroundTransparency = THEME.BgTrans
keyBox.BorderSizePixel = 0
keyBox.Active = true
keyBox.Parent = keyGui

local keyCorner = Instance.new("UICorner")
keyCorner.CornerRadius = UDim.new(0, 16)
keyCorner.Parent = keyBox

local keyStroke = Instance.new("UIStroke")
keyStroke.Color = THEME.Stroke
keyStroke.Thickness = 2
keyStroke.Parent = keyBox

local keyTitle = Instance.new("TextLabel")
keyTitle.Size = UDim2.new(1, 0, 0, 50)
keyTitle.Position = UDim2.new(0, 0, 0, 20)
keyTitle.BackgroundTransparency = 1
keyTitle.Text = "卡密验证"
keyTitle.TextColor3 = THEME.Accent
keyTitle.Font = Enum.Font.Gotham
keyTitle.TextSize = 26
keyTitle.Parent = keyBox

local keyHint = Instance.new("TextLabel")
keyHint.Size = UDim2.new(1, 0, 0, 24)
keyHint.Position = UDim2.new(0, 0, 0, 70)
keyHint.BackgroundTransparency = 1
keyHint.Text = "请输入卡密"
keyHint.TextColor3 = THEME.SubText
keyHint.Font = Enum.Font.Gotham
keyHint.TextSize = 15
keyHint.Parent = keyBox

local keyInput = Instance.new("TextBox")
keyInput.Size = UDim2.new(1, -60, 0, 40)
keyInput.Position = UDim2.new(0, 30, 0, 100)
keyInput.BackgroundColor3 = Color3.fromRGB(35, 35, 50)
keyInput.BorderSizePixel = 0
keyInput.Text = ""
keyInput.PlaceholderText = "在此输入卡密..."
keyInput.PlaceholderColor3 = THEME.SubText
keyInput.TextColor3 = THEME.Text
keyInput.Font = Enum.Font.Gotham
keyInput.TextSize = 16
keyInput.ClearTextOnFocus = false
keyInput.Parent = keyBox

local keyInputCorner = Instance.new("UICorner")
keyInputCorner.CornerRadius = UDim.new(0, 8)
keyInputCorner.Parent = keyInput

local keyInputStroke = Instance.new("UIStroke")
keyInputStroke.Color = THEME.StrokeDim
keyInputStroke.Thickness = 1
keyInputStroke.Parent = keyInput

local keyBtn = Instance.new("TextButton")
keyBtn.Size = UDim2.new(1, -60, 0, 40)
keyBtn.Position = UDim2.new(0, 30, 0, 155)
keyBtn.BackgroundColor3 = THEME.Button
keyBtn.BorderSizePixel = 0
keyBtn.Text = "验证"
keyBtn.TextColor3 = THEME.Accent
keyBtn.Font = Enum.Font.Gotham
keyBtn.TextSize = 18
keyBtn.AutoButtonColor = false
keyBtn.Parent = keyBox

local keyBtnCorner = Instance.new("UICorner")
keyBtnCorner.CornerRadius = UDim.new(0, 8)
keyBtnCorner.Parent = keyBtn

local keyBtnStroke = Instance.new("UIStroke")
keyBtnStroke.Color = THEME.Stroke
keyBtnStroke.Thickness = 1
keyBtnStroke.Parent = keyBtn

keyBtn.MouseEnter:Connect(function()
	keyBtn.BackgroundColor3 = THEME.ButtonHover
end)
keyBtn.MouseLeave:Connect(function()
	keyBtn.BackgroundColor3 = THEME.Button
end)

local keyError = Instance.new("TextLabel")
keyError.Size = UDim2.new(1, 0, 0, 20)
keyError.Position = UDim2.new(0, 0, 1, -24)
keyError.BackgroundTransparency = 1
keyError.Text = ""
keyError.TextColor3 = THEME.Error
keyError.Font = Enum.Font.Gotham
keyError.TextSize = 14
keyError.Parent = keyBox

local passed = false

keyBtn.MouseButton1Click:Connect(function()
	if passed then return end
	if keyInput.Text == KEY_PASSWORD then
		passed = true
		keyError.Text = ""
		keyBtn.Text = "验证通过 ✓"
		keyBtn.TextColor3 = THEME.Accent
		task.wait(0.6)
		keyGui:Destroy()
	else
		keyError.Text = "卡密错误，请重试"
		keyInput.Text = ""
	end
end)

keyInput.FocusLost:Connect(function(enterPressed)
	if enterPressed then
		keyBtn.MouseButton1Click:Fire()
	end
end)

while not passed do
	task.wait(0.1)
end

-- ============================================================
--  一、加载动画
-- ============================================================

local old = game.CoreGui:FindFirstChild("ScriptIntro")
if old then old:Destroy() end
local oldSnd = SoundService:FindFirstChild("IntroMusic")
if oldSnd then oldSnd:Destroy() end

local sound = Instance.new("Sound")
sound.Name = "IntroMusic"
sound.SoundId = "rbxassetid://1837879082"
sound.Volume = 0
sound.Looped = false
sound.Parent = SoundService
sound:Play()
TweenService:Create(sound, TweenInfo.new(1.5), {Volume = 1}):Play()

local sg = Instance.new("ScreenGui")
sg.Name = "ScriptIntro"
sg.ResetOnSpawn = false
sg.IgnoreGuiInset = true
sg.Parent = game.CoreGui

local overlay = Instance.new("Frame")
overlay.Size = UDim2.new(1, 0, 1, 0)
overlay.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
overlay.BackgroundTransparency = 1
overlay.BorderSizePixel = 0
overlay.Parent = sg

local box = Instance.new("Frame")
box.Size = UDim2.new(0, 400, 0, 160)
box.Position = UDim2.new(0.5, -200, 0.5, -80)
box.BackgroundColor3 = THEME.Bg
box.BackgroundTransparency = 1
box.BorderSizePixel = 0
box.Parent = sg

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 16)
corner.Parent = box

local stroke = Instance.new("UIStroke")
stroke.Color = THEME.Stroke
stroke.Thickness = 2
stroke.Transparency = 1
stroke.Parent = box

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 60)
title.Position = UDim2.new(0, 0, 0, 30)
title.BackgroundTransparency = 1
title.Text = "五月力量传奇"
title.TextColor3 = THEME.Accent
title.Font = Enum.Font.Gotham
title.TextSize = 42
title.TextTransparency = 1
title.Parent = box

local sub = Instance.new("TextLabel")
sub.Size = UDim2.new(1, 0, 0, 30)
sub.Position = UDim2.new(0, 0, 0, 90)
sub.BackgroundTransparency = 1
sub.Text = "正在加载..."
sub.TextColor3 = THEME.SubText
sub.Font = Enum.Font.Gotham
sub.TextSize = 18
sub.TextTransparency = 1
sub.Parent = box

local barBg = Instance.new("Frame")
barBg.Size = UDim2.new(0.8, 0, 0, 8)
barBg.Position = UDim2.new(0.1, 0, 1, 20)
barBg.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
barBg.BorderSizePixel = 0
barBg.BackgroundTransparency = 1
barBg.Parent = box

local barBgCorner = Instance.new("UICorner")
barBgCorner.CornerRadius = UDim.new(1, 0)
barBgCorner.Parent = barBg

local bar = Instance.new("Frame")
bar.Size = UDim2.new(0, 0, 1, 0)
bar.BackgroundColor3 = THEME.Accent
bar.BorderSizePixel = 0
bar.Parent = barBg

local barCorner = Instance.new("UICorner")
barCorner.CornerRadius = UDim.new(1, 0)
barCorner.Parent = bar

TweenService:Create(overlay, TweenInfo.new(0.8), {BackgroundTransparency = 0.3}):Play()
task.wait(0.5)

TweenService:Create(box, TweenInfo.new(0.8), {BackgroundTransparency = THEME.BgTrans}):Play()
TweenService:Create(stroke, TweenInfo.new(0.8), {Transparency = 0}):Play()
TweenService:Create(title, TweenInfo.new(0.8), {TextTransparency = 0}):Play()
TweenService:Create(sub, TweenInfo.new(0.8), {TextTransparency = 0}):Play()
TweenService:Create(barBg, TweenInfo.new(0.8), {BackgroundTransparency = 0}):Play()

title.TextSize = 30
TweenService:Create(title, TweenInfo.new(0.8, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {TextSize = 42}):Play()

task.wait(0.8)
TweenService:Create(bar, TweenInfo.new(4, Enum.EasingStyle.Quad), {Size = UDim2.new(1, 0, 1, 0)}):Play()
task.wait(4)

sub.Text = "加载完成 ✓"
task.wait(1)

local fadeOut = TweenInfo.new(0.8)
TweenService:Create(overlay, fadeOut, {BackgroundTransparency = 1}):Play()
TweenService:Create(box, fadeOut, {BackgroundTransparency = 1}):Play()
TweenService:Create(stroke, fadeOut, {Transparency = 1}):Play()
TweenService:Create(title, fadeOut, {TextTransparency = 1}):Play()
TweenService:Create(sub, fadeOut, {TextTransparency = 1}):Play()
TweenService:Create(barBg, fadeOut, {BackgroundTransparency = 1}):Play()

local fadeSound = TweenService:Create(sound, TweenInfo.new(1), {Volume = 0})
fadeSound:Play()
fadeSound.Completed:Connect(function()
	sound:Stop()
	sound:Destroy()
end)

task.wait(0.9)
sg:Destroy()


-- ============================================================
--  二、正式脚本（悬浮球 + 悬浮窗）
-- ============================================================

if game.CoreGui:FindFirstChild("WhiteTemplate") then
	game.CoreGui.WhiteTemplate:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "WhiteTemplate"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = game.CoreGui

local BALL_CONFIG = {
	Size        = UDim2.new(0, 60, 0, 60),
	Position    = UDim2.new(0, 20, 0.5, -30),
	BgColor     = Color3.fromRGB(230, 230, 240),
	HoverColor  = Color3.fromRGB(210, 210, 225),
	Text        = "五月",
	TextColor   = Color3.fromRGB(20, 60, 160),
	TextSize    = 44,
	Font        = Enum.Font.Gotham,
	StrokeColor = THEME.Stroke,
	StrokeWidth = 2,
}

local Ball = Instance.new("TextButton")
Ball.Name = "FloatBall"
Ball.Size = BALL_CONFIG.Size
Ball.Position = BALL_CONFIG.Position
Ball.BackgroundColor3 = BALL_CONFIG.BgColor
Ball.BackgroundTransparency = 0
Ball.BorderSizePixel = 0
Ball.Text = BALL_CONFIG.Text
Ball.TextColor3 = BALL_CONFIG.TextColor
Ball.TextSize = BALL_CONFIG.TextSize
Ball.Font = BALL_CONFIG.Font
Ball.AutoButtonColor = false
Ball.Active = true
Ball.Parent = ScreenGui

local BallCorner = Instance.new("UICorner")
BallCorner.CornerRadius = UDim.new(1, 0)
BallCorner.Parent = Ball

local BallStroke = Instance.new("UIStroke")
BallStroke.Color = BALL_CONFIG.StrokeColor
BallStroke.Thickness = BALL_CONFIG.StrokeWidth
BallStroke.Parent = Ball

Ball.MouseEnter:Connect(function()
	Ball.BackgroundColor3 = BALL_CONFIG.HoverColor
end)
Ball.MouseLeave:Connect(function()
	Ball.BackgroundColor3 = BALL_CONFIG.BgColor
end)

local Main = Instance.new("Frame")
Main.Name = "Main"
Main.Size = UDim2.new(0, 320, 0, 420)
Main.Position = UDim2.new(0.5, -160, 0.5, -210)
Main.BackgroundColor3 = THEME.Bg
Main.BackgroundTransparency = THEME.BgTrans
Main.BorderSizePixel = 0
Main.Active = true
Main.Visible = false
Main.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 10)
MainCorner.Parent = Main

local MainStroke = Instance.new("UIStroke")
MainStroke.Color = THEME.Stroke
MainStroke.Thickness = 2
MainStroke.Parent = Main

local Title = Instance.new("TextLabel")
Title.Name = "Title"
Title.Size = UDim2.new(1, -80, 0, 40)
Title.Position = UDim2.new(0, 14, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "五月力量传奇脚本"
Title.TextColor3 = THEME.Accent
Title.TextSize = 18
Title.Font = Enum.Font.Gotham
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = Main

local CloseBtn = Instance.new("TextButton")
CloseBtn.Name = "CloseBtn"
CloseBtn.Size = UDim2.new(0, 30, 0, 30)
CloseBtn.Position = UDim2.new(1, -40, 0, 5)
CloseBtn.BackgroundColor3 = THEME.Button
CloseBtn.BorderSizePixel = 0
CloseBtn.Text = "✕"
CloseBtn.TextColor3 = THEME.Text
CloseBtn.TextSize = 14
CloseBtn.Font = Enum.Font.Gotham
CloseBtn.AutoButtonColor = false
CloseBtn.Parent = Main

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 8)
CloseCorner.Parent = CloseBtn

local CloseStroke = Instance.new("UIStroke")
CloseStroke.Color = THEME.StrokeDim
CloseStroke.Thickness = 1
CloseStroke.Parent = CloseBtn

local Divider = Instance.new("Frame")
Divider.Size = UDim2.new(1, -28, 0, 1)
Divider.Position = UDim2.new(0, 14, 0, 40)
Divider.BackgroundColor3 = THEME.Divider
Divider.BorderSizePixel = 0
Divider.Parent = Main

-- ============================================
--  可滚动按钮容器
-- ============================================
local ButtonHolder = Instance.new("ScrollingFrame")
ButtonHolder.Name = "ButtonHolder"
ButtonHolder.Size = UDim2.new(1, -28, 1, -60)
ButtonHolder.Position = UDim2.new(0, 14, 0, 50)
ButtonHolder.BackgroundTransparency = 1
ButtonHolder.BorderSizePixel = 0
ButtonHolder.ScrollBarThickness = 4
ButtonHolder.ScrollBarImageColor3 = THEME.Accent
ButtonHolder.CanvasSize = UDim2.new(0, 0, 0, 0)
ButtonHolder.AutomaticCanvasSize = Enum.AutomaticSize.Y
ButtonHolder.ScrollingDirection = Enum.ScrollingDirection.Y
ButtonHolder.Parent = Main

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.Padding = UDim.new(0, 8)
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Parent = ButtonHolder

local function createButton(text, callback)
	local Button = Instance.new("TextButton")
	Button.Size = UDim2.new(1, 0, 0, 36)
	Button.BackgroundColor3 = THEME.Button
	Button.BorderSizePixel = 0
	Button.Text = text
	Button.TextColor3 = THEME.Text
	Button.TextSize = 15
	Button.Font = Enum.Font.Gotham
	Button.AutoButtonColor = false
	Button.Parent = ButtonHolder

	local Corner = Instance.new("UICorner")
	Corner.CornerRadius = UDim.new(0, 8)
	Corner.Parent = Button

	local Stroke = Instance.new("UIStroke")
	Stroke.Color = THEME.StrokeDim
	Stroke.Thickness = 1
	Stroke.Parent = Button

	Button.MouseEnter:Connect(function()
		Button.BackgroundColor3 = THEME.ButtonHover
	end)
	Button.MouseLeave:Connect(function()
		Button.BackgroundColor3 = THEME.Button
	end)
	Button.MouseButton1Click:Connect(function()
		Button.BackgroundColor3 = THEME.ButtonClick
		task.wait(0.1)
		Button.BackgroundColor3 = THEME.Button
		if callback then
			pcall(callback)
		end
	end)

	return Button
end

-- ============================================
--  悬浮球拖拽 + 点击
-- ============================================
local dragging = false
local dragStart, startPos
local movedDistance = 0

Ball.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1
		or input.UserInputType == Enum.UserInputType.Touch then
		dragging = true
		movedDistance = 0
		dragStart = input.Position
		startPos = Ball.Position
	end
end)

Ball.InputChanged:Connect(function(input)
	if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement
		or input.UserInputType == Enum.UserInputType.Touch) then
		local delta = input.Position - dragStart
		movedDistance = movedDistance + math.abs(delta.X) + math.abs(delta.Y)
		Ball.Position = UDim2.new(
			startPos.X.Scale, startPos.X.Offset + delta.X,
			startPos.Y.Scale, startPos.Y.Offset + delta.Y
		)
	end
end)

UserInputService.InputEnded:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1
		or input.UserInputType == Enum.UserInputType.Touch then
		if dragging then
			dragging = false
			if movedDistance < 8 then
				Main.Visible = not Main.Visible
				if Main.Visible then
					Main.Position = UDim2.new(0, Ball.AbsolutePosition.X + 65, 0, Ball.AbsolutePosition.Y)
				end
			end
		end
	end
end)

-- ============================================
--  主面板拖拽（拖标题栏）
-- ============================================
local dragging2 = false
local dragStart2, startPos2

Title.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1
		or input.UserInputType == Enum.UserInputType.Touch then
		dragging2 = true
		dragStart2 = input.Position
		startPos2 = Main.Position
	end
end)

Title.InputChanged:Connect(function(input)
	if dragging2 and (input.UserInputType == Enum.UserInputType.MouseMovement
		or input.UserInputType == Enum.UserInputType.Touch) then
		local delta = input.Position - dragStart2
		Main.Position = UDim2.new(
			startPos2.X.Scale, startPos2.X.Offset + delta.X,
			startPos2.Y.Scale, startPos2.Y.Offset + delta.Y
		)
	end
end)

UserInputService.InputEnded:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1
		or input.UserInputType == Enum.UserInputType.Touch then
		dragging2 = false
	end
end)

CloseBtn.MouseButton1Click:Connect(function()
	Main.Visible = false
end)

-- ============================================
--  自动锻炼
-- ============================================
local training = false
local trainingBtn
trainingBtn = createButton("自动锻炼 [关]", function()
	training = not training
	if training then
		trainingBtn.Text = "自动锻炼 [开]"
		trainingBtn.TextColor3 = THEME.Accent
		task.spawn(function()
			local args = { "rep" }
			while training do
				pcall(function()
					LocalPlayer:WaitForChild("muscleEvent"):FireServer(unpack(args))
				end)
				task.wait(0.2)
			end
		end)
	else
		trainingBtn.Text = "自动锻炼 [关]"
		trainingBtn.TextColor3 = THEME.Text
	end
end)

-- ============================================
--  自动重生
-- ============================================
local rebirthing = false
local rebirthBtn
rebirthBtn = createButton("自动重生 [关]", function()
	rebirthing = not rebirthing
	if rebirthing then
		rebirthBtn.Text = "自动重生 [开]"
		rebirthBtn.TextColor3 = THEME.Accent
		task.spawn(function()
			local remote = ReplicatedStorage:WaitForChild("rEvents"):WaitForChild("rebirthRemote")
			local args = { "rebirthRequest" }
			while rebirthing do
				pcall(function()
					remote:InvokeServer(unpack(args))
				end)
				task.wait(0.2)
			end
		end)
	else
		rebirthBtn.Text = "自动重生 [关]"
		rebirthBtn.TextColor3 = THEME.Text
	end
end)

-- ============================================
--  自动举哑铃
-- ============================================
local ATYL = false
local ATYLPlatform = nil
local atylBtn

atylBtn = createButton("自动举哑铃 [关]", function()
	ATYL = not ATYL

	if ATYL then
		atylBtn.Text = "自动举哑铃 [开]"
		atylBtn.TextColor3 = THEME.Accent

		local part = Instance.new("Part")
		part.Size = Vector3.new(500, 20, 530.1)
		part.Position = Vector3.new(0, 100000, 133.15)
		part.CanCollide = true
		part.Anchored = true
		part.Parent = workspace
		ATYLPlatform = part

		task.spawn(function()
			while ATYL do
				task.wait()
				local char = LocalPlayer.Character
				if char and char:FindFirstChild("HumanoidRootPart") then
					char.HumanoidRootPart.CFrame = part.CFrame + Vector3.new(0, 50, 0)

					local bp = LocalPlayer:FindFirstChild("Backpack")
					if bp then
						for _, v in pairs(bp:GetChildren()) do
							if v.ClassName == "Tool" and v.Name == "Weight" then
								v.Parent = char
							end
						end
					end

					pcall(function()
						LocalPlayer.muscleEvent:FireServer("rep")
					end)
				end
			end
		end)
	else
		atylBtn.Text = "自动举哑铃 [关]"
		atylBtn.TextColor3 = THEME.Text

		if ATYLPlatform then
			ATYLPlatform:Destroy()
			ATYLPlatform = nil
		end
	end
end)

local teleportOpen = false
local teleportList = {}

local teleportPoints = {
	{ "出生点",         CFrame.new(7, 3, 108) },
	{ "安全岛",         CFrame.new(-39, 10, 1838) },
	{ "幸运抽奖区",     CFrame.new(-2606, -2, 5753) },
	{ "肌肉之王健身房", CFrame.new(-8554, 22, -5642) },
	{ "传说健身房",     CFrame.new(4676, 997, -3915) },
	{ "永恒健身房",     CFrame.new(-6686, 13, -1284) },
	{ "神话健身房",     CFrame.new(2177, 13, 1070) },
	{ "冰霜健身房",     CFrame.new(-2543, 13, -410) },
 { "过载健身房",     CFrame.new（–3063,165,4942）},
}
local teleBtn
teleBtn = createButton("传送 ▾", function()
	teleportOpen = not teleportOpen
	if teleportOpen then
		teleBtn.Text = "传送 ▴"
		teleBtn.TextColor3 = THEME.Accent
		for _, b in ipairs(teleportList) do
			b.Visible = true
		end
	else
		teleBtn.Text = "传送 ▾"
		teleBtn.TextColor3 = THEME.Text
		for _, b in ipairs(teleportList) do
			b.Visible = false
		end
	end
end)

for _, point in ipairs(teleportPoints) do
	local name, cf = point[1], point[2]
	local btn = createButton("  → " .. name, function()
		local char = LocalPlayer.Character
		if char and char:FindFirstChild("HumanoidRootPart") then
			char.HumanoidRootPart.CFrame = cf
		end
	end)
	btn.Visible = false
	table.insert(teleportList, btn)
end

-- 关闭脚本
createButton("关闭脚本", function()
	ScreenGui:Destroy()
end)

print("[五月] 加载完成 — 点击悬浮球打开菜单")