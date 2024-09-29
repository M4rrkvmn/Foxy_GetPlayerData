ESX = exports.es_extended:getSharedObject()

TriggerEvent('chat:addSuggestion', '/'..Config.Getjob["GetPlayerData"].CommandName..'', "Játékos Információ lekérése", {
    { name = "playerId", help = "Játékos ID"}
})

RegisterNetEvent("Foxy_script:openUi")
AddEventHandler("Foxy_script:openUi", function()
    SendNUIMessage({
        action = "open"
    })
    SetNuiFocus(true, true)
end)

RegisterNetEvent("closeUi")
AddEventHandler("closeUi", function()
    SendNUIMessage({
        action = "close"
    })
    SetNuiFocus(false, false)
end)

RegisterNUICallback("close", function(data, cb)
    TriggerEvent("closeUi")
    cb("ok")
end)

RegisterNUICallback("getPlayerData", function(data, cb)
    ESX.TriggerServerCallback('Foxy_GetPlayerData:sendData', function(playerData)
        cb({
            id = playerData.id,
            name = playerData.name,
            sex = playerData.sex,
            Male = Config.Getjob.Sex.male,
            Female = Config.Getjob.Sex.female,
            date = playerData.date,
            group = playerData.group,
            job = playerData.job,
            job1 = playerData.job1,
            jobgrade = playerData.jobgrade,
            jobgrade1 = playerData.jobgrade1,
            money = playerData.money,
            bank = playerData.bank,
            Steam = playerData.Steam,
            Health = GetEntityHealth(PlayerPedId()) / 2,
            Armor = GetPedArmour(PlayerPedId()),
            vehicleCount = playerData.vehicleCount,
        })
    end)
end)
