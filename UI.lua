local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer
local RunService = game:GetService("RunService")

if game.CoreGui:FindFirstChild("WhiteTemplate") then
	game.CoreGui.WhiteTemplate:Destroy()
end


local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "WhiteTemplate"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = game.CoreGui


local Ball = Instance.new("TextButton")
Ball.Name = "FloatBall"
Ball.Size = UDim2.new(0, 55, 0, 55)
Ball.Position = UDim2.new(0, 20, 0.5, -27)
Ball.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Ball.BorderSizePixel = 0
Ball.Text = "⚙"
Ball.TextColor3 = Color3.fromRGB(30, 30, 30)
Ball.TextSize = 26
Ball.Font = Enum.Font.GothamBold
Ball.AutoButtonColor = false
Ball.Active = true
Ball.Draggable = true
Ball.Parent = ScreenGui

local BallCorner = Instance.new("UICorner")
BallCorner.CornerRadius = UDim.new(1, 0)
BallCorner.Parent = Ball

local BallStroke = Instance.new("UIStroke")
BallStroke.Color = Color3.fromRGB(220, 220, 220)
BallStroke.Thickness = 2
BallStroke.Parent = Ball

Ball.MouseEnter:Connect(function()
	Ball.BackgroundColor3 = Color3.fromRGB(240, 240, 240)
end)
Ball.MouseLeave:Connect(function()
	Ball.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
end)

local Main = Instance.new("Frame")
Main.Name = "Main"
Main.Size = UDim2.new(0, 320, 0, 280)
Main.Position = UDim2.new(0.5, -160, 0.5, -140)
Main.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Main.BorderSizePixel = 0
Main.Active = true
Main.Draggable = true
Main.Visible = false   -- 默认隐藏
Main.Parent = ScreenGui

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 10)
UICorner.Parent = Main

local UIStroke = Instance.new("UIStroke")
UIStroke.Color = Color3.fromRGB(220, 220, 220)
UIStroke.Thickness = 1
UIStroke.Parent = Main

local Title = Instance.new("TextLabel")
Title.Name = "Title"
Title.Size = UDim2.new(1, -80, 0, 40)
Title.Position = UDim2.new(0, 10, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "割草模拟器"
Title.TextColor3 = Color3.fromRGB(30, 30, 30)
Title.TextSize = 18
Title.Font = Enum.Font.GothamBold
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = Main


local CloseBtn = Instance.new("TextButton")
CloseBtn.Name = "CloseBtn"
CloseBtn.Size = UDim2.new(0, 30, 0, 30)
CloseBtn.Position = UDim2.new(1, -40, 0, 5)
CloseBtn.BackgroundColor3 = Color3.fromRGB(245, 245, 245)
CloseBtn.BorderSizePixel = 0
CloseBtn.Text = "✕"
CloseBtn.TextColor3 = Color3.fromRGB(30, 30, 30)
CloseBtn.TextSize = 14
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.AutoButtonColor = false
CloseBtn.Parent = Main

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 8)
CloseCorner.Parent = CloseBtn

-- 分割线
local Divider = Instance.new("Frame")
Divider.Size = UDim2.new(1, -20, 0, 1)
Divider.Position = UDim2.new(0, 10, 0, 40)
Divider.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
Divider.BorderSizePixel = 0
Divider.Parent = Main

-- 按钮容器
local ButtonHolder = Instance.new("Frame")
ButtonHolder.Name = "ButtonHolder"
ButtonHolder.Size = UDim2.new(1, -20, 1, -60)
ButtonHolder.Position = UDim2.new(0, 10, 0, 50)
ButtonHolder.BackgroundTransparency = 1
ButtonHolder.Parent = Main

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.Padding = UDim.new(0, 8)
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Parent = ButtonHolder

-- ============================================
--  按钮生成函数
-- ============================================
local function createButton(text, callback)
	local Button = Instance.new("TextButton")
	Button.Size = UDim2.new(1, 0, 0, 36)
	Button.BackgroundColor3 = Color3.fromRGB(245, 245, 245)
	Button.BorderSizePixel = 0
	Button.Text = text
	Button.TextColor3 = Color3.fromRGB(30, 30, 30)
	Button.TextSize = 15
	Button.Font = Enum.Font.Gotham
	Button.AutoButtonColor = false
	Button.Parent = ButtonHolder

	local Corner = Instance.new("UICorner")
	Corner.CornerRadius = UDim.new(0, 8)
	Corner.Parent = Button

	local Stroke = Instance.new("UIStroke")
	Stroke.Color = Color3.fromRGB(220, 220, 220)
	Stroke.Thickness = 1
	Stroke.Parent = Button

	Button.MouseEnter:Connect(function()
		Button.BackgroundColor3 = Color3.fromRGB(235, 235, 235)
	end)
	Button.MouseLeave:Connect(function()
		Button.BackgroundColor3 = Color3.fromRGB(245, 245, 245)
	end)
	Button.MouseButton1Click:Connect(function()
		Button.BackgroundColor3 = Color3.fromRGB(225, 225, 225)
		task.wait(0.1)
		Button.BackgroundColor3 = Color3.fromRGB(245, 245, 245)
		if callback then
			pcall(callback)
		end
	end)

	return Button
end

-- ============================================
--  点击悬浮球 → 显示/隐藏 悬浮窗
-- ============================================
local ballDragging = false
local dragStartPos, startPos

Ball.MouseButton1Down:Connect(function()
	ballDragging = false
	dragStartPos = UserInputService:GetMouseLocation()
	startPos = Ball.Position
end)

Ball.MouseButton1Up:Connect(function()
	-- 如果移动距离很小，判定为"点击"而不是"拖动"
	local moved = (UserInputService:GetMouseLocation() - dragStartPos).Magnitude
	if moved < 5 then
		Main.Visible = not Main.Visible
		-- 悬浮窗出现在悬浮球旁边
		Main.Position = UDim2.new(0, Ball.AbsolutePosition.X + 65, 0, Ball.AbsolutePosition.Y)
	end
end)

-- 检测拖动，避免拖动结束后误触发点击
Ball.MouseMoved:Connect(function()
	if UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) then
		ballDragging = true
	end
end)

-- 关闭按钮 → 隐藏悬浮窗（不销毁）
CloseBtn.MouseButton1Click:Connect(function()
	Main.Visible = false
end)

-- ============================================
--  在这里写你的功能
-- ======
createButton("自动收集", function()
	local args = {
		{
			normal = 0,
			ruby = 0,
			silver = 0,
			golden = 0,
			diamond = 999
		}
	}
	local remote = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("GrassCollect")
	while true do
		remote:FireServer(unpack(args))
		task.wait(0.2)
	end
end)

-- 示例 2：点击赚钱
createButton("无", function()
	local remote = ReplicatedStorage:WaitForChild("Events"):WaitForChild("ClickMoney")
	while true do
		remote:FireServer()
		task.wait(0.2)
	end
end)

createButton("关闭脚本", function()
	ScreenGui:Destroy()
end)

print("[白色模板] 加载完成 — 点击悬浮球打开菜单")