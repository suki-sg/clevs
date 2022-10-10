--version 1.0
repeat task.wait() until game:IsLoaded()
local CoreGui = game:GetService("StarterGui")
local players = game:GetService("Players")

players.PlayerAdded:Connect(function(player)
	if player:IsFriendsWith(players.LocalPlayer.UserId) then
		CoreGui:SetCore("SendNotification",{
			Title = "Player Joined",
			Text = player.Name.. " has joined your game",
			Icon = "rbxasset://textures/ui/icon_friends_16.png",
			Duration = 5
		})
	end
end)
