-- VRP - HUD - Amorim#6101

-- Citizen.CreateThread(function()
--     while true do
--         Citizen.Wait(1)
--         TriggerServerEvent("vrp_hud:update")
--     end
-- end)

AddEventHandler("playerSpawned", function()
    TriggerServerEvent("vrp_hud:update")
end)

RegisterNetEvent("vrp_hud:send")
AddEventHandler("vrp_hud:send", function(status)
    local mostrar = false
    local pause = IsPauseMenuActive()
    if pause == false then
        mostrar = true
    else
        mostrar = false
    end
    SendNUIMessage({
        show = mostrar,
        status = status
    })
end)