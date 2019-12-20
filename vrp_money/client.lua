-- Amorim#6101



RegisterNetEvent("vrp_money:open:c")
AddEventHandler("vrp_money:open:c", function(money,bank,id,job)
    SendNUIMessage({
        show = true,
        money = money,
        bank = bank,
        id = id,
        job = job
    })
end)


Citizen.CreateThread( function()
	while true do
        Citizen.Wait(1)
        if IsControlJustPressed(1, 246) then
            toggle1()
		end
	end
end)


local on = false
function toggle()
    on = not on
    if (on) then
        TriggerServerEvent("vrp_money:open")
    else
        SendNUIMessage({
            show = false
        })
    end
end


function toggle1()
    toggle()
end