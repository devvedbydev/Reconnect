if gethwid then
    setclipboard(gethwid()) print("HWID set to clipboard.")
else
    game.Players.LocalPlayer:Kick("EXECUTOR NOT SUPPORTED.")
end
