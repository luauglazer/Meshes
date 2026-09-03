local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")
local SoundService = game:GetService("SoundService")

local ASSET_ICON = "rbxassetid://126027056432287"
local ASSET_SOUND = "rbxassetid://106825898931973"
local SCRIPT_URL = "https://raw.githubusercontent.com/luauglazer/Meshes/refs/heads/main/init.lua"
local DISPLAY_DURATION = 2

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "PurrwTeamLoader"
screenGui.ResetOnSpawn = false
screenGui.IgnoreGuiInset = true

local targetParent = (gethui and gethui()) or CoreGui:FindFirstChild("RobloxGui") or CoreGui
screenGui.Parent = targetParent

local container = Instance.new("Frame")
container.Name = "Container"
container.AnchorPoint = Vector2.new(0.5, 0.5)
container.Position = UDim2.new(0.5, 0, 0.5, 0)
container.Size = UDim2.new(0, 160, 0, 190)
container.BackgroundTransparency = 1
container.Parent = screenGui

local logo = Instance.new("ImageLabel")
logo.Name = "Logo"
logo.AnchorPoint = Vector2.new(0.5, 0.5)
logo.Position = UDim2.new(0.5, 0, 0.4, 0)
logo.Size = UDim2.new(0, 110, 0, 110)
logo.BackgroundTransparency = 1
logo.Image = ASSET_ICON
logo.Parent = container

local label = Instance.new("TextLabel")
label.Name = "Title"
label.AnchorPoint = Vector2.new(0.5, 1)
label.Position = UDim2.new(0.5, 0, 1, 0)
label.Size = UDim2.new(1, 0, 0, 30)
label.BackgroundTransparency = 1
label.Font = Enum.Font.GothamBold
label.Text = "Purrw team made in brazil"
label.TextColor3 = Color3.fromRGB(255, 255, 255)
label.TextSize = 20
label.TextStrokeTransparency = 0.5
label.Parent = container

local sound = Instance.new("Sound")
sound.SoundId = ASSET_SOUND
sound.Volume = 1
sound.Parent = SoundService
sound:Play()

local spinTweenInfo = TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, -1)
local spinTween = TweenService:Create(logo, spinTweenInfo, { Rotation = 360 })
spinTween:Play()

task.wait(DISPLAY_DURATION)

local fadeInfo = TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local fadeLogo = TweenService:Create(logo, fadeInfo, { ImageTransparency = 1 })
local fadeText = TweenService:Create(label, fadeInfo, { TextTransparency = 1, TextStrokeTransparency = 1 })

fadeLogo:Play()
fadeText:Play()
fadeLogo.Completed:Wait()

spinTween:Cancel()
screenGui:Destroy()
sound:Destroy()

local success, content = pcall(function()
    return game:HttpGet(SCRIPT_URL)
end)

if success and content then
    local func, err = loadstring(content)
    if func then
        task.spawn(func)
    else
        warn("Loadstring compilation error: " .. tostring(err))
    end
else
    warn("Failed to fetch script: " .. tostring(content))
end
