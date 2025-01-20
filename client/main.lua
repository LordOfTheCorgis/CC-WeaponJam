-- Tracks the jammed state of each weapon
local jammedWeapons = {}

function attemptToJamWeapon()
    local playerPed = PlayerPedId()
    local weapon = GetSelectedPedWeapon(playerPed)

    if not jammedWeapons[weapon] and math.random() < Config.JamChance then
        if isMeleeOrThrowable(weapon) then return end

        jammedWeapons[weapon] = true
        TriggerEvent("weaponJam:notify", Config.Messages.Jammed)
        disableWeaponFire(weapon)
    end
end

function isMeleeOrThrowable(weapon)
    local weaponGroup = GetWeapontypeGroup(weapon)
    return weaponGroup == 416676503 or weaponGroup == -1609580060
end

function disableWeaponFire(weapon)
    Citizen.CreateThread(function()
        while jammedWeapons[weapon] do
            Citizen.Wait(0)
            local playerPed = PlayerPedId()
            local currentWeapon = GetSelectedPedWeapon(playerPed)

            if currentWeapon == weapon then
                DisableControlAction(0, 24, true)
                DisableControlAction(0, 257, true)
                DisableControlAction(0, 69, true)
                DisablePlayerFiring(playerPed, true)
            end
        end
    end)
end

function fixWeaponJam()
    local playerPed = PlayerPedId()
    local weapon = GetSelectedPedWeapon(playerPed)

    if jammedWeapons[weapon] then
        TriggerEvent("weaponJam:notify", Config.Messages.Fixing)
        Citizen.Wait(Config.FixTime)
        jammedWeapons[weapon] = nil
        TriggerEvent("weaponJam:notify", Config.Messages.Fixed)
    end
end

RegisterNetEvent("weaponJam:notify")
AddEventHandler("weaponJam:notify", function(message)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(message)
    DrawNotification(false, true)
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        local playerPed = PlayerPedId()
        local weapon = GetSelectedPedWeapon(playerPed)

        if jammedWeapons[weapon] and IsControlJustPressed(1, Config.JamFixKey) then
            fixWeaponJam()
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        if IsPedShooting(PlayerPedId()) then
            attemptToJamWeapon()
        end
    end
end)