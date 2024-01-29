local function toggleCarWindow(windowIndex)
    local playerId = PlayerPedId()
    local playerVehicle = GetVehiclePedIsIn(playerId, false)

    if playerVehicle <= 0 then
        return
    end

    if GetPedInVehicleSeat(playerVehicle, -1) ~= playerId then
        return
    end

    if IsVehicleWindowIntact(playerVehicle, windowIndex) then
        if IsWindowRolledDown(playerVehicle, windowIndex) then
            RollUpWindow(playerVehicle, windowIndex)
        else
            RollDownWindow(playerVehicle, windowIndex)
        end
    end
end

-- Registering commands for each window
RegisterCommand('window1', function() toggleCarWindow(0) end) -- Front left window
RegisterCommand('window2', function() toggleCarWindow(1) end) -- Front right window
RegisterCommand('window3', function() toggleCarWindow(2) end) -- Rear left window
RegisterCommand('window4', function() toggleCarWindow(3) end) -- Rear right window