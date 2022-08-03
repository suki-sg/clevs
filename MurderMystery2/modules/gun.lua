local gun = {}

function gun:fake()
    game:GetService("ReplicatedStorage").Remotes.Gameplay.FakeGun:FireServer(true)
end

return gun
