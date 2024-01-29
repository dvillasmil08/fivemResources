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
function showSubtitle(message, duration)
    BeginTextCommandPrint("STRING")
    AddTextComponentSubstringPlayerName(message)
    EndTextCommandPrint(duration, true)
end

RegisterCommand('testSubtitle', function (_,_, rawCommand)
    showSubtitle(
        "This is a ~y~Subtitle~s~! Hope you like it.",
        10000
    )
end)
    
end

-- Busy Spinners
function showBusySpinner(message)
    BeginTextCommandBusyspinnerOn("STRING")
    AddTextComponentSubstringPlayerName(message)
    EndTextCommandBusyspinnerOn(4)
end

function hideBusySpinner()
    BusyspinnerOff() 
end

RegisterCommand('testSpinner', function (_,_, rawCommand)
    if rawCommand == 'testSpinner' then
        hideBusySpinner()
    else
        showBusySpinner(rawCommand)
    end
end)
    
end

end)



-- Text Input

function getTextInput(title, inputLength)
    AddTextEntry('CH_INPUT', title)
    DisplayOnscreenKeyboard(1, "CH_INPUT", "", "", "", "", "", inputLength)

    while UpdateOnscreenKeyboard() == 0 do
        Citizen.Wait(0)        
    end

    if UpdateOnscreenKeyboard() ~= 2 then
        local result = GetOnscreenKeyboardResult()

        Citizen.Wait(0)

        return result

    else
        Citizen.Wait(0)

        return nil
    end
end

RegisterCommand('testInput', function (_,_, rawCommand)
   local result = getTextInput(rawCommand, 30)

   showNotification(result, 180, false, false)
    
end)