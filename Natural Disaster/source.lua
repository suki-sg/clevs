repeat task.wait() until game:IsLoaded() and game:GetService("Players").LocalPlayer.Character 

local Library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local modules = loadstring(game:HttpGet(('https://raw.githubusercontent.com/clevsgm/clevs/main/Natural%20Disaster/module.lua')))()
local Window = Library:MakeWindow({Name = "clevs", HidePremium = false, SaveConfig = true, ConfigFolder = "clevsTest", IntroText = "clevs", IntroIcon = "rbxassetid://1335094140"})

--variables
local ws = game:GetService("Workspace")
local ps = game:GetService("Players")
local lp = ps.LocalPlayer
local wslp = ws[lp.Name]
local TeleportService = game:GetService("TeleportService")

local function removeDamage()
    if wslp:FindFirstChild("FallDamageScript") then
        wslp.FallDamageScript:Destroy()
        Library:MakeNotification({
            Name = "Fall Damage",
            Content = "No Fall Damage Applied.",
            Image = "rbxassetidt://4483345998",
            Time = 5
        })
    end
end

local Tab = Window:MakeTab({Name = "Player", Icon = "rbxassetid://7992557358" ,PremiumOnly = false})
local Section = Tab:AddSection({Name = "🔹 Local Player"})
Tab:AddSlider({Name = "Walk Speed",
	Min = 16,
	Max = 150,
	Default = 16,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "Jump Power",
	Callback = function(Value)
        lp.Character.Humanoid.WalkSpeed = Value
	end    
})
Tab:AddSlider({Name = "Jump Power",
	Min = 50,
	Max = 200,
	Default = 50,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "Jump Power",
	Callback = function(Value)
        lp.Character.Humanoid.JumpPower = Value
	end    
})
Tab:AddToggle({Name = "Infinite Jump",
	Default = false,
	Callback = function(Value)
		GJumping = Value
		game:GetService("UserInputService").JumpRequest:Connect(function()
			if GJumping then
				return ps.LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
			end
		end)
	end    
})
Tab:AddSlider({Name = "Gravity",
	Min = 0,
	Max = 196,
	Default = 196,
	Color = Color3.fromRGB(135,206,235),
	Increment = 1,
	ValueName = "Gravity",
	Callback = function(Value)
		ws.Gravity = Value
	end    
})

local Tab2 = Window:MakeTab({Name = "Mods", Icon = "rbxassetid://4483345998", PremiumOnly = false})
local SectionTab2 = Tab2:AddSection({Name = "🔹 Game"})--Character
Tab2:AddButton({Name = "No Fall Damage",
	Callback = function()
        removeDamage()
  	end    
})
local Section22 = Tab2:AddSection({Name = "🔹 Size"})--Character
Tab2:AddButton({Name = "Tall",
	Callback = function()
        modules:tall()
  	end    
})
Tab2:AddButton({Name = "Tiny",
	Callback = function()
        modules:tiny()
  	end    
})

local Tab5 = Window:MakeTab({Name = "Teleport", Icon = "rbxassetid://3192485344", PremiumOnly = false})
local SectionTab5 = Tab5:AddSection({Name = "🔹 Server"})
Tab5:AddButton({Name = "Rejoin",
	Callback = function()
		TeleportService:TeleportToPlaceInstance(game.PlaceId,game.JobId,tps)
  	end    
})
Tab5:AddButton({Name = "Hop Servers",
	Callback = function()
		TeleportService:Teleport(game.PlaceId, lp)
  	end    
})

local Tab6 = Window:MakeTab({Name = "Settings", Icon = "rbxassetid://1185031129", PremiumOnly = false})
local SectionTab6 = Tab6:AddSection({Name = "🔹 Graphics"})
Tab6:AddButton({Name = "Graphics Enhancer",
	Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/clevsgm/scripts/main/Graphics%20Enhancer.lua'))()
  	end
})
Tab6:AddButton({Name = "HD Graphics",
	Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/clevsgm/scripts/main/HD%20Graphics.lua'))()
  	end
})
Tab6:AddButton({Name = "No Textures (Low GFX)",
	Callback = function()
	    loadstring(game:HttpGet('https://raw.githubusercontent.com/clevsgm/scripts/main/No%20Textures.lua'))()
  	end
})

Library:Init()
