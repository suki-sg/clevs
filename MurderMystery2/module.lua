local module = {}

local ws = game:GetService("Workspace")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local lp = Players.LocalPlayer
local wslp = ws[lp.Name]
local RunService = game:GetService("RunService")

local function notif()
   game:GetService("StarterGui"):SetCore("SendNotification", {
      Title = "Title",
      Text = "Message",
      Icon = "rbxassetid://6238537240",
      Duration = 5,
   })
end


local function getMurderer()
   for i,v in pairs(ws:GetChildren()) do
      for i,v in pairs(v:GetChildren()) do
         if v.Name == "Knife" then
            return v.Parent, "Workspace"
         end
      end
   end
   for i,v in pairs(Players:GetChildren()) do
      for i,v in pairs(v.Backpack:GetChildren()) do
         if v.Name == "Knife" then
            return v.Parent.Parent, "Players"
         end
      end
   end
end
local function getSheriff()
   for i,v in pairs(ws:GetChildren()) do
      for i,v in pairs(v:GetChildren()) do
         if v.Name == "Gun" then
            return v.Parent, "Workspace"
         end
      end
   end
   for i,v in pairs(Players:GetChildren()) do
      for i,v in pairs(v.Backpack:GetChildren()) do
         if v.Name == "Gun" then
            return v.Parent.Parent, "Players"
         end
      end
   end
end
local function SpawnsFinder()
   for i,v in pairs(ws:GetChildren()) do
      if v:FindFirstChild("Spawns") and v.Name ~= "Lobby" then
         return v
      end
   end
end
local function getCompsCF(args)
   local serial = {args:GetComponents()}
   local deserial = CFrame.new(table.unpack(serial))
   return serial, deserial
end

function module:emote_play(args)--Done
   game:GetService("ReplicatedStorage").Remotes.Misc.PlayEmote:Fire(args)
end

function module:trap(args)
   local trapsys = ReplicatedStorage.TrapSystem.PlaceTrap

   if args == "place" then
      local serial, deserial = getCompsCF(wslp.HumanoidRootPart.CFrame)
		ReplicatedStorage.TrapSystem.PlaceTrap:InvokeServer(deserial)
   elseif args == "murderer" then
      local Murderer ,Origin = module:getMurderer()
      if Murderer then
         local serial, deserial = getCompsCF(Murderer.HumanoidRootPart.CFrame or ws[Murderer.Name].HumanoidRootPart.CFrame)
         ReplicatedStorage.TrapSystem.PlaceTrap:InvokeServer(deserial)
      else
         game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "Trap Service",
            Text = "Murderer was not found",
            Icon = "rbxassetid://1335094140",
            Duration = 5,
         })
      end
   elseif args == "sheriff" then
      local Sheriff, Origin = module:getSheriff()
      if Sheriff then
         local serial, deserial = getCompsCF(Sheriff.HumanoidRootPart.CFrame or ws[Sheriff.Name].HumanoidRootPart.CFrame)
         trapsys:InvokeServer(deserial)
      else
         game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "Trap Service",
            Text = "Sheriff was not found",
            Icon = "rbxassetid://1335094140",
            Duration = 5,
         })
      end
   elseif args == "destroy" then
      for i,v in pairs(wslp:GetChildren()) do
			if v.Name == "Trap" then
				v:Destroy()
			end
		end
	else
      game:GetService("StarterGui"):SetCore("SendNotification", {
         Title = "Trap Service",
         Text = "Invalid Arguments",
         Icon = "rbxassetid://1335094140",
         Duration = 5,
      })
   end
end

function module:gun(args)
   local Sheriff, Origin = module:getSheriff()
   if args == "break gun" then
      if Origin == "Workspace" then
         Sheriff.Gun.KnifeServer.ShootGun:InvokeServer(1,"1,1,1", "AH")
      end
   elseif args == "fake" then
      ReplicatedStorage.Remotes.Gameplay.FakeGun:FireServer(true)
   elseif args == "loop break gun" then
      print("Not finished")
   end
end

function module:tp2map(args)
	local hrp = wslp.HumanoidRootPart
	if args == "lobby" then
		hrp.CFrame = CFrame.new(-107.80003356933594, 137.3238525390625, 34.399967193603516)
	elseif args == "voting room" then
		hrp.CFrame = CFrame.new(-108.37427520751953, 139.67385864257812, 83.54652404785156)
	elseif args == "map" then
		local map = SpawnsFinder()
		if map then
			local Check = "Spawn" or "PlayerSpawn"
			local Spawns = map.Spawns
			local mapX = Spawns[Check].CFrame.X
			local mapY = Spawns[Check].CFrame.Y + 1
			local mapZ = Spawns[Check].CFrame.Z
			hrp.CFrame = CFrame.new(mapX, mapY, mapZ)
		else
			hrp.CFrame = CFrame.new(-107.80003356933594, 137.3238525390625, 34.399967193603516)
         game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "Teleport Service",
            Text = "Map was not found\nYou were Teleported to the lobby",
            Icon = "rbxassetid://1335094140",
            Duration = 5,
         })
		end
	end
end

function module:CrashServer()
   game:GetService("StarterGui"):SetCore("SendNotification", {
      Title = "Crash Service",
      Text = "Crash Server has started and it cannot be stopped",
      Icon = "rbxassetid://1335094140",
      Duration = 5,
   })
	RunService.RenderStepped:Connect(function()
		if not ws[lp.Name]:FindFirstChild("SnowballToy2020") and not lp.Backpack:FindFirstChild("SnowballToy2020") then
			ReplicatedStorage.Remotes.Extras.ReplicateToy:InvokeServer("SnowballToy2020")
			task.wait()
			local tool = lp.Backpack.SnowballToy2020
			task.wait()
			lp.Character.Humanoid:EquipTool(tool)
		elseif lp.Backpack:FindFirstChild("SnowballToy2020") and not ws[lp.Name]:FindFirstChild("SnowballToy2020") then
			local tool = lp.Backpack.SnowballToy2020
			lp.Character.Humanoid:EquipTool(tool)
		elseif ws[lp.Name]:FindFirstChild("SnowballToy2020") then
			local args = {
				[1] = CFrame.new(1, 1, 1) * CFrame.Angles(-0, 0, -0),
				[2] = Vector3.new(1, 1, 1)
			}
			game:GetService("Players").LocalPlayer.Character.SnowballToy2020.Throw:FireServer(unpack(args))
		end	
	end)
end

function module:xray(bool)
   local function modpart(part)
       if bool then
           part.LocalTransparencyModifier = 0.8
       else
           part.LocalTransparencyModifier = 0
       end
   end
   local function research(object)
       if object:IsA("BasePart") then
           modpart(object)
       end

       if object:FindFirstChildOfClass("Humanoid") then return end

       for _, child in pairs(object:GetChildren()) do
           research(child)
       end
   end
   research(workspace)
end

function module:ghost(bool)
   if game:GetService("ReplicatedStorage"):FindFirstChild("Remotes") then
      if game:GetService("ReplicatedStorage").Remotes.Gameplay:FindFirstChild("Stealth") then
         game:GetService("ReplicatedStorage").Remotes.Gameplay.Stealth:FireServer(bool)
      end
   else
      game:GetService("StarterGui"):SetCore("SendNotification", {
         Title = "Perk Service",
         Text = "You must own 'Ghost' to use this feature",
         Icon = "rbxassetid://1335094140",
         Duration = 5,
      })
   end
end

function module:trail(bool)
   if wslp:FindFirstChild("SpeedTrail") then
      wslp.SpeedTrail.Toggle:FireServer(bool)
   end
end

return module
