function killTutorialMenu()
SetNuiFocus( false, false )
		SendNUIMessage({
      heal = false
    })
    SendNUIMessage({
      healfree = false
    })
    SendNUIMessage({
      buy = false
    })
end


local heal = { -- Coordenadas onde vai abrir o menu de heal
    {name = "Atendimento Médico", id=80,color=59, x=326.99520874023,y=-581.52429199219,z=43.317413330078},
}

local blips = true -- Se tiver true vai aparecer os blips do atendimento médico no mapa, se tiver false não irá aparecer

local buy = { -- Lugares onde vai ficar a compra de convênios
    {name = "Convênio Unimed", id=153,color=2, x=305.41082763672,y=-595.82434082031,z=43.291843414307},
}

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(1)
    -- SetNuiFocus(false,false)
    if IsNearHeal() then
      DisplayHelpText("~g~Pressione ~INPUT_PICKUP~ para acessar o painel de atendimento.")
      if IsControlJustPressed(1,38) then
        TriggerServerEvent("heal", source)
      end
    end
    if IsNearBuy() then
      DisplayHelpText("~g~Pressione ~INPUT_PICKUP~ para acessar o painel da unimed.")
      if IsControlJustPressed(1,38) then
        TriggerServerEvent("buy", source)
      end
    end
  end
end)

RegisterNetEvent("buy")
AddEventHandler("buy", function()
  SendNUIMessage({
    buy = true
  })
  SetNuiFocus( true ,true )
end)

RegisterNetEvent("healfree")
AddEventHandler("healfree", function()
  SendNUIMessage({
    healfree = true
  })
  SetNuiFocus( true ,true )
end)

RegisterNetEvent("heal")
AddEventHandler("heal", function()
  SendNUIMessage({
    heal = true
  })
  SetNuiFocus( true ,true )
end)

function IsNearHeal()
  local ply = GetPlayerPed(-1)
  local plyCoords = GetEntityCoords(ply, 0)
  for _, item in pairs(heal) do
    local distance = GetDistanceBetweenCoords(item.x, item.y, item.z,  plyCoords["x"], plyCoords["y"], plyCoords["z"], true)
    if(distance <= 3) then
      return true
    end
  end
end

function IsNearBuy()
    local ply = GetPlayerPed(-1)
    local plyCoords = GetEntityCoords(ply, 0)
    for _, item in pairs(buy) do
      local distance = GetDistanceBetweenCoords(item.x, item.y, item.z,  plyCoords["x"], plyCoords["y"], plyCoords["z"], true)
      if(distance <= 3) then
        return true
      end
    end
  end


Citizen.CreateThread(function()
  if blips then
    for k,v in ipairs(heal)do
      local blip = AddBlipForCoord(v.x, v.y, v.z)
      SetBlipSprite(blip, v.id)
      SetBlipScale(blip, 1.0)
      SetBlipAsShortRange(blip, true)
      SetBlipColour(blip, v.color)
      BeginTextCommandSetBlipName("STRING");
      AddTextComponentString(tostring(v.name))
      EndTextCommandSetBlipName(blip)
    end
  end
end)

Citizen.CreateThread(function()
  if blips then
    for k,v in ipairs(buy)do
      local blip = AddBlipForCoord(v.x, v.y, v.z)
      SetBlipSprite(blip, v.id)
      SetBlipScale(blip, 1.2)
      SetBlipAsShortRange(blip, true)
      SetBlipColour(blip, v.color)
      BeginTextCommandSetBlipName("STRING");
      AddTextComponentString(tostring(v.name))
      EndTextCommandSetBlipName(blip)
    end
  end
end)



RegisterNUICallback('free', function(data, cb)
    free()
  	cb('ok')
end)

RegisterNUICallback('pago', function(data, cb)
    pago()
  	cb('ok')
end)

RegisterNUICallback('unimed', function(data, cb)
TriggerServerEvent("add")
  	cb('ok')
end)

RegisterNUICallback('closeButton', function(data, cb)
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
  SetEntityCoords(GetPlayerPed(-1), 349.71279907227,-583.56756591797,44.016319274902)
  TaskStartScenarioInPlace(GetPlayerPed(-1), "WORLD_HUMAN_BUM_SLUMPED", 0, true)
	Citizen.Wait(10000)
	ClearPedTasksImmediately(GetPlayerPed(-1))
end)

function free()
    local ped = GetPlayerPed(-1)
    notificar("~g~Você possui Unimed e não pagou nada pelo Serviço.")
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