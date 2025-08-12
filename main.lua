local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Russainhub",
   Icon = 0, 
   LoadingTitle = "warning:detection status is unknown",
   LoadingSubtitle = "by pulse",
   ShowText = "russain is very pregnant", 
   Theme = "Default", 

   ToggleUIKeybind = "K", 

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, 

   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil,
      FileName = "Big Hub"
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

Rayfield:Notify({
   Title = "RussainHub",
   Content = "Russainspy is very pregnant",
   Duration = 6.5,
   Image = 4483362458,
})

local MainTab = Window:CreateTab("main", 4483362458)

local WalkspeedSlider = MainTab:CreateSlider({
   Name = "speed",
   Range = {0, 300},
   Increment = 1,
   Suffix = "Walkspeed",
   CurrentValue = 16,
   Flag = "Walkspeed", 
   Callback = function(Value)
   local player = game.Players.LocalPlayer
            if player and player.Character and player.Character:FindFirstChild("Humanoid") then
                player.Character.Humanoid.WalkSpeed = Value
            end
   end,
})


