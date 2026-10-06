local CoreGui = game:GetService("StarterGui")
CoreGui:SetCore("SendNotification", {
    Title = "科创云端",
    Text = "正在加载",
    Duration = 5
})
print("Anti AFK")
local vu = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:connect(function()
    vu:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
    wait(1)
    vu:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
end)
local OrionLib = loadstring(game:HttpGet('https://raw.githubusercontent.com/nainshu/no/main/ori.lua'))()

local Window = OrionLib:MakeWindow({Name = "科创云端", HidePremium = false, SaveConfig = true, IntroText = "科创云端", ConfigFolder = "科创云端"})
local about = Window:MakeTab({
    Name = "脚本名称",
    Icon = "rbxassetid://104249998363078",
    PremiumOnly = false
})
about:AddParagraph("您的用户名:", " "..game.Players.LocalPlayer.Name.."")
about:AddParagraph("您的注入器:", " "..identifyexecutor().."")
about:AddParagraph("您当前服务器的ID", " "..game.GameId.."")

local Tab = Window:MakeTab({
  Name = "通用",
  Icon = "rbxassetid://104249998363078",
  PremiumOnly = false
  })
  
  Tab:AddButton({
	Name = "飞行［自制］",
	Callback = function()

loadstring(game:HttpGet("https://raw.githubusercontent.com/nainshu/no/main/fly.lua"))()

end
})

Tab:AddButton({
	Name = "翻跟斗",
	Callback = function()

loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-super-awesome-backflip-31143"))()

end
})

local Tab = Window:MakeTab({
    Name = "捉鬼敢死队:灭绝",
    Icon = "rbxassetid://104249998363078",
    PremiumOnly = false
})

local moneyFarmEnabled = false
local moneyFarmConnection = nil

Tab:AddToggle({
    Name = "刷钱",
    Default = false,
    Callback = function(value)
        moneyFarmEnabled = value
        if value then
            -- Start money farm
            moneyFarmConnection = game:GetService("RunService").Heartbeat:Connect(function()
                if moneyFarmEnabled then
                    local args = {[1] = "Cultist"}
                    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("UpdateSpiritGuide"):FireServer(unpack(args))
                end
            end)
        else
            -- Stop money farm
            if moneyFarmConnection then
                moneyFarmConnection:Disconnect()
                moneyFarmConnection = nil
            end
        end
    end
})

local Tab = Window:MakeTab({
    Name = "深层下降",
    Icon = "rbxassetid://104249998363078",
    PremiumOnly = false
})

Tab:AddButton({
    Name = "无限体力",
    Callback = function()
        local sprint = game:GetService("Players").LocalPlayer.Sprint
        local RunService = game:GetService("RunService")
        
        RunService.Heartbeat:Connect(function()
            sprint.Value = 7.5
        end)
    end
})

local Tab = Window:MakeTab({
    Name = "跑酷狂潮（小游戏）",
    Icon = "rbxassetid://104249998363078",
    PremiumOnly = false
})

local moneyFarmEnabledParkour = false
local moneyFarmConnectionParkour = nil

Tab:AddToggle({
    Name = "刷钱",
    Default = false,
    Callback = function(value)
        moneyFarmEnabledParkour = value
        if value then
            -- Start money farm
            moneyFarmConnectionParkour = game:GetService("RunService").Heartbeat:Connect(function()
                if moneyFarmEnabledParkour then
                    local Event = game:GetService("ReplicatedStorage").Remotes.DailyRewards.ClaimReward
                    Event:FireServer("Day1")
                end
            end)
        else
            -- Stop money farm
            if moneyFarmConnectionParkour then
                moneyFarmConnectionParkour:Disconnect()
                moneyFarmConnectionParkour = nil
            end
        end
    end
})

local Tab = Window:MakeTab({
  Name = "方块故事",
  Icon = "rbxassetid://104249998363078",
  PremiumOnly = false
  })
  
  Tab:AddButton({
	Name = "无敌金身（基本无敌）",
	Callback = function()

loadstring(game:HttpGet("https://rawscripts.net/raw/Block-Tales-Demo-3-God-Mode-22736"))()

end

})Tab:AddButton({
	Name = "英文脚本",
	Callback = function()

loadstring(game:HttpGet"https://raw.githubusercontent.com/TexRBLX/Roblox-stuff/refs/heads/main/block%20tales/Block-Tales-Auto-Guard.lua")()

end
})

Tab:AddButton({
	Name = "英文脚本",
	Callback = function()

loadstring(game:HttpGet("https://raw.githubusercontent.com/TexRBLX/Roblox-stuff/refs/heads/main/block%20tales/revamp.lua"))()

end
})

local Tab = Window:MakeTab({
  Name = "NOOB必须死",
  Icon = "rbxassetid://104249998363078",
  PremiumOnly = false
  })
  
  Tab:AddButton({
	Name = "英文脚本",
	Callback = function()

loadstring(game:HttpGet("https://raw.githubusercontent.com/TexRBLX/Roblox-stuff/refs/heads/main/noobsmustdie/updatedupdated.lua"))()

end
})

local Tab = Window:MakeTab({
    Name = "黑暗欺骗",
    Icon = "rbxassetid://104249998363078",
    PremiumOnly = false
})

-----------------------------
-- 通用ESP功能
-----------------------------
local function createESPLabel(part, color, text)
    if not part or not part.Parent then return nil end
    
    local billboard = Instance.new("BillboardGui")
    billboard.Size = UDim2.new(5, 0, 2, 0)
    billboard.Adornee = part
    billboard.AlwaysOnTop = true
    billboard.ExtentsOffset = Vector3.new(0, part.Size.Y + 2, 0)
    
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, 0, 1, 0)
    label.BackgroundTransparency = 0.7
    label.BackgroundColor3 = Color3.new(0, 0, 0)
    label.TextColor3 = color
    label.TextScaled = true
    label.TextStrokeTransparency = 0
    label.Font = Enum.Font.SourceSansBold
    label.Text = text
    
    label.Parent = billboard
    billboard.Parent = part
    
    return billboard
end

-----------------------------
-- 碎片ESP功能
-----------------------------
local shardEspEnabled = false
local shardEspLabels = {}
local shardEspConnection = nil

local SHARD_TYPES = {
    ["Shard"] = {Color = Color3.fromRGB(128, 0, 128), Text = "● 普通碎片"},
    ["OrangeShard"] = {Color = Color3.fromRGB(255, 165, 0), Text = "● 震撼碎片"},
    ["RedShard"] = {Color = Color3.fromRGB(255, 0, 0), Text = "● 透视怪物位置碎片"}
}

local function setupShardESP()
    for shard, label in pairs(shardEspLabels) do
        if label then label:Destroy() end
    end
    shardEspLabels = {}
    
    if not shardEspEnabled then return end
    
    for _, shard in ipairs(workspace.Shards:GetChildren()) do
        if shard:IsA("BasePart") and SHARD_TYPES[shard.Name] then
            shardEspLabels[shard] = createESPLabel(shard, SHARD_TYPES[shard.Name].Color, SHARD_TYPES[shard.Name].Text)
        end
    end
end

Tab:AddToggle({
    Name = "碎片ESP显示",
    Default = false,
    Callback = function(value)
        shardEspEnabled = value
        if value then
            setupShardESP()
            if shardEspConnection then shardEspConnection:Disconnect() end
            shardEspConnection = workspace.Shards.ChildAdded:Connect(function(newShard)
                if newShard:IsA("BasePart") and SHARD_TYPES[newShard.Name] then
                    shardEspLabels[newShard] = createESPLabel(newShard, SHARD_TYPES[newShard.Name].Color, SHARD_TYPES[newShard.Name].Text)
                end
            end)
        else
            for shard, label in pairs(shardEspLabels) do
                if label then label:Destroy() end
            end
            shardEspLabels = {}
            if shardEspConnection then
                shardEspConnection:Disconnect()
                shardEspConnection = nil
            end
        end
    end
})

-----------------------------
-- 超高速自动拾取+传送功能
-----------------------------
local autoCollectEnabled = false
local collectLoop = nil
local lastRespawnTime = 0
local lastCheckTime = 0
local isCollecting = true

-- 参数设置
local respawnInterval = 8  -- 复活间隔(秒)
local teleportSpeed = 0.001  -- 传送速度(秒)
local checkInterval = 0.3  -- 检查间隔(秒)

-- 传送点坐标
local SAFE_SPOT_1 = Vector3.new(-27.16, 21.07, -44.91)
local SAFE_SPOT_2 = Vector3.new(36.47, 21.40, 61.43)

-- 检查剩余碎片
local function hasShardsLeft()
    for _, shard in ipairs(workspace.Shards:GetChildren()) do
        if shard:IsA("BasePart") and SHARD_TYPES[shard.Name] then
            return true
        end
    end
    return false
end

-- 安全传送
local function safeTeleport(position)
    local player = game.Players.LocalPlayer
    if player and player.Character then
        local hrp = player.Character:FindFirstChild("HumanoidRootPart")
        if hrp then
            hrp.CFrame = CFrame.new(position)
        end
    end
end

-- 核心拾取逻辑
local function ultraCollect()
    if not autoCollectEnabled then return end
    
    local player = game.Players.LocalPlayer
    if not player or not player.Character then return end
    
    local hrp = player.Character:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    
    -- 复活检查
    if os.time() - lastRespawnTime >= respawnInterval then
        game:GetService("ReplicatedStorage").Bridges.RequestRespawn:FireServer()
        lastRespawnTime = os.time()
        return
    end
    
    -- 碎片检查
    if os.clock() - lastCheckTime > checkInterval then
        lastCheckTime = os.clock()
        if not hasShardsLeft() and isCollecting then
            isCollecting = false
            safeTeleport(SAFE_SPOT_1)
            wait(10)
            safeTeleport(SAFE_SPOT_2)
            return
        elseif hasShardsLeft() and not isCollecting then
            isCollecting = true
        end
    end
    
    if not isCollecting then return end
    
    -- 超高速拾取
    local nearestShard, minDist = nil, math.huge
    for _, shard in ipairs(workspace.Shards:GetChildren()) do
        if shard:IsA("BasePart") and SHARD_TYPES[shard.Name] then
            local dist = (hrp.Position - shard.Position).Magnitude
            if dist < minDist then
                minDist = dist
                nearestShard = shard
            end
        end
    end
    
    if nearestShard then
        hrp.CFrame = CFrame.new(nearestShard.Position + Vector3.new(0, 2, 0))
        wait(teleportSpeed)
    end
end

Tab:AddToggle({
    Name = "超高速自动拾取+传送（传送到雕像拿完水晶就进电梯）",
    Default = false,
    Callback = function(value)
        autoCollectEnabled = value
        if value then
            isCollecting = true
            lastRespawnTime = os.time()
            lastCheckTime = os.clock()
            
            if not collectLoop then
                collectLoop = game:GetService("RunService").Heartbeat:Connect(ultraCollect)
            end
        else
            if collectLoop then
                collectLoop:Disconnect()
                collectLoop = nil
            end
            isCollecting = false
        end
    end
})

Tab:AddButton({
	Name = "月星的黑暗欺骗（更暴力）",
	Callback = function()

loadstring(game:HttpGet("https://raw.githubusercontent.com/nainshu/no/main/Hunted.txt"))()

end
})

Tab:AddButton({
	Name = "du8的自动收集（更快速）",
	Callback = function()

loadstring(game:HttpGet("https://raw.githubusercontent.com/9kn-1/Dark/main/Auto.lua"))()

end
})

local Tab = Window:MakeTab({
  Name = "摊位世界",
  Icon = "rbxassetid://104249998363078",
  PremiumOnly = false
  })
  
  Tab:AddButton({
	Name = "宿摊[自动开启宝箱]",
	Callback = function()

loadstring(game:HttpGet("https://raw.githubusercontent.com/AZYsGithub/chillz-workshop/main/Arceus%20Aimbot.lua"))()

end
})

local Tab = Window:MakeTab({
  Name = "死亡之死",
  Icon = "rbxassetid://104249998363078",
  PremiumOnly = false
  })
  
  Tab:AddButton({
	Name = "老外脚本（由我修复汉化）",
	Callback = function()

loadstring(game:HttpGet("https://raw.githubusercontent.com/nainshu/no/main/laowaiDOORS.lua"))()

end
})

local Tab = Window:MakeTab({
  Name = "终极战场",
  Icon = "rbxassetid://104249998363078",
  PremiumOnly = false
  })
  
  Tab:AddButton({
	Name = "HTT终极战场",
	Callback = function()

loadstring(game:HttpGet("https://raw.githubusercontent.com/DevSloPo/nil/refs/heads/main/%E7%BB%88%E6%9E%81%E6%88%98%E5%9C%BA%E4%B8%A8%E6%B0%B8%E4%B9%85%E5%85%8D%E8%B4%B9"))()

end
})

local Tab = Window:MakeTab({
    Name = "种植花园",
    Icon = "rbxassetid://104249998363078",
    PremiumOnly = false
})

local autoSummerEnabled = false
local summerConnection = nil

Tab:AddToggle({
    Name = "自动放夏日",
    Default = false,
    Callback = function(value)
        autoSummerEnabled = value
        if value then
            -- Start auto summer harvest
            summerConnection = game:GetService("RunService").Heartbeat:Connect(function()
                if autoSummerEnabled then
                    game:GetService("ReplicatedStorage").GameEvents.SummerHarvestRemoteEvent:FireServer("SubmitAllPlants")
                end
            end)
        else
            -- Stop auto summer harvest
            if summerConnection then
                summerConnection:Disconnect()
                summerConnection = nil
            end
        end
    end
})

-- 在你的OrionLib菜单中添加这个标签页
local MiningTab = Window:MakeTab({
    Name = "dig",
    Icon = "rbxassetid://104249998363078", -- 可以换成矿镐图标ID
    PremiumOnly = false
})

-- 共享变量
local autoHitEnabled = false
local autoSellEnabled = false
local miningConnection = nil
local sellConnection = nil
local lastSoldTime = 0

-- 核心挖矿功能
local function autoStrongHit()
    if not autoHitEnabled then return end
    
    local PlayerGui = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
    local digUI = PlayerGui:FindFirstChild("Dig")
    
    local safezone = digUI:FindFirstChild("Safezone")
    local holder = safezone and safezone:FindFirstChild("Holder")
    local playerBar = holder and holder:FindFirstChild("PlayerBar")
    local areaStrong = holder and holder:FindFirstChild("Area_Strong")
    
    if not playerBar or not areaStrong then return end
    
    -- 只在强力区域可见时工作
    if areaStrong.Visible and areaStrong.AbsoluteSize.X >= 2 then
        local playerPos = playerBar.Position.X.Scale
        local strongLeft = areaStrong.Position.X.Scale
        local strongRight = strongLeft + areaStrong.Size.X.Scale
        
        -- 当玩家位于强力区域时自动点击
        if playerPos >= strongLeft and playerPos <= strongRight then
            local VIM = game:GetService("VirtualInputManager")
            VIM:SendKeyEvent(true, Enum.KeyCode.Space, false, game)
            VIM:SendKeyEvent(false, Enum.KeyCode.Space, false, game)
        end
    end
end

-- 自动售卖功能
local function autoSellItems()
    if not autoSellEnabled then return end
    
    local currentTime = os.time()
    if currentTime - lastSoldTime >= 50 then -- 50秒检测一次
        local Event = game:GetService("ReplicatedStorage").DialogueRemotes.SellAllItems
        local success, err = pcall(function()
            Event:FireServer(workspace.World.NPCs.Rocky)
        end)
        
        if success then
            OrionLib:MakeNotification({
                Name = "自动售卖",
                Content = "物品已成功售卖",
                Image = "rbxassetid://104249998363078",
                Time = 3
            })
            lastSoldTime = currentTime
        else
            OrionLib:MakeNotification({
                Name = "错误",
                Content = "售卖失败: "..tostring(err),
                Image = "rbxassetid://104249998363078",
                Time = 5
            })
        end
    end
end

-- 添加挖矿开关控件
MiningTab:AddToggle({
    Name = "自动挖掘",
    Default = false,
    Callback = function(value)
        autoHitEnabled = value
        
        if value then
            -- 启用功能
            if not miningConnection then
                miningConnection = game:GetService("RunService").Heartbeat:Connect(autoStrongHit)
            end
            OrionLib:MakeNotification({
                Name = "挖矿助手",
                Content = "自动挖矿已启用",
                Image = "rbxassetid://104249998363078",
                Time = 3
            })
        else
            -- 禁用功能
            if miningConnection then
                miningConnection:Disconnect()
                miningConnection = nil
            end
            OrionLib:MakeNotification({
                Name = "挖矿助手",
                Content = "自动挖矿已禁用",
                Image = "rbxassetid://104249998363078",
                Time = 3
            })
        end
    end
})

-- 添加自动售卖开关控件
MiningTab:AddToggle({
    Name = "自动售卖(50秒一次)",
    Default = false,
    Callback = function(value)
        autoSellEnabled = value
        
        if value then
            -- 启用功能
            if not sellConnection then
                sellConnection = game:GetService("RunService").Heartbeat:Connect(autoSellItems)
                lastSoldTime = os.time() -- 重置计时器
            end
            OrionLib:MakeNotification({
                Name = "自动售卖",
                Content = "已启用自动售卖功能，每50秒执行一次",
                Image = "rbxassetid://104249998363078",
                Time = 5
            })
        else
            -- 禁用功能
            if sellConnection then
                sellConnection:Disconnect()
                sellConnection = nil
            end
            OrionLib:MakeNotification({
                Name = "自动售卖",
                Content = "自动售卖功能已禁用",
                Image = "rbxassetid://104249998363078",
                Time = 3
            })
        end
    end
})

-- 添加使用说明
MiningTab:AddParagraph("使用说明", [[
1. 自动挖矿: 自动在完美区域点击
2. 自动售卖: 每50秒自动售卖物品给Rocky
]])