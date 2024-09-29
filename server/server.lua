ESX = exports.es_extended:getSharedObject()

function GetjobIsAdmin(playerGroup)
    for _, perm in ipairs(Config.Getjob["GetPlayerData"].groups) do
        if playerGroup == perm then
            return true
        end
    end
    return false
end

RegisterCommand(Config.Getjob["GetPlayerData"].CommandName, function (source,args)
    local targetId = tonumber(args[1])
    local xPlayer = ESX.GetPlayerFromId(source)
    local adminGroup = xPlayer.getGroup()
    local xTarget = ESX.GetPlayerFromId(targetId)

    if GetjobIsAdmin(adminGroup) then  
    if xTarget then   
        SendToDiscord(003024,''..GetPlayerName(source)..' [ID : '..xPlayer.source..']', 'Lekérte '..GetPlayerName(xTarget.source)..' [ID : '..xTarget.source..'] adatait.')
ESX.RegisterServerCallback('Foxy_GetPlayerData:sendData', function(source, cb)
    local xTarget = ESX.GetPlayerFromId(targetId)
    local data = {
        id = xTarget.source,
        name = xTarget.getName(),
        sex = xTarget.get('sex'),
        date = xTarget.get('dateofbirth'),
        group = xTarget.getGroup(),
        job = xTarget.getJob().label,
        job1 = xTarget.getJob().name,
        jobgrade = xTarget.getJob().grade_label,
        jobgrade1 = xTarget.getJob().grade,
        money = xTarget.getMoney(),
        bank = xTarget.getAccount('bank').money,
        Steam = GetPlayerName(xTarget.source),
        vehicleCount = MySQL.Sync.fetchScalar(
            "SELECT COUNT(*) FROM owned_vehicles WHERE owner = ?",
            { xTarget.identifier }
        ),
    }
    cb(data)
end)
    xPlayer.triggerEvent('Foxy_script:openUi')
else
    TriggerClientEvent('esx:showNotification',source,'Nincs ilyen ID-jű player a szerveren.')
end
else
    TriggerClientEvent('esx:showNotification',source,'Nincs jogod a parancshoz.')
end
end,false)