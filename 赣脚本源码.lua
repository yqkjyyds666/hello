-- ============================================================
--  赣脚本V2  ——  卡密验证 + 加载动画 + 音乐 + 面板
-- ============================================================

local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local SoundService = game:GetService("SoundService")

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
keyBox.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
keyBox.BackgroundTransparency = 0.1
keyBox.BorderSizePixel = 0
keyBox.Active = true
keyBox.Parent = keyGui

local keyCorner = Instance.new("UICorner")
keyCorner.CornerRadius = UDim.new(0, 16)
keyCorner.Parent = keyBox

local keyStroke = Instance.new("UIStroke")
keyStroke.Color = Color3.fromRGB(0, 220, 255)
keyStroke.Thickness = 2
keyStroke.Parent = keyBox

local keyTitle = Instance.new("TextLabel")
keyTitle.Size = UDim2.new(1, 0, 0, 50)
keyTitle.Position = UDim2.new(0, 0, 0, 20)
keyTitle.BackgroundTransparency = 1
keyTitle.Text = "卡密验证"
keyTitle.TextColor3 = Color3.fromRGB(0, 220, 255)
keyTitle.Font = Enum.Font.Gotham
keyTitle.TextSize = 26
keyTitle.Parent = keyBox

local keyInput = Instance.new("TextBox")
keyInput.Size = UDim2.new(1, -60, 0, 40)
keyInput.Position = UDim2.new(0, 30, 0, 100)
keyInput.BackgroundColor3 = Color3.fromRGB(35, 35, 50)
keyInput.BorderSizePixel = 0
keyInput.Text = ""
keyInput.PlaceholderText = "在此输入卡密..."
keyInput.PlaceholderColor3 = Color3.fromRGB(150, 150, 160)
keyInput.TextColor3 = Color3.fromRGB(230, 230, 230)
keyInput.Font = Enum.Font.Gotham
keyInput.TextSize = 16
keyInput.ClearTextOnFocus = false
keyInput.Parent = keyBox

local keyInputCorner = Instance.new("UICorner")
keyInputCorner.CornerRadius = UDim.new(0, 8)
keyInputCorner.Parent = keyInput

local keyBtn = Instance.new("TextButton")
keyBtn.Size = UDim2.new(1, -60, 0, 40)
keyBtn.Position = UDim2.new(0, 30, 0, 155)
keyBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 50)
keyBtn.BorderSizePixel = 0
keyBtn.Text = "验证"
keyBtn.TextColor3 = Color3.fromRGB(0, 220, 255)
keyBtn.Font = Enum.Font.Gotham
keyBtn.TextSize = 18
keyBtn.AutoButtonColor = false
keyBtn.Parent = keyBox

local keyBtnCorner = Instance.new("UICorner")
keyBtnCorner.CornerRadius = UDim.new(0, 8)
keyBtnCorner.Parent = keyBtn

local keyBtnStroke = Instance.new("UIStroke")
keyBtnStroke.Color = Color3.fromRGB(0, 220, 255)
keyBtnStroke.Thickness = 1
keyBtnStroke.Parent = keyBtn

local keyError = Instance.new("TextLabel")
keyError.Size = UDim2.new(1, 0, 0, 20)
keyError.Position = UDim2.new(0, 0, 1, -24)
keyError.BackgroundTransparency = 1
keyError.Text = ""
keyError.TextColor3 = Color3.fromRGB(255, 80, 80)
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
--  一、加载动画 + 背景音乐
-- ============================================================

-- 背景音乐（不阻塞加载动画）
local musicSound = nil
task.spawn(function()
    local ok, err = pcall(function()
        local music = game:HttpGet("https://raw.githubusercontent.com/renlua/music/refs/heads/main/%E8%B5%B7%E9%A3%8E%E4%BA%86.mp3")
        writefile("music.mp3", music)
        local Getmusic = getsynasset("music.mp3")

        musicSound = Instance.new("Sound")
        musicSound.Name = "MayMusic"
        musicSound.SoundId = Getmusic
        musicSound.Volume = 1
        musicSound.Looped = false
        musicSound.Parent = SoundService
        musicSound:Play()
    end)
    if not ok then
        warn("音乐加载失败：", err)
    end
end)

