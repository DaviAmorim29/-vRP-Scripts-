vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP", "vrp_carshop")
vRPd = {}
Tunnel.bindInterface("vrp_carshop",vRPd)
Proxy.addInterface("vrp_carshop",vRPd)





local show = false
local cooldown = 0

function openGui(cars)
  if show == false then
    show = true
    SetNuiFocus(true, true)
    SendNUIMessage(
      {
        show = true,
        foods = cars
      }
    )
  end
end

function closeGui()
  show = false
  SetNuiFocus(false)
  SendNUIMessage({show = false})
end

RegisterNetEvent("vrp_carshop:close:gui")
AddEventHandler("vrp_carshop:close:gui", function()
  closeGui()
end)


RegisterNetEvent("vrp_mercado:updatecars")
AddEventHandler(
  "vrp_mercado:updatecars",
  function(cars)
    temp_cars = cars
    openGui(temp_cars)
  end
)

RegisterNetEvent("vrp_mercado:updateUseds")
AddEventHandler(
  "vrp_mercado:updateUseds",
  function(cars)
    temp_useds = cars
    open_useds(temp_useds)
  end
)

RegisterNetEvent("vrp_mercado:closeGui")
AddEventHandler(
  "vrp_mercado:closeGui",
  function()
    closeGui()
  end
)



RegisterNetEvent("notify:nui3")
AddEventHandler("notify:nui3", function(title,desc,type)
  SendNUIMessage({
    notify = true,
    titulo = title,
    desc = desc,
    type = type
  })
end)



RegisterNUICallback(
  "close",
  function(data)
    closeGui()
  end
)

function DisplayHelpText(str)
	SetTextComponentFormat("STRING")
	AddTextComponentString(str)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

function isNearMarket()
  local ply = GetPlayerPed(-1)
  local plyCoords = GetEntityCoords(ply, 0)
  for _, item in pairs(cfg.mercados) do
    local distance = GetDistanceBetweenCoords(item.x, item.y, item.z,  plyCoords["x"], plyCoords["y"], plyCoords["z"], true)
    if(distance <= 2) then
      return true
    end
  end
end

local blips = true
Citizen.CreateThread(function()
  if blips then
    for k,v in ipairs(cfg.mercados)do
      local blip = AddBlipForCoord(v.x, v.y, v.z)
      SetBlipSprite(blip, v.id)
      SetBlipScale(blip, 0.8)
      SetBlipAsShortRange(blip, true)
      SetBlipColour(blip, v.color)
      BeginTextCommandSetBlipName("STRING");
      AddTextComponentString(tostring(v.name))
      EndTextCommandSetBlipName(blip)
    end
  end
end)


Citizen.CreateThread(function()
  while true do
    Citizen.Wait(1000)
    if cooldown > 0 then 
      cooldown = cooldown - 1
    end
  end
end)




Citizen.CreateThread(
  function()
    while true do
      Citizen.Wait(0)
      for k,v in ipairs(cfg.mercados) do
        DrawMarker(27, v.x,v.y,v.z-0.8, 0, 0, 0, 0, 0, 0, 1.301, 1.3001, 0.3001, 150, 2, 2, 255, 0, 0, 0, 0)
      end
      if isNearMarket() then
        DisplayHelpText("~r~Pressione ~INPUT_PICKUP~ para acessar o mercado")
        if IsControlPressed(1, cfg.openNui) then
          TriggerServerEvent("vrp_mercado:openNui")
        end
      end
    end
  end
)



AddEventHandler(
  "onResourceStop",
  function(resource)
    if resource == GetCurrentResourceName() then
      closeGui()
    end
  end
)




RegisterNUICallback("buy", function(data)
  TriggerServerEvent("vrp_mercado:buy:food",data)
end)