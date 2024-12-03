local HWID = (function() for k, v in pairs(game:GetService("HttpService"):JSONDecode(request({Url = "https://httpbin.org/get", Method = "GET"}).Body).headers) do if string.match(k, "-Fingerprint") then return v end end end)()
setclipboard(HWID)
print("HWID Set to clipboard, now do 'register <your-hwid>' in bot commands.")
