local Library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = Library:MakeWindow({Name = "clevs", HidePremium = false, SaveConfig = true, ConfigFolder = "clevsTest", IntroText = "clevs", IntroIcon = "rbxassetid://9415533863"})

local Tab1 = Window:MakeTab({Name = "Local Player", Icon = "rbxassetid://7992557358", PremiumOnly = false})
local Section = Tab1:AddSection({Name = "♦ Character"})
local sldws = Tab1:AddSlider({Name = "WalkSpeed",
	Min = 16,
	Max = 100,
	Default = 16,
	Color = Color3.fromRGB(135,206,235),
	Increment = 1,
	ValueName = "",
	Callback = function(Value)
		local negros = game:GetService("Players")
		local negro1 = negros.LocalPlayer
		negro1.Character.Humanoid.WalkSpeed = Value
	end    
})
local sldjp = Tab1:AddSlider({Name = "Jump Power",
	Min = 50,
	Max = 200,
	Default = 50,
	Color = Color3.fromRGB(135,206,235),
	Increment = 1,
	ValueName = "",
	Callback = function(Value)
		local negros = game:GetService("Players")
		local negro1 = negros.LocalPlayer
		negro1.Character.Humanoid.JumpPower = Value
	end    
})
local Section = Tab1:AddSection({Name = "♦ Camera"})
Tab1:AddSlider({Name = "FOV",
	Min = 70,
	Max = 120,
	Default = 70,
	Color = Color3.fromRGB(135,206,235),
	Increment = 1,
	ValueName = "Field Of View",
	Callback = function(Value)
		local cam = game:GetService("Workspace").Camera
		cam.FieldOfView = Value
	end    
})

local Tab2 = Window:MakeTab({Name = "Visuals", Icon = "rbxassetid://6523858394", PremiumOnly = false})
local Section = Tab2:AddSection({Name = "♦ Esp:"})
Tab2:AddToggle({Name = "Esp Innocents - NJ",-- No Jala
	Default = false,
	Callback = function(Value)
		print(Value)
	end    
})
Tab2:AddToggle({Name = "Esp Murderer - NJ",--No Jala
	Default = false,
	Callback = function(Value)
		print(Value)
	end    
})
Tab2:AddToggle({Name = "Esp Sheriff - NJ",-- No Jala
	Default = false,
	Callback = function(Value)
		print(Value)
	end    
})

local Section = Tab2:AddSection({Name = "♦ Perks:"})
local waza = Tab2:AddToggle({Name = "Ghost",
	Default = false,
	Callback = function(Value)
		game:GetService("ReplicatedStorage").Remotes.Gameplay.Stealth:FireServer(Value)
	end    
})
local tgst = Tab2:AddToggle({Name = "Sprint Trail",
	Default = false,
	Callback = function(Value)
		local negros = game:GetService("Players")
		local negro1 = negros.LocalPlayer
		game:GetService("Workspace")[negro1.Name].SpeedTrail.Toggle:FireServer(Value)
	end    
})
Tab2:AddButton({Name = "Fake Gun",
	Callback = function()
		te_trolie()
  	end    
})
local Section = Tab2:AddSection({Name = "♦ Traps"})
Tab2:AddButton({Name = "Place Trap",
	Callback = function()
		atrapada()
  	end    
})
Tab2:AddButton({Name = "Trap Murderer",
	Callback = function()
		atrapada_asesine()
  	end    
})
Tab2:AddButton({Name = "Trap Sheriff/Hero",
	Callback = function()
		atrapada_chota()
  	end    
})
Tab2:AddButton({Name = "Destroy Traps",
	Callback = function()
		remover_atrapades()
  	end    
})


local Tab3 = Window:MakeTab({Name = "Game Mods",Icon = "rbxassetid://1557343445",PremiumOnly = false})
Tab3:AddParagraph("NOTA!","ME DA PAJA.")
local Section = Tab3:AddSection({Name = "♦ Innocent"})
Tab3:AddButton({Name = "Grab Gun - NJ",
	Callback = function()
		warn("NOT AVAILABLE FOR THE MOMENT")
  	end    
})

local Section = Tab3:AddSection({Name = "♦ Sheriff"})

local Section = Tab3:AddSection({Name = "♦ Murderer"})


local Tab4 = Window:MakeTab({Name = "Emotes", Icon = "rbxassetid://6567073136", PremiumOnly = false})
Tab4:AddButton({Name = "Sit", 
	Callback = function()
    	emotiza("sit")
  	end    
})
Tab4:AddButton({Name = "Ninja", 
	Callback = function()
		emotiza("ninja")
  	end    
})
Tab4:AddButton({Name = "Dab", 
	Callback = function()
		emotiza("dab")
  	end    
})
Tab4:AddButton({Name = "Floss", 
	Callback = function()
    	emotiza("floss")
  	end    
})
Tab4:AddButton({Name = "Zen", 
	Callback = function()
    	emotiza("zen")
  	end    
})
Tab4:AddButton({Name = "Zombie", 
	Callback = function()
    	emotiza("zombie")
  	end    
})
Tab4:AddButton({Name = "Headless", 
	Callback = function()
    	emotiza("headless")
  	end    
})


