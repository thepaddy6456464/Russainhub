local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local ESP = loadstring(game:HttpGet("https://kiriot22.com/releases/ESP.lua"))()
ESP.Players = true
ESP.Boxes = true
ESP.Names = true
ESP:Toggle(true)

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

local MainButton = MainTab:CreateButton({
   Name = "esp prototype",
   Callback = function()
   -- loadstring
   wait(1)

-- config

 
-- object
ESP:AddObjectListener(Workspace, { game:GetService("Workspace").Skyscraper.Base
    Name = "weirdo", --Object name inside of the path, for example: Workspace.ThisFolder.Item_1
    CustomName = "", -- Name you want to be displayed
    Color = Color3.fromRGB(0, 0, 0), -- Color
    IsEnabled = "whatever" -- Any name, has to be the same as the last line: ESP.TheNameYouWant
})
ESP.whatever = true
   end,
})

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