local sg = Instance.new("ScreenGui")
sg.Name = "ScriptIntro"
sg.ResetOnSpawn = false
sg.IgnoreGuiInset = true
sg.Parent = game.CoreGui

local overlay = Instance.new("Frame")
overlay.Size = UDim2.new(1, 0, 1, 0)
overlay.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
overlay.BackgroundTransparency = 0.3
overlay.BorderSizePixel = 0
overlay.Parent = sg

local box = Instance.new("Frame")
box.Size = UDim2.new(0, 400, 0, 160)
box.Position = UDim2.new(0.5, -200, 0.5, -80)
box.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
box.BackgroundTransparency = 0.1
box.BorderSizePixel = 0
box.Parent = sg

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 16)
corner.Parent = box

local stroke = Instance.new("UIStroke")
stroke.Color = Color3.fromRGB(0, 220, 255)
stroke.Thickness = 2
stroke.Parent = box

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 60)
title.Position = UDim2.new(0, 0, 0, 30)
title.BackgroundTransparency = 1
title.Text = "五月脚本"
title.TextColor3 = Color3.fromRGB(0, 220, 255)
title.Font = Enum.Font.Gotham
title.TextSize = 42
title.Parent = box

local sub = Instance.new("TextLabel")
sub.Size = UDim2.new(1, 0, 0, 30)
sub.Position = UDim2.new(0, 0, 0, 90)
sub.BackgroundTransparency = 1
sub.Text = "正在加载..."
sub.TextColor3 = Color3.fromRGB(150, 150, 160)
sub.Font = Enum.Font.Gotham
sub.TextSize = 18
sub.Parent = box

local barBg = Instance.new("Frame")
barBg.Size = UDim2.new(0.8, 0, 0, 8)
barBg.Position = UDim2.new(0.1, 0, 1, 20)
barBg.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
barBg.BorderSizePixel = 0
barBg.Parent = box

local barBgCorner = Instance.new("UICorner")
barBgCorner.CornerRadius = UDim.new(1, 0)
barBgCorner.Parent = barBg

local bar = Instance.new("Frame")
bar.Size = UDim2.new(0, 0, 1, 0)
bar.BackgroundColor3 = Color3.fromRGB(0, 220, 255)
bar.BorderSizePixel = 0
bar.Parent = barBg

local barCorner = Instance.new("UICorner")
barCorner.CornerRadius = UDim.new(1, 0)
barCorner.Parent = bar

TweenService:Create(bar, TweenInfo.new(2, Enum.EasingStyle.Quad), {Size = UDim2.new(1, 0, 1, 0)}):Play()
task.wait(2.2)

sub.Text = "加载完成 ✓"
task.wait(0.5)

local fadeOut = TweenInfo.new(0.6)
TweenService:Create(overlay, fadeOut, {BackgroundTransparency = 1}):Play()
TweenService:Create(box, fadeOut, {BackgroundTransparency = 1}):Play()
TweenService:Create(stroke, fadeOut, {Transparency = 1}):Play()
TweenService:Create(title, fadeOut, {TextTransparency = 1}):Play()
TweenService:Create(sub, fadeOut, {TextTransparency = 1}):Play()
TweenService:Create(barBg, fadeOut, {BackgroundTransparency = 1}):Play()

task.wait(0.7)
sg:Destroy()

-- 音乐淡出
if musicSound then
    TweenService:Create(musicSound, TweenInfo.new(1), {Volume = 0}):Play()
    task.wait(1)
    musicSound:Stop()
    musicSound:Destroy()
end

-- ============================================================
--  二、library 面板（关于 / 通用 / 范围 / 旋转 / 力量传奇）
-- ============================================================

local library = loadstring(game:HttpGet("https://pastebin.com/raw/3vQbADjh", true))()
local window = library:new("五月很帅")

