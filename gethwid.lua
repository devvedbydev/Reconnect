if gethwid then
    setclipboard(gethwid()) 
	print("hwid set to clipboard")
else
    game:GetService("Players").LocalPlayer:Kick("Executor not supported")
end
