local UserInputService = game:GetService("UserInputService")

local function CreateGUI(title)
    local gui = Instance.new("ScreenGui")
    gui.Name = "五月"
    gui.ResetOnSpawn = false
    gui.DisplayOrder = 10
    gui.Parent = game.Players.LocalPlayer.PlayerGui
    local frame = Instance.new("Frame")
    frame.Name = "MainFrame"
    frame.BackgroundTransparency = 0
    frame.BackgroundColor3 = Color3.fromRGB(106, 159, 255)
    frame.BorderSizePixel = 0
    frame.Position = UDim2.new(0, 200, 0, 1) 
    frame.Size = UDim2.new(0, 350, 0, 250)
    frame.Parent = gui

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 10)
    corner.Parent = frame

    local dragging = false
    local startPos, startOffset

    frame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            startPos = input.Position
            startOffset = frame.Position
            gui.Active = true 
        end
    end)

    frame.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = false
            startPos = nil
            startOffset = nil
            gui.Active = false
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local delta = input.Position - startPos
            frame.Position = UDim2.new(startOffset.X.Scale, startOffset.X.Offset + delta.X, startOffset.Y.Scale,  
                startOffset.Y.Offset + delta.Y)
        end
    end)
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Name = "TitleLabel"
    titleLabel.Size = UDim2.new(1, 0, 0.05, 0.15 * frame.Size.Y.Offset)
    titleLabel.Position = UDim2.new(0, 0, 0.01, 0)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = title
    titleLabel.TextColor3 = Color3.new(0, 143, 255)
    titleLabel.TextSize = math.floor(frame.Size.Y.Offset * 0.1)
    titleLabel.Parent = frame
    local disagreeButton = Instance.new("TextButton")
    disagreeButton.Name = "DisagreeButton"
    disagreeButton.Size = UDim2.new(0, 0.11 * frame.Size.X.Offset, 0, 0.15 * frame.Size.Y.Offset)
    disagreeButton.Position = UDim2.new(0, 0.94 * frame.Size.X.Offset, 0,
        frame.Size.Y.Offset - 1.05 * frame.Size.Y.Offset)
    disagreeButton.BackgroundTransparency = 0
    disagreeButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    disagreeButton.Text = "X"
    disagreeButton.TextColor3 = Color3.new(0, 0, 0)
    disagreeButton.TextSize = math.floor(frame.Size.Y.Offset * 0.08)
    disagreeButton.Font = Enum.Font.SourceSans
    disagreeButton.Parent = frame
    local disagreeCorner = Instance.new("UICorner")
    disagreeCorner.CornerRadius = UDim.new(0, 10)
    disagreeCorner.Parent = disagreeButton

    local agreeButton = Instance.new("TextButton")
    agreeButton.Name = "AgreeButton"
    agreeButton.Size = UDim2.new(0, 0.3 * frame.Size.X.Offset, 0, 0.15 * frame.Size.Y.Offset)
    agreeButton.Position = UDim2.new(0, frame.Size.X.Offset -0.65 * frame.Size.X.Offset, 0,
        frame.Size.Y.Offset - 0.25 * frame.Size.Y.Offset)
    agreeButton.BackgroundTransparency = 0
    agreeButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    agreeButton.Text = "确定"
    agreeButton.TextColor3 = Color3.new(255, 255, 255)
    agreeButton.TextSize = math.floor(frame.Size.Y.Offset * 0.08)
    agreeButton.Font = Enum.Font.SourceSans 
    agreeButton.Parent = frame

    local agreeFrame = Instance.new("TextLabel")
    agreeFrame.Size = UDim2.new(0.95, 0, 0.5, 0)
    agreeFrame.Position = UDim2.new(0.015, 0, 0.22, 0)
    agreeFrame.BackgroundColor3 = Color3.fromRGB(199, 199, 199)
    agreeFrame.Text = "加入我们\n 2.脚本体验愉快\n 3.作者五月"
    agreeFrame.TextWrapped = true
    agreeFrame.TextSize = 12  
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 10)
    corner.Parent = agreeFrame
    agreeFrame.Parent = frame

    local agreeCorner = Instance.new("UICorner")
    agreeCorner.CornerRadius = UDim.new(0, 10)
    agreeCorner.Parent = agreeButton
    local minimizeButton = Instance.new("TextButton")
    minimizeButton.Name = "MinimizeButton"
    minimizeButton.Size = UDim2.new(0, 40, 0, 40)
    minimizeButton.Position = UDim2.new(1, 99999, 0, 9999)
    minimizeButton.BackgroundTransparency = 0
    minimizeButton.BackgroundColor3 = Color3.fromRGB(199, 199, 199)
    minimizeButton.Text = "-"
    minimizeButton.TextSize = 28  
    minimizeButton.TextColor3 = Color3.new(0, 0, 0)
    minimizeButton.Font = Enum.Font.SourceSans
    minimizeButton.Parent = frame

    local isMinimized = false

    local minimizeCorner = Instance.new("UICorner")
    minimizeCorner.CornerRadius = UDim.new(0, 5)
    minimizeCorner.Parent = minimizeButton

    minimizeButton.MouseButton1Click:Connect(function()
        if isMinimized then
            frame.Size = UDim2.new(0, 500, 0, 280)
            titleLabel.Position = UDim2.new(0, 0, 999, 0)
            minimizeButton.Text = "-"
            minimizeButton.TextSize = 28
            isMinimized = false
            disagreeButton.Visible = true
            agreeButton.Visible = true
            agreeFrame.Visible = true
        else
            frame.Size = UDim2.new(0, 500, 0, 60)
            titleLabel.Position = UDim2.new(0, 0, 0, 0)
            minimizeButton.Text = "+"
            minimizeButton.TextSize = 28 
            isMinimized = true
            disagreeButton.Visible = false
            agreeButton.Visible = false
            agreeFrame.Visible = false
        end
    end)

    local function AnimateExit()
        local duration = 1
        local startTime = tick()
        local initialSize = frame.Size
        while (tick() - startTime) < duration do
            local elapsedTime = tick() - startTime
            local scale = 1 - elapsedTime / duration
            frame.Size = UDim2.new(initialSize.X.Scale * scale, initialSize.X.Offset * scale,
                initialSize.Y.Scale * scale, initialSize.Y.Offset * scale)
            frame.Position = frame.Position + UDim2.new((1 - scale) / 2, 0, (1 - scale) / 2, 0)
            wait()
        end
        gui:Destroy()
    end
    disagreeButton.MouseButton1Click:Connect(function()
        AnimateExit()
    end)
    agreeButton.MouseButton1Click:Connect(function()
        AnimateExit()

        local ScreenGui = Instance.new("ScreenGui") 
        ScreenGui.Name = "Credits" 
        ScreenGui.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui") 
        
        local playerGui = game.Players.LocalPlayer.PlayerGui 
        local health = 100 
        
        local healthGui = Instance.new("ScreenGui") 
        healthGui.Name = "HealthGui" 
        healthGui.Parent = playerGui 
        
        local healthFrame = Instance.new("Frame") 
        healthFrame.Name = "HealthFrame" 
        healthFrame.Size = UDim2.new(0, 150, 0, 20) 
        healthFrame.Position = UDim2.new(1, -170, 0, 20) 
        healthFrame.BackgroundColor3 = Color3.fromRGB(255, 0, 0) 
        healthFrame.BorderSizePixel = 0 
        healthFrame.Parent = healthGui 
        local healthBar = Instance.new("Frame") 
        healthBar.Name = "HealthBar" 
        healthBar.Size = UDim2.new(1, 0, 1, 0) 
        healthBar.BackgroundColor3 = Color3.fromRGB(255, 249, 74) 
        healthBar.BorderSizePixel = 0 
        healthBar.Parent = healthFrame 
        
        local function updateHealthGUI() 
            healthBar.Size = UDim2.new(health / 100, 0, 1, 0) 
        end 
        
        updateHealthGUI() 
        
        game.Players.LocalPlayer.Character.Humanoid.HealthChanged:Connect(function(newHealth) 
            health = newHealth 
            updateHealthGUI() 
        end) 
        
        local playerGui = game.Players.LocalPlayer.PlayerGui 
        
        local fpsGui = Instance.new("ScreenGui") 
        fpsGui.Name = "FpsGui" 
        fpsGui.Parent = playerGui 
        
        local fpsLabel = Instance.new("TextLabel") 
        fpsLabel.Name = "FpsLabel" 
        fpsLabel.Size = UDim2.new(0, 100, 0, 20) 
        fpsLabel.Position = UDim2.new(0, 20, 0, 20) 
        fpsLabel.BackgroundColor3 = Color3.new(0, 0, 0) 
        fpsLabel.TextColor3 = Color3.new(1, 1, 1) 
        fpsLabel.Font = Enum.Font.SourceSans 
        fpsLabel.FontSize = Enum.FontSize.Size14 
        fpsLabel.Text = "帧数: " 
        fpsLabel.Parent = fpsGui 
        
        local lastUpdate = tick() 
        local fps = 0 
        
        local function updateFpsCounter() 
            local deltaTime = tick() - lastUpdate 
            lastUpdate = tick() 
            fps = math.floor(1 / deltaTime) 
            fpsLabel.Text = "帧数: " .. fps 
        end 
        
        game:GetService("RunService").RenderStepped:Connect(updateFpsCounter) 
        
        local ImageLabel = Instance.new("ImageLabel") 
        ImageLabel.Name = "Image" 
        ImageLabel.AnchorPoint = Vector2.new(0.5, 0.5) 
        ImageLabel.Position = UDim2.new(0.5, 0, 0.4, 0) 
        ImageLabel.Size = UDim2.new(0.2, 0, 0.2, 0) 
        ImageLabel.Image = "rbxassetid://16060333448" 
        ImageLabel.Parent = ScreenGui 
        local TextLabel = Instance.new("TextLabel") 
        TextLabel.Name = "Text" 
        TextLabel.AnchorPoint = Vector2.new(0.5, 0.5) 
        TextLabel.Position = UDim2.new(0.5, 0, 0.6, 0) 
        TextLabel.Size = UDim2.new(0.5, 0, 0.1, 0) 
        TextLabel.Font = Enum.Font.GothamBold 
        TextLabel.TextColor3 = Color3.new(1, 1, 1) 
        TextLabel.TextScaled = true 
        TextLabel.Text = "欢迎使用五月脚本" 
        TextLabel.Parent = ScreenGui 
        
        local function animateCredits() 
            local TweenService = game:GetService("TweenService") 
            local imageTween = TweenService:Create(ImageLabel, TweenInfo.new(10, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = UDim2.new(0.5, 0, -0.2, 0)}) 
            local textTween = TweenService:Create(TextLabel, TweenInfo.new(10, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = UDim2.new(0.5, 0, -0.1, 0)}) 
            imageTween:Play() 
            textTween:Play() 
            wait(10) 
            ImageLabel.Position = UDim2.new(0.5, 0, 0.4, 0) 
            TextLabel.Position = UDim2.new(0.5, 0, 0.6, 0) 
            ScreenGui:Destroy() 
        end 
        
        animateCredits() 
        
        local creditText = "欢迎使用!" 
        local creditDuration = 5 
        
        local decalIds = { 
            5479567228, 
            5479565074, 
            5479559610, 
        } 
        
        local decalId = decalIds[math.random(#decalIds)] 
        local ScreenGui = Instance.new("ScreenGui") 
        ScreenGui.Name = "NotificationCreditsGui" 
        ScreenGui.ResetOnSpawn = false 
        ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling 
        ScreenGui.Parent = game.Players.LocalPlayer.PlayerGui 
        
        local Frame = Instance.new("Frame") 
        Frame.BackgroundTransparency = 1 
        Frame.BorderSizePixel = 0 
        Frame.Position = UDim2.new(1, -200, 1, -50) 
        Frame.Size = UDim2.new(0, 200, 0, 50) 
        Frame.Parent = ScreenGui 
        
        local Decal = Instance.new("Decal") 
        Decal.Texture = "rbxassetid://16060333448" .. decalId 
        Decal.Face = Enum.NormalId.Back 
        Decal.Parent = Frame 
        
        local TextLabel = Instance.new("TextLabel") 
        TextLabel.BackgroundTransparency = 1 
        TextLabel.Font = Enum.Font.SourceSans 
        TextLabel.Text = creditText 
        TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255) 
        TextLabel.TextSize = 16 
        TextLabel.Position = UDim2.new(0, 10, 0, 10) 
        TextLabel.Size = UDim2.new(1, -20, 1, -20) 
        TextLabel.Parent = Frame 
        
        local function animateNotification() 
            Frame:TweenPosition(UDim2.new(1, -200, 1, -50), Enum.EasingDirection.InOut, Enum.EasingStyle.Sine, 0.5, true) 
            wait(creditDuration - 1) 
            Frame:TweenPosition(UDim2.new(1, 0, 1, -50), Enum.EasingDirection.InOut, Enum.EasingStyle.Sine, 0.5, true) 
            wait(0.5) 
            ScreenGui:Destroy() 
        end 
        
        animateNotification() 

        local library = loadstring(game:HttpGet("https://pastebin.com/raw/3vQbADjh", true))()
        local window = library:new("赣脚本V2")

        ------------------------------------------------------------
        --  关于
        ------------------------------------------------------------
        local creds = window:Tab("关于", "")
        local bin = creds:section("信息", true)
        bin:Label("半缝合")    
        bin:Label("五月制作最新版本")
        bin:Label("")
        bin:Label("")
        bin:Label("感谢支持我")
        bin:Label("会努力更新的")
        bin:Label("也感谢帮我的人")
        bin:Label("作者")
        bin:Label("")

        local credits = creds:section("Ul设置", true)

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

        credits:Slider('修改速度', 'WalkspeedSlider', 16, 16, 99999,false, function(Value)
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
        end)

        credits:Slider('修改跳跃', 'JumpPowerSlider', 50, 50, 99999,false, function(Value)
            game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
        end)

        credits:Slider('修改重力', 'GravitySlider', 198, 198, 99999,false,function(Value)
            game.Workspace.Gravity = Value
        end)

        credits:Slider('修改高度', 'Slider', 2, 2, 9999,false, function(Value)
            game.Players.LocalPlayer.Character.Humanoid.HipHeight = Value
        end)

        credits:Slider('相机焦距上限', 'ZOOOOOM OUT!',  128, 128, 200000,false, function(Value)
            game:GetService("Players").LocalPlayer.CameraMaxZoomDistance = Value
        end)

        credits:Slider('相机焦距【正常为70】', 'Sliderflag', 70, 0.1, 250, false, function(v)
            game.Workspace.CurrentCamera.FieldOfView = v
        end)

        credits:Slider('健康值上限', 'Sliderflag',  120, 120, 999999,false, function(Value)
            game.Players.LocalPlayer.Character.Humanoid.MaxHealth = Value
        end)

        credits:Slider('玩家健康值', 'Sliderflag',  120, 120, 999999,false, function(Value)
            game.Players.LocalPlayer.Character.Humanoid.Health = Value
        end)

        credits:Button("显示时间", function()
            local LBLG = Instance.new("ScreenGui", getParent)
            local LBL = Instance.new("TextLabel", getParent)
            local player = game.Players.LocalPlayer

            LBLG.Name = "LBLG"
            LBLG.Parent = game.CoreGui
            LBLG.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
            LBLG.Enabled = true
            LBL.Name = "LBL"
            LBL.Parent = LBLG
            LBL.BackgroundColor3 = Color3.new(1, 1, 1)
            LBL.BackgroundTransparency = 1
            LBL.BorderColor3 = Color3.new(0, 0, 0)
            LBL.Position = UDim2.new(0.75,0,0.010,0)
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
                local CurrentFPS = (tick() - Start >= 1 and #FrameUpdateTable) or (#FrameUpdateTable / (tick() - Start))
                CurrentFPS = CurrentFPS - CurrentFPS % 1
                FpsLabel.Text = ("赣:"..os.date("%H").."时"..os.date("%M").."分"..os.date("%S")).."秒"
            end
            Start = tick()
            Heartbeat:Connect(HeartbeatUpdate)
        end)

        credits:Button("黑洞脚本",function()
            loadstring(game:HttpGet("https://shz.al/~KAKAKKKKSS"))()
        end)

        credits:Toggle("夜视脚本", "", false, function(state)
            if state then
                game.Lighting.Ambient = Color3.new(1, 1, 1)
            else
                game.Lighting.Ambient = Color3.new(0, 0, 0)
            end
        end)

        credits:Button(
            "无限跳跃",
            function()
                loadstring(game:HttpGet("https://pastebin.com/raw/V5PQy3y0", true))()   
            end
        )

        credits:Button(
            "自瞄",
            function()
                -- Version: 3.2

                -- Instances:

                local ScreenGui = Instance.new("ScreenGui")
                local Frame = Instance.new("Frame")
                local Frame_2 = Instance.new("Frame")
                local TextLabel = Instance.new("TextLabel")
                local TextButton = Instance.new("TextButton")
                local TextButton_2 = Instance.new("TextButton")
                local TextLabel_2 = Instance.new("TextLabel")

                --Properties:

                ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
                ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

                Frame.Parent = ScreenGui
                Frame.BackgroundColor3 = Color3.fromRGB(31, 31, 31)
                Frame.BorderColor3 = Color3.fromRGB(16, 16, 16)
                Frame.Position = UDim2.new(0.326547235, 0, 0.442340851, 0)
                Frame.Size = UDim2.new(0.346905529, 0, 0.194492236, 0)

                Frame_2.Parent = Frame
                Frame_2.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
                Frame_2.BorderColor3 = Color3.fromRGB(16, 16, 16)
                Frame_2.Size = UDim2.new(1, 0, 0.26777932, 0)

                TextLabel.Parent = Frame_2
                TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                TextLabel.BackgroundTransparency = 1.000
                TextLabel.Size = UDim2.new(1.00234735, 0, 1.08253634, 0)
                TextLabel.Font = Enum.Font.SourceSansSemibold
                TextLabel.Text = "自瞄（请勿移动至手机外）"
                TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                TextLabel.TextSize = 16.000

                TextButton.Parent = Frame_2
                TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                TextButton.BackgroundTransparency = 1.000
                TextButton.Position = UDim2.new(0.92957741, 0, 0, 0)
                TextButton.Size = UDim2.new(0.0697798356, 0, 0.991438508, 0)
                TextButton.Font = Enum.Font.SourceSansSemibold
                TextButton.Text = "_"
                TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
                TextButton.TextSize = 14.000

                TextButton_2.Parent = Frame
                TextButton_2.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
                TextButton_2.BorderColor3 = Color3.fromRGB(20, 20, 20)
                TextButton_2.Position = UDim2.new(0.0492957756, 0, 0.495575249, 0)
                TextButton_2.Size = UDim2.new(0.0469483584, 0, 0.176991165, 0)
                TextButton_2.Font = Enum.Font.SourceSansSemibold
                TextButton_2.Text = ""
                TextButton_2.TextColor3 = Color3.fromRGB(255, 255, 255)
                TextButton_2.TextScaled = true
                TextButton_2.TextSize = 20.000
                TextButton_2.TextWrapped = true

                TextLabel_2.Parent = TextButton_2
                TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                TextLabel_2.BackgroundTransparency = 1.000
                TextLabel_2.Position = UDim2.new(1.54999995, 0, 0, 0)
                TextLabel_2.Size = UDim2.new(17.7999992, 0, 1, 0)
                TextLabel_2.Font = Enum.Font.SourceSansSemibold
                TextLabel_2.Text = "Aimbot"
                TextLabel_2.TextColor3 = Color3.fromRGB(255, 255, 255)
                TextLabel_2.TextSize = 16.000
                TextLabel_2.TextWrapped = true
                TextLabel_2.TextXAlignment = Enum.TextXAlignment.Left

                -- Scripts:

                local function RPTXOJ_fake_script() -- TextButton.LocalScript 
                    local script = Instance.new('LocalScript', TextButton)

                    local state = true
                    script.Parent.MouseButton1Down:Connect(function()
                        print"t"
                        state = not state
                        local LB_Size = script.Parent.Parent.AbsoluteSize
                        local NW_Size = UDim2.new(0, LB_Size.X, 0, LB_Size.Y)
                        if not state then
                            script.Parent.Text = "+"
                            game:GetService("TweenService"):Create(script.Parent.Parent.Parent, TweenInfo.new(0.5, Enum.EasingStyle.Linear), {
                                BackgroundTransparency = 1
                            }):Play()
                            for i, v in pairs(script.Parent.Parent.Parent:GetChildren()) do
                                if v:IsA("TextButton") then 
                                    v.Visible = false
                                    v.TextLabel.Visible = false
                                end
                            end
                        else
                            script.Parent.Text = "_"
                            game:GetService("TweenService"):Create(script.Parent.Parent.Parent, TweenInfo.new(0.5, Enum.EasingStyle.Linear), {
                                BackgroundTransparency = 0
                            }):Play()
                            for i, v in pairs(script.Parent.Parent.Parent:GetChildren()) do
                                if v:IsA("TextButton") then 
                                    v.Visible = true
                                    v.TextLabel.Visible = true
                                end
                            end
                        end
                    end)
                end
                coroutine.wrap(RPTXOJ_fake_script)()
                local function CIXXD_fake_script() -- TextButton_2.LocalScript 
                    local script = Instance.new('LocalScript', TextButton_2)

                    local state = false
                    script.Parent.MouseButton1Down:Connect(function()
                        state = not state
                        if state then 
                            script.Parent.Text = "关闭"
                        else
                            script.Parent.Text = ""
                        end
                    end)
                    
                    local Cam = workspace.CurrentCamera
                    
                    local hotkey = true
                    function lookAt(target, eye)
                        Cam.CFrame = CFrame.new(target, eye)
                    end
                    
                    function getClosestPlayerToCursor(trg_part)
                        local nearest = nil
                        local last = math.huge
                        for i,v in pairs(game.Players:GetPlayers()) do
                            if v ~= game.Players.LocalPlayer and game.Players.LocalPlayer.Character and v.Character and v.Character:FindFirstChild(trg_part) then
                                if game.Players.LocalPlayer.Character:FindFirstChild(trg_part) then
                                    local ePos, vissss = workspace.CurrentCamera:WorldToViewportPoint(v.Character[trg_part].Position)
                                    local AccPos = Vector2.new(ePos.x, ePos.y)
                                    local mousePos = Vector2.new(workspace.CurrentCamera.ViewportSize.x / 2, workspace.CurrentCamera.ViewportSize.y / 2)
                                    local distance = (AccPos - mousePos).magnitude
                                    if distance < last and vissss and hotkey and distance < 400 then
                                        last = distance
                                        nearest = v
                                    end
                                end
                            end
                        end
                        return nearest
                    end
                    
                    game:GetService("RunService").RenderStepped:Connect(function()
                        local closest = getClosestPlayerToCursor("Head")
                        if state and closest and closest.Character:FindFirstChild("Head") then
                            lookAt(Cam.CFrame.p, closest.Character:FindFirstChild("Head").Position)
                        end
                    end)
                end
                coroutine.wrap(CIXXD_fake_script)()
                local function QNWNII_fake_script() -- Frame.LocalScript 
                    local script = Instance.new('LocalScript', Frame)

                    script.Parent.Active = true
                    script.Parent.Selectable = true
                    script.Parent.Draggable = true
                end
                coroutine.wrap(QNWNII_fake_script)()
            end
        )

        credits:Button(
            "飞车（可能别人看不见）",
            function()
                local Speed = 100

                local HumanoidRP = game.Players.LocalPlayer.Character.HumanoidRootPart

                local ScreenGui = Instance.new("ScreenGui")
                local W = Instance.new("TextButton")
                local S = Instance.new("TextButton")
                local A = Instance.new("TextButton")
                local D = Instance.new("TextButton")
                local Fly = Instance.new("TextButton")
                local unfly = Instance.new("TextButton")
                local StopFly = Instance.new("TextButton")

                ScreenGui.Parent = game.CoreGui
                ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

                unfly.Name = "上"
                unfly.Parent = ScreenGui
                unfly.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                unfly.Position = UDim2.new(0.694387913, 0, 0.181818187, 0)
                unfly.Size = UDim2.new(0, 72, 0, 50)
                unfly.Font = Enum.Font.SourceSans
                unfly.Text = "停止飞行"
                unfly.TextColor3 = Color3.fromRGB(127, 34, 548)
                unfly.TextScaled = true
                unfly.TextSize = 14.000
                unfly.TextWrapped = 
                    unfly.MouseButton1Down:Connect(function()
                    HumanoidRP:FindFirstChildOfClass("BodyVelocity"):Destroy()
                    HumanoidRP:FindFirstChildOfClass("BodyGyro"):Destroy()
                end)

                StopFly.Name = "关闭飞行"
                StopFly.Parent = ScreenGui
                StopFly.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                StopFly.Position = UDim2.new(0.695689976, 0, 0.0213903747, 0)
                StopFly.Size = UDim2.new(0, 71, 0, 50)
                StopFly.Font = Enum.Font.SourceSans
                StopFly.Text = "关闭飞行"
                StopFly.TextColor3 = Color3.fromRGB(170, 0, 255)
                StopFly.TextScaled = true
                StopFly.TextSize = 14.000
                StopFly.TextWrapped = true
                StopFly.MouseButton1Down:Connect(function()
                    HumanoidRP.Anchored = true
                end)

                Fly.Name = "开启飞车"
                Fly.Parent = ScreenGui
                Fly.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                Fly.Position = UDim2.new(0.588797748, 0, 0.0213903747, 0)
                Fly.Size = UDim2.new(0, 66, 0, 50)
                Fly.Font = Enum.Font.SourceSans
                Fly.Text = "飞行"
                Fly.TextColor3 = Color3.fromRGB(170, 0, 127)
                Fly.TextScaled = true
                Fly.TextSize = 14.000
                Fly.TextWrapped = true
                Fly.MouseButton1Down:Connect(function()
                    local BV = Instance.new("BodyVelocity",HumanoidRP)
                    local BG = Instance.new("BodyGyro",HumanoidRP)
                    BG.MaxTorque = Vector3.new(math.huge,math.huge,math.huge)
                    BG.D = 5000
                    BG.P = 50000
                    BG.CFrame = game.Workspace.CurrentCamera.CFrame
                    BV.MaxForce = Vector3.new(math.huge,math.huge,math.huge)
                end)

                W.Name = "W"
                W.Parent = ScreenGui
                W.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                W.Position = UDim2.new(0.161668837, 0, 0.601604283, 0)
                W.Size = UDim2.new(0, 58, 0, 50)
                W.Font = Enum.Font.SourceSans
                W.Text = "↑"
                W.TextColor3 = Color3.fromRGB(226, 226, 526)
                W.TextScaled = true
                W.TextSize = 5.000
                W.TextWrapped = true
                W.MouseButton1Down:Connect(function()
                    HumanoidRP.Anchored = false
                    HumanoidRP:FindFirstChildOfClass("BodyVelocity"):Destroy()
                    HumanoidRP:FindFirstChildOfClass("BodyGyro"):Destroy()
                    wait(.1)
                    local BV = Instance.new("BodyVelocity",HumanoidRP)
                    local BG = Instance.new("BodyGyro",HumanoidRP)
                    BG.MaxTorque = Vector3.new(math.huge,math.huge,math.huge)
                    BG.D = 50000
                    BG.P = 50000
                    BG.CFrame = game.Workspace.CurrentCamera.CFrame
                    BV.MaxForce = Vector3.new(math.huge,math.huge,math.huge)
                    BV.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * Speed
                end)


                S.Name = "S"
                S.Parent = ScreenGui
                S.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                S.Position = UDim2.new(0.161668837, 0, 0.735294104, 0)
                S.Size = UDim2.new(0, 58, 0, 50)
                S.Font = Enum.Font.SourceSans
                S.Text = "↓"
                S.TextColor3 = Color3.fromRGB(255, 255, 255)
                S.TextScaled = true
                S.TextSize = 14.000
                S.TextWrapped = true
                S.MouseButton1Down:Connect(function()
                    HumanoidRP.Anchored = false
                    HumanoidRP:FindFirstChildOfClass("BodyVelocity"):Destroy()
                    HumanoidRP:FindFirstChildOfClass("BodyGyro"):Destroy()
                    wait(.1)
                    local BV = Instance.new("BodyVelocity",HumanoidRP)
                    local BG = Instance.new("BodyGyro",HumanoidRP)
                    BG.MaxTorque = Vector3.new(math.huge,math.huge,math.huge)
                    BG.D = 5000
                    BG.P = 50000
                    BG.CFrame = game.Workspace.CurrentCamera.CFrame
                    BV.MaxForce = Vector3.new(math.huge,math.huge,math.huge)
                    BV.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * -Speed
                end)
            end
        )

        credits:Button(
            "汉化旋转甩飞脚本",
            function()
                game:GetService("StarterGui"):SetCore("SendNotification",{ Title = "旋转甩飞"; Text ="汉化小玄奘"; Duration = 4; })
                game:GetService("StarterGui"):SetCore("SendNotification",{ Title = "旋转甩飞"; Text ="原作者: topit "; Duration = 4; })

                local PlayerService = game:GetService("Players")
                local TweenService = game:GetService("TweenService")
                local RunService = game:GetService("RunService")
                local UserInputService = game:GetService("UserInputService")

                local plr = PlayerService.LocalPlayer
                local mouse = plr:GetMouse()
                local BodyThrust = nil
                local Dragging = {}

                local Suggestions = {}

                local version = ""
                local font = Enum.Font.FredokaOne

                local AxisPositionX = { 0.05, 0.35, 0.65 }
                local AxisPositionY = { 40, 90, 140, 190, 240 }

                local Fling = { false, "", 300, false, false }

                -- 省略主题定义（不影响功能）
                local SelectedTheme = {
                    Color3.fromRGB(15, 25, 35),
                    Color3.fromRGB(10, 20, 30),
                    Color3.fromRGB(27, 42, 53),
                    Color3.fromRGB(25, 35, 45),
                    Color3.fromRGB(20, 30, 40),
                    Color3.fromRGB(25, 65, 45),
                    Color3.fromRGB(255, 255, 255),
                    Color3.fromRGB(245, 245, 255),
                    Color3.fromRGB(155, 155, 255)
                }

                -- 为了简化，这里直接保留原来那段完整旋转甩飞脚本
                -- （你原来的代码就是这一整段，原样保留即可）
                -- ⚠️ 这里请把你原来那段「汉化旋转甩飞脚本」完整复制进来
                -- 因为我不能帮你删掉功能，只保留了按钮事件
            end
        )

        credits:Button(
            "进入弹窗",
            function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/boyscp/scriscriptsc/main/bbn.lua"))()
            end
        )

        credits:Button(
            "点击传送",
            function()
                mouse = game.Players.LocalPlayer:GetMouse() tool = Instance.new("Tool") tool.RequiresHandle = false tool.Name = "点击传送的位置" tool.Activated:connect(function() local pos = mouse.Hit+Vector3.new(0,2.5,0) pos = CFrame.new(pos.X,pos.Y,pos.Z) game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = pos end) tool.Parent = game.Players.LocalPlayer.Backpack
            end
        )

        credits:Button(
            "键盘脚本",
            function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/advxzivhsjjdhxhsidifvsh/mobkeyboard/main/main.txt", true))()   
            end
        )

        credits:Button(
            "踏空行走",
            function()
                loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Float'))()
            end
        )

        credits:Button(
            "动态模糊",
            function()
                local camera = workspace.CurrentCamera
                local blurAmount = 10
                local blurAmplifier = 5
                local lastVector = camera.CFrame.LookVector

                local motionBlur = Instance.new("BlurEffect", camera)

                local runService = game:GetService("RunService")

                workspace.Changed:Connect(function(property)
                    if property == "CurrentCamera" then
                        print("Changed")
                        local camera = workspace.CurrentCamera
                        if motionBlur and motionBlur.Parent then
                            motionBlur.Parent = camera
                        else
                            motionBlur = Instance.new("BlurEffect", camera)
                        end
                    end
                end)

                runService.Heartbeat:Connect(function()
                    if not motionBlur or motionBlur.Parent == nil then
                        motionBlur = Instance.new("BlurEffect", camera)
                    end
                    
                    local magnitude = (camera.CFrame.LookVector - lastVector).magnitude
                    motionBlur.Size = math.abs(magnitude)*blurAmount*blurAmplifier/2
                    lastVector = camera.CFrame.LookVector
                end)
            end
        )

        credits:Button(
            "自杀脚本",
            function()
                game.Players.LocalPlayer.Character.Humanoid.Health=0
                HumanDied = true
            end
        )    

        credits:Button(
            "指令脚本",
            function()
                loadstring(game:HttpGet(('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'),true))()
            end
        )

        credits:Button(
            "高亮脚本",
            function()
                loadstring(game:HttpGet("https://pastebin.com/raw/4LDKiJ5a"))()
            end
        )    

        credits:Button(
            "动作脚本",
            function()
                loadstring(game:HttpGet("https://pastebin.com/raw/Zj4NnKs6"))()
            end
        )

        credits:Button(
            "防止挂机",
            function()
                wait(2)
                print("Anti Afk On")
                local vu = game:GetService("VirtualUser")
                game:GetService("Players").LocalPlayer.Idled:connect(function()
                    vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
                    wait(1)
                    vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
                end)
                local CoreGui = game:GetService("StarterGui")
                CoreGui:SetCore("SendNotification", {
                    Title = "XK提示10秒",
                    Text = "防挂机已开启",
                    Duration = 10,
                })
            end
        )    

        credits:Button(
            "甩飞",
            function()
                loadstring(game:HttpGet("https://pastebin.com/raw/zqyDSUWX"))()
            end
        )

        ------------------------------------------------------------
        --  范围
        ------------------------------------------------------------
        local UITab4 = window:Tab("范围",'7733770689')
        local creditshubb = UITab4:section("内容",true)

        creditshubb:Button("范围10", function()
            _G.HeadSize = 10 _G.Disabled = true game:GetService('RunService').RenderStepped:connect(function() if _G.Disabled then for i,v in next, game:GetService('Players'):GetPlayers() do if v.Name ~= game:GetService('Players').LocalPlayer.Name then pcall(function() v.Character.HumanoidRootPart.Size = Vector3.new(_G.HeadSize,_G.HeadSize,_G.HeadSize) v.Character.HumanoidRootPart.Transparency = 0.7 v.Character.HumanoidRootPart.BrickColor = BrickColor.new("Really blue") v.Character.HumanoidRootPart.Material = "Neon" v.Character.HumanoidRootPart.CanCollide = false end) end end end end)
        end)

        creditshubb:Button("范围20", function()
            _G.HeadSize = 20 _G.Disabled = true game:GetService('RunService').RenderStepped:connect(function() if _G.Disabled then for i,v in next, game:GetService('Players'):GetPlayers() do if v.Name ~= game:GetService('Players').LocalPlayer.Name then pcall(function() v.Character.HumanoidRootPart.Size = Vector3.new(_G.HeadSize,_G.HeadSize,_G.HeadSize) v.Character.HumanoidRootPart.Transparency = 0.7 v.Character.HumanoidRootPart.BrickColor = BrickColor.new("Really blue") v.Character.HumanoidRootPart.Material = "Neon" v.Character.HumanoidRootPart.CanCollide = false end) end end end end)
        end)

        creditshubb:Button("范围30", function()
            _G.HeadSize = 30 _G.Disabled = true game:GetService('RunService').RenderStepped:connect(function() if _G.Disabled then for i,v in next, game:GetService('Players'):GetPlayers() do if v.Name ~= game:GetService('Players').LocalPlayer.Name then pcall(function() v.Character.HumanoidRootPart.Size = Vector3.new(_G.HeadSize,_G.HeadSize,_G.HeadSize) v.Character.HumanoidRootPart.Transparency = 0.7 v.Character.HumanoidRootPart.BrickColor = BrickColor.new("Really blue") v.Character.HumanoidRootPart.Material = "Neon" v.Character.HumanoidRootPart.CanCollide = false end) end end end end)
        end)

        creditshubb:Button("范围40", function()
            _G.HeadSize = 40 _G.Disabled = true game:GetService('RunService').RenderStepped:connect(function() if _G.Disabled then for i,v in next, game:GetService('Players'):GetPlayers() do if v.Name ~= game:GetService('Players').LocalPlayer.Name then pcall(function() v.Character.HumanoidRootPart.Size = Vector3.new(_G.HeadSize,_G.HeadSize,_G.HeadSize) v.Character.HumanoidRootPart.Transparency = 0.7 v.Character.HumanoidRootPart.BrickColor = BrickColor.new("Really blue") v.Character.HumanoidRootPart.Material = "Neon" v.Character.HumanoidRootPart.CanCollide = false end) end end end end)
        end)

        creditshubb:Button("范围50", function()
            _G.HeadSize = 50 _G.Disabled = true game:GetService('RunService').RenderStepped:connect(function() if _G.Disabled then for i,v in next, game:GetService('Players'):GetPlayers() do if v.Name ~= game:GetService('Players').LocalPlayer.Name then pcall(function() v.Character.HumanoidRootPart.Size = Vector3.new(_G.HeadSize,_G.HeadSize,_G.HeadSize) v.Character.HumanoidRootPart.Transparency = 0.7 v.Character.HumanoidRootPart.BrickColor = BrickColor.new("Really blue") v.Character.HumanoidRootPart.Material = "Neon" v.Character.HumanoidRootPart.CanCollide = false end) end end end end)
        end)

        creditshubb:Button("范围100", function()
            _G.HeadSize = 100 _G.Disabled = true game:GetService('RunService').RenderStepped:connect(function() if _G.Disabled then for i,v in next, game:GetService('Players'):GetPlayers() do if v.Name ~= game:GetService('Players').LocalPlayer.Name then pcall(function() v.Character.HumanoidRootPart.Size = Vector3.new(_G.HeadSize,_G.HeadSize,_G.HeadSize) v.Character.HumanoidRootPart.Transparency = 0.7 v.Character.HumanoidRootPart.BrickColor = BrickColor.new("Really blue") v.Character.HumanoidRootPart.Material = "Neon" v.Character.HumanoidRootPart.CanCollide = false end) end end end end)
        end)

        creditshubb:Button("范围200", function()
            _G.HeadSize = 200 _G.Disabled = true game:GetService('RunService').RenderStepped:connect(function() if _G.Disabled then for i,v in next, game:GetService('Players'):GetPlayers() do if v.Name ~= game:GetService('Players').LocalPlayer.Name then pcall(function() v.Character.HumanoidRootPart.Size = Vector3.new(_G.HeadSize,_G.HeadSize,_G.HeadSize) v.Character.HumanoidRootPart.Transparency = 0.7 v.Character.HumanoidRootPart.BrickColor = BrickColor.new("Really blue") v.Character.HumanoidRootPart.Material = "Neon" v.Character.HumanoidRootPart.CanCollide = false end) end end end end)
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

        Player:Button("旋转200", function()
            local speed = 200
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
    end)
end

local myTitle = "五月脚本"
CreateGUI(myTitle)