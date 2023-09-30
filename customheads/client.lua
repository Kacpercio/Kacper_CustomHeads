local started = false

RegisterNetEvent('playerSpawned')
AddEventHandler('playerSpawned', function()
    if not started then
        Citizen.CreateThread(function()
            started = true
            while true do
                Citizen.Wait(30)
                local ped = PlayerPedId()
                local cv, boneIndex = GetPedLastDamageBone(ped)
                local weapon = HasEntityBeenDamagedByWeapon(ped, 0, 4)
                local weaponTazer = HasEntityBeenDamagedByWeapon(ped, "WEAPON_STUNGUN", 0)
                local weaponSnow = HasEntityBeenDamagedByWeapon(ped, "WEAPON_SNOWBALL", 0)
                local weaponMelee = HasEntityBeenDamagedByWeapon(ped, 0, 1)
                
                if weaponTazer == 1 or weaponMelee == 1 or weaponSnow == 1 then
                    --print("mele albo tazer")
                else
                    if boneIndex == 31086 then
                        started = false
                        ApplyDamageToPed(ped, 300, 1)
                        break
                    end
                end
            end
        end)
    end
end)