-- Amorim#0567



RegisterNetEvent("abrir")
AddEventHandler("abrir", function(id,name,idade,rg,numero,emprego,vip,cnh,porte,dinheiro,banco,home,number)

    local male = IsPedMale(GetPlayerPed(-1))
            if male then
                sex = true
            elseif not male then
                sex = 2
            end

    SendNUIMessage({
        type = "send",
        id = id,
        name = name,
        idade = idade,
        rg = rg,
        numero = numero,
        emprego = emprego,
        vip = vip,
        cnh = cnh,
        porte = porte,
        sex = sex,
        dinheiro = dinheiro,
        banco = banco,
        home = home,
        number = number,
        open = true
    })
end)


Citizen.CreateThread( function()
	while true do
        Citizen.Wait(1)
        if IsControlJustPressed(1, 243) then
            toggle1()
		end
	end
end)


local on = false
function toggle()
    on = not on
    if (on) then
        TriggerServerEvent("updates")
    else
        SendNUIMessage({
            open = false
        })
    end
end


function toggle1()
    toggle()
end