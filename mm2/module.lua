local module = {}
local notify = loadstring(game:HttpGet('https://raw.githubusercontent.com/clevsgm/clevs/main/notify.lua'))()

-- local functions 
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

--module functions
function module:emote_play(args)
   game:GetService("ReplicatedStorage").Remotes.Misc.PlayEmote:Fire(args)
end

function module:gun(args)
   
   if args == "break" then

      local Sheriff, Origin = getSheriff()

      if Origin == "Workspace" then
         Sheriff.Gun.KnifeServer.ShootGun:InvokeServer(1,"1,1,1", "AH")
      end

   end

   if args == "fake" then
      game:GetService("ReplicatedStorage").Remotes.Gameplay.FakeGun:FireServer(true)
   end

   if args == "test" then
      print("Testing")
   end

end

function module:teleport(args)

   local ws = game:GetService("Workspace")
   local ps = game:GetService("Players")
   local wslp = ws[ps.LocalPlayer.Name]

   if args == "lobby" then
      wslp.HumanoidRootPart.CFrame = CFrame.new(-107.80003356933594, 137.3238525390625, 34.399967193603516)
   end

   if args == "voting room" then
      wslp.HumanoidRootPart.CFrame = CFrame.new(-108.37427520751953, 139.67385864257812, 83.54652404785156)
   end

   if args == "map" then

      local function findMap()
         for i,v in pairs(ws:GetChildren()) do
            if v:FindFirstChild("Spawns") and v.Name ~= "Lobby" then
               return v
            end
         end
         return nil
      end

      local currentMap = findMap()

      if currentMap then
         local Spawns = currentMap.Spawns
         local check = "Spawn" or "PlayerSpawn"

         local x = Spawns[check].CFrame.X
         local y = Spawns[check].CFrame.Y +1
         local z = Spawns[check].CFrame.Z
         wslp.HumanoidRootPart.CFrame = CFrame.new(x, y, z)

      else
         wslp.HumanoidRootPart.CFrame = CFrame.new(-107.80003356933594, 137.3238525390625, 34.399967193603516)
      end

   end

end

function module:perk(perk, args)
   
   if perk == "xray" then
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

   if perk == "ghost" then
      if game:GetService("ReplicatedStorage"):FindFirstChild("Remotes") then
         if game:GetService("ReplicatedStorage").Remotes.Gameplay:FindFirstChild("Stealth") then
            game:GetService("ReplicatedStorage").Remotes.Gameplay.Stealth:FireServer(args)
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

   if perk == "sprint" then
      local ws = game:GetService("Workspace")
      local ps = game:GetService("Players")

      if ws[ps.LocalPlayer.Name]:FindFirstChild("SpeedTrail") then
         ws[ps.LocalPlayer.Name].SpeedTrail.Toggle:FireServer(args)
      end
   end

   if perk == "trap" then
      local ws = game:GetService("Workspace")
      local ps = game:GetService("Players")
      local ReplicatedStorage = game:GetService("ReplicatedStorage")

      local function getCFrame(args)
         local serial = {args:GetComponents()}
         local deserial = CFrame.new(table.unpack(serial))
         return serial, deserial
      end

      if args == "place" then
         local serial, deserial = getCFrame(ws[ps.LocalPlayer.Name].HumanoidRootPart.CFrame)
         ReplicatedStorage.TrapSystem.PlaceTrap:InvokeServer(deserial)
      end

      if args == "murderer" then
         local Murderer = getMurderer()
         if Murderer then
            local taget = Murderer.HumanoidRootPart or ws[Murderer.Name].HumanoidRootPart
            local serial, deserial = getCFrame(target.CFrame)
            ReplicatedStorage.TrapSystem.PlaceTrap:InvokeServer(deserial)
         end
      end

      if args == "sheriff" then
         local Sheriff = getSheriff()
         if Sheriff then
            local taget = Sheriff.HumanoidRootPart or ws[Sheriff.Name].HumanoidRootPart
            local serial, deserial = getCFrame(target.CFrame)
            ReplicatedStorage.TrapSystem.PlaceTrap:InvokeServer(deserial)
         end
      end

      if args == "destroy" then
         local ws = game:GetService("Workspace")
         local ps = game:GetService("Players").LocalPlayer
         for i,v in pairs(ws[ps.LocalPlayer.Name]:GetChildren()) do
            if v.Name == "Trap" then
               v:Destroy()
            end
         end
      end
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
