local LogService = game:GetService("LogService")

hookfunction(print, function(message)
    writefile("log.txt", "Print Detected: " .. message .. "\n")
    return message
end)

hookfunction(warn, function(message)
    writefile("log.txt", "Warning Detected: " .. message .. "\n")
    return message
end)

hookfunction(error, function(message)
    writefile("log.txt", "Error Detected: " .. message .. "\n")
    return message
end)

LogService.MessageOut:Connect(function(message, messageType)
    writefile("log.txt", messageType.Name .. ": " .. message .. "\n")
end)
