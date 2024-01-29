-- Notification
function showNotification(message, color, flash, saveToBrief)
    BeginTextCommandThefeedPost("STRING")
    AddTextComponentSubstringPlayerName(message)
    ThefeedNextPostBackgroundColor(color)
    EndTextCommandThefeedPostMessagetext(textureDict, textureName, false, iconType, sender, subject)
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


-- Advanced Notifications




-- Alerts
-- Markers
-- Subtitles
-- Busy Spinners
-- Text Input