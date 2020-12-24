vRP = Proxy.getInterface("vRP")

local menuEnabled = false

function killTutorialMenu()
SetNuiFocus( false )
	SendNUIMessage({
		showPlayerMenu = false
	})
	menuEnabled = false
end
RegisterNetEvent('gps')
AddEventHandler('gps', function()
	SetNuiFocus( true, true )
	SendNUIMessage({
	    showPlayerMenu = true
	})
end)

RegisterNUICallback('hospital', function(data, cb)
TriggerServerEvent("hospital")
  	cb('ok')
end)

RegisterNUICallback('praca', function(data, cb)
TriggerServerEvent("praca")
  	cb('ok')
end)

RegisterNUICallback('delegacia', function(data, cb)
TriggerServerEvent("delegacia")
  	cb('ok')
end)

RegisterNUICallback('academia', function(data, cb)
TriggerServerEvent("academia")
  	cb('ok')
end)

RegisterNUICallback('concessionaria', function(data, cb)
TriggerServerEvent("concessionaria")
  	cb('ok')
end)

RegisterNUICallback('agencia', function(data, cb)
TriggerServerEvent("agencia")
  	cb('ok')
end)

RegisterNUICallback('favela', function(data, cb)
TriggerServerEvent("favela")
  	cb('ok')
end)

RegisterNUICallback('closeButton', function(data, cb)
	killTutorialMenu()
  	cb('ok')
end)

RegisterNetEvent("notify")
AddEventHandler("notify", function()
 notificar("~r~Você não possui um ~g~GPS, ~r~Compre um em alguma loja !")
end)

function notificar(msg)
	SetNotificationTextEntry("STRING")
	AddTextComponentString(msg)
	DrawNotification(false, false)
end