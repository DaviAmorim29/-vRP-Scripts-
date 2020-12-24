local sec = 20 -- Segundos para o blip ficar no mapa da policia

RegisterNetEvent("blip:notify")
AddEventHandler("blip:notify", function(x,y,z,name)
    local blip = AddBlipForCoord(x, y, z)
    local alpha = 250
    SetBlipSprite(blip,  60)
    SetBlipColour(blip,  1)
    SetBlipAlpha(blip,  alpha)
    SetBlipAsShortRange(blip,  1)
    BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(tostring(name))
      EndTextCommandSetBlipName(blip)
    SetTimeout(1000*sec, function()
        SetBlipSprite(blip,0)
        SetBlipColour(blip,0)
        SetBlipAsShortRange(blip,0)
    end)
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        local plyPos = GetEntityCoords(GetPlayerPed(-1),  true)
        if IsPedShooting(GetPlayerPed(-1)) then
            local sexo = ""
            local male = IsPedMale(GetPlayerPed(-1))
            if male then
                sexo = "Homem"
            elseif not male then
                sexo = "Mulher"
            end
            TriggerServerEvent("tiro:notify", sexo,plyPos.x, plyPos.y, plyPos.z)
            Citizen.Wait(10000)
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        local plyPos = GetEntityCoords(GetPlayerPed(-1),  true)
        if IsPedTryingToEnterALockedVehicle(GetPlayerPed(-1)) or IsPedJacking(GetPlayerPed(-1)) then
            local sexo = ""
            local male = IsPedMale(GetPlayerPed(-1))
            if male then
                sexo = "Homem"
            elseif not male then
                sexo = "Mulher"
            end
            TriggerServerEvent("roubo:notify", sexo,plyPos.x, plyPos.y, plyPos.z)
            Citizen.Wait(10000)
        end
    end
end)

--[[Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        local plyPos = GetEntityCoords(GetPlayerPed(-1),  true)
        if IsPedInMeleeCombat(GetPlayerPed(-1)) then
            local sexo = ""
            local male = IsPedMale(GetPlayerPed(-1))
            if male then
                sexo = "Homem"
            elseif not male then
                sexo = "Mulher"
            end
            TriggerServerEvent("porrada:notify", sexo,plyPos.x, plyPos.y, plyPos.z)
            Citizen.Wait(10000)
        end
    end
end)]]