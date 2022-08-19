local module = {}

local notify = loadstring(game:HttpGet('https://raw.githubusercontent.com/clevsgm/clevs/main/notify.lua'))()

function module:remove_fall_damage()
   local ps = game:GetService("Players")
   if game:GetService("Workspace")[ps.LocalPlayer.Name]:FindFirstChild("FallDamageScript") then
        game:GetService("Workspace")[ps.LocalPlayer.Name].FallDamageScript:Destroy()
        notify:success("Fall Damage", "fall damage has been removed", 5)
   end
end

function module:tiny()
   local LocalPlayer = game:GetService("Players").LocalPlayer
   local Character = LocalPlayer.Character
   local Humanoid = Character:FindFirstChildOfClass("Humanoid")
   local function rm()
       for i,v in pairs(Character:GetDescendants()) do
           if v:IsA("BasePart") then
               if v.Name ~= "SomeRandomShit" then
                   for i,cav in pairs(v:GetDescendants()) do
                       if cav:IsA("Attachment") then
                           if cav:FindFirstChild("OriginalPosition") then
                               cav.OriginalPosition:Destroy()
                           end
                       end
                   end
                   v:FindFirstChild("OriginalSize"):Destroy()
                   if v:FindFirstChild("AvatarPartScaleType") then
                       v:FindFirstChild("AvatarPartScaleType"):Destroy()
                   end
               end
           end
       end
   end
   rm()
   task.wait(0.5)
   Humanoid:FindFirstChild("BodyTypeScale"):Destroy()
   task.wait(0.2)
   rm()
   task.wait(0.5)
   Humanoid:FindFirstChild("BodyWidthScale"):Destroy()
   task.wait(0.2)
   rm()
   task.wait(0.5)
   Humanoid:FindFirstChild("BodyDepthScale"):Destroy()
   task.wait(0.2)
   rm()
   task.wait(0.5)
   Humanoid:FindFirstChild("HeadScale"):Destroy()
   task.wait(0.2)
end

function module:tall()
   local LocalPlayer = game:GetService("Players").LocalPlayer
   local Character = LocalPlayer.Character
   local Humanoid = Character:FindFirstChildOfClass("Humanoid")
   local function rm()
       for i,v in pairs(Character:GetDescendants()) do
           if v:IsA("BasePart") then
               if v.Name == "Handle" or v.Name == "Head" then
                   if Character.Head:FindFirstChild("OriginalSize") then
                       Character.Head.OriginalSize:Destroy()
                   end
               else
                   for i,cav in pairs(v:GetDescendants()) do
                       if cav:IsA("Attachment") then
                           if cav:FindFirstChild("OriginalPosition") then
                               cav.OriginalPosition:Destroy()  
                           end
                       end
                   end
                   v:FindFirstChild("OriginalSize"):Destroy()
                   if v:FindFirstChild("AvatarPartScaleType") then
                       v:FindFirstChild("AvatarPartScaleType"):Destroy()
                   end
               end
           end
       end
   end
   rm()
   task.wait(0.5)
   Humanoid:FindFirstChild("BodyProportionScale"):Destroy()
   task.wait(1)
   rm()
   task.wait(0.5)
   Humanoid:FindFirstChild("BodyHeightScale"):Destroy()
   task.wait(1)
   rm()
   task.wait(0.5)
   Humanoid:FindFirstChild("BodyWidthScale"):Destroy()
   task.wait(1)
   rm()
   task.wait(0.5)
   Humanoid:FindFirstChild("BodyDepthScale"):Destroy()
   task.wait(1)
   rm()
   task.wait(0.5)
   Humanoid:FindFirstChild("HeadScale"):Destroy()
   task.wait(1)
end

return module
