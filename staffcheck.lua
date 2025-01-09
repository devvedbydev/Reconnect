rconsolecreate("")
rconsolename("[ RECONNECT.WIN ]")
rconsoleprint("@@WHITE@@")
rconsoleclear()
rconsoleprint("   Thank you for choosing Reconnect\n")

local staff = {
    16681869, 47983795, 15680821, 363101315, 25548179, 174212818, 1279177872,
    3441886693, 51281722, 156457707, 1249478607, 3544497889, 1534692727, 
    419652748, 920463550, 41482597, 1661163712, 330990753, 52120772, 
    6102275375, 661625254, 3004094651, 7178750309, 3576575263, 1147811746
}

local function log(color, message)
    rconsoleprint(color)
    rconsoleprint("   " .. message .. "\n")
    rconsoleprint("@@WHITE@@")
end

local function notifplr(player, action)
    local isStaff = table.find(staff, player.UserId)
    log(isStaff and "@@RED@@" or "@@WHITE@@", 
        (action == "join" and "Player Joined: " or "Player Left: ") .. 
        player.Name .. " (ID: " .. player.UserId .. ") - " .. 
        (isStaff and "STAFF" or "NOT STAFF"))
end

local function initcheck()
    local staffFound = false
    for _, player in ipairs(game.Players:GetPlayers()) do
        notifplr(player, "join")
        if table.find(staff, player.UserId) then staffFound = true end
    end
    log(staffFound and "@@RED@@" or "@@LIGHT_BLUE@@", 
        staffFound and "WARNING: Staff member/s found!" or "INFO: No staff members found.")
end
initcheck()

game.Players.PlayerAdded:Connect(function(player) notifplr(player, "join") end)
game.Players.PlayerRemoving:Connect(function(player) notifplr(player, "leave") end)
