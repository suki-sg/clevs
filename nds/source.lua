if game.PlaceId ~= 189707 then game:GetService("Players").LocalPlayer:Kick("Script for `Natural Disaster Survival") end
repeat task.wait() until game:IsLoaded() and game:GetService("Players").LocalPlayer.Character
if game:GetService("CoreGui"):FindFirstChild("Vynixius UI Library") then game:GetService("CoreGui")["Vynixius UI Library"]:Destroy() end
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/UI-Libraries/main/Vynixius/Source.lua"))()
local module = loadstring(game:HttpGet(('https://raw.githubusercontent.com/levy-gm/clevs/main/nds/module.lua')))()
local Window = Library:AddWindow({title = {"clevs", "NDS"}, theme = {Accent = Color3.fromRGB(0, 255, 0)}, key = Enum.KeyCode.RightControl, default = true})

local Main_Tab = Window:AddTab("Main", {default = true})
local Section = Main_Tab:AddSection("Main Mods", {default = false})
local Button = Section:AddButton("Remove Fall Damage (Once)", function()
	module:remove_fall_damage()
end)
local Toggle = Section:AddToggle("Remove Fall Damage", {flag = "Toggle_Flag", default = false}, function(bool)
   GLoopRFD = bool
	while GLoopRFD do
      if bool then
         module:remove_fall_damage()
      end
      wait()
   end
end)

local Section = Main_Tab:AddSection("Player", {default = false})
local Slider = Section:AddSlider("WalkSpeed", 1, 100, 16, {toggleable = true, default = false, flag = "Slider_Flag", fireontoggle = true, fireondrag = true, rounded = true}, function(val, bool)
	if bool then
      game:GetService("Players").LocalPlayer.Character.Humanoid.WalkSpeed = val
   else
      game:GetService("Players").LocalPlayer.Character.Humanoid.WalkSpeed = 16
   end
end)
local Slider = Section:AddSlider("Jump Power", 1, 100, 50, {toggleable = true, default = false, flag = "Slider_Flag", fireontoggle = true, fireondrag = true, rounded = true}, function(val, bool)
	if bool then
      game:GetService("Players").LocalPlayer.Character.Humanoid.JumpPower = val
   else
      game:GetService("Players").LocalPlayer.Character.Humanoid.JumpPower = 50
   end
end)
local Toggle = Section:AddToggle("Inf Jump", {flag = "Toggle_Flag", default = false}, function(bool)
	print("Toggle set to:", bool)
end)


local Section = Main_Tab:AddSection("Teleport", {default = false})
local Button = Section:AddButton("Lobby / Spawn", function()
	print("Button has been pressed")
end)
local Button = Section:AddButton("Map", function()
	print("Button has been pressed")
end)


local Section = Main_Tab:AddSection("Misc Mods", {default = false})
local SubSection = Section:AddSubSection("Character Size", {default = false})
local Button = SubSection:AddButton("Short / Tiny", function()
   print("tiny")
	module:tiny()
   print("taaaa")
end)
local Button = SubSection:AddButton("Tall / Big", function()
	module:tall()
end)
