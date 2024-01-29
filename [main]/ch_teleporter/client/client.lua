-- command to go to another player
RegisterCommand('goto', function (_, args)
    local targetId = tonumber(args[1]) -- Convert the argument to a number

    if not targetId then
        TriggerEvent('chat:addMessage', {
            args = { 'Provide a valid Target ID' }
        })
        return
    end

    TriggerServerEvent('ch_teleporter:goto', targetId)
end)

-- command to bring a player to us
RegisterCommand('summon', function (_, args)
    local targetId = tonumber(args[1]) -- Convert the argument to a number

    if not targetId then
        TriggerEvent('chat:addMessage', {
            args = { 'Provide a valid Target ID' }
        })
        return
    end

    TriggerServerEvent('ch_teleporter:summon', targetId)
end)
