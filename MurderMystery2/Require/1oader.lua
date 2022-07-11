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

function emotiza(emote) -- EMOTE / BUTTON
    local emote2play = emote
    game:GetService("ReplicatedStorage").Remotes.Misc.PlayEmote:Fire(emote2play)
end

function freeFakeGun() -- FAKE GUN / BUTTON
    game:GetService("ReplicatedStorage").Remotes.Gameplay.FakeGun:FireServer(true)
end

function placeFreeTrap() --PLACE TRAP / BUTTON
    local ws = game.Workspace
    local cf = ws.B4bySharkU_U.HumanoidRootPart.CFrame
    local seri = {cf:GetComponents()}
    local deseri = CFrame.new(table.unpack(seri))
    game:GetService("ReplicatedStorage").TrapSystem.PlaceTrap:InvokeServer(deseri)
end

function spamTraps(boolean, delay) -- SPAM TRAPS / TOGGLE
    while getgenv().spamingTraps == true do
        if getgenv().spamingTraps == true then
            local ws = game.Workspace
            local cf = ws.B4bySharkU_U.HumanoidRootPart.CFrame
            local seri = {cf:GetComponents()}
            local deseri = CFrame.new(table.unpack(seri))
            game:GetService("ReplicatedStorage").TrapSystem.PlaceTrap:InvokeServer(deseri)
            wait(delay)
        else
            break
        end
    end
end

function infiniteGhost(boolean) -- INFINITE GHOST / TOGGLE
    if game:GetService("ReplicatedStorage").Remotes.Gameplay:FindFirstChild("Stealth") then
        game:GetService("ReplicatedStorage").Remotes.Gameplay.Stealth:FireServer(boolean)
    end
end

function SprintTrail(boolean) -- SPRINT TRAIL / TOGGLE
    game:GetService("Workspace").B4bySharkU_U.SpeedTrail.Toggle:FireServer(boolean)
end
