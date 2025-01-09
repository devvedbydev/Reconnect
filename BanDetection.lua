appendfile("log.txt", "Log file created at: " .. os.date("%Y-%m-%d %H:%M:%S") .. "\n")

local function isBanRelated(message)
    local patterns = {
        "ban", "banned", "cheating", "rule 1", "you have been banned", "rule 1 - cheating"
    }
    message = message:lower()
    for _, pattern in ipairs(patterns) do
        if message:find(pattern) then
            return true
        end
    end
    return false
end

local oldPrint = print
hookfunction(print, function(...)
    local message = table.concat({...}, " ")
    if isBanRelated(message) then
        appendfile("log.txt", "BAN Detected: " .. message .. "\n")
    else
        appendfile("log.txt", "Print Detected: " .. message .. "\n")
    end
    return oldPrint(...)
end)

local oldWarn = warn
hookfunction(warn, function(...)
    local message = table.concat({...}, " ")
    if isBanRelated(message) then
        appendfile("log.txt", "BAN Detected: " .. message .. "\n")
    else
        appendfile("log.txt", "Warning Detected: " .. message .. "\n")
    end
    return oldWarn(...)
end)

local oldError = error
hookfunction(error, function(...)
    local message = table.concat({...}, " ")
    if isBanRelated(message) then
        appendfile("log.txt", "BAN Detected: " .. message .. "\n")
    else
        appendfile("log.txt", "Error Detected: " .. message .. "\n")
    end
    return oldError(...)
end)
