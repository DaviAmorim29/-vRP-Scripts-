vRP = Proxy.getInterface("vRP")

vRPserver = Tunnel.getInterface("vrp_bike_gym","vrp_bike_gym")



-- Locais
local malhar = false


local inicio = 40 -- KMH NECESSARIO PARA COMEÇAR A GANHAR XP

local seconds = 15 -- A CADA QUANTOS SEGUNDOS QUE ELE VAI RECEBER O XP



function text(str)
	SetTextComponentFormat("STRING")
	AddTextComponentString(str)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

function malharOn()
    velocidade = GetEntitySpeed(GetVehiclePedIsIn(GetPlayerPed(-1), false)) * 3.6
    ped = GetPlayerPed(-1)
    playerveh = GetVehiclePedIsIn(ped, false)
    if GetVehicleClass(playerveh) == 13 and velocidade >=30 then
        strenght = randomFloat(1.0,2.5)
        vRPserver.gainStrenght({strenght})
    end
end

Citizen.CreateThread(function()
    while true do
        velocidade = GetEntitySpeed(GetVehiclePedIsIn(GetPlayerPed(-1), false)) * 3.6
        ped = GetPlayerPed(-1)
        playerveh = GetVehiclePedIsIn(ped, false)
        while GetVehicleClass(playerveh) == 13 and velocidade >=30 do
            malharOn()
            Citizen.Wait(10000)
        end
        Citizen.Wait(1)
    end
end)


function randomFloat(lower, greater)
	x = lower + math.random()  * (greater - lower);
	result = string.format("%0.1f", x)
    return result
end