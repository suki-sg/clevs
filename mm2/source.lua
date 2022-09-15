if game.PlaceId ~= 142823291 then game:GetService("Players").LocalPlayer:Kick("Script is for `Murder Mystery 2`") end
repeat task.wait() until game:IsLoaded() and game:GetService("Players").LocalPlayer.Character
if game:GetService("CoreGui"):FindFirstChild("Vynixius UI Library") then game:GetService("CoreGui")["Vynixius UI Library"]:Destroy() end
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/UI-Libraries/main/Vynixius/Source.lua"))()
local module = loadstring(game:HttpGet(('https://raw.githubusercontent.com/levy-gm/clevs/main/mm2/module.lua')))()
local Window = Library:AddWindow({title = {"clevs", "MM2"}, theme = {Accent = Color3.fromRGB(0, 255, 0)}, key = Enum.KeyCode.RightControl, default = true})

getgenv().GLoopBreakGun = false
getgenv().GLoopTrapAll = false

local Game_Tab = Window:AddTab("Game", {default = true})


local Section = Game_Tab:AddSection("Player", {default = false})
local Slider = Section:AddSlider("Walkspeed", 1, 100, 16, {toggleable = true, default = false, flag = "Slider_Flag", fireontoggle = true, fireondrag = true, rounded = true}, function(val, bool)
   if bool then
      game:GetService("Players").LocalPlayer.Character.Humanoid.WalkSpeed = val
   else
      game:GetService("Players").LocalPlayer.Character.Humanoid.WalkSpeed = 16
   end
end)
local Slider = Section:AddSlider("JumpPower", 1, 100, 50, {toggleable = true, default = false, flag = "Slider_Flag", fireontoggle = true, fireondrag = true, rounded = true}, function(val, bool)
   if bool then
      game:GetService("Players").LocalPlayer.Character.Humanoid.JumpPower = val
   else
      game:GetService("Players").LocalPlayer.Character.Humanoid.JumpPower = 50
   end
end)
local Toggle = Section:AddToggle("Inf Jump", {flag = "Toggle_Flag", default = false}, function(bool)
	print("Toggle set to:", bool)
end)
local Slider = Section:AddSlider("Gravity", 0, 196.2, 196.2, {toggleable = true, default = false, flag = "Slider_Flag", fireontoggle = true, fireondrag = true, rounded = false}, function(val, bool)
	if bool then
      game:GetService("Workspace").Gravity = val
   else
      game:GetService("Workspace").Gravity = 196.2
   end
end)
local Slider = Section:AddSlider("Field of View", 30, 120, 70, {toggleable = true, default = false, flag = "Slider_Flag", fireontoggle = true, fireondrag = true, rounded = true}, function(val, bool)
	if bool then
      game:GetService("Workspace").Camera.FieldOfView = val
   else
      game:GetService("Workspace").Camera.FieldOfView = 70
   end
end)





local Section = Game_Tab:AddSection("Visuals", {default = false})
local SubSection = Section:AddSubSection("Esp", {default = false})
local Toggle = SubSection:AddToggle("Innocents", {flag = "Toggle_Flag", default = false}, function(bool)
	print("Toggle set to:", bool)
end)
local Toggle = SubSection:AddToggle("Murderer", {flag = "Toggle_Flag", default = false}, function(bool)
	print("Toggle set to:", bool)
end)
local Toggle = SubSection:AddToggle("Sheriff", {flag = "Toggle_Flag", default = false}, function(bool)
	print("Toggle set to:", bool)
end)
local SubSection = Section:AddSubSection("Chams", {default = false})
local Toggle = SubSection:AddToggle("Innocents", {flag = "Toggle_Flag", default = false}, function(bool)
	print("Toggle set to:", bool)
end)
local Toggle = SubSection:AddToggle("Murderer", {flag = "Toggle_Flag", default = false}, function(bool)
	print("Toggle set to:", bool)
end)
local Toggle = SubSection:AddToggle("Sheriff", {flag = "Toggle_Flag", default = false}, function(bool)
	print("Toggle set to:", bool)
end)
local Toggle = Section:AddToggle("X-Ray", {flag = "Toggle_Flag", default = false}, function(bool)
   module:xray(bool)
end)



local Section = Game_Tab:AddSection("GameMods", {default = false})
local SubSection = Section:AddSubSection("Gun", {default = false})
local Button = SubSection:AddButton("Break Gun", function()
	module:gun("break")
end)
local Toggle = SubSection:AddToggle("Loop Break Gun", {flag = "Toggle_Flag", default = false}, function(bool)
	GLoopBreakGun = bool
	while GLoopBreakGun do
		module:gun("break")
		task.wait()
	end
end)
local Button = SubSection:AddButton("Fake Gun", function()
	module:gun("fake")
end)
local SubSection = Section:AddSubSection("Knife", {default = false})
local SubSection = Section:AddSubSection("Perks", {default = false})
local Toggle = SubSection:AddToggle("Infinite Ghost", {flag = "Toggle_Flag", default = false}, function(bool)
	module:ghost(bool)
end)
local Toggle = SubSection:AddToggle("Sprint Trail", {flag = "Toggle_Flag", default = false}, function(bool)
	module:sprint(bool)
end)
local SubSection = Section:AddSubSection("Traps", {default = false})
local Button = SubSection:AddButton("Place", function()
	module:trap("place")
end)
local Button = SubSection:AddButton("Murderer", function()
	module:trap("murderer")
end)
local Button = SubSection:AddButton("Sheriff", function()
	module:trap("sheriff")
end)
local Button = SubSection:AddButton("Destroy", function()
	module:trap("destroy")
end)
local Toggle = SubSection:AddToggle("Loop", {flag = "Toggle_Flag", default = false}, function(bool)
	GLoopTrapAll = bool
		while GLoopTrapAll do
			if bool then
				local ws = game:GetService("Workspace")
				local ps = game:GetService("Players")
				for i,v in pairs(ws:GetChildren()) do
					if v:FindFirstChild("HumanoidRootPart") then
						local cf = v.HumanoidRootPart.CFrame
						local ReplicatedStorage = game:GetService("ReplicatedStorage")
						local function getCFrame(cfargs)
							local serial = {cfargs:GetComponents()}
							local deserial = CFrame.new(table.unpack(serial))
							return serial, deserial
						end
						local serial, deserial = getCFrame(cf)
						ReplicatedStorage.TrapSystem.PlaceTrap:InvokeServer(deserial)
					end
				end
			end
		end
end)



local Section = Game_Tab:AddSection("Emotes", {default = false})
local Button = Section:AddButton("Sit", function()
	module:emote("sit")
end)
local Button = Section:AddButton("Ninja", function()
	module:emote("ninja")
end)
local Button = Section:AddButton("Dab", function()
	module:emote("dab")
end)
local Button = Section:AddButton("Floss", function()
	module:emote("floss")
end)
local Button = Section:AddButton("Zen", function()
	module:emote("zen")
end)
local Button = Section:AddButton("Zombie", function()
	module:emote("zombie")
end)
local Button = Section:AddButton("Headless", function()
	module:emote("headless")
end)


local Section = Game_Tab:AddSection("Teleport", {default = false})
local Button = Section:AddButton("Lobby", function()
	module:teleport("lobby")
end)
local Button = Section:AddButton("Voting Room", function()
	module:teleport("voting room")
end)
local Button = Section:AddButton("Map", function()
	module:teleport("map")
end)



local Settings_Tab = Window:AddTab("Settings", {default = false})
