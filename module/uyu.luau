local ps = game:GetService("Players")

local uyu = {}

function uyu.punish(p_id, lasts, private_reason, public_reason, include_alts)
    
    local cfg = {

        UserIds = {p_id},
        Duration = lasts,
        DisplayReason = public_reason,
        PrivateReason = private_reason,
        ExcludeAltAccounts = include_alts,

        ApplyToUniverse = true
    }

    repeat local success, res = pcall(function() ps:BanAsync(cfg) end) task.wait(.5) until success
end

function uyu.kick(p, public_reason)
    
    p:Kick(public_reason)
end

return uyu
