local modules = {}

function modules:traps:place()
    local ws = game:GetService("Workspace")
	local ps = game:GetService("Players")
	local lp = ps.LocalPlayer
	local wslp = ws[lp.Name]
	local cf = wslp.HumanoidRootPart.CFrame
	local ser = {cf:GetComponents()}
	local des = CFrame.new(table.unpack(ser))
	game:GetService("ReplicatedStorage").TrapSystem.PlaceTrap:InvokeServer(des)
end

function modules:traps:murderer()
	local ws = game:GetService("Workspace")
	local ps = game:GetService("Players") 
	
	local function getMurderer()
		for i,v in pairs(ws:GetChildren()) do
			for i,v in pairs(v:GetChildren()) do
				if v.Name == "Knife" then
					return v.Parent
				end
			end
		end
		for i,v in pairs(ps:GetChildren()) do
			for i,v in pairs(v.Backpack:GetChildren()) do
				if v.Name == "Knife" then
					return v.Parent.Parent
				end
			end
		end
	end
	
	local Murderer = getMurderer()
	
	if Murderer == nil then
		return true
	else
		local cf = ws[Murderer.Name].HumanoidRootPart.CFrame
		local ser = {cf:GetComponents()}
		local des = CFrame.new(table.unpack(ser))
		game:GetService("ReplicatedStorage").TrapSystem.PlaceTrap:InvokeServer(des)
	end
end

function modules:traps:sheriff()
	local ws = game:GetService("Workspace")
	local ps = game:GetService("Players") 
	
	local function getSheriff()
		for i,v in pairs(ws:GetChildren()) do
			for i,v in pairs(v:GetChildren()) do
				if v.Name == "Gun" then
					return v.Parent
				end
			end
		end
		for i,v in pairs(ps:GetChildren()) do
			for i,v in pairs(v.Backpack:GetChildren()) do
				if v.Name == "Gun" then
					return v.Parent.Parent
				end
			end
		end
	end
	
	local Sheriff = getSheriff()
	
	if Sheriff == nil then
		return true
	else
		local cf = ws[Sheriff.Name].HumanoidRootPart.CFrame
		local ser = {cf:GetComponents()}
		local des = CFrame.new(table.unpack(ser))
		game:GetService("ReplicatedStorage").TrapSystem.PlaceTrap:InvokeServer(des)
	end
end

function modules:traps:remove()
    local ws = game:GetService("Workspace")
	local ps = game:GetService("Players")
	local lp = ps.LocalPlayer
	local wslp = ws[lp.Name]
	for i,v in pairs(wslp:GetChildren()) do
		if v.Name == "Trap" then
			v:Destroy()
		end
	end
end

function modules:gun:fake()
    game:GetService("ReplicatedStorage").Remotes.Gameplay.FakeGun:FireServer(true)
end

return modules