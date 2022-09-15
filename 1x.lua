repeat task.wait() until game:IsLoaded() and game:GetService("Players").LocalPlayer.Character
local sg = {
   ["142823291"] = "https://raw.githubusercontent.com/levy-gm/clevs/main/mm2/source.lua",
   ["189707"] = "https://raw.githubusercontent.com/levy-gm/clevs/main/nds/source.lua"
}

for i,v in pairs(sg) do
   if i == tostring(game.PlaceId) then
      loadstring(game:HttpGet(v))()
   end
end
