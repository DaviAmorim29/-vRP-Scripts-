local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vrp_convenio")


local price = 10000 -- Preço do convênio.

local taxa = 200 -- Taxa do convênio que vai ser paga dependendo do tempo do convênio.

local time = 2 -- Tempo para pagar a taxa do convênio em minutos.

local grupo = "Convênio Unimed" -- Grupo que vai setar

local atendimento_preco_sem_convenio = math.random(1500,2500) -- preço randomizado entre 1500 e 2500

RegisterServerEvent("cobrar")
AddEventHandler("cobrar", function()
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})
    local valor = atendimento_preco_sem_convenio
    if vRP.tryFullPayment({user_id,valor}) then
        TriggerClientEvent("chatMessage", source, "[Sun Happy vRP]", {255, 0, 0}, "Você pagou ^2" .. valor .. " ^7pelo atendimento médico.")
    else
        TriggerClientEvent("chatMessage", source, "[Sun Happy vRP]", {255, 0, 0}, "Você não possui dinheiro suficiente para o tratamento.")
    end
end)

RegisterServerEvent("heal")
AddEventHandler("heal", function()
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})
    if vRP.hasGroup({user_id, grupo}) then
        TriggerClientEvent("healfree", source)
    else
        TriggerClientEvent("heal", source)
    end 
end)

RegisterServerEvent("buy")
AddEventHandler("buy", function()
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})
    if vRP.hasGroup({user_id, grupo}) then
        vRPclient.notify(player, {"~r~Você já possui ~g~UNIMED."})
    else
        TriggerClientEvent("buy", source)
    end
end)

RegisterServerEvent("deitar")
AddEventHandler("deitar", function()
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})
    TriggerClientEvent("teleport", source)
        --vRPclient.playAnim({source,false,{task="WORLD_HUMAN_BUM_SLUMPED"},false})
end)


RegisterServerEvent("add")
AddEventHandler("add", function()
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})
    if vRP.hasGroup({user_id,grupo}) then
            vRPclient.notify(player, {"~r~Você já possui um convênio."})
        else
        if vRP.tryFullPayment({user_id,price}) then
        vRP.addUserGroup({user_id,grupo})
        vRPclient.notify(player, {"~g~Você assinou o contrato da Unimed, agora você possui vários benefícios."})
        else
        vRPclient.notify(player, {"~r~Você não possui dinheiro suficiente para o contrato."})
        end
    end
end)