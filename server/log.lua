local DISCORD_WEBHOOK = ""

function SendToDiscord(color,name, message)
    local connect = {
        {
            ["color"] = color,
            ["title"] = "**" .. name .. "**", 
            ["description"] = message,
            ["footer"] = {
                ["text"] = os.date("%Y-%m-%d %X | Foxy GetPlayerData"),
            },
        }
    }
    PerformHttpRequest(DISCORD_WEBHOOK, function(err, text, headers) end, 'POST',
        json.encode({ username = "Foxy Development", embeds = connect, avatar_url = "" }),
        { ['Content-Type'] = 'application/json' })
end