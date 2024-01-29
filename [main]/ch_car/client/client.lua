RegisterCommand('car', function (source, args)
    local vehicleName = args[1] or 'adder'

    if not IsModelInCdimage(vehicleName) or not IsModelAVehicle(vehicleName) then
        TriggerEvent('chat:addMessage', {
            args = { 'You dummy, ' .. vehicleName .. ' is not a vehicle' }
        })
        return
    end

    RequestModel(vehicleName)

    while not HasModelLoaded(vehicleName) do
        Wait (10)
    end

    local playerPed = PlayerPedId()
    local pos = GetEntityCoords(playerPed)
    local heading = GetEntityHeading(playerPed)

    local vehicle = CreateVehicle(
        vehicleName,
        pos,
        heading,
        -- isNetwork-
        true
    )
    -- -1 is the driver seat, and so on
    SetPedIntoVehicle(playerPed, vehicle, -1)

    -- Release the model from memory
    SetModelAsNoLongerNeeded(vehicleName)
end)

RegisterCommand('cardelete', function()
    local playerPed = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(playerPed, false)

    -- If the player is not in a vehicle, get the nearest one
    if vehicle == 0 then
        vehicle = GetClosestVehicleToPlayer(playerPed)
    end

    if DoesEntityExist(vehicle) then
        DeleteVehicle(vehicle)
    else
        TriggerEvent('chat:addMessage', {
            args = { 'No vehicle found to delete.' }
        })
    end
end)

-- Function to get the closest vehicle to the player
function GetClosestVehicleToPlayer(playerPed)
    local pos = GetEntityCoords(playerPed)
    local vehicle = GetClosestVehicle(pos.x, pos.y, pos.z, 10.0, 0, 70)

    return vehicle
end