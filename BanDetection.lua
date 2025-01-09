local LogService = game:GetService("LogService")

appendfile("log.txt", "Log file created at: " .. os.date("%Y-%m-%d %H:%M:%S") .. "\n")

hookfunction(print, function(message)
    appendfile("log.txt", "Print Detected: " .. message .. "\n")
    return message
end)

hookfunction(warn, function(message)
    appendfile("log.txt", "Warning Detected: " .. message .. "\n")
    return message
end)

hookfunction(error, function(message)
    appendfile("log.txt", "Error Detected: " .. message .. "\n")
    return message
end)

LogService.MessageOut:Connect(function(message, messageType)
    if message == "You have been banned from Fallen. If you feel this was a false ban, you may send an appeal." then
        appendfile("log.txt", "BAN Detected: " .. message .. "\n")
    elseif message == "RULE 1 - CHEATING (You may Appeal if you believe this was false.)" then
        appendfile("log.txt", "BAN Detected: " .. message .. "\n")
    else
        appendfile("log.txt", messageType.Name .. ": " .. message .. "\n")
    end
end)
