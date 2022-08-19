repeat task.wait() until game:IsLoaded() and game:GetService("Players").LocalPlayer.Character

local Library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local module = loadstring(game:HttpGet(('https://raw.githubusercontent.com/clevsgm/clevs/main/nds/module.lua')))()
local Window = Library:MakeWindow({Name = "clevs", HidePremium = false, SaveConfig = true, ConfigFolder = "clevsTest", IntroText = "clevs", IntroIcon = "rbxassetid://1335094140"})

GJumping = false

local Tab = Window:MakeTab({
   Name = "Main",
	Icon = "rbxassetid://7992557358",
	PremiumOnly = false
})
Tab:AddButton({
	Name = "Remove Fall Damage",
	Callback = function()
      module:remove_fall_damage()
  	end
})
Tab:AddSlider({
	Name = "WalkSpeed",
	Min = 16,
	Max = 100,
	Default = 16,
	Color = Color3.fromRGB(50, 50, 50),
	Increment = 1,
	ValueName = "walkspeed",
	Callback = function(Value)
		game:GetService("Players").LocalPlayer.Character.Humanoid.WalkSpeed = Value
	end
})
Tab:AddSlider({
	Name = "Jump Power",
	Min = 50,
	Max = 150,
	Default = 50,
	Color = Color3.fromRGB(50, 50, 50),
	Increment = 1,
	ValueName = "jump power",
	Callback = function(Value)
		game:GetService("Players").LocalPlayer.Character.Humanoid.JumpPower = Value
	end
})
Tab:AddToggle({
	Name = "Infinite Jump",
	Default = false,
	Callback = function(Value)
		GJumping = Value
		game:GetService("UserInputService").JumpRequest:Connect(function()
			if GJumping then
				return game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
			end
		end)
	end
})


local modsTab = Window:MakeTab({
	Name = "Mods",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
local modSec = modsTab:AddSection({Name = "🔹 Size"})

local tiny =  modSec:AddButton({
	Name = "Tiny",
	Callback = function()
      module:tiny()
  	end
})
local tall = modSec:AddButton({
	Name = "Tall",
	Callback = function()
      module:tall()
  	end
})

local modsSection2 = modsTab:AddSection({Name = "🔹 Coming Soon"})
local comingsoon = modsSection2:AddButton({
	Name = "Coming Soon",
	Callback = function()
      print("button pressed")
  	end
})


local tpTab = Window:MakeTab({Name = "Teleport", Icon = "rbxassetid://3192485344", PremiumOnly = false})
local SectionTab5 = tpTab:AddSection({Name = "🔹 Server"})
SectionTab5:AddButton({Name = "Rejoin",
	Callback = function()
		game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId,game.JobId, game:GetService("TeleportService"))
  	end
})
SectionTab5:AddButton({Name = "Hop Servers",
	Callback = function()
		game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer)
  	end
})


local SettingsTab = Window:MakeTab({Name = "Settings", Icon = "rbxassetid://1185031129", PremiumOnly = false})
local SettingsSection = SettingsTab:AddSection({Name = "🔹 Graphics"})
SettingsSection:AddButton({Name = "Graphics Enhancer",
	Callback = function()
      loadstring(game:HttpGet('https://raw.githubusercontent.com/clevsgm/scripts/main/Graphics%20Enhancer.lua'))()
  	end
})
SettingsSection:AddButton({Name = "HD Graphics",
	Callback = function()
      loadstring(game:HttpGet('https://raw.githubusercontent.com/clevsgm/scripts/main/HD%20Graphics.lua'))()
  	end
})
SettingsSection:AddButton({Name = "No Textures (Low GFX)",
	Callback = function()
	   loadstring(game:HttpGet('https://raw.githubusercontent.com/clevsgm/scripts/main/No%20Textures.lua'))()
  	end
})

Library:Init()
