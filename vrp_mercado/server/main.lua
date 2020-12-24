local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP", "vrp_mercado")
MySQL = module("vrp_mysql", "MySQL")
local cfg_inventory = module("cfg/inventory")

RegisterServerEvent("vrp_mercado:openNui")
AddEventHandler(
    "vrp_mercado:openNui",
    function()
        local user_id = vRP.getUserId({source})
        local player = vRP.getUserSource({user_id})
        local foods_table = {}
        for food_k,food_v in pairs(foods) do
            if food_k then
                table.insert(
                    foods_table,
                    {
                        name = food_k,
                        realname = food_v.name,
                        price = food_v.price,
                        icon = food_v.logo
                    }
                )
            end
        end
        TriggerClientEvent("vrp_mercado:updatecars", player, foods_table)
    end
)


RegisterServerEvent("vrp_mercado:buy:food")
AddEventHandler("vrp_mercado:buy:food", function(data)
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})
    local money = vRP.getMoney({user_id})
    local weight = vRP.getInventoryMaxWeight({user_id})
    local item_weight = vRP.getItemWeight({data.idname})
    local total_weight = item_weight*data.quantidade
    if (tonumber(data.quantidade)) then
        local price_all = data.quantidade*data.price
        if (tonumber(price_all) > money) then
            TriggerClientEvent("notify:nui3",player,"Atenção!","Você não possui dinheiro suficiente","warning")
        else
            if (tonumber(total_weight)) then
                if (tonumber(total_weight)>0 ) then
                    if weight > (tonumber(total_weight)) then
                        vRP.tryPayment({user_id,price_all})
                        vRP.giveInventoryItem({user_id,data.idname,(tonumber(data.quantidade)),true})
                        Wait(200)
                        TriggerClientEvent("notify:nui3",player,"Compra concluída com sucesso!","Você comprou "..data.quantidade.." "..data.name.." com sucesso!","success")
                    else
                        TriggerClientEvent("notify:nui3",player,"Atenção!","Você não tem espaço no inventário suficiente!","warning")
                    end
                end
            end
        end
    end
end)