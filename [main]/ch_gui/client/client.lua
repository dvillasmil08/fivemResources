-- Notification
function showNotification(message, color, flash, saveToBrief)
    BeginTextCommandThefeedPost("STRING")
    AddTextComponentSubstringPlayerName(message)
    ThefeedNextPostBackgroundColor(color)
    EndTextCommandThefeedPostTicker(flash, saveToBrief)
    
end

RegisterCommand('testNotification', function (_,_, rawCommand)
    showNotification(
        rawCommand,
        130,
        true,
        false
    
    )
end)


-- Advanced Notifications, can be used for text or phone notifications.
function showAdvancedNotification(message, color, flash, saveToBrief, color)
    BeginTextCommandThefeedPost("STRING")
    AddTextComponentSubstringPlayerName(message)
    ThefeedNextPostBackgroundColor(color)
    EndTextCommandThefeedPostMessagetext(textureDict, textureName, false, iconType, sender, subject)
    EndTextCommandThefeedPostTicker(flash, saveToBrief)
    
end

RegisterCommand('testNotification', function (_,_, rawCommand)
    showAdvancedNotification(
        rawCommand,
        "This is sender",
        "This is subject",
        "CHAR_AMMUNATION",
        8,
        true,
        130
    
    )
end)

-- Alerts
function showAlerts(message, beep, duration)
    AddTextEntry('CH_ALERT', message)

    BeginTextCommandDisplayHelp('CH_ALERT')
    EndTextCommandDisplayHelp(0, false, beep, duration)
end

RegisterCommand('testAlert', function (_,_, rawCommand)
    showAlert(
        rawCommand,
        true,
        -1
    )
end)


-- Markers
RegisterCommand('testMarker', function ()
    CreateThread(function ()
        local start = GetGameTimer()

        while GetGameTimer() < (start + 10000) do
            Wait(0)

            local playerCoordinates = GetEntityCoords(PlayerPedId())
         
            DrawMarker(
                6,
                playerCoordinates.x,
                playerCoordinates.y ,
                playerCoordinates.z,
                0.0,
                0.0,
                0.0,
                0.0,
                0.0,
                0.0,
                1.0,
                1.0,
                1.0,
                0,
                0,
                220,
                180,
                true,
                true,
                2
            )
        end
    end)
    end )
        
-- Subtitles
-- Busy Spinners
-- Text Input