RegisterNetEvent('ch_teleporter:goto', function(targetId)
    local playerId = source
    local playerPed = GetPlayerPed(-1) -- Use -1 to get the player's own Ped
    local targetPed = GetPlayerPed(targetId)

    if targetPed <= 0 then
        -- Player not found
        TriggerClientEvent('chat:addMessage', playerId, {
            args = { 'Hey, ' .. targetId ..  ' does not exist' }
        })
        return
    end

    local targetPos = GetEntityCoords(targetPed)

    SetEntityCoords(playerPed, targetPos)
end)

RegisterNetEvent('ch_teleporter:summon', function(targetId)
    local playerId = source
    local playerPed = GetPlayerPed(-1)
    local targetPed = GetPlayerPed(targetId)

    if targetPed <= 0 then
        -- Player not found
        TriggerClientEvent('chat:addMessage', playerId, {
            args = { 'Hey, ' .. targetId ..  ' does not exist' }
        })
        return
    end

    local playerPos = GetEntityCoords(playerPed)

    SetEntityCoords(targetPed, playerPos)
end)
