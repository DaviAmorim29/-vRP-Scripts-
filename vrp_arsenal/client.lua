function killTutorialMenu()
SetNuiFocus( false, false )
	SendNUIMessage({
      recruta = false
    })
	SendNUIMessage({
      soldado = false
    })
    SendNUIMessage({
      cabo = false
    })
	SendNUIMessage({
      sgt3 = false
    })
	SendNUIMessage({
      sgt2 = false
    })
	SendNUIMessage({
      sgt1 = false
    })
	SendNUIMessage({
      subten = false
    })
	SendNUIMessage({
      ten2 = false
    })
	SendNUIMessage({
      ten1 = false
    })
	SendNUIMessage({
      capitao = false
    })
	SendNUIMessage({
      major = false
    })
	SendNUIMessage({
      tencel = false
    })
	SendNUIMessage({
      cel = false
    })
    SendNUIMessage({
      comandante = false
    })
end

Citizen.CreateThread(function()
  while true do
  -- SetNuiFocus(false)
    Citizen.Wait(1)
    if pertoPolicia() then
      DisplayHelpText("~g~Pressione ~INPUT_PICKUP~ para acessar o arsenal.")
      if IsControlJustPressed(1,38) then
        TriggerServerEvent("test", source)
      end
    end
  end
end)

RegisterNetEvent("recruta")
AddEventHandler("recruta", function()
  SendNUIMessage({
    recruta = true
  })
  SetNuiFocus( true ,true )
end)

RegisterNetEvent("soldado")
AddEventHandler("soldado", function()
  SendNUIMessage({
    soldado = true
  })
  SetNuiFocus( true ,true )
end)

RegisterNetEvent("cabo")
AddEventHandler("cabo", function()
  SendNUIMessage({
    cabo = true
  })
  SetNuiFocus( true ,true )
end)

RegisterNetEvent("sgt3")
AddEventHandler("sgt3", function()
  SendNUIMessage({
    sgt3 = true
  })
  SetNuiFocus( true ,true )
end)

RegisterNetEvent("sgt2")
AddEventHandler("sgt2", function()
  SendNUIMessage({
    sgt2 = true
  })
  SetNuiFocus( true ,true )
end)

RegisterNetEvent("sgt1")
AddEventHandler("sgt1", function()
  SendNUIMessage({
    sgt1 = true
  })
  SetNuiFocus( true ,true )
end)

RegisterNetEvent("subten")
AddEventHandler("subten", function()
  SendNUIMessage({
    subten = true
  })
  SetNuiFocus( true ,true )
end)

RegisterNetEvent("ten2")
AddEventHandler("ten2", function()
  SendNUIMessage({
    ten2 = true
  })
  SetNuiFocus( true ,true )
end)

RegisterNetEvent("ten1")
AddEventHandler("ten1", function()
  SendNUIMessage({
    ten1 = true
  })
  SetNuiFocus( true ,true )
end)

RegisterNetEvent("capitao")
AddEventHandler("capitao", function()
  SendNUIMessage({
    capitao = true
  })
  SetNuiFocus( true ,true )
end)

RegisterNetEvent("major")
AddEventHandler("major", function()
  SendNUIMessage({
    major = true
  })
  SetNuiFocus( true ,true )
end)

RegisterNetEvent("tencel")
AddEventHandler("tencel", function()
  SendNUIMessage({
    tencel = true
  })
  SetNuiFocus( true ,true )
end)

RegisterNetEvent("cel")
AddEventHandler("cel", function()
  SendNUIMessage({
    cel = true
  })
  SetNuiFocus( true ,true )
end)

RegisterNetEvent("comandante")
AddEventHandler("comandante", function()
  SendNUIMessage({
    comandante = true
  })
  SetNuiFocus( true ,true )
end)

RegisterNetEvent("colete")
AddEventHandler("colete", function()
  local ped = GetPlayerPed(-1)
  AddArmourToPed(ped, 100)
end)

function pertoPolicia()
  local ply = GetPlayerPed(-1)
  local plyCoords = GetEntityCoords(ply, 0)
  for _, item in pairs(cfg.arsenal) do
    local distance = GetDistanceBetweenCoords(item.x, item.y, item.z,  plyCoords["x"], plyCoords["y"], plyCoords["z"], true)
    if(distance <= 3) then
      return true
    end
  end
end

