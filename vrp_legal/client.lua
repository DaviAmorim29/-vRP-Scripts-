function killTutorialMenu()
SetNuiFocus( false, false )
    SendNUIMessage({
      legal = false
    })
end

vRP = Proxy.getInterface("vRP")
vRPg = Proxy.getInterface("vRP_legal")

Citizen.CreateThread(function()
  while true do
    if isNearConce() then
      DisplayHelpText("~g~Pressione ~INPUT_PICKUP~ para entrar na Agência de Empregos.")
      if IsControlJustPressed(1, 38) then
        SetNuiFocus(true,true)
        SendNUIMessage({
          legal = true
        })
      end
    end
    Citizen.Wait(3)
  end
end)

function isNearConce()
  local ply = GetPlayerPed(-1)
  local plyCoords = GetEntityCoords(ply, 0)
  for _, item in pairs(cfg.conce) do
    local distance = GetDistanceBetweenCoords(item.x, item.y, item.z,  plyCoords["x"], plyCoords["y"], plyCoords["z"], true)
    if(distance <= 2) then
      return true
    end
  end
end



Citizen.CreateThread(function()
  if cfg.blips then
    for k,v in ipairs(cfg.conce)do
      local blip = AddBlipForCoord(v.x, v.y, v.z)
      SetBlipSprite(blip, v.id)
      SetBlipScale(blip, 0.8)
	  SetBlipColour(blip, v.color)
      SetBlipAsShortRange(blip, true)
      BeginTextCommandSetBlipName("STRING");
      AddTextComponentString(tostring(v.name))
      EndTextCommandSetBlipName(blip)
    end
  end
end)

RegisterNUICallback('minerador', function(data, cb)
    TriggerServerEvent("emprego","Minerador")
  	cb('ok')
end)

RegisterNUICallback('mecanico', function(data, cb)
    TriggerServerEvent("emprego","Mecânico")
  	cb('ok')
end)

RegisterNUICallback('taxi', function(data, cb)
    TriggerServerEvent("emprego","Taxista")
  	cb('ok')
end)

RegisterNUICallback('sedex', function(data, cb)
    TriggerServerEvent("emprego","Sedex")
  	cb('ok')
end)

RegisterNUICallback('pescador', function(data, cb)
  TriggerServerEvent("emprego","Pescador")
  cb('ok')
end)

RegisterNUICallback('lixeiro', function(data, cb)
  TriggerServerEvent("emprego","Lixeiro")
  cb('ok')
end)

RegisterNUICallback('close', function(data, cb)
    killTutorialMenu()
  	cb('ok')
end)

function DisplayHelpText(str)
	SetTextComponentFormat("STRING")
	AddTextComponentString(str)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

RegisterNetEvent('sem:inventario')
AddEventHandler('sem:inventario', function()
    notificar("~r~Inventário Lotado !")
end)

function notificar(msg)
  SetNotificationTextEntry("STRING")
  AddTextComponentString(msg)
  DrawNotification(true, false)
end