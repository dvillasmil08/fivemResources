RegisterCommand("giveweapon", function(source, args, rawCommand)
    local playerPed = PlayerPedId()
    local weaponName = args[1]

    if weaponName then
        local weaponHash = GetHashKey(weaponName)

        -- Check if the weapon exists in the game's weapon list
        if DoesWeaponExist(weaponHash) then
            GiveWeaponToPed(playerPed, weaponHash, 1000, false, true)
            TriggerEvent("chatMessage", "SYSTEM", { 255, 0, 0 }, "You have been given a " .. weaponName)
        else
            TriggerEvent("chatMessage", "SYSTEM", { 255, 0, 0 }, "Invalid weapon name.")
        end
    else
        TriggerEvent("chatMessage", "SYSTEM", { 255, 0, 0 }, "Usage: /giveweapon [weapon_name]")
    end
end, false)
