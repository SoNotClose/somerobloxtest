-- ignore ingnore yes im skidding fuck offffffffff
-- im just fucking aroiud with lua code
local TeleportService = game:GetService("TeleportService")

TeleportService.OnTeleport:Connect(function(state)
    if state == Enum.TeleportState.InProgress then
        queue_on_teleport([[
            loadstring(game:HttpGet("https://raw.githubusercontent.com/SoNotClose/somerobloxtest/main/main.lua"))()
        ]])
    end
end)


local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
    Name = "BRAINROT",
    Icon = 0,
    LoadingTitle = "BRAINROT CLIENT",
    LoadingSubtitle = "by Sahur",
    ShowText = "",
    Theme = "Default",
    ToggleUIKeybind = "K",
    DisableRayfieldPrompts = false,
    DisableBuildWarnings = false,
    ConfigurationSaving = {
        Enabled = true,
        FolderName = nil,
        FileName = "BR Hub"
    },
    Discord = {
        Enabled = false,
        Invite = "noinvitelink",
        RememberJoins = true
    },
    KeySystem = false,
    KeySettings = {
        Title = "Untitled",
        Subtitle = "Key System",
        Note = "No method of obtaining the key is provided",
        FileName = "Key",
        SaveKey = true,
        GrabKeyFromSite = false,
        Key = {"Hello"}
    }
})

print("autosigmaobby")
local MainTab = Window:CreateTab("Main", "crown")

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")

local RemoteEvent = ReplicatedStorage:WaitForChild("Shared")
    :WaitForChild("Framework")
    :WaitForChild("Network")
    :WaitForChild("Remote")
    :WaitForChild("RemoteEvent")

local LocalPlayer = Players.LocalPlayer
local AutoObbyRunning = false
local attempting = false
local lastAttemptTime = 0
local attemptDelay = 2.354

local difficultyIndex = 1
local difficulties = { "Hard", "Medium", "Easy" }

local obbyEnds = {
    Hard = Vector3.new(-1532.31, 5925.23, 22536.96),
    Medium = Vector3.new(-1122.12, 5918.23, 22548.54),
    Easy = Vector3.new(-790.59, 5932.23, 22613.33)
}

local function tweenToPosition(part, targetPosition)
    local tweenInfo = TweenInfo.new(
        math.random(2, 3), -- duration between 2–3 seconds
        Enum.EasingStyle.Linear,
        Enum.EasingDirection.Out
    )
    local goal = { Position = targetPosition }
    local tween = TweenService:Create(part, tweenInfo, goal)
    tween:Play()
end

local AutoOBBY = MainTab:CreateToggle({
    Name = "Auto Obby",
    CurrentValue = false,
    Flag = "autoobby",
    Callback = function(Value)
        AutoObbyRunning = Value
    end,
})

RunService.RenderStepped:Connect(function()
    if not AutoObbyRunning or attempting then return end
    if os.clock() - lastAttemptTime < attemptDelay then return end

    attempting = true
    lastAttemptTime = os.clock()

    local difficulty = difficulties[difficultyIndex]
    local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
    if not HumanoidRootPart then attempting = false return end

    local initialPosition = HumanoidRootPart.Position
    RemoteEvent:FireServer("StartObby", difficulty)
    task.wait(math.random(25, 45) / 100)

    local newPosition = HumanoidRootPart.Position
    local distanceMoved = (newPosition - initialPosition).Magnitude

    if distanceMoved >= 8.7 then
        print("Completed " .. difficulty)
        task.wait(math.random(25, 45) / 100)
        tweenToPosition(HumanoidRootPart, obbyEnds[difficulty])
        difficultyIndex = 1
    else
        difficultyIndex += 1
        if difficultyIndex > #difficulties then
            difficultyIndex = 1
        end
    end

    attempting = false
end)

Rayfield:LoadConfiguration();
