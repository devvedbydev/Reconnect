getgenv().global = getgenv()

function global.declare(self, index, value, check)
    if self[index] == nil then
        self[index] = value
    elseif check then
        local methods = { "remove", "Disconnect" }
        for _, method in methods do
            pcall(function()
                value[method](value)
            end)
        end
    end
    return self[index]
end

global.declare(global, "features", {})

features.toggle = function(self, feature, boolean)
    if self[feature] then
        if boolean == nil then
            self[feature].enabled = not self[feature].enabled
        else
            self[feature].enabled = boolean
        end

        if self[feature].toggle then
            task.spawn(function()
                self[feature]:toggle()
            end)
        end
    end
end

global.declare(features, "visuals", {
    ["enabled"] = true,
    ["teamCheck"] = false,
    ["teamColor"] = true,
    ["renderDistance"] = 2000,
    ["boxes"] = {
        ["enabled"] = true,
        ["color"] = Color3.fromRGB(255, 255, 255),
        ["outline"] = {
            ["enabled"] = true,
            ["color"] = Color3.fromRGB(0, 0, 0),
        },
        ["filled"] = {
            ["enabled"] = true,
            ["color"] = Color3.fromRGB(255, 255, 255),
            ["transparency"] = 0.25
        },
    },
    ["names"] = {
        ["enabled"] = true,
        ["color"] = Color3.fromRGB(255, 255, 255),
        ["outline"] = {
            ["enabled"] = true,
            ["color"] = Color3.fromRGB(0, 0, 0),
        },
    },
    ["health"] = {
        ["enabled"] = true,
        ["color"] = Color3.fromRGB(0, 255, 0),
        ["colorLow"] = Color3.fromRGB(255, 0, 0),
        ["outline"] = {
            ["enabled"] = true,
            ["color"] = Color3.fromRGB(0, 0, 0)
        },
        ["text"] = {
            ["enabled"] = true,
            ["outline"] = {
                ["enabled"] = true,
            },
        }
    },
    ["distance"] = {
        ["enabled"] = true,
        ["color"] = Color3.fromRGB(255, 255, 255),
        ["outline"] = {
            ["enabled"] = true,
            ["color"] = Color3.fromRGB(0, 0, 0),
        },
    },
    ["weapon"] = {
        ["enabled"] = true,
        ["color"] = Color3.fromRGB(255, 255, 255),
        ["outline"] = {
            ["enabled"] = true,
            ["color"] = Color3.fromRGB(0, 0, 0),
        },
    }
})

local visuals = features.visuals

loadstring(game:HttpGet("https://raw.githubusercontent.com/devvedbydev/Reconnect/refs/heads/main/esplib.lua"))()