local Tab5 = Window:MakeTab({Name = "Teleport", Icon = "rbxassetid://3192485344", PremiumOnly = false})
local Section = Tab5:AddSection({Name = "♦ Map"})
Tab5:AddButton({Name = "Lobby ",
	Callback = function()
		tepe_mapa("lobby")
  	end    
})
Tab5:AddButton({Name = "Voting Room",
	Callback = function()
		tepe_mapa("voting room")
  	end    
})
Tab5:AddButton({Name = "Map",
	Callback = function()
		tepe_mapa("map")
  	end    
})

local Section = Tab5:AddSection({Name = "♦ Player"})
local aaashitbro = Tab5:AddTextbox({Name = "Player:",
	Default = "Text",
	TextDisappear = false,
	Callback = function(Value)
		print(Value)
	end	  
})
Tab5:AddButton({Name = "Teleport",
	Callback = function()
		print(aaashitbro)
  	end    
})
local idkBro = Tab5:AddDropdown({Name = "Select Player - ⚠.",
	Default = "",
	Options = {"Player1", "Player2"},
	Callback = function(Value)
		print(Value)
	end    
})
Tab5:AddButton({Name = "Refresh - ⚠",
	Callback = function()
		local plrs = game:GetService("Players")
		for i,v in pairs(plrs:GetChildren()) do
			local lista = {}
			table.insert(lista, v.Name)
			print(table.unpack(lista))
			idkBro:Refresh(table.unpack(lista), true)
		end
  	end    
})
local Section = Tab5:AddSection({Name = "♦ Server"})
Tab5:AddButton({Name = "Rejoin",
	Callback = function()
		local tps = game:GetService("TeleportService")
		tps:TeleportToPlaceInstance(game.PlaceId,game.JobId,tps)
  	end    
})
Tab5:AddButton({Name = "Hop Servers",
	Callback = function()
		local tps = game:GetService("TeleportService")
		local yo = game.Players.LocalPlayer
		tps:Teleport(game.PlaceId, yo)
  	end    
})


local Tab7 = Window:MakeTab({Name = "Autofarm", Icon = "rbxassetid://4602932763", PremiumOnly = false})
Tab7:AddParagraph("⚠ NOTA!","ME DA PAJA.")

local Section = Tab7:AddSection({Name = "♦ Autofarm"})

local Section = Tab7:AddSection({Name = "♦ Crates"})
local selectedCrate = Tab7:AddDropdown({Name = "Select Crate",
	Default = "Mystery Box #1",
	Options = {"MysteryBox1", "MysteryBox2", "KnifeBox1", "KnifeBox2", "KnifeBox3", "KnifeBox4", "KnifeBox5", "GunBox1", "GunBox2", "GunBox3", "MLG Box"},
	Callback = function(Value)
		print(Value)
	end    
})


local Tab8 = Window:MakeTab({Name = "Settings", Icon = "rbxassetid://1185031129", PremiumOnly = false})
local Section = Tab8:AddSection({Name = "♦ Keybinds"})
Tab8:AddBind({Name = "Zen",
	Default = Enum.KeyCode.Z,
	Hold = false,
	Callback = function()
		emotiza("zen")
	end    
})
Tab8:AddBind({Name = "Toggle Ghost",
	Default = Enum.KeyCode.V,
	Hold = false,
	Callback = function()
		if waza.Value == true then
			waza:Set(false)
		else
			waza:Set(true)
		end
	end    
})
Tab8:AddBind({Name = "Place Trap",
	Default = Enum.KeyCode.T,
	Hold = false,
	Callback = function()
		atrapada()
	end    
})
Tab8:AddBind({Name = "Destroy Traps",
	Default = Enum.KeyCode.Y,
	Hold = false,
	Callback = function()
		remover_atrapades()
	end    
})
Tab8:AddBind({Name = "Fake Sprint",
	Default = Enum.KeyCode.LeftControl,
	Hold = true,
	Callback = function(bool)
		if bool then
			sldws:Set(24)
			tgst:Set(true)
		else
			sldws:Set(16)
			tgst:Set(false)
		end
	end    
})

-- About
local Tab9 = Window:MakeTab({Name = "About", Icon = "rbxassetid://7059344100", PremiumOnly = false})
Tab9:AddParagraph("⚠ NOTA!","Ni idea por que agregue esto mano se me fueron las ideas                   (Es relleno pa)")

--[[ FUNCIONES ]]
function emotiza(insana)-- JALA
    game:GetService("ReplicatedStorage").Remotes.Misc.PlayEmote:Fire(insana)
end

function atrapada()-- JALA
	local ws = game:GetService("Workspace")
	local ps = game:GetService("Players")
	local lp = ps.LocalPlayer
	local wslp = ws[lp.Name]
	local cf = wslp.HumanoidRootPart.CFrame
	local ser = {cf:GetComponents()}
	local des = CFrame.new(table.unpack(ser))
	game:GetService("ReplicatedStorage").TrapSystem.PlaceTrap:InvokeServer(des)
end

function te_trolie()-- JALA
    -- GUN FALSA
    game:GetService("ReplicatedStorage").Remotes.Gameplay.FakeGun:FireServer(true)
end

function tepe_mapa(Name)-- al rato lo termino
    local ps = game:GetService("Players")
    local lp = ps.LocalPlayer
    local hrp = lp.Character.HumanoidRootPart
	local ws = game:GetService("Workspace")

	local function obtenerDatosDeMapa()
		for i,v in pairs(ws:GetChildren()) do
			if v.Name == "BioLab" then
				return v, "maincra"
			elseif v.Name =="Factory" then
				return v, "maincra"
			elseif v.Name == "Bank2" then
				return v, "maincra"
			end
		end
	end

	if Name == "lobby" then
		hrp.CFrame = CFrame.new(-107.80003356933594, 138.3238525390625, 34.399967193603516)
	elseif Name == "voting room" then
		hrp.CFrame = CFrame.new(-108.37427520751953, 140.67385864257812, 83.54652404785156)
	elseif Name == "map" then
		local n,c = obtenerDatosDeMapa()
		print(n,c)
	else
		warn("Error")
	end

	--[[
    if Name == "lobby" then
        hrp.CFrame = CFrame.new(-107.80003356933594, 138.3238525390625, 34.399967193603516)
    elseif Name == "voting room" then
        hrp.CFrame = CFrame.new(-108.37427520751953, 140.67385864257812, 83.54652404785156)
    elseif Name == "map" then
		for i,v in pairs(ws:GetChildren()) do
			if v.Name == "MilBase" then
				local cf = v.Spawns.Spawn.CFrame
				local ser = {cf:GetComponents()}
				hrp.CFrame = CFrame.new(table.unpack(ser))
				return
			elseif v.Name == "Mansion2" then
				local cf = v.Spawns.Spawn.CFrame
				local ser = {cf:GetComponents()}
				hrp.CFrame = CFrame.new(table.unpack(ser))
				return
			elseif v.Name == "Hotel2" then
				local cf = v.Spawns.Spawn.CFrame
				local ser = {cf:GetComponents()}
				hrp.CFrame = CFrame.new(table.unpack(ser))
				return
			elseif v.Name == "House2" then
				local cf = v.Spawns.Spawn.CFrame
				local ser = {cf:GetComponents()}
				hrp.CFrame = CFrame.new(table.unpack(ser))
				return
			elseif v.Name == "PoliceStation" then
				local cf = v.Spawns.Spawn.CFrame
				local ser = {cf:GetComponents()}
				hrp.CFrame = CFrame.new(table.unpack(ser))
				return
			elseif v.Name == "Factory" then
				local cf = v.Spawns.Spawn.CFrame
				local ser = {cf:GetComponents()}
				hrp.CFrame = CFrame.new(table.unpack(ser))
				return
			elseif v.Name == "Bank2" then
				local cf = v.Spawns.Spawn.CFrame
				local ser = {cf:GetComponents()}
				hrp.CFrame = CFrame.new(table.unpack(ser))
				return
			elseif v.Name == "BioLab" then
				local cf = v.Spawns.Spawn.CFrame
				local ser = {cf:GetComponents()}
				hrp.CFrame = CFrame.new(table.unpack(ser))
				return
			elseif v.Name == "nSOffice" then
				local cf = v.Spawns.Spawn.CFrame
				local ser = {cf:GetComponents()}
				hrp.CFrame = CFrame.new(table.unpack(ser))
				return
			elseif v.Name == "Office3" then
				local cf = v.Spawns.Spawn.CFrame
				local ser = {cf:GetComponents()}
				hrp.CFrame = CFrame.new(table.unpack(ser))
				return
			elseif v.Name == "ResearchFacility" then
				local cf = v.Spawns.PlayerSpawn.CFrame
				local ser = {cf:GetComponents()}
				hrp.CFrame = CFrame.new(table.unpack(ser))
				return
			elseif v.Name == "Workplace" then
				local cf = v.Spawns.Spawn.CFrame
				local ser = {cf:GetComponents()}
				hrp.CFrame = CFrame.new(table.unpack(ser))
				return
			elseif v.Name == "Hospital3" then
				local cf = v.Spawns.Spawn.CFrame
				local ser = {cf:GetComponents()}
				hrp.CFrame = CFrame.new(table.unpack(ser))
				return
			elseif v.Name == "Hotel" then
				local cf = v.Spawns.Spawn.CFrame
				local ser = {cf:GetComponents()}
				hrp.CFrame = CFrame.new(table.unpack(ser))
				return
			end
		end
    end
	]]
