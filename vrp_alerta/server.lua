local Proxy = module("vrp","lib/Proxy")
local Tunnel = module("vrp", "lib/Tunnel")

vRP = Proxy.getInterface("vRP","vrp_alerta")
vRPclient = Tunnel.getInterface("vRP","vrp_alerta")

RegisterServerEvent("tiro:notify")
AddEventHandler("tiro:notify", function(sexo,x,y,z)
    local policeMembers = vRP.getUsersByPermission({"police.check"})
	for i, v in ipairs(policeMembers) do
		local player = vRP.getUserSource({tonumber(v)})
        vRP.request({player,"Ocorrencia de tiro com um(a) "..sexo..", deseja ir ?",20,function(player,ok)
            if ok then
                vRPclient.notify(player,{"~g~Foi marcada a ocorrencia de tiro."})
                TriggerClientEvent("blip:notify", player, x,y,z,"Suspeita de tiro")
                TriggerClientEvent("amorim:addWaypoint",player,x,y)
            else
                vRPclient.notify(player,{"~r~Você não marcou o destino."})
            end
        end})
	end
end)

RegisterServerEvent("roubo:notify")
AddEventHandler("roubo:notify", function(sexo,x,y,z)
    local policeMembers = vRP.getUsersByPermission({"police.check"})
	for i, v in ipairs(policeMembers) do
		local player = vRP.getUserSource({tonumber(v)})
        vRP.request({player,"Ocorrencia de roubo de carro com um(a) "..sexo..", deseja ir ?",20,function(player,ok)
            if ok then
                vRPclient.setGps(player,{x,y,z})
                vRPclient.notify(player,{"~g~Foi marcada a ocorrencia de roubo."})
                TriggerClientEvent("blip:notify", player, x,y,z,"Suspeita de roubo de carro")
            else
                vRPclient.notify(player,{"~r~Você não marcou o destino."})
            end
        end})
	end
end)

--[[RegisterServerEvent("porrada:notify")
AddEventHandler("porrada:notify", function(sexo,x,y,z)
    local policeMembers = vRP.getUsersByPermission({"police.check"})
	for i, v in ipairs(policeMembers) do
		local player = vRP.getUserSource({tonumber(v)})
        vRP.request({player,"Ocorrencia de pessoas brigando com um(a) "..sexo..", deseja ir ?",20,function(player,ok)
            if ok then
                vRPclient.setGps(player,{x,y,z})
                vRPclient.notify(player,{"~g~Foi marcada a ocorrencia de briga."})
                TriggerClientEvent("blip:notify", player, x,y,z,"Suspeita de briga")
            else
                vRPclient.notify(player,{"~r~Você não marcou o destino."})
            end
        end})
	end
end)]]