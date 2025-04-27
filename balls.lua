-- Krystal Dance Client Replication Convert by catt0q
-- Credits to Hemi
-- Krystal Dance V3 By Hemi
-- https://discord.gg/DArZqdJmmN
-- https://discord.gg/mfM99eM5xy
local plr = game.Players.LocalPlayer
local ch = plr.Character or plr.CharacterAdded:Wait()

local childrens = {}

local children = {
    "Right Arm", "Right Leg", "Left Arm", "Left Leg", "Torso"
}

local function rma()
    for _, acc in pairs(ch:GetDescendants()) do
        if acc:IsA("Accessory") then
            acc:Destroy()
        end
    end
end

local function inv()
    for _, v in pairs(ch:GetDescendants()) do
        if v:IsA("BasePart") then
            v.Transparency = 1
            v.CanCollide = true
            v.Anchored = false
        end
    end
end


local function clone()
    for _, v in pairs(ch:GetDescendants()) do
        if v:IsA("BasePart") and table.find(children, v.Name) then
            local c = Instance.new("Part")
            c.Size = v.Size
            c.Material = Enum.Material.SmoothPlastic
            c.Color = v.Color
            c.Transparency = 0
            c.CanCollide = false
            c.Anchored = true
            c.Name = v.Name .. "funny_rig"
            
            if v.Name == "Left Arm" or v.Name == "Right Arm" then
                c.Color = Color3.fromRGB(255, 255, 255)
            end

            local rigo = Instance.new("Highlight")
            rigo.Parent = c
            rigo.FillTransparency = 1
            rigo.OutlineTransparency = 0.5
            rigo.OutlineColor = Color3.fromRGB(0, 0, 0)
            rigo.DepthMode = Enum.HighlightDepthMode.Occluded

            c.Parent = workspace
            table.insert(childrens, {original = v, clone = c, highlight = rigo})
        end
    end
end


rma()
inv()
clone()
plr.Character.Head.face:Destroy()

game:GetService("RunService").Heartbeat:Connect(function()
    for _, p in pairs(childrens) do
        if p.original and p.original.Parent then
            p.clone.CFrame = p.original.CFrame
        end
    end
end)

task.wait(1) -- let the rig load
loadstring(game:HttpGet("https://raw.githubusercontent.com/Nitro-GT/OxideReanim/refs/heads/main/KrystalDance3"))()