------------------------------------------------------------
--  关于
------------------------------------------------------------
local creds = window:Tab("关于", "")
local bin = creds:section("信息", true)
bin:Label("五月制作最新版本")
bin:Label("感谢支持我")
bin:Label("会努力更新的")
bin:Label("也感谢帮我的人")
local credits = creds:section("UI设置", true)

credits:Toggle("移除UI辉光", "", false, function(state)
    if state then
        game:GetService("CoreGui")["frosty is cute"].Main.DropShadowHolder.Visible = false
    else
        game:GetService("CoreGui")["frosty is cute"].Main.DropShadowHolder.Visible = true
    end
end)

credits:Toggle("彩虹UI", "", false, function(state)
    if state then
        game:GetService("CoreGui")["frosty is cute"].Main.Style = "DropShadow"
    else
        game:GetService("CoreGui")["frosty is cute"].Main.Style = "Custom"
    end
end)

credits:Toggle("脚本框架变小一点", "", false, function(state)
    if state then
        game:GetService("CoreGui")["frosty"].Main.Style = "DropShadow"
    else
        game:GetService("CoreGui")["frosty"].Main.Style = "Custom"
    end
end)

credits:Button("摧毁GUI",function()
    game:GetService("CoreGui")["frosty is cute"]:Destroy()
end)

------------------------------------------------------------
--  通用
------------------------------------------------------------
local creds = window:Tab("通用", "6035145364")
local credits = creds:section("通用内容", true)

credits:Slider('修改速度', 'WalkspeedSlider', 16, 16, 99999, false, function(Value)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
end)

credits:Slider('修改跳跃', 'JumpPowerSlider', 50, 50, 99999, false, function(Value)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
end)

credits:Slider('修改重力', 'GravitySlider', 198, 198, 99999, false, function(Value)
    game.Workspace.Gravity = Value
end)

credits:Slider('修改高度', 'Slider', 2, 2, 9999, false, function(Value)
    game.Players.LocalPlayer.Character.Humanoid.HipHeight = Value
end)

credits:Slider('相机焦距上限', 'ZOOOOOM OUT!', 128, 128, 200000, false, function(Value)
    game:GetService("Players").LocalPlayer.CameraMaxZoomDistance = Value
end)

credits:Slider('相机焦距【正常为70】', 'Sliderflag', 70, 0.1, 250, false, function(v)
    game.Workspace.CurrentCamera.FieldOfView = v
end)

credits:Slider('健康值上限', 'Sliderflag', 120, 120, 999999, false, function(Value)
    game.Players.LocalPlayer.Character.Humanoid.MaxHealth = Value
end)

credits:Slider('玩家健康值', 'Sliderflag', 120, 120, 999999, false, function(Value)
    game.Players.LocalPlayer.Character.Humanoid.Health = Value
end)

credits:Button("显示时间", function()
    local LBLG = Instance.new("ScreenGui")
    local LBL = Instance.new("TextLabel")
    LBLG.Name = "LBLG"
    LBLG.Parent = game.CoreGui
    LBLG.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    LBLG.Enabled = true
    LBL.Name = "LBL"
    LBL.Parent = LBLG
    LBL.BackgroundTransparency = 1
    LBL.Position = UDim2.new(0.75, 0, 0.010, 0)
    LBL.Size = UDim2.new(0, 133, 0, 30)
    LBL.Font = Enum.Font.GothamSemibold
    LBL.Text = "XK脚本中心max"
    LBL.TextColor3 = Color3.new(1, 1, 1)
    LBL.TextScaled = true
    LBL.TextSize = 14
    LBL.TextWrapped = true
    LBL.Visible = true

    local FpsLabel = LBL
    local Heartbeat = game:GetService("RunService").Heartbeat
    local LastIteration, Start
    local FrameUpdateTable = { }

    local function HeartbeatUpdate()
        LastIteration = tick()
        for Index = #FrameUpdateTable, 1, -1 do
            FrameUpdateTable[Index + 1] = (FrameUpdateTable[Index] >= LastIteration - 1) and FrameUpdateTable[Index] or nil
        end
        FrameUpdateTable[1] = LastIteration
        FpsLabel.Text = ("赣:"..os.date("%H").."时"..os.date("%M").."分"..os.date("%S")).."秒"
    end
    Start = tick()
    Heartbeat:Connect(HeartbeatUpdate)
end)

