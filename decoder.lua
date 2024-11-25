local function base64decode(data)
    return crypt.base64decode(data)
end

local function decryptData(encryptedData, key, iv, mode)
    return crypt.decrypt(encryptedData, key, iv, mode)
end

local function decode(url, key, iv)
    local encryptedData = tostring(game:HttpGet(url))
    local decodedKey = base64decode(key)
    local decodedIV = base64decode(iv)
    local mode = "CBC"
    
    local decryptedData = decryptData(encryptedData, decodedKey, decodedIV, mode)
    return decryptedData
end

return decode
