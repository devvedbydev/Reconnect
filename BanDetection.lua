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
    appendfile("log.txt", messageType.Name .. ": " .. message .. "\n")
end)