credits:Button("黑洞脚本", function()
    loadstring(game:HttpGet("https://shz.al/~KAKAKKKKSS"))()
end)

credits:Toggle("夜视脚本", "", false, function(state)
    if state then
        game.Lighting.Ambient = Color3.new(1, 1, 1)
    else
        game.Lighting.Ambient = Color3.new(0, 0, 0)
    end
end)

credits:Button("无限跳跃", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/V5PQy3y0", true))()
end)

credits:Button("进入弹窗", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/boyscp/scriscriptsc/main/bbn.lua"))()
end)

credits:Button("点击传送", function()
    mouse = game.Players.LocalPlayer:GetMouse()
    tool = Instance.new("Tool")
    tool.RequiresHandle = false
    tool.Name = "点击传送的位置"
    tool.Activated:connect(function()
        local pos = mouse.Hit + Vector3.new(0, 2.5, 0)
        pos = CFrame.new(pos.X, pos.Y, pos.Z)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = pos
    end)
    tool.Parent = game.Players.LocalPlayer.Backpack
end)

credits:Button("键盘脚本", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/advxzivhsjjdhxhsidifvsh/mobkeyboard/main/main.txt", true))()
end)

credits:Button("踏空行走", function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Float'))()
end)

credits:Button("动态模糊", function()
    local camera = workspace.CurrentCamera
    local blurAmount = 10
    local blurAmplifier = 5
    local lastVector = camera.CFrame.LookVector
    local motionBlur = Instance.new("BlurEffect", camera)
    local runService = game:GetService("RunService")

    runService.Heartbeat:Connect(function()
        local magnitude = (camera.CFrame.LookVector - lastVector).magnitude
        motionBlur.Size = math.abs(magnitude)*blurAmount*blurAmplifier/2
        lastVector = camera.CFrame.LookVector
    end)
end)

credits:Button("自杀脚本", function()
    game.Players.LocalPlayer.Character.Humanoid.Health = 0
end)

credits:Button("指令脚本", function()
    loadstring(game:HttpGet(('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'), true))()
end)

credits:Button("高亮脚本", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/4LDKiJ5a"))()
end)

credits:Button("动作脚本", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/Zj4NnKs6"))()
end)

credits:Button("防止挂机", function()
    wait(2)
    local vu = game:GetService("VirtualUser")
    game:GetService("Players").LocalPlayer.Idled:connect(function()
        vu:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
        wait(1)
        vu:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
    end)
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "XK提示10秒",
        Text = "防挂机已开启",
        Duration = 10,
    })
end)

credits:Button("甩飞", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/zqyDSUWX"))()
end)

------------------------------------------------------------
--  范围
------------------------------------------------------------
local UITab4 = window:Tab("范围", '7733770689')
local creditshubb = UITab4:section("内容", true)

creditshubb:Button("范围10", function()
    _G.HeadSize = 10
    _G.Disabled = true
    game:GetService('RunService').RenderStepped:connect(function()
        if _G.Disabled then
            for i, v in next, game:GetService('Players'):GetPlayers() do
                if v.Name ~= game:GetService('Players').LocalPlayer.Name then
                    pcall(function()
                        v.Character.HumanoidRootPart.Size = Vector3.new(_G.HeadSize, _G.HeadSize, _G.HeadSize)
                        v.Character.HumanoidRootPart.Transparency = 0.7
                        v.Character.HumanoidRootPart.BrickColor = BrickColor.new("Really blue")
                        v.Character.HumanoidRootPart.Material = "Neon"
                        v.Character.HumanoidRootPart.CanCollide = false
                    end)
                end
            end
        end
    end)
end)

