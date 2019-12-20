local Proxy = module("vrp","lib/Proxy")
local Tunnel = module("vrp", "lib/Tunnel")

vRP = Proxy.getInterface("vRP")

vRPclient = Tunnel.getInterface("vrp","vrp_rg")


RegisterServerEvent("updates")
AddEventHandler("updates", function()
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})

    vRP.getUserIdentity({user_id,function(identity)
        if identity then
            vRP.getUserAddress({user_id, function(address)
                local primeiro = identity.firstname
                local segundo = identity.name
                local name = ""..primeiro.. " "..segundo
                local idade = identity.age
                local rg = identity.registration
                local numero = identity.phone
                local emprego = vRP.getUserGroupByType({user_id,"job"})
                local vip = vRP.getUserGroupByType({user_id,"vip"})
                local cnh = ""
                if vRP.hasGroup({user_id,"cnh"}) then
                    cnh = "Possui"
                else
                    cnh = "Não possui"
                end
                local porte = ""
                if vRP.hasGroup({user_id,"porte"}) then
                    porte = "Possui"
                else
                    porte = "Não possui"
                end

                function format_thousand(v)
                    local s = string.format("%d", math.floor(v))
                    local pos = string.len(s) % 3
                    if pos == 0 then pos = 3 end
                        return string.sub(s, 1, pos)
                    .. string.gsub(string.sub(s, pos+1), "(...)", ".%1")
                end

                local home = ""
                local number = ""
                if address then
                    home = address.home
                    number = address.number
                else 
                    home = "Sem casa"
                    number = ""
                end

                local dinheiro = format_thousand(math.floor(vRP.getMoney({user_id})))
                local banco = format_thousand(math.floor(vRP.getBankMoney({user_id})))

                TriggerClientEvent("abrir", player, user_id , name ,idade,rg,numero,emprego,vip,cnh,porte,"R$ "..dinheiro,"R$ "..banco,home,number)
            end})
        end
    end})
end)

RegisterServerEvent("ups")
AddEventHandler("ups", function()
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})
    local emprego = vRP.getUserGroupByType({user_id,"job"})
    local vip = vRP.getUserGroupByType({user_id,"vip"})
    if vRP.hasGroup({user_id,"cnh"}) then
        local cnh = true
    else
        cnh = false
    end
    if vRP.hasGroup({user_id,"porte"}) then
        local porte = true
    else
        porte = false
    end

    TriggerClientEvent("open",player)
end)