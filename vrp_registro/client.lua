local nome_cidade = "Amorim vRP"

function KillMenu()
    SendNUIMessage({
        mostrar = false
    })
    SetNuiFocus(false,false)
    SetEntityInvincible(GetPlayerPed(-1),false)
	SetEntityVisible(GetPlayerPed(-1),true)
	FreezeEntityPosition(GetPlayerPed(-1),false) 
end

function openMenu()
    SendNUIMessage({
        mostrar = true
    })
end

RegisterNetEvent("fechar:identity")
AddEventHandler("fechar:identity", function()
    KillMenu()
    SetNuiFocus(false,false)
    SetEntityInvincible(GetPlayerPed(-1),false)
	SetEntityVisible(GetPlayerPed(-1),true)
	FreezeEntityPosition(GetPlayerPed(-1),false) 
end)

RegisterNetEvent("effects:identity")
AddEventHandler("effects:identity", function()
        SetEntityInvincible(GetPlayerPed(-1),true)
        SetEntityVisible(GetPlayerPed(-1),false)
        FreezeEntityPosition(GetPlayerPed(-1),true)
        DoScreenFadeOut(2000)
end)

-- Citizen.CreateThread(function()
--     while true do
--         local model = "mp_f_freemode_01"
--         local mhash = GetHashKey(model)
--         if IsControlJustPressed(1,38) then
--             if mhash ~= nil then
--                 local i = 0
--                 while not HasModelLoaded(mhash) and i < 10000 do
--                   RequestModel(mhash)
--                   Citizen.Wait(10)
--                 end
        
--                 if HasModelLoaded(mhash) then
--                   SetPlayerModel(PlayerId(), mhash)
--                   SetModelAsNoLongerNeeded(mhash)
--                 end
--             end
--         end
--         Citizen.Wait(1)
--     end
-- end)

RegisterNetEvent("spawn:identity")
AddEventHandler("spawn:identity",function(model)
    Citizen.CreateThread(function()
        local mhash = GetHashKey(model)
        if mhash ~= nil then
            local i = 0
            while not HasModelLoaded(mhash) and i < 10000 do
                RequestModel(mhash)
                Citizen.Wait(10)
            end
            
            if HasModelLoaded(mhash) then
                SetPlayerModel(PlayerId(), mhash)
                SetModelAsNoLongerNeeded(mhash)
            end
        end
        SetEntityCoords(GetPlayerPed(-1), 237.39944458008,-408.18264770508,47.924365997314,1, 0, 0, 1)
        Wait(1)
    end)
end)

RegisterNetEvent("openidentity:nui")
AddEventHandler("openidentity:nui", function()
    openMenu()
    SetNuiFocus(true, true)
end)

-- Citizen.CreateThread(function()
--     while true do
--         --SetNuiFocus(false)
--         if IsControlJustPressed(1, 38) then
--             TriggerServerEvent("teste_identity")
--         end
--     Citizen.Wait(1)
--     end
-- end)



-- Pegar informações da NUI
RegisterNUICallback("concluir", function(data,cb)
    if not (#data.nome>0) and not (data.sobrenome>0) then
        KillMenu()
    else
        TriggerServerEvent("att:identity", data)
        TriggerEvent("amorim:notify", "~g~Você se cadastrou com sucesso.")
        TriggerEvent("amorim:notify","~g~Seja bem vindo a cidade "..nome_cidade.." "..data.nome)
        KillMenu()
        TriggerServerEvent("load:identity",data)
        Citizen.Wait(10000)
        DoScreenFadeIn(8000)
        Citizen.Wait(2500)
        TriggerServerEvent("concluido")
        cb('ok')
    end
end)