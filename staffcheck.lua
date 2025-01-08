rconsolecreate("")
rconsolename("[ RECONNECT.WIN ]")
rconsoleclear()
rconsoleprint("@@WHITE@@   Thank you for choosing Reconnect\n")

local staff = {16681869, 47983795, 15680821, 363101315, 25548179, 174212818, 1279177872, 3441886693, 51281722, 156457707, 1249478607, 3544497889, 1534692727, 419652748, 920463550, 41482597, 1661163712, 330990753, 52120772, 6102275375, 661625254, 3004094651, 7178750309, 3576575263, 1147811746}

local function log(color, msg)
    rconsoleprint(color .. "   " .. msg .. "\n@@WHITE@@")
end
local function notify(plr, act)
    local staffCheck = table.find(staff, plr.UserId)
    log(staffCheck and "@@RED@@" or "@@WHITE@@", (act == "join" and "Player Joined: " or "Player Left: ") .. plr.Name .. " (ID: " .. plr.UserId .. ") - " .. (staffCheck and "STAFF" or "NOT STAFF"))
end
local function initialcheck()
    local staffFound = false
    for _, plr in ipairs(game.Players:GetPlayers()) do
        notify(plr, "join")
        if table.find(staff, plr.UserId) then staffFound = true end
    end
    log(staffFound and "@@RED@@" or "@@LIGHT_BLUE@@", staffFound and "WARNING: Staff found!" or "INFO: No staff found.")
end
initialcheck()

game.Players.PlayerAdded:Connect(function(plr) notify(plr, "join") end)
game.Players.PlayerRemoving:Connect(function(plr) notify(plr, "leave") end)
