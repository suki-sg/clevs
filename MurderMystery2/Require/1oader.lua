function findMurderer() -- FIND MURDERER / PRINT CONSOLE
    for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
        for i,v in pairs(v:GetChildren()) do
            if v.Name == "Knife" then
                print("Workspace", "Murderer", v.Parent)
            end
        end
    end
    for i,v in pairs(game:GetService("Players"):GetChildren()) do
        for i,v in pairs(v.Backpack:GetChildren()) do
            if v.Name == "Knife" then
                print("Players", "Murderer", v.Parent.Parent)
            end
        end
    end
end

function findSheriff() -- FIND SHERIFF / PRINT CONSOLE
    for i,v in paris(game:GetService("Workspace"):GetChildren()) do
        for i,v in pairs(v:GetChildren()) do
            if v.Name == "Gun" then
                print("Workspace", "Sheriff", v.Parent)
            end
        end
    end
    for i,v in pairs(game:GetService("Players"):GetChildren()) do
        for i,v in pairs(v.Backpack:GetChildren()) do
            if v.Name == "Gun" then
                print("Players", "Sheriff", v.Parent.Parent)
            end
        end
    end
end

function emotiza(emote) -- EMOTE / BUTTON / WORKS
    local emote2play = emote
    game:GetService("ReplicatedStorage").Remotes.Misc.PlayEmote:Fire(emote2play)
end

function freeFakeGun() -- FAKE GUN / BUTTON / WORKS
    game:GetService("ReplicatedStorage").Remotes.Gameplay.FakeGun:FireServer(true)
end

function infiniteGhost(boolean) -- INFINITE GHOST / TOGGLE / WORKS
    if game:GetService("ReplicatedStorage").Remotes.Gameplay:FindFirstChild("Stealth") then
        game:GetService("ReplicatedStorage").Remotes.Gameplay.Stealth:FireServer(boolean)
    end
end

function SprintTrail(boolean) -- SPRINT TRAIL / TOGGLE /
    game:GetService("Workspace").B4bySharkU_U.SpeedTrail.Toggle:FireServer(boolean)
end

function betterPlaceTrap()
    for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
        local ps = game:GetService("Players")
        local pslp = ps.LocalPlayer
        if v.Name == pslp.Name then
            local plr = v
            local ws = game.Workspace
            local cf = ws[plr.Name].HumanoidRootPart.CFrame
            local seri = {cf:GetComponents()}
            local deseri = CFrame.new(table.unpack(seri))
            game:GetService("ReplicatedStorage").TrapSystem.PlaceTrap:InvokeServer(deseri)
        end
    end
end

function betterSpamTrap(boolean, delay) -- SPAM TRAP / TOGGLE / WORKS
    while getgenv().bSpamTrap == true do
        if getgenv().bSpamTrap == true then
            for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
                local ps = game:GetService("Players")
                local pslp = ps.LocalPlayer
                if v.Name == pslp.Name then
                    local plr = v
                    local ws = game.Workspace
                    local cf = ws[plr.Name].HumanoidRootPart.CFrame
                    local seri = {cf:GetComponents()}
                    local deseri = CFrame.new(table.unpack(seri))
                    game:GetService("ReplicatedStorage").TrapSystem.PlaceTrap:InvokeServer(deseri)
                    wait(delay)
                end
            end
        else 
            break
        end
    end
end
