local ScreenGui = Instance.new("ScreenGui")
local Toolbar = Instance.new("Frame")
local Background = Instance.new("Frame")
local Name = Instance.new("TextLabel")
local Mole = Instance.new("TextButton")
ScreenGui.Parent = game.CoreGui


Toolbar.Name = "Toolbar"
Toolbar.Parent = ScreenGui
Toolbar.BackgroundColor3 = Color3.fromRGB(42, 42, 42)
Toolbar.Position = UDim2.new(0.02541296, 0, 0.163390666, 0)
Toolbar.Size = UDim2.new(0, 269, 0, 34)
Toolbar.Active = true
Toolbar.Draggable = true

Background.Name = "Background"
Background.Parent = Toolbar
Background.BackgroundColor3 = Color3.fromRGB(42, 42, 42)
Background.BackgroundTransparency = 0.500
Background.Position = UDim2.new(0, 0, 0.986920536, 0)
Background.Size = UDim2.new(0, 268, 0, 36)

Name.Name = "Name"
Name.Parent = Toolbar
Name.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Name.BackgroundTransparency = 1.000
Name.Position = UDim2.new(0.00371747208, 0, 0, 0)
Name.Size = UDim2.new(0, 268, 0, 34)
Name.Font = Enum.Font.SourceSans
Name.Text = "Mole"
Name.TextColor3 = Color3.fromRGB(255, 255, 255)
Name.TextScaled = true
Name.TextSize = 14.000
Name.TextWrapped = true

Mole.Name = "Mole"
Mole.Parent = Toolbar
Mole.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Mole.BackgroundTransparency = 1.000
Mole.Position = UDim2.new(0, 0, 1, 0)
Mole.Size = UDim2.new(0, 268, 0, 36)
Mole.Font = Enum.Font.Gotham
Mole.Text = "Mole(B)"
Mole.TextColor3 = Color3.fromRGB(255, 255, 255)
Mole.TextSize = 20.000
Mole.MouseButton1Down:connect(function()
--[[ Press "E" to toggle noclip]]
noclip = false
game:GetService('RunService').Stepped:connect(function()
if noclip then
game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
end
end)
plr = game.Players.LocalPlayer
mouse = plr:GetMouse()
mouse.KeyDown:connect(function(key)

if key == "e" then
noclip = not noclip
game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
end
end)
print('Loaded')
print('Press "E" to noclip')
 
local Player = game:GetService("Players").LocalPlayer
local Mouse = Player:GetMouse()
Mouse.KeyDown:connect(function(k)
k = k:lower()
if k == "f" then
if _G.infinjump == true then
_G.infinjump = false
else
_G.infinjump = true
end
end
end)
--epic molescript
mole = "up"
                                        plr = game.Players.LocalPlayer

hum = plr.Character.HumanoidRootPart




mouse.KeyDown:connect(function(key)

if key == "b" then
if status then
mole = "up"
else
mole = "down"
end

elseif key == "n" then
if probestatus then
mole = "probeup"
else
mole = "probedown"
end
end

if mole == "down" then
noclip = true
wait()
hum.CFrame = CFrame.new(hum.CFrame.x, hum.CFrame.y - 8.42, hum.CFrame.z)
mole = "off"
status = true

elseif mole == "up" then
noclip = false
wait()
hum.CFrame = CFrame.new(hum.CFrame.x, hum.CFrame.y + 8.42, hum.CFrame.z)
mole = "off"
status = false

elseif mole == "probeup" then
noclip = false
wait()
hum.CFrame = CFrame.new(hum.CFrame.x, hum.CFrame.y + 35, hum.CFrame.z)
mole = "off"
probestatus = false

elseif mole == "probedown" then
noclip = true
wait()
hum.CFrame = CFrame.new(hum.CFrame.x, hum.CFrame.y - 35, hum.CFrame.z)
mole = "off"
probestatus = true
end
end)
end)

local LocalPlayer = game:GetService("Players").LocalPlayer
local OriginalKeyUpValue = 0

local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://2791328524"

function StopAudio()
    LocalPlayer.Character.LowerTorso.BOOMBOXSOUND:Stop()
end

function stop(ID, Key)
    local cor = coroutine.wrap(function()
        wait(LocalPlayer.Character.LowerTorso.BOOMBOXSOUND.TimeLength-0.1)
        if LocalPlayer.Character.LowerTorso.BOOMBOXSOUND.SoundId == "rbxassetid://"..ID and OriginalKeyUpValue == Key then
            StopAudio()
        end
    end)
    cor()
end

function play(ID, STOP, LMAO)
    if LocalPlayer.Backpack:FindFirstChild("[Boombox]") then
        local Tool = nil
        if LocalPlayer.Character:FindFirstChildOfClass("Tool") and LMAO == true then
            Tool = LocalPlayer.Character:FindFirstChildOfClass("Tool")
            LocalPlayer.Character:FindFirstChildOfClass("Tool").Parent = LocalPlayer.Backpack
        end
        LocalPlayer.Backpack["[Boombox]"].Parent =
            LocalPlayer.Character
        game.ReplicatedStorage.MainEvent:FireServer("Boombox", ID)
        LocalPlayer.Character["[Boombox]"].RequiresHandle = false
        if LocalPlayer.Character["[Boombox]"]:FindFirstChild("Handle") then
            LocalPlayer.Character["[Boombox]"].Handle:Destroy()
        end
        LocalPlayer.Character["[Boombox]"].Parent =
            LocalPlayer.Backpack
        LocalPlayer.PlayerGui.MainScreenGui.BoomboxFrame.Visible = false
        if Tool ~= true then
            if Tool then
                Tool.Parent = LocalPlayer.Character
            end
        end
        if STOP == true then
            LocalPlayer.Character.LowerTorso:WaitForChild("BOOMBOXSOUND")
            local cor = coroutine.wrap(function()
                repeat wait() until LocalPlayer.Character.LowerTorso.BOOMBOXSOUND.SoundId == "rbxassetid://"..ID and LocalPlayer.Character.LowerTorso.BOOMBOXSOUND.TimeLength > 0.01
                OriginalKeyUpValue = OriginalKeyUpValue+1
                stop(ID, OriginalKeyUpValue)
            end)
            cor()
        end
    end
end

function Slide()
    local XD = LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):LoadAnimation(Anim)
    XD:Play()
    XD.TimePosition = 0
    XD.Looped = false
    XD:AdjustSpeed(2.5)
end

game:GetService("UserInputService").InputBegan:connect(function(i, XD)
    if i.UserInputType == Enum.UserInputType.Keyboard and XD == false then
        if i.KeyCode == Enum.KeyCode.B then
            local Character = LocalPlayer.Character
            local Humanoid = Character:FindFirstChildOfClass("Humanoid")

            function rm()
                for i,v in pairs(Character:GetDescendants()) do
                    if v:IsA("BasePart") or v:IsA("MeshPart") then
                        if v.Name ~= "Head" then
                            for i,cav in pairs(v:GetDescendants()) do
                                if cav:IsA("Attachment") then
                                    if cav:FindFirstChild("OriginalPosition") then
                                        cav.OriginalPosition:Destroy()
                                    end
                                end
                            end
                            for i,v in pairs(v:GetChildren()) do
                                if v.Name == "OriginalSize" then
                                    v:Destroy()
                                end
                            end
                            if v:FindFirstChild("AvatarPartScaleType") then
                                v:FindFirstChild("AvatarPartScaleType"):Destroy()
                            end
                        end
                    end
                end
            end
            
            play(3923230963, true, true)
            Slide()
        end
    end
end)