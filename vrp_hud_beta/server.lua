local Proxy = module("vrp","lib/Proxy")
local Tunnel = module("vrp","lib/Tunnel")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP", "vrp_hud_beta")

RegisterServerEvent("vrp_hud:update")
AddEventHandler("vrp_hud:update", function()
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})
    local status = {}
    if user_id ~= nil then
        local sede = math.floor(vRP.getThirst({user_id}))
        local fome = math.floor(vRP.getHunger({user_id}))
        table.insert(status,{
            sede = sede,
            fome = fome
        })
        TriggerClientEvent("vrp_hud:send", player, status)
    end
end)