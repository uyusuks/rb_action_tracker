local ps = game:GetService("Players")
local sss = game:GetService("ServerScriptService")

local modules_folder = sss:WaitForChild("modules")
local uyu = require(modules_folder:WaitForChild("uyu"))

local check_per_sec = 5

local on_check = true

local sec = 1
local min = sec * 60
local hour = min * 60
local day = hour * 24
local month = day * 30
local year = month * 12

ps.PlayerAdded:Connect(function(p)
    
    local ch = p.Character or p.CharacterAdded:Wait()
    local hrp = ch:WaitForChild("HumanoidRootPart")
    local hmd = ch:WaitForChild("Humanoid")

    while on_check do
        
        local hrp_pos = hrp.Position

        task.wait(check_per_sec)

        local current_hrp_pos = hrp.Position

        if math.abs((current_hrp_pos - hrp_pos).Magnitude) > hmd.WalkSpeed * 5 then
            
            uyu.kick(p, "public_reason")
            -- uyu.punish(p.UserId, year, "private_reason", "public_reason", true)
        end
    end
end)
