local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")
local Lighting = game:GetService("Lighting")
local UserGameSettings = UserSettings():GetService("UserGameSettings")

local gui = Instance.new("ScreenGui")
gui.Name = "ElPatronGraphics"
gui.ResetOnSpawn = false
gui.Parent = PlayerGui

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 220, 0, 130)
frame.Position = UDim2.new(0.02, 0, 0.4, 0)
frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true
frame.Parent = gui

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 30)
title.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
title.Text = "EL PATRÓN GRAPHICS"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Font = Enum.Font.GothamBold
title.TextSize = 18
title.Parent = frame

local potatoBtn = Instance.new("TextButton")
potatoBtn.Size = UDim2.new(1, -20, 0, 40)
potatoBtn.Position = UDim2.new(0, 10, 0, 50)
potatoBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
potatoBtn.Text = "POTATO GRAPHICS"
potatoBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
potatoBtn.Font = Enum.Font.GothamBold
potatoBtn.TextSize = 16
potatoBtn.Parent = frame

local function setPotatoGraphics()
    pcall(function()
        UserGameSettings.SavedQualityLevel = Enum.SavedQualitySetting.QualityLevel1
    end)
    Lighting.GlobalShadows = false
    Lighting.EnvironmentDiffuseScale = 0
    Lighting.EnvironmentSpecularScale = 0
    Lighting.Brightness = 1
    Lighting.FogStart = 0
    Lighting.FogEnd = 60
    Lighting.Ambient = Color3.fromRGB(255, 255, 255)
    Lighting.OutdoorAmbient = Color3.fromRGB(255, 255, 255)
    local sky = Lighting:FindFirstChildOfClass("Sky")
    if sky then
        sky.SkyboxBk = ""
        sky.SkyboxDn = ""
        sky.SkyboxFt = ""
        sky.SkyboxLf = ""
        sky.SkyboxRt = ""
        sky.SkyboxUp = ""
    end
    for _, obj in ipairs(workspace:GetDescendants()) do
        if obj:IsA("ParticleEmitter") or obj:IsA("Trail") then
            obj.Enabled = false
        elseif obj:IsA("PointLight") or obj:IsA("SpotLight") or obj:IsA("SurfaceLight") then
            obj.Enabled = false
        elseif obj:IsA("Decal") or obj:IsA("Texture") then
            obj.Transparency = 1
        end
    end
    for _, part in ipairs(workspace:GetDescendants()) do
        if part:IsA("BasePart") then
            part.Material = Enum.Material.SmoothPlastic
            part.Reflectance = 0
        end
    end
end

potatoBtn.MouseButton1Click:Connect(setPotatoGraphics)