creditshubb:Button("范围50", function()
    _G.HeadSize = 50
    _G.Disabled = true
    game:GetService('RunService').RenderStepped:connect(function()
        if _G.Disabled then
            for i, v in next, game:GetService('Players'):GetPlayers() do
                if v.Name ~= game:GetService('Players').LocalPlayer.Name then
                    pcall(function()
                        v.Character.HumanoidRootPart.Size = Vector3.new(_G.HeadSize, _G.HeadSize, _G.HeadSize)
                        v.Character.HumanoidRootPart.Transparency = 0.7
                        v.Character.HumanoidRootPart.BrickColor = BrickColor.new("Really blue")
                        v.Character.HumanoidRootPart.Material = "Neon"
                        v.Character.HumanoidRootPart.CanCollide = false
                    end)
                end
            end
        end
    end)
end)

creditshubb:Button("范围100", function()
    _G.HeadSize = 100
    _G.Disabled = true
    game:GetService('RunService').RenderStepped:connect(function()
        if _G.Disabled then
            for i, v in next, game:GetService('Players'):GetPlayers() do
                if v.Name ~= game:GetService('Players').LocalPlayer.Name then
                    pcall(function()
                        v.Character.HumanoidRootPart.Size = Vector3.new(_G.HeadSize, _G.HeadSize, _G.HeadSize)
                        v.Character.HumanoidRootPart.Transparency = 0.7
                        v.Character.HumanoidRootPart.BrickColor = BrickColor.new("Really blue")
                        v.Character.HumanoidRootPart.Material = "Neon"
                        v.Character.HumanoidRootPart.CanCollide = false
                    end)
                end
            end
        end
    end)
end)

creditshubb:Button("范围200", function()
    _G.HeadSize = 200
    _G.Disabled = true
    game:GetService('RunService').RenderStepped:connect(function()
        if _G.Disabled then
            for i, v in next, game:GetService('Players'):GetPlayers() do
                if v.Name ~= game:GetService('Players').LocalPlayer.Name then
                    pcall(function()
                        v.Character.HumanoidRootPart.Size = Vector3.new(_G.HeadSize, _G.HeadSize, _G.HeadSize)
                        v.Character.HumanoidRootPart.Transparency = 0.7
                        v.Character.HumanoidRootPart.BrickColor = BrickColor.new("Really blue")
                        v.Character.HumanoidRootPart.Material = "Neon"
                        v.Character.HumanoidRootPart.CanCollide = false
                    end)
                end
            end
        end
    end)
end)

------------------------------------------------------------
--  旋转
------------------------------------------------------------
local creds = window:Tab("旋转", "7743873633")
local Player = creds:section("旋转", true)

Player:Button("旋转10", function()
    local speed = 10
    local plr = game:GetService("Players").LocalPlayer
    repeat task.wait() until plr.Character
    local humRoot = plr.Character:WaitForChild("HumanoidRootPart")
    plr.Character:WaitForChild("Humanoid").AutoRotate = false
    local velocity = Instance.new("AngularVelocity")
    velocity.Attachment0 = humRoot:WaitForChild("RootAttachment")
    velocity.MaxTorque = math.huge
    velocity.AngularVelocity = Vector3.new(0, speed, 0)
    velocity.Parent = humRoot
    velocity.Name = "Spinbot"
end)

Player:Button("旋转50", function()
    local speed = 50
    local plr = game:GetService("Players").LocalPlayer
    repeat task.wait() until plr.Character
    local humRoot = plr.Character:WaitForChild("HumanoidRootPart")
    plr.Character:WaitForChild("Humanoid").AutoRotate = false
    local velocity = Instance.new("AngularVelocity")
    velocity.Attachment0 = humRoot:WaitForChild("RootAttachment")
    velocity.MaxTorque = math.huge
    velocity.AngularVelocity = Vector3.new(0, speed, 0)
    velocity.Parent = humRoot
    velocity.Name = "Spinbot"
end)

