local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

MySQL = module("vrp_mysql", "MySQL")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vrp_ilegal")

RegisterServerEvent("emprego")
AddEventHandler("emprego", function(emprego)
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})
    if vRP.hasGroup({user_id, "user"}) then
        vRP.addUserGroup({user_id, emprego})
        vRPclient.notify(player,{"~g~Você agora é "..emprego})
    end
end)