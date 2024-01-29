local isBennysShopOpen = false

RegisterCommand('bennys', function()
    isBennysShopOpen = not isBennysShopOpen

    if isBennysShopOpen then
        -- Teleport players to the Benny's shop location or open a menu.
        TriggerClientEvent('showBennysMenu', -1) -- Trigger an event for all players.
    else
        -- Close the Benny's shop or menu.
        TriggerClientEvent('hideBennysMenu', -1)
    end
end, false)

-- Optional: Add a chat message to inform players about the /bennys command.
AddEventHandler('chatMessage', function(source, name, message)
    if message == '/bennys' then
        CancelEvent() -- Prevent the command from being shown in chat.
        TriggerClientEvent('chatMessage', source, '^2[INFO]^7', 'Use /bennys to check customizations at Benny\'s shop.')
    end
end)
