local auth = loadstring(game:HttpGet("https://raw.githubusercontent.com/devvedbydev/Reconnect/refs/heads/main/auth.lua"))()
local loader = auth.get_loader()

if loader then
    loadstring(game:HttpGet(loader))()
else
    game.Players.LocalPlayer:Kick("Authentication failed.")
end
