local VU = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:connect(function()
VU:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
task.wait(0.2)
VU:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)
if not KG_HUB or KG_HUB ~= "KG_TEAM" then 
game.Players.LocalPlayer:Kick("变量（KG HUB）验证失败，请把内容复制全")
    return
end
task.wait(0.1)
local lib = loadstring(game:HttpGet"https://raw.github.com/520-Ghost/-/main/UI.lua")()
local win = lib:new("KG┇彩虹朋友")
local tabV = win:Tab("主要功能")
local tab = tabV:section("主要功能",true)

tab:Button("自动收集", function()
attempts = 0
   for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
 if v:FindFirstChild("TouchTrigger") and attempts < 10 then
     attempts = attempts + 1
       firetouchinterest(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart,v.TouchTrigger,0)
 
   end
end
end)

tab:Button("自动放置", function()
game:GetService("Workspace").GroupBuildStructures:FindFirstChild("Trigger", true)
firetouchinterest(game:GetService("Workspace").GroupBuildStructures:FindFirstChild("Trigger", true), game.Players.LocalPlayer.Character.HumanoidRootPart, 0)
task.wait()
firetouchinterest(game:GetService("Workspace").GroupBuildStructures:FindFirstChild("Trigger", true), game.Players.LocalPlayer.Character.HumanoidRootPart, 1)
end)

tab:Toggle("怪物透视", false, function(bool)
    if bool then
        local runService = game:GetService("RunService")
        event = runService.RenderStepped:Connect(function()
            for _,v in pairs(game:GetService("Workspace").Monsters:GetChildren()) do
                if not v:FindFirstChild("Lol") then
                    local esp = Instance.new("Highlight", v)
                    esp.Name = "Lol"
                    esp.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                    esp.FillColor = Color3.new(0, 0, 255)
                end
            end
        end)
    end
    if not bool then
        event:Disconnect()
        for _,v in pairs(game:GetService("Workspace").Monsters:GetChildren()) do
            v:FindFirstChild("Lol"):Destroy()
        end
    end
end)

tab:Toggle("物品透视", "", false, function(bool)
    if bool then
        local runService = game:GetService("RunService")
        event = runService.RenderStepped:Connect(function()
            for _,v in pairs(game:GetService("Workspace"):GetChildren()) do
                if v:FindFirstChild("TouchTrigger") then
                    if not v:FindFirstChild("Lol") then
                        local esp = Instance.new("Highlight", v)
                        esp.Name = "Lol"
                        esp.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                        esp.FillColor = Color3.new(0, 255, 0)
                    end
                end
            end
        end)
    end
    if not bool then
        event:Disconnect()
        for _,v in pairs(game:GetService("Workspace"):GetChildren()) do
            if v:FindFirstChild("TouchTrigger") then
                v:FindFirstChild("Lol"):Destroy()
            end
        end
    end
end)