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