Citizen.CreateThread(function()
  if cfg.blips then
    for k,v in ipairs(cfg.arsenal)do
      local blip = AddBlipForCoord(v.x, v.y, v.z)
      SetBlipSprite(blip, v.id)
      SetBlipScale(blip, 0.8)
      SetBlipAsShortRange(blip, true)
      BeginTextCommandSetBlipName("STRING");
      AddTextComponentString(tostring(v.name))
      EndTextCommandSetBlipName(blip)
    end
  end
end)

RegisterNUICallback('recruta', function(data, cb)
TriggerServerEvent("recruta")
  	cb('ok')
end)

RegisterNUICallback('soldado', function(data, cb)
TriggerServerEvent("soldado")
  	cb('ok')
end)

RegisterNUICallback('cabo', function(data, cb)
TriggerServerEvent("cabo")
  	cb('ok')
end)

RegisterNUICallback('sgt3', function(data, cb)
TriggerServerEvent("sgt3")
  	cb('ok')
end)

RegisterNUICallback('sgt2', function(data, cb)
TriggerServerEvent("sgt2")
  	cb('ok')
end)

RegisterNUICallback('sgt1', function(data, cb)
TriggerServerEvent("sgt1")
  	cb('ok')
end)

RegisterNUICallback('subten', function(data, cb)
TriggerServerEvent("subten")
  	cb('ok')
end)

RegisterNUICallback('ten2', function(data, cb)
TriggerServerEvent("ten2")
  	cb('ok')
end)

RegisterNUICallback('ten1', function(data, cb)
TriggerServerEvent("ten1")
  	cb('ok')
end)

RegisterNUICallback('capitao', function(data, cb)
TriggerServerEvent("capitao")
  	cb('ok')
end)

RegisterNUICallback('major', function(data, cb)
TriggerServerEvent("major")
  	cb('ok')
end)

RegisterNUICallback('tencel', function(data, cb)
TriggerServerEvent("tencel")
  	cb('ok')
end)

RegisterNUICallback('cel', function(data, cb)
TriggerServerEvent("cel")
  	cb('ok')
end)

RegisterNUICallback('comandante', function(data, cb)
TriggerServerEvent("comandante")
  	cb('ok')
end)

RegisterNUICallback('close', function(data, cb)
killTutorialMenu()
fechar()
  	cb('ok')
end)

function fechar()
  SetNuiFocus(false,false)
  SendNUIMessage({
    buy = false
  })
end



function pago()
    local ped = GetPlayerPed(-1)
    notificar("~g~Você será curado em breve.")
    TriggerServerEvent("deitar",source)
    Wait(10000)
    TriggerServerEvent("cobrar",source)
    SetEntityHealth(ped, 500)
end

RegisterNetEvent("parar")
AddEventHandler("parar", function()
  ClearPedTasksImmediately(GetPlayerPed(-1))
end)

RegisterNetEvent("teleport")
AddEventHandler("teleport", function()
  SetEntityCoords(GetPlayerPed(-1), 255.75007629395,-1352.1807861328,25.519519805908)
  TaskStartScenarioInPlace(GetPlayerPed(-1), "WORLD_HUMAN_BUM_SLUMPED", 0, true)
	Citizen.Wait(10000)
	ClearPedTasksImmediately(GetPlayerPed(-1))
end)

function free()
    local ped = GetPlayerPed(-1)
    notificar("~g~Você possui unimed e não pagou nada pelo serviço.")
    SetEntityHealth(ped,500)
end


function DisplayHelpText(str)
	SetTextComponentFormat("STRING")
	AddTextComponentString(str)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end
    
-- EVENTOS
RegisterNetEvent('sem:inventario')
AddEventHandler('sem:inventario', function()
    subtitle("~r~Sua Mochila Está Lotada ! ", 30000)
    notificar("~r~Inventário Lotado !")
end)

RegisterNetEvent('sem:dinheiro')
AddEventHandler('sem:dinheiro', function()
    notificar("~r~Sem dinheiro !")
end)
    
function notificar(msg)
  SetNotificationTextEntry("STRING")
  AddTextComponentString(msg)
  DrawNotification(true, false)
end

    
    --============================================================================================================================================--
       --                                     FUNÇÃO TEXTO LEGENDA                                                                            --
   --============================================================================================================================================
function subtitle(msg, duree)
    duree = duree or 500
    ClearPrints()
    SetTextEntry_2("STRING")
    AddTextComponentString(msg)
    DrawSubtitleTimed(duree, 1)
end