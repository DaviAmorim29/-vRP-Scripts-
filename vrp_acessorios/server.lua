local Proxy = module("vrp", "lib/Proxy")
local Tunnel = module("vrp", "lib/Tunnel")

vRP = Proxy.getInterface("vRP")

vRPclient = Tunnel.getInterface("vRP")

RegisterCommand("silenciador", function(source)
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})
    if (vRP.getInventoryItemAmount({user_id,"silenciador"}) >=1) then
        TriggerClientEvent("silenciador", source)
    else
        vRPclient.notify(player,{"~r~Você não possui um silenciador."})
    end
end)

RegisterCommand("lanterna", function(source)
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})
    if (vRP.getInventoryItemAmount({user_id,"lanterna"}) >=1) then
        TriggerClientEvent("lanterna", source)
    else
        vRPclient.notify(player,{"~r~Você não possui uma lanterna."})
    end
end)

RegisterCommand("grip", function(source)
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})
    if (vRP.getInventoryItemAmount({user_id,"grip"}) >=1) then
        TriggerClientEvent("grip", source)
    else
        vRPclient.notify(player,{"~r~Você não possui um grip."})
    end
end)

RegisterCommand("skin", function(source)
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})
    if (vRP.getInventoryItemAmount({user_id,"skin"}) >=1) then
        TriggerClientEvent("skin", source)
    else
        vRPclient.notify(player,{"~r~Você não possui uma skin."})
    end
end)