local StarterGui = game:GetService("StarterGui")
local LogService = game:GetService("LogService")

hookfunction(print, function(message)
    StarterGui:SetCore("SendNotification", {
        Title = "Print Detected",
        Text = message,
        Duration = 5
    })
    return message
end)

hookfunction(warn, function(message)
    StarterGui:SetCore("SendNotification", {
        Title = "Warning Detected",
        Text = message,
        Duration = 5
    })
    return message
end)

hookfunction(error, function(message)
    StarterGui:SetCore("SendNotification", {
        Title = "Error Detected",
        Text = message,
        Duration = 5
    })
    return message
end)

LogService.MessageOut:Connect(function(message, messageType)
    StarterGui:SetCore("SendNotification", {
        Title = messageType.Name,
        Text = message,
        Duration = 5
    })
end)
