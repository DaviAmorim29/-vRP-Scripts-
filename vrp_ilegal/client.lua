function killTutorialMenu()
SetNuiFocus( false, false )
    SendNUIMessage({
      legal = false
    })
end

vRP = Proxy.getInterface("vRP")
vRPg = Proxy.getInterface("vRP_ilegal")

Citizen.CreateThread(function()
  while true do
    if isNearConce() then
      DisplayHelpText("~g~Pressione ~INPUT_PICKUP~ para ver os Empregos Ilegais.")
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

RegisterNUICallback('cocaina', function(data, cb)
    TriggerServerEvent("emprego","Traficante de Cocaina")
  	cb('ok')
end)

RegisterNUICallback('maconha', function(data, cb)
    TriggerServerEvent("emprego","Traficante de Maconha")
  	cb('ok')
end)

RegisterNUICallback('metanfetamina', function(data, cb)
    TriggerServerEvent("emprego","Traficante de Metanfetamina")
  	cb('ok')
end)

RegisterNUICallback('hacker', function(data, cb)
    TriggerServerEvent("emprego","Hacker")
  	cb('ok')
end)

RegisterNUICallback('ladraocarros', function(data, cb)
  TriggerServerEvent("emprego","Ladrao de Carros")
  cb('ok')
end)

RegisterNUICallback('assaltante', function(data, cb)
  TriggerServerEvent("emprego","Assaltante")
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