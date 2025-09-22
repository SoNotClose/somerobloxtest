-- ignore ingnore yes im skidding fuck offffffffff
-- im just fucking aroiud with lua code

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

local MainTab = Window:CreateTab("Main", "crown")

local Players=game:GetService("Players")local ReplicatedStorage=game:GetService("ReplicatedStorage")local RunService=game:GetService("RunService")local RemoteEvent=ReplicatedStorage:WaitForChild("Shared"):WaitForChild("Framework"):WaitForChild("Network"):WaitForChild("Remote"):WaitForChild("RemoteEvent")local LocalPlayer=Players.LocalPlayer local AutoObbyRunning=false local attempting=false local lastAttemptTime=0 local attemptDelay=1.854 local AutoOBBY=MainTab:CreateToggle({Name="Auto Obby",CurrentValue=false,Flag="autoobby",Callback=function(Value)AutoObbyRunning=Value end})RunService.RenderStepped:Connect(function()if not AutoObbyRunning or attempting then return end if os.clock()-lastAttemptTime<attemptDelay then return end attempting=true lastAttemptTime=os.clock() local success=false for _,difficulty in ipairs({"Hard","Medium","Easy"})do local Character=LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()local HumanoidRootPart=Character:FindFirstChild("HumanoidRootPart")if not HumanoidRootPart then break end local initialPosition=HumanoidRootPart.Position RemoteEvent:FireServer("StartObby",difficulty)task.wait(0.2)local newPosition=HumanoidRootPart.Position local distanceMoved=(newPosition-initialPosition).Magnitude if distanceMoved>=8.7 then RemoteEvent:FireServer("CompleteObby")print("Completed "..difficulty)task.wait(0.2)RemoteEvent:FireServer("Teleport","Workspace.Worlds.Seven Seas.Areas.Classic Island.HouseSpawn")success=true break else warn(difficulty.." obby not ready")end if not AutoObbyRunning then break end end attempting=false end)


