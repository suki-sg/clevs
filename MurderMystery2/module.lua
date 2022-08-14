local module = {}

local function module:getMurderer()
   local ws = game:GetService("Workspace")
   local ps = game:GetService("Players")
   for i,v in pairs(ws:GetChildren()) do
       for i,v in pairs(v:GetChildren()) do
           if v.Name == "Knife" then
               return v.Parent, "check", "Workspace"
           end
       end
   end
   for i,v in pairs(ps:GetChildren()) do
      for i,v in pairs(v.Backpack:GetChildren()) do
         if v.Name == "Knife" then
            return v.Parent.Parent, "check", "Players"
         end
      end
   end
end

local function module:getSheriff()
   local ws = game:GetService("Workspace")
   local ps = game:GetService("Players")
   for i,v in pairs(ws:GetChildren()) do
      for i,v in pairs(v:GetChildren()) do
         if v.Name == "Gun" then
            return v.Parent, "check", "Workspace"
         end
      end
   end
   for i,v in pairs(ps:GetChildren()) do
      for i,v in pairs(v.Backpack:GetChildren()) do
         if v.Name == "Gun" then
            return v.Parent.Parent, "check", "Players"
         end
      end
   end
end

local function module:emote_play(emote)--Done
   game:GetService("ReplicatedStorage").Remotes.Misc.PlayEmote:Fire(emote)
end

local function module:trap(method)
   local ws = game:GetService("Workspace")
   local ps = game:GetService("Players")
   local lp = ps.LocalPlayer
   local wslp = ws[lp.Name]
   local trapsys = game:GetService("ReplicatedStorage").TrapSystem.PlaceTrap

   if method == "place" then
      local cf = wslp.HumanoidRootPart.CFrame
		local ser = {cf:GetComponents()}
		local des = CFrame.new(table.unpack(ser))
		trapsys:InvokeServer(des)
   elseif method == "murderer" then
      local Murderer,Check,Origin = module:getMurderer()
      if Murderer then
         local cf = Murderer.HumanoidRootPart.CFrame or ws[Murderer.Name].HumanoidRootPart.CFrame
         local ser = {cf:GetComponents()}
         local des = CFrame.new(table.unpack(ser))
         trapsys:InvokeServer(des)
      else
         return "Murderer was not found"
      end
   elseif method == "sheriff" then
      local Sheriff,Check,Origin = module:getSheriff()
      if Sheriff then
         local cf = Sheriff.HumanoidRootPart.CFrame or ws[Sheriff.Name].HumanoidRootPart.CFrame
         local ser = {cf:GetComponents()}
         local des = CFrame.new(table.unpack(ser))
         trapsys:InvokeServer(des)
      else
         return "Sheriff was not found"
      end
   elseif method == "destroy" then
      for i,v in pairs(wslp:GetChildren()) do
			if v.Name == "Trap" then
				v:Destroy()
			end
		end
	else
		return "Invalid Arguments"
   end
end

local function module:gun(arguments)
   local ws = game:GetService("Workspace")
   local ps = game:GetService("Players")
   local ReplicatedStorage = game:GetService("ReplicatedStorage")

   if arguments == "break gun" then
      local Sheriff, check, Origin = module:getSheriff()
      if Origin == "Workspace" then
         Sheriff.Gun.KnifeServer.ShootGun:InvokeServer(1,"1,1,1", "AH")
      end
   elseif arguments == "fake" then
      ReplicatedStorage.Remotes.Gameplay.FakeGun:FireServer(true)
   elseif arguments == "loop break gun" then
      
   end
end

return module
