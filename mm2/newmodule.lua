if game.PlaceId ~= 142823291 then
   game.Players.LocalPlayer:Kick("\nThis is a test\nHELLO\n")
end

local Module = {}







-- @Emote
function Module:Emote(Args)
   local ReplicatedStorage = game:GetService("ReplicatedStorage")
   ReplicatedStorage.Remotes.Misc.PlayEmote:Fire(Args)
end
-- @Teleport
function Module:Teleport(MoS, Args)
   if MoS == "Map" then
      -- @variables
      local works = game:GetService("Workspace")
      local player = game:GetService("Players").LocalPlayer
      local worksplr = works[player.Name]
      -- @conditionals
      if Args == "Lobby" then

      end
   
      if Args == "VotingRoom" then
   
      end
   
      if Args == "Map" then
         -- @functions
         local function GetMap()
            for i,v in pairs(works:GetChildren()) do
               if v:FindFirstChild("Spawns") and v.Name ~= "Lobby" then
                  return v
               end
            end
         end
         -- @variables
         local CurrentMap = GetMap()
         -- @conditionals
         if CurrentMap then
            local Spawns = CurrentMap.Spawns
            local Key = "Spawns" or "PlayerSpawn"
            local x = Spawns[Key].CFrame.X
            local y = Spawns[Key].CFrame.Y +1
            local z = Spawns[Key].CFrame.Z
            worksplr.HumanoidRootPart.CFrame = CFrame.new(x, y, z)
         else
            -- teleport back to map since theres no map yet
         end
      end
   end

   if MoS == "Server" then
      if Args == "Rejoin" then

      end

      if Args == "HopServer" then

      end
   end
end
-- @Trap
function Module:Trap(Args)
   -- @variables
   local Works = game:GetService("Workspace")
   local Players = game:GetService("Players")
   local ReplicatedStorage = game:GetService("ReplicatedStorage")

   -- @functions
   local function GetCFrame(Args)
      local Ser = {Args:GetComponents()}
      local Des = CFrame.new(table.unpack(Ser))
      return Ser, Des
   end

   -- @conditionals

   -- @Trap:Place()
   if Args == "Trap: Place" then
      local Ser, Des = GetCFrame(Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
      ReplicatedStorage.TrapSystem.PlaceTrap:InvokeServer(Des)
      return
   end
   -- @Trap:Murderer()
   if Args == "Trap: Murderer" then
      -- @get murderer
      local function GetMurderer()
         --checks workspace for knive
         for i,v in pairs(Works:GetChildren()) do
            for i,v in pairs(v:GetChildren()) do
               if v.Name == "Knife" then
                  return v.Parent, "Workspace"
               end
            end      
         end
         --checks players backpack for knife
         for i,v in pairs(Players:GetChildren()) do
            for i,v in pairs(v.Backpack:GetChildren()) do
               if v.Name == "Knife" then
                  return v.Parent.Parent, "Players"
               end
            end                  
         end
      end
      -- @variables
      local Murderer = GetMurderer()
      -- @conditionals
      if Murderer then
         local Ser,Des = GetCFrame(Works[Murderer.Name].HumanoidRootPart.CFrame)
         ReplicatedStorage.TrapSystem.PlaceTrap:InvokeServer(Des)
         return
      else return end
   end
   -- @ Trap:Sheriff()
   if Args == "Trap: Sheriff" then
      -- @get sheriff
      local function GetSheriff()
         --checks workspace for gun
         for i,v in pairs(Works:GetChildren()) do
            for i,v in pairs(v:GetChildren()) do
               if v.Name == "Gun" then
                  return v.Parent, "Workspace"
               end
            end      
         end
         --checks players backpack for gun
         for i,v in pairs(Players:GetChildren()) do
            for i,v in pairs(v.Backpack:GetChildren()) do
               if v.Name == "Gun" then
                  return v.Parent.Parent, "Players"
               end
            end                  
         end
      end
      -- @variables
      local Sheriff = GetSheriff()
      -- @conditionals
      if Sheriff then
         local Ser,Des = GetCFrame(Works[Sheriff.Name].HumanoidRootPart.CFrame)
         ReplicatedStorage.TrapSystem.PlaceTrap:InvokeServer(Des)
         return
      else return end
   end
   -- @ Trap:Destroy()
   if Args == "Trap: Destroy" then
      for i,v in pairs(Works[Players.LocalPlayer.Name]:GetChildren()) do
         if v.Name == "Trap" then
            v:Destroy()
         end
      end
   end
end
-- @Ghost
function Module:Ghost(Args) -- gotta be improved
   local ReplicatedStorage = game:GetService("ReplicatedStorage")
   ReplicatedStorage.Remotes.Gameplay.Stealth:FireServer(Args)
end
-- @Sprint Trail
function Module:Trail(Args)
   local Works = game:GetService("Workspace")
   local Players = game:GetService("Players")
   if Works[Players.LocalPlayer.Name]:FindFirstChild("SpeedTrail") then
      Works[Players.LocalPlayer.Name].SpeedTrail.Toggle:FireServer(Args)
   end
end
-- @Break Gun

-- @Fake Gun



return Module