end

function atrapada_asesine() -- JALA
	local ws = game:GetService("Workspace")
	local ps = game:GetService("Players") 
	
	local function obtenerAsesine()
		for i,v in pairs(ws:GetChildren()) do
			for i,v in pairs(v:GetChildren()) do
				if v.Name == "Knife" then
					return v.Parent
				end
			end
		end
		for i,v in pairs(ps:GetChildren()) do
			for i,v in pairs(v.Backpack:GetChildren()) do
				if v.Name == "Knife" then
					return v.Parent.Parent
				end
			end
		end
	end
	
	local Asesino = obtenerAsesine()
	
	if Asesino == nil then
		Library:MakeNotification({Name = "Trap Service",
			Content = "Asesine no encontrado",
			Image = "rbxassetid://4483345998",
			Time = 2.5
		})
	else
		local cf = ws[Asesino.Name].HumanoidRootPart.CFrame
		local ser = {cf:GetComponents()}
		local des = CFrame.new(table.unpack(ser))
		game:GetService("ReplicatedStorage").TrapSystem.PlaceTrap:InvokeServer(des)
	end
end

function atrapada_chota()-- JALA
	local ws = game:GetService("Workspace")
	local ps = game:GetService("Players") 
	
	local function obtener_chota()
		for i,v in pairs(ws:GetChildren()) do
			for i,v in pairs(v:GetChildren()) do
				if v.Name == "Gun" then
					return v.Parent
				end
			end
		end
		for i,v in pairs(ps:GetChildren()) do
			for i,v in pairs(v.Backpack:GetChildren()) do
				if v.Name == "Gun" then
					return v.Parent.Parent
				end
			end
		end
	end
	
	local chota = obtener_chota()
	
	if chota == nil then
		Library:MakeNotification({Name = "Trap Service",
			Content = "Sheriff no encontrado",
			Image = "rbxassetid://4483345998",
			Time = 2.5
		})
	else
		local cf = ws[chota.Name].HumanoidRootPart.CFrame
		local ser = {cf:GetComponents()}
		local des = CFrame.new(table.unpack(ser))
		game:GetService("ReplicatedStorage").TrapSystem.PlaceTrap:InvokeServer(des)
	end
end

function remover_atrapades()-- JALA
	local ws = game:GetService("Workspace")
	local ps = game:GetService("Players")
	local lp = ps.LocalPlayer
	local wslp = ws[lp.Name]
	for i,v in pairs(wslp:GetChildren()) do
		if v.Name == "Trap" then
			v:Destroy()
		end
	end
end

function abrirCajitaFeliz(Cajita)
	local Tipo = "MysteryBox"
	local Pago = "Coins"
	game:GetService("ReplicatedStorage").Remotes.Shop.OpenCrate:InvokeServer(Cajita, Tipo, Pago)
end

function wea1()
	local ws = game:GetService("Workspace")
	local ps = game:GetService("Players")
	local lp = ps.LocalPlayer
	local wslp = ws[lp.Name]

	local bullets = 1
	local ohVector32 = Vector3.new(-3376.71484375, 30.004261016845703, 2778.536376953125)
	local text = "AH"

	wslp.Gun.KnifeServer.ShootGun:InvokeServer(bullets, ohVector32, text)
end

function wea2()
	game:GetService("Players").LocalPlayer.Backpack.Knife.Stab:FireServer("Slash")
end

function wea3()
	local ws = game:GetService("Workspace")
	local ps = game:GetService("Players")
	local lp = ps.LocalPlayer
	local hrp = lp.Character.HumanoidRootPart

	local cX = hrp.CFrame.X
	local cY = hrp.CFrame.Y
	local cZ = hrp.CFrame.Z

	local gcf = ws:GetChildren("GunDrop").CFrame

	if ws:FindFirstChild("GunDrop") then
		hrp.CFrame = gcf
		wait(0.25)
		hrp.CFrame = CFrame.new(cX, cY, cZ)
	else
		Library:MakeNotification({
			Name = "Grab Gun",
			Content = "There's no Gun Dropped",
			Image = "rbxassetid://4483345998",
			Time = 2.5
		})	
	end
end

Library:Init()
