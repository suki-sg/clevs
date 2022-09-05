module = {}

local function getMurderer()
   local ws = game:GetService("Workspace")
   for i,v in pairs(ws:GetChildren()) do
      for i,v in pairs(v:GetChildren()) do
         if v.Name == "Knife" then
            return v.Parent, "Workspace"
         end
      end
   end
   local ps = game:GetService("Players")
   for i,v in pairs(ps:GetChildren()) do
      for i,v in pairs(v.Backpack:GetChildren()) do
         if v.Name == "Knife" then
            return v.Parent.Parent, "Players"
         end
      end
   end
   return nil
end
local function getSheriff()
   local ws = game:GetService("Workspace")
   for i,v in pairs(ws:GetChildren()) do
      for i,v in pairs(v:GetChildren()) do
         if v.Name == "Gun" then
            return v.Parent, "Workspace"
         end
      end
   end
   local ps = game:GetService("Players")
   for i,v in pairs(ps:GetChildren()) do
      for i,v in pairs(v.Backpack:GetChildren()) do
         if v.Name == "Gun" then
            return v.Parent.Parent, "Players"
         end
      end
   end
   return nil
end


function module:emote(args)
   if args then
      local rs = game:GetService("ReplicatedStorage")
      if rs:FindFirstChild("Remotes") then
         if rs.Remotes:FindFirstChild("Misc") then
            if rs.Remotes.Misc:FindFirstChild("PlayEmote") then
               rs.Remotes.Misc.PlayEmote:Fire(args)
            end
         end
      end
   end
end

function module:gun(args)
   if args then
      if string.lower(args) == "break" then
         local Sheriff, Origin = getSheriff()
         if Origin == "Workspace" then
            Sheriff.Gun.KnifeServer.ShootGun:InvokeServer(1,"1,1,1", "AH")
         end
      end
      if string.lower(args) == "fake" then
         game:GetService("ReplicatedStorage").Remotes.Gameplay.FakeGun:FireServer(true)
      end
   end
end

function module:teleport(args)
   if args then
      local ws = game:GetService("Workspace")
      local ps = game:GetService("Players")
      local wslp = ws[ps.LocalPlayer.Name]
      if string.lower(args) == "lobby" then
         wslp.HumanoidRootPart.CFrame = CFrame.new(-107.80003356933594, 137.3238525390625, 34.399967193603516)
      end
      if string.lower(args) == "voting room" then
         wslp.HumanoidRootPart.CFrame = CFrame.new(-108.37427520751953, 139.67385864257812, 83.54652404785156)
      end
      if string.lower(args) == "map" then
         local function getMap()
            for i,v in pairs(ws:GetChildren()) do
               if v:FindFirstChild("Spawns") and v.Name ~= "Lobby" then
                  return v
               end
            end
            return nil
         end
         local map = getMap()
         if map then
            local Spawns = map.Spawns
            local Key = "Spawn" or "PlayerSpawn"
            local x = Spawns[Key].CFrame.X
            local y = Spawns[Key].CFrame.Y +1
            local z = Spawns[Key].CFrame.Z
            wslp.HumanoidRootPart.CFrame = CFrame.new(x, y, z)
         else
            wslp.HumanoidRootPart.CFrame = CFrame.new(-107.80003356933594, 137.3238525390625, 34.399967193603516)
         end
      end
   end
end

function module:trap(args)
   if args then
      local ws = game:GetService("Workspace")
      local ps = game:GetService("Players")
      local ReplicatedStorage = game:GetService("ReplicatedStorage")
      local function getCFrame(cfargs)
         local serial = {cfargs:GetComponents()}
         local deserial = CFrame.new(table.unpack(serial))
         return serial, deserial
      end
      if string.lower(args) == "place" then
         local serial, deserial = getCFrame(ws[ps.LocalPlayer.Name].HumanoidRootPart.CFrame)
         ReplicatedStorage.TrapSystem.PlaceTrap:InvokeServer(deserial)
      end
      if string.lower(args) == "murderer" then
         local Murderer = getMurderer()
         if Murderer then
            local taget = Murderer.HumanoidRootPart or ws[Murderer.Name].HumanoidRootPart
            local serial, deserial = getCFrame(target.CFrame)
            ReplicatedStorage.TrapSystem.PlaceTrap:InvokeServer(deserial)
         end
      end
      if string.lower(args) == "sheriff" then
         local Sheriff = getSheriff()
         if Sheriff then
            local taget = Sheriff.HumanoidRootPart or ws[Sheriff.Name].HumanoidRootPart
            local serial, deserial = getCFrame(target.CFrame)
            ReplicatedStorage.TrapSystem.PlaceTrap:InvokeServer(deserial)
         end
      end
      if string.lower(args) == "destroy" then
         local ws = game:GetService("Workspace")
         local plr = game:GetService("Players").LocalPlayer
         for i,v in pairs(ws[plr.Name]:GetChildren()) do
            if v.Name == "Trap" then
               v:Destroy()
            end
         end
      end
   end
end

function module:xray(args)
   local function modpart(part)
      if args then
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

function module:ghost(args)
   local rs = game:GetService("ReplicatedStorage")
   if rs:FindFirstChild("Remotes") then
      if rs.Remotes:FindFirstChild("Gameplay") then
         if rs.Remotes.Gameplay:FindFirstChild("Stealth") then
            rs.Remotes.Gameplay.Stealth:FireServer(args)
         end
      end
   end
end

function module:sprint(args)
   local ws = game:GetService("Workspace")
   local ps = game:GetService("Players")
   if ws[ps.LocalPlayer.Name]:FindFirstChild("SpeedTrail") then
      ws[ps.LocalPlayer.Name].SpeedTrail.Toggle:FireServer(args)
   end
end

function module:crash_server()
   local RunService = game:GetService("RunService")
   RunService.RenderStepped:Connect(function()
      local ws = game:GetService("Workspace")
      local ps = game:GetService("Players")
      local lp = ps.LocalPlayer
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

return module
