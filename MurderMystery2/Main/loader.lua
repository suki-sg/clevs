-- [[ Global ]]
getgenv().bSpamTrap = false
getgenv().toggleInfGhost = false

--[[ Destroy() ]]
if game:GetService("CoreGui"):FindFirstChild("Harry Potter") then
    game:GetService("CoreGui")["Harry Potter"]:Destroy()
    wait(0.3)
end
--[[ Library and Gui ]]
local sss = "https://raw.githubusercontent.com/RegularVynixu/IreXion-UI-Library/main/Revamp/IreXion%20UI%20Library"
local Library = loadstring(game:HttpGet(sss))()
local Gui = Library:AddGui({
    Title = {"Harry", "Potter"},
    ThemeColor = Color3.fromRGB(255, 0, 0),
    ToggleKey = Enum.KeyCode.RightControl,
})
game.RunService.Stepped:Connect(function()--Rainbow
    Gui:SetTheme(Color3.fromHSV(tick() % 5 / 5, 1, 1))
end)
--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--
--[[ Home Tab ]]
local homeTab = Gui:AddTab("Home")
--[[ ESP ]]
local EspCategory = homeTab:AddCategory("Visuals")
local AEsp = EspCategory:AddToggle("All Esp", false, function(toggle)
    print(toggle)
end)
local MEsp = EspCategory:AddToggle("Murderer Esp", false, function(toggle)
    findMurderer()
end)
local SEsp = EspCategory:AddToggle("Sheriff Esp", false, function(toggle)
    findSheriff()
end)
--[[ Effects ]]
local EffectsCategory = homeTab:AddCategory("Perks")
local tInfGhost = EffectsCategory:AddToggle("Infinite Ghost", false, function(bool)
    getgenv().toggleInfGhost = bool
    infiniteGhost(bool)
end)
local tSprintTrail = EffectsCategory:AddToggle("Sprint Trail", false, function(bool)
    SprintTrail(bool)
end)
local Button = EffectsCategory:AddButton("Place Trap", function()
    betterPlaceTrap()
end)
local spamTrapTog = EffectsCategory:AddToggle("Spam Traps", false, function(bool)
    local time = 0.1
    getgenv().bSpamTrap = bool
    betterSpamTrap(bool, time) 
end)
local Button = EffectsCategory:AddButton("Trap Murderer", function()
    trapMurderer()
end)
local Button = EffectsCategory:AddButton("Free Fake Gun", function()
    freeFakeGun()
end)
--[[ Teleport ]]
local TpCategory = homeTab:AddCategory("Teleport")
local Button = TpCategory:AddButton("Lobby", function()
    local yomero = game:GetService("Players").LocalPlayer
    yomero.Character.Humanoid.RootPart.CFrame = CFrame.new(-107.80003356933594, 138.3238525390625, 34.399967193603516)
end)
local Button = TpCategory:AddButton("Voting Room", function()
    local yomero = game:GetService("Players").LocalPlayer
    yomero.Character.Humanoid.RootPart.CFrame = CFrame.new(-108.37427520751953, 140.67385864257812, 83.54652404785156)
end)
local Button = TpCategory:AddButton("Map", function()
    print("Button pressed")
end)
local Box = TpCategory:AddBox("Teleport to Player", function(text)
    local mmg = text
end)
--[[ Emotes ]]
local EmotesCategory = homeTab:AddCategory("Emotes")
local Button = EmotesCategory:AddButton("Sit", function()
    emotiza("sit")
end)
local Button = EmotesCategory:AddButton("Ninja", function()
    emotiza("ninja")
end)
local Button = EmotesCategory:AddButton("Dab", function()
    emotiza("dab")
end)
local Button = EmotesCategory:AddButton("Floss", function()
    emotiza("floss")
end)
local Button = EmotesCategory:AddButton("Zen", function()
    emotiza("zen")
end)
local Button = EmotesCategory:AddButton("Zombie", function()
    emotiza("zombie")
end)
local Button = EmotesCategory:AddButton("Headless", function()
    emotiza("headless")
end)
--[[ Autofarm ]]
local AutofarmCategory = homeTab:AddCategory("Autofarm")


--[[ Universal ]]
local uvTab = Gui:AddTab("Universal")
--[[ Player ]]
local PlayerCategory = uvTab:AddCategory("Player")
local sWalkSpeed = PlayerCategory:AddSlider("Walk Speed", 1, 100, 16, true, function(value)
    local yom = game:GetService("Players").LocalPlayer
    yom.Character.Humanoid.WalkSpeed = value
end)
local Button = PlayerCategory:AddButton("Default", function()
    sWalkSpeed:Set(16)
    sWalkSpeed:Set(16)
end)
local sJumpPower = PlayerCategory:AddSlider("Jump Power", 1, 100, 50, true, function(value)
    local yom = game:GetService("Players").LocalPlayer
    yom.Character.Humanoid.JumpPower = value
end)
local Button = PlayerCategory:AddButton("Default", function()
    sJumpPower:Set(50)
    sJumpPower:Set(50)
end)
--[[ Camera ]]
local CameraCategory = uvTab:AddCategory("Camera")
local sFOV = CameraCategory:AddSlider("FOV", 10, 120, 70, true, function(value)
    local cam = game:GetService("Workspace").Camera
    cam.FieldOfView = value
end)
local Button = CameraCategory:AddButton("Default", function()
    sFOV:Set(70)
    sFOV:Set(70)
end)

--[[ Settings ]]
local SettingsTab = Gui:AddTab("Settings")
--[[ Server ]]
local ServerCategory = SettingsTab:AddCategory("Server")
local bRj = ServerCategory:AddButton("Rejoin", function()
    local tps = game:GetService("TeleportService")
    local yom = game:GetService("Players").LocalPlayer
    tps:TeleportToPlaceInstance(game.PlaceId,game.JobId,tps)
end)
local bHopServ = ServerCategory:AddButton("Hop Server", function()
    local tpservice= game:GetService("TeleportService")
    local plr = game.Players.LocalPlayer
    tpservice:Teleport(game.PlaceId, plr)
end)
--[[ Key Binds ]]
local KeyBindsCategory = SettingsTab:AddCategory("KeyBinds")
local ToggleBind = KeyBindsCategory:AddToggleBind("Trap's Placer", Enum.KeyCode.R, false, function()
    betterPlaceTrap()
end)
local ToggleBind = KeyBindsCategory:AddToggleBind("Infinite Ghost Toggler", Enum.KeyCode.V, false, function()
    local short = getgenv().toggleInfGhost
    if short == false then
        tInfGhost:Set(true)
    elseif short == true then
        tInfGhost:Set(false)
    end
end)
local ToggleBind = KeyBindsCategory:AddToggleBind("Zen", Enum.KeyCode.Z, false, function()
    emotiza("zen")
end)
--[[ Destroy ]]
local DestroyCategory = SettingsTab:AddCategory("Destroy")
local Button = DestroyCategory:AddButton("Destroy", function()
    game:GetService("CoreGui")["Harry Potter"]:Destroy()
end)

-- [[ Load Functions ]] --
loadstring(game:HttpGet("https://raw.githubusercontent.com/clevsgm/clevs/main/MurderMystery2/Require/1oader.lua"))()
