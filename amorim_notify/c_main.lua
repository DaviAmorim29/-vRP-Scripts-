RegisterNetEvent("amorim:notify2")
AddEventHandler("amorim:notify2", function(tipo,msg)
    SendNUIMessage({
        tipo = tipo,
        msg = msg
    })
end)