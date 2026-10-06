local NotificationHolder = loadstring(game:HttpGet("https://raw.githubusercontent.com/Ghost-Gui-888/UI/main/inform/Module.Lua"))()
local Notification = loadstring(game:HttpGet("https://raw.githubusercontent.com/Ghost-Gui-888/UI/main/inform/Client.Lua"))()

 Notification:Notify( 
     {Title = "GHOST TEAM", Description = "欢迎使用霖磐脚本"}, 
     {OutlineColor = Color3.fromRGB(80, 80, 80),Time = 5, Type = "image"}, 
     {Image = "http://www.roblox.com/asset/?id=", ImageColor = Color3.fromRGB(225, 225, 225)} 
 ) 
 wait(2) 

local CoreGui = game:GetService("StarterGui")CoreGui:SetCore("SendNotification", {    Title = "👑老郭🇨🇳",    Text = "耐心等待（反挂机已开启）",    Duration = 5, })print("反挂机开启")		local vu = game:GetService("VirtualUser")		game:GetService("Players").LocalPlayer.Idled:connect(function()		   vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)		   wait(1)		   vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)		end)
local OrionLib = loadstring(game:HttpGet(('https://pastebin.com/raw/FUEx0f3G')))()
local Window = OrionLib:MakeWindow({Name = "霖磐脚本", HidePremium = false, SaveConfig = false, IntroText = "欢迎使用", ConfigFolder = "欢迎使用"})

local Tab = Window:MakeTab({
    Name = "脚本公告",
    Icon = "rbxassetid://7734068321",
    PremiumOnly = false
})

Tab:AddParagraph("作者","老郭")
Tab:AddLabel("作者QQ：2306887018")
Tab:AddLabel("QQ群：864060476")
Tab:AddLabel("此脚本完全免费")

local Tab = Window:MakeTab({
	Name = "⭐通用功能⭐",
	Icon = "rbxassetid://7734068321",
	PremiumOnly = false
})

Tab:AddButton({
  Name = "HUA 光影",
  Callback = function()
    loadstring(game:HttpGet("https://pastebin.com/raw/arzRCgwS"))()
  end
})

Tab:AddButton({
  Name = "光影_2",
  Default = false,
  Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/MZEEN2424/Graphics/main/Graphics.xml"))()
  end
})

Tab:AddButton({
	Name = "超高画质",
	Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/jHBfJYmS"))()
end
})    

Tab:AddButton({
  Name = "旋转",
  Callback = function()
    loadstring(game:HttpGet('https://pastebin.com/raw/r97d7dS0', true))()
  end
})

Tab:AddToggle({
	Name = "夜视",
	Default = false,
	Callback = function(Value)
		if Value then
		    game.Lighting.Ambient = Color3.new(1, 1, 1)
		else
		    game.Lighting.Ambient = Color3.new(0, 0, 0)
		end
	end
})
 
Tab:AddButton({
	Name = "飞车",
	Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/MHE1cbWF"))()
	end
})

Tab:AddButton({
	Name = "爬墙",
	Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/zXk4Rq2r"))()
end
})

Tab:AddButton({
    Name = "动作",
    Callback = function()
    loadstring(game:HttpGet("https://pastebin.com/raw/Zj4NnKs6"))()
    end
})

Tab:AddButton({
	Name = "电脑键盘",
	Callback = function()
     loadstring(game:HttpGet("https://raw.githubusercontent.com/advxzivhsjjdhxhsidifvsh/mobkeyboard/main/main.txt", true))()
  	end    
})

Tab:AddButton({
	Name = "踏空行走",
	Callback = function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Float'))()
	end
})

local player = Window:MakeTab({
	Name = "👁玩家👁",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Tab:AddButton({
  Name = "奖励自己",
  Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/minecrafttotem/yzhs./main/Fe%20pp%20script%20very%20fun"))()
  end
})

Tab:AddButton({
	Name = "无限跳",
    Default = false,
	Callback = function(Value)
loadstring(game:HttpGet("https://pastebin.com/raw/V5PQy3y0", true))()
	end
})

player:AddTextbox({
	Name = "移动速度",
	Default = "",
	TextDisappear = true,
	Callback = function(Value)
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
	end
})

player:AddTextbox({
	Name = "跳跃高度",
	Default = "",
	TextDisappear = true,
	Callback = function(Value)
		game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
	end
})

player:AddTextbox({
	Name = "重力设置",
	Default = "",
	TextDisappear = true,
	Callback = function(Value)
		game.Workspace.Gravity = Value
	end
})

player:AddButton({
	Name = "👻穿墙",
	Callback = function()
      	loadstring(game:HttpGet("https://pastebin.com/raw/jvyN5hT8"))()
  	end
})

player:AddButton({
	Name = "🚀飞行",
	Callback = function()
      	loadstring(game:HttpGet("https://pastebin.com/raw/U27yQRxS"))()
  	end
})

player:AddButton({
	Name = "透视",
	Callback = function()
      	local FillColor = Color3.fromRGB(175,25,255)
local DepthMode = "AlwaysOnTop"
local FillTransparency = 0.5
local OutlineColor = Color3.fromRGB(255,255,255)
local OutlineTransparency = 0

local CoreGui = game:FindService("CoreGui")
local Players = game:FindService("Players")
local lp = Players.LocalPlayer
local connections = {}

local Storage = Instance.new("Folder")
Storage.Parent = CoreGui
Storage.Name = "Highlight_Storage"

local function Highlight(plr)
    local Highlight = Instance.new("Highlight")
    Highlight.Name = plr.Name
    Highlight.FillColor = FillColor
    Highlight.DepthMode = DepthMode
    Highlight.FillTransparency = FillTransparency
    Highlight.OutlineColor = OutlineColor
    Highlight.OutlineTransparency = 0
    Highlight.Parent = Storage
    
    local plrchar = plr.Character
    if plrchar then
        Highlight.Adornee = plrchar
    end

    connections[plr] = plr.CharacterAdded:Connect(function(char)
        Highlight.Adornee = char
    end)
end

Players.PlayerAdded:Connect(Highlight)
for i,v in next, Players:GetPlayers() do
    Highlight(v)
end

Players.PlayerRemoving:Connect(function(plr)
    local plrname = plr.Name
    if Storage[plrname] then
        Storage[plrname]:Destroy()
    end
    if connections[plr] then
        connections[plr]:Disconnect()
    end
end)
  	end
})

player:AddButton({
	Name = "传送玩家",
	Callback = function()
      	loadstring(game:HttpGet(("https://pastebin.com/raw/YNVbeqPy")))()
  	end
})

player:AddButton({
	Name = "fps显示",
	Callback = function()
      	loadstring(game:HttpGet('https://raw.githubusercontent.com/1201for/littlegui/main/FPS-Counter'))()
  	end
})

player:AddButton({
	Name = "玩家进入提示",
	Callback = function()
      	loadstring(game:HttpGet("https://raw.githubusercontent.com/boyscp/scriscriptsc/main/bbn.lua"))()
  	end
})

local Tab = Window:MakeTab({
	Name = "🌚小黑子",
	Icon = "rbxassetid://7734068321",
	PremiumOnly = false
})

Tab:AddButton({
  Name = "1",
  Callback = function()
    loadstring(game:HttpGet(('https://gist.githubusercontent.com/blox-hub-roblox/021bad62bbc6a0adc4ba4e625f9ad7df/raw/c89af6e1acf587d09e4ce4bc7510e7100e0c0065/swordWarrior.lua'),true))()
  end
})

Tab:AddButton({
  Name = "2",
  Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/ToraIsMe/ToraIsMe/main/0SwordWarriors"))()
  end
})

local Tab = Window:MakeTab({
	Name = "🔥自然灾害🔥",
	Icon = "rbxassetid://7734068321",
	PremiumOnly = false
})

Tab:AddButton({
  Name = "hua-自然灾害",
  Callback = function()
    loadstring(game:HttpGet("https://pastebin.com/raw/5fKvum70"))()
  end
})

local Tab = Window:MakeTab({
	Name = "🌈doors🌈",
	Icon = "rbxassetid://7734068321",
	PremiumOnly = false
})

Tab:AddButton({
  Name = "微山",
  Callback = function()
    loadstring(game:HttpGet("\104\116\116\112\115\58\47\47\112\97\115\116\101\98\105\110\46\99\111\109\47\114\97\119\47\117\72\72\112\56\102\122\83"))()
  	end
})

local Tab = Window:MakeTab({
	Name = "🤡最强战场🤡",
	Icon = "rbxassetid://7734068321",
	PremiumOnly = false
})

Tab:AddButton({
  Name = "1",
  Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/LOLking123456/Strongest/main/Battlegrounds77"))()
  end
})

Tab:AddButton({
   Name = "点击复制秘钥",
   Callback = function()
    setclipboard("BestTheStrongest5412Roblox")
   end
})

local Tab = Window:MakeTab({
    Name = "⭐俄亥俄⭐",
    Icon = "rbxassetid://7734068321",
    PremiumOnly = false
})

Tab:AddButton({
    Name = "🐲指令脚本🐲",
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/longshulol/long/main/longshu/Ohio"))()
    end
})

Tab:AddLabel("指令如下（聊天框输入）")
Tab:AddLabel("透开-透关 ---透视")
Tab:AddLabel("追踪开-追踪关 ---子弹追踪")
Tab:AddLabel("收钱开-收钱关 ---收集钱包")
Tab:AddLabel("收物开-收物关 ---收集物品")
Tab:AddLabel("抢取款机开-抢取款机关")
Tab:AddLabel("抢银行开-抢银行关")
Tab:AddLabel("穿墙开-穿墙关")
Tab:AddLabel("拳击光环开-拳击光环关")

local Tab = Window:MakeTab({
    Name = "👋巴掌大战👋",
    Icon = "rbxassetid://7734068321",
    PremiumOnly = false
})

Tab:AddButton({
    Name = "1",
    Callback = function()
    loadstring(game:HttpGet(("https://raw.githubusercontent.com/ionlyusegithubformcmods/1-Line-Scripts/main/Slap%20Battles")))()
    end
})

Tab:AddButton({
    Name = "🐲指令脚本🐲",
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/longshulol/long/main/longshu/bazhang"))()
    end
})

Tab:AddLabel("指令如下（聊天框输入）")
Tab:AddLabel("透视-自动击打-击打光环-踏空")
Tab:AddLabel("防击飞-防推飞-防死神-速度")
Tab:AddLabel("关-无敌开-无敌关-全开-全关")
Tab:AddLabel("全开功能有:防编辑，防毒液，防黑洞，防死神")
Tab:AddLabel("防雷神，防rob，防秒杀手套，管理员预警，防踢")

local Tab = Window:MakeTab({
    Name = "✨忍者✨",
    Icon = "rbxassetid://7734068321",
    PremiumOnly = false
})

Tab:AddButton({
    Name = "1",
    Callback = function()
    pcall(loadstring(game:HttpGet("https://pastebin.com/raw/2UjrXwTV")))
    end
})

local Tab = Window:MakeTab({
    Name = "🏳️‍🌈极速",
    Icon = "rbxassetid://7734068321",
    PremiumOnly = false
})

Tab:AddButton({
  Name = "1-会覆盖",
  Callback = function()
    loadstring(game:HttpGet('\104\116\116\112\115\58\47\47\114\97\119\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\98\111\121\115\99\112\47\98\101\116\97\47\109\97\105\110\47\37\69\57\37\56\48\37\57\70\37\69\53\37\66\65\37\65\54\37\69\55\37\56\50\37\66\56\37\69\56\37\66\53\37\66\55\46\108\117\97'))()
  end
})

Tab:AddButton({
    Name = "开启卡宠",
    Callback = function()
    loadstring(game:HttpGet("https://pastebin.com/raw/uR6azdQQ"))()
    end
})

Tab:AddButton({
    Name = "自动",
    Callback = function()
    loadstring(game:HttpGet("https://pastebin.com/raw/AyeCYbT6"))()
    end
})

local Tab = Window:MakeTab({
    Name = "💪力量",
    Icon = "rbxassetid://7734068321",
    PremiumOnly = false
})

Tab:AddButton({
    Name = "💪力量传奇1",
    Callback = function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/jynzl/main/main/Musclas%20Legenos.lua'))()
    end
})

Tab:AddButton({
    Name = "💪力量传奇2",
    Callback = function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/BoaHacker/ROBLOX/main/cheat', true))()
    end
})

local Tab = Window:MakeTab({
    Name = "🔥伐木脚本🔥",
    Icon = "rbxassetid://7734068321",
    PremiumOnly = false
})

Tab:AddButton({
    Name = "🏳️白🏳️",
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/XiaoYunCN/Kavo-Ui/main/%E4%BC%90%E6%9C%A8%E5%A4%A7%E4%BA%A82.lua", true))()
    end
})

local Tab = Window:MakeTab({
	Name = "🌈彩虹好友🏳️‍🌈",
	Icon = "rbxassetid://7734068321",
	PremiumOnly = false
})

Tab:AddButton({
    Name = "1",
    Callback = function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/ToraIsMe/ToraIsMe/main/0rainbow'))()
    end
})

local Tab = Window:MakeTab({
	Name = "🌟生存巨人🌟",
	Icon = "rbxassetid://7734068321",
	PremiumOnly = false
})

Tab:AddButton({
    Name = "1",
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/RiseValco/scripts/main/GiantSurvival.lua"))()
    end
})

local player = Window:MakeTab({
	Name = "🔥能力大战🔥",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

player:AddButton({ 
	Name = "1（会覆盖）",
	Callback = function()
      	loadstring(game:HttpGet("https://raw.githubusercontent.com/castycheat/abilitywars/main/Protected%20(29).lua"))()
  	end
})

local player = Window:MakeTab({
	Name = "⭐️幸运方块战地⭐️",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

player:AddButton({ 
	Name = "1",
	Callback = function()
      	loadstring(game:HttpGet("https://github.com/bruhhwtf/LUCKY-BLOCKS-Battlegrounds-GUI/raw/main/Main"))()
  	end
})

local player = Window:MakeTab({
	Name = "👊最强拳击模拟器👊",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

player:AddButton({ 
	Name = "1",
	Callback = function()
      	loadstring(game:HttpGet('https://raw.githubusercontent.com/Solx69/Shit-Boy-Hub-Main/main/Master.lua'))();
  	end
})

local player = Window:MakeTab({
	Name = "🔪生存杀手🔪",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

player:AddButton({ 
	Name = "1",
	Callback = function()
      	loadstring(game:HttpGet('https://raw.githubusercontent.com/Kiroftt/Survive-The-Killer/main/Simple'))();
  	end
})
local player = Window:MakeTab({
	Name = "ZO ぞ SAMURAI",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

player:AddButton({ 
	Name = "1",
	Callback = function()
      	loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/Blackout4781/Project-Sinister/main/ProjectSinisterLoader"))()
  	end
})

local player = Window:MakeTab({
	Name = "🔪杀手vs警长👩‍✈️",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

player:AddButton({ 
	Name = "1",
	Callback = function()
      	loadstring(game:HttpGet("https://raw.githubusercontent.com/ToraIsMe2/ToraIsMe2/main/0murder", true))()
  	end
})
local player = Window:MakeTab({
	Name = "3008",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

player:AddButton({ 
	Name = "1",
	Callback = function()
      	loadstring(game:HttpGet'https://raw.githubusercontent.com/RunDTM/scripts/main/3008.lua')()
  	end
})

local player = Window:MakeTab({
	Name = "👊打墙模拟器",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

player:AddButton({ 
	Name = "1",
	Callback = function()
      	loadstring(game:HttpGet("https://raw.githubusercontent.com/JunBloxYTPlayz/SORIX-Hub/main/Punch%20Wall%20Simulator"))();
  	end
})

local player = Window:MakeTab({
	Name = "逃出建筑💨",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

player:AddButton({ 
	Name = "1",
	Callback = function()
      	loadstring(game:HttpGet(('https://raw.githubusercontent.com/rblxscriptsnet/unfair/main/rblxhub.lua'),true))()
  	end
})

local player = Window:MakeTab({
	Name = "🏳️‍🌈在51区生存",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

player:AddButton({ 
	Name = "1（会覆盖）",
	Callback = function()
      	loadstring(game:HttpGet("https://raw.githubusercontent.com/ZONE100/ZoneHub/main/MultiGames"))()
  	end
})

local player = Window:MakeTab({
	Name = "🥪我的餐厅",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

player:AddButton({ 
	Name = "1",
	Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Rafacasari/roblox-scripts/main/mr.lua"))()
  	end
})

local Tab = Window:MakeTab({
    Name = "🌟CDID脚本🌟",
    Icon = "rbxassetid://7734068321",
    PremiumOnly = false
})

Tab:AddButton({
    Name = "CDID脚本",
    Callback = function()
    warn("Anti afk running")
game:GetService("Players").LocalPlayer.Idled:connect(function()
warn("Anti afk ran")
game:GetService("VirtualUser"):CaptureController()
game:GetService("VirtualUser"):ClickButton2(Vector2.new())
end)
local drop
local function dealerships()
local tables = {"Dealerships"}
for i,v in pairs(workspace.Etc.Dealership:GetChildren()) do
    if v.ClassName == "Model" then
    table.insert(tables,v.Name)
end
end
return tables
end
getfenv().grav = workspace.Gravity
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Marco8642/science/refs/heads/main/ui%20libs"))()
local example = library:CreateWindow({
  text = "CDID"
})
example:AddToggle("自动刷钱 [卡车司机]", function(state)
   getfenv().drive = (state and true or false)
   workspace.Gravity = 196
   if workspace.Map:findFirstChild("Prop") then
    workspace.Map.Prop:Destroy()
   end
    while getfenv().drive do
        wait()
        pcall(function()
if game.Players.LocalPlayer.Character.Humanoid.SeatPart == nil then
game:GetService("ReplicatedStorage").NetworkContainer.RemoteEvents.Job:FireServer("Truck")
wait(0.1)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Etc.Job.Truck.Starter.WorldPivot
game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true
wait(5)
game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
wait()
local prepos = workspace.Etc.Waypoint.Waypoint.Position
repeat wait()
fireproximityprompt(workspace.Etc.Job.Truck.Starter.Prompt)
until workspace.Etc.Waypoint.Waypoint.Position ~= prepos
wait(2)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame= workspace.Etc.Job.Truck.Spawner.Part.CFrame
workspace.Gravity = 196
wait(2)
local thetruck = nil
repeat wait()
if thetruck == nil then
repeat wait()
fireproximityprompt(workspace.Etc.Job.Truck.Spawner.Part.Prompt)
until workspace.Vehicles:FindFirstChild(game.Players.LocalPlayer.Name.."sCar")
wait(4)
for i,v in pairs(workspace.Vehicles:FindFirstChild(game.Players.LocalPlayer.Name.."sCar"):GetDescendants()) do
if v.Name == "Identifier" and v.Text == "H 9281 KGK" or v.Name == "Identifier" and v.Text == "BL 7201 EL" or v.Name == "Identifier" and v.Text == "L 9128 TIM" then
    thetruck = v
    print(v)
end
end
end
until thetruck ~= nil
repeat wait()
until workspace.Vehicles:FindFirstChild(game.Players.LocalPlayer.Name.."sCar")
repeat wait()
    pcall(function()
if game.Players.LocalPlayer.Character.Humanoid.SeatPart == nil then
workspace.Vehicles:FindFirstChild(game.Players.LocalPlayer.Name.."sCar"):FindFirstChild("DriveSeat"):Sit(game.Players.LocalPlayer.Character.Humanoid)
wait(1)
end
    end)
until game.Players.LocalPlayer.Character.Humanoid.SeatPart ~= nil
elseif game.Players.LocalPlayer.Character.Humanoid.SeatPart ~= nil then
local plr = game.Players.LocalPlayer
local chr = plr.Character
local croot = chr.HumanoidRootPart
local seat = chr.Humanoid.SeatPart
local car = seat.Parent
local primary = car.PrimaryPart
workspace.Gravity = 0
wait()
local dist = (primary.Position-primary.Position+Vector3.new(0,1000,0)).magnitude
local TweenService = game:GetService("TweenService")
local TweenInfoToUse = TweenInfo.new(0, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0)

local TweenValue = Instance.new("CFrameValue")
TweenValue.Value = car:GetPrimaryPartCFrame()
        
TweenValue.Changed:Connect(function()
car:PivotTo(TweenValue.Value)
end)
local OnTween = TweenService:Create(TweenValue, TweenInfoToUse, {Value=primary.CFrame+Vector3.new(0,1000,0)})
OnTween:Play()
OnTween.Completed:Wait()
local plr = game.Players.LocalPlayer
local chr = plr.Character
local croot = chr.HumanoidRootPart
local seat = chr.Humanoid.SeatPart
local car = seat.Parent
local primary = car.PrimaryPart
workspace.Gravity = 0
local dist = (primary.Position-workspace.Etc.Waypoint.Waypoint.Position+Vector3.new(0,1000,0)).magnitude
print(dist/150)
local TweenService = game:GetService("TweenService")
local TweenInfoToUse = TweenInfo.new(40, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0)

local TweenValue = Instance.new("CFrameValue")
TweenValue.Value = car:GetPrimaryPartCFrame()
        
TweenValue.Changed:Connect(function()
car:PivotTo(TweenValue.Value)
end)
local OnTween = TweenService:Create(TweenValue, TweenInfoToUse, {Value=workspace.Etc.Waypoint.Waypoint.CFrame+Vector3.new(0,1000,0)})
OnTween:Play()
OnTween.Completed:Wait()
local plr = game.Players.LocalPlayer
local chr = plr.Character
local croot = chr.HumanoidRootPart
local seat = chr.Humanoid.SeatPart
local car = seat.Parent
local primary = car.PrimaryPart
workspace.Gravity = 0
local dist = (primary.Position-workspace.Etc.Waypoint.Waypoint.Position+Vector3.new(0,30,0)).magnitude
local TweenService = game:GetService("TweenService")
local TweenInfoToUse = TweenInfo.new(dist/150, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0)

local TweenValue = Instance.new("CFrameValue")
TweenValue.Value = car:GetPrimaryPartCFrame()
        
TweenValue.Changed:Connect(function()
car:PivotTo(TweenValue.Value)
end)
local OnTween = TweenService:Create(TweenValue, TweenInfoToUse, {Value=workspace.Etc.Waypoint.Waypoint.CFrame+Vector3.new(0,30,0)})
OnTween:Play()
OnTween.Completed:Wait()
local prepos = workspace.Etc.Waypoint.Waypoint.Position
repeat task.wait()
    if workspace.Etc.Waypoint.Waypoint.Position == prepos then
        local plr = game.Players.LocalPlayer
        local chr = plr.Character
        local croot = chr.HumanoidRootPart
        local seat = chr.Humanoid.SeatPart
        local car = seat.Parent
        local primary = car.PrimaryPart
        workspace.Gravity = 0
        local dist = (primary.Position-workspace.Etc.Waypoint.Waypoint.Position).magnitude
        local TweenService = game:GetService("TweenService")
        local TweenInfoToUse = TweenInfo.new(2, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0)
        
        local TweenValue = Instance.new("CFrameValue")
        TweenValue.Value = car:GetPrimaryPartCFrame()
                
        TweenValue.Changed:Connect(function()
        car:PivotTo(TweenValue.Value)
        end)
        local OnTween = TweenService:Create(TweenValue, TweenInfoToUse, {Value=workspace.Etc.Waypoint.Waypoint.CFrame*CFrame.new(0,0,20)})
        OnTween:Play()
        OnTween.Completed:Wait()
        if workspace.Etc.Waypoint.Waypoint.Position == prepos then
            local plr = game.Players.LocalPlayer
local chr = plr.Character
local croot = chr.HumanoidRootPart
local seat = chr.Humanoid.SeatPart
local car = seat.Parent
local primary = car.PrimaryPart
workspace.Gravity = 0
local dist = (primary.Position-workspace.Etc.Waypoint.Waypoint.Position-Vector3.new(0,25,0)).magnitude
local TweenService = game:GetService("TweenService")
local TweenInfoToUse = TweenInfo.new(2, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0)

local TweenValue = Instance.new("CFrameValue")
TweenValue.Value = car:GetPrimaryPartCFrame()
        
TweenValue.Changed:Connect(function()
car:PivotTo(TweenValue.Value)
end)
local OnTween = TweenService:Create(TweenValue, TweenInfoToUse, {Value=workspace.Etc.Waypoint.Waypoint.CFrame-Vector3.new(0,25,0)})
OnTween:Play()
OnTween.Completed:Wait()
end
workspace.Gravity = 200
for i, v in pairs(car:GetDescendants()) do
    pcall(function()
    v.Velocity = Vector3.new(0,0,0)
    end)
end
wait(2)
    end
until prepos ~= workspace.Etc.Waypoint.Waypoint.Position
workspace.Gravity = 196
end
end)
end
end)
local example = library:CreateWindow({
    text = "传送"
  })
example:AddDropdown(dealerships(),function(state) 
if state ~= "经销商" then
    for i,v in pairs(workspace.Etc.Dealership:GetChildren()) do
        if v.Name == state then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =v.WorldPivot+Vector3.new(0,5,0)
game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true
wait(1)
game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
        end
    end
end
end)
    end
})

OrionLib:Init()