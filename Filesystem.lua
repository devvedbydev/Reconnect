local lastCheckTime = tick()
local checkInterval = 0.1
local fileChecked = false

local function checkFile()
    local content = readfile("reconnect.txt")
    if content then
        _G.ESPEnabled = content:find("PlayerESP=true") and true or false
        _G.AimbotEnabled = content:find("AimbotEnabled=true") and true or false
        _G.FreeCam = content:find("FreeCam=true") and true or false
    end
end

game:GetService("RunService").RenderStepped:Connect(function()
    local currentTime = tick()
    if currentTime - lastCheckTime >= checkInterval and not fileChecked then
        fileChecked = true
        pcall(function() checkFile() end)
        lastCheckTime = currentTime
    end

    if currentTime - lastCheckTime >= checkInterval then
        fileChecked = false
    end
end)