Player:Button("旋转100", function()
    local speed = 100
    local plr = game:GetService("Players").LocalPlayer
    repeat task.wait() until plr.Character
    local humRoot = plr.Character:WaitForChild("HumanoidRootPart")
    plr.Character:WaitForChild("Humanoid").AutoRotate = false
    local velocity = Instance.new("AngularVelocity")
    velocity.Attachment0 = humRoot:WaitForChild("RootAttachment")
    velocity.MaxTorque = math.huge
    velocity.AngularVelocity = Vector3.new(0, speed, 0)
    velocity.Parent = humRoot
    velocity.Name = "Spinbot"
end)

Player:Button("旋转400", function()
    local speed = 400
    local plr = game:GetService("Players").LocalPlayer
    repeat task.wait() until plr.Character
    local humRoot = plr.Character:WaitForChild("HumanoidRootPart")
    plr.Character:WaitForChild("Humanoid").AutoRotate = false
    local velocity = Instance.new("AngularVelocity")
    velocity.Attachment0 = humRoot:WaitForChild("RootAttachment")
    velocity.MaxTorque = math.huge
    velocity.AngularVelocity = Vector3.new(0, speed, 0)
    velocity.Parent = humRoot
    velocity.Name = "Spinbot"
end)

------------------------------------------------------------
--  力量传奇
------------------------------------------------------------
local creds = window:Tab("力量传奇", "6035145364")
local credits = creds:section("力量传奇功能", true)

-- 自动重生
credits:Toggle("自动重生", "ATRE", false, function(ATRE)
    while ATRE do
        wait(0.1)
        game:GetService("ReplicatedStorage").rEvents.rebirthRemote:InvokeServer("rebirthRequest")
    end
end)

-- 自动举哑铃（可关闭）
local atylPart = nil
local atylRunning = false

credits:Toggle("自动举哑铃", "ATYL", false, function(ATYL)
    if ATYL then
        if atylRunning then return end
        atylRunning = true

        atylPart = Instance.new("Part")
        atylPart.Size = Vector3.new(500, 20, 530.1)
        atylPart.Position = Vector3.new(0, 100000, 133.15)
        atylPart.CanCollide = true
        atylPart.Anchored = true
        atylPart.Parent = workspace

        task.spawn(function()
            while atylRunning do
                task.wait()
                local char = game.Players.LocalPlayer.Character
                if char and char:FindFirstChild("HumanoidRootPart") then
                    char.HumanoidRootPart.CFrame = atylPart.CFrame + Vector3.new(0, 50, 0)

                    local bp = game.Players.LocalPlayer:FindFirstChild("Backpack")
                    if bp then
                        for _, v in pairs(bp:GetChildren()) do
                            if v.ClassName == "Tool" and v.Name == "Weight" then
                                v.Parent = char
                            end
                        end
                    end

                    pcall(function()
                        game.Players.LocalPlayer.muscleEvent:FireServer("rep")
                    end)
                end
            end
        end)
    else
        atylRunning = false

        task.spawn(function()
            task.wait(0.2)
            local char = game.Players.LocalPlayer.Character
            if char and char:FindFirstChild("HumanoidRootPart") then
                char.HumanoidRootPart.CFrame = CFrame.new(7, 5, 108)
            end
        end)

        if atylPart then
            atylPart:Destroy()
            atylPart = nil
        end
    end
end)

-- 传送
credits:Button("传送到出生点", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(7, 3, 108)
end)

credits:Button("传送到安全岛", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-39, 10, 1838)
end)

credits:Button("传送到幸运抽奖区域", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2606, -2, 5753)
end)

credits:Button("传送到肌肉之王健身房", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-8554, 22, -5642)
end)

credits:Button("传送到传说健身房", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(4676, 997, -3915)
end)

credits:Button("传送到永恒健身房", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-6686, 13, -1284)
end)

credits:Button("传送到神话健身房", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2177, 13, 1070)
end)

credits:Button("传送到冰霜健身房", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2543, 13, -410)
end)

credits:Button("传送到过载健身房", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-3063, 165, 4942)
end)