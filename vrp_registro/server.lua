local Proxy = module("vrp","lib/Proxy")

vRP = Proxy.getInterface("vRP")
MySQL = module("vrp_mysql", "MySQL")


MySQL.createCommand("vRP/pegarMade","SELECT made FROM vrp_user_identities WHERE user_id = @user_id")

MySQL.createCommand("vRP/pegarHistoria","SELECT historia FROM vrp_user_identities WHERE user_id = @user_id")

MySQL.createCommand("vRP/pegarSexo","SELECT sexo FROM vrp_user_identities WHERE user_id = @user_id")


RegisterServerEvent("att:identity")
AddEventHandler("att:identity", function(data)
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})
    vRP.getUserIdentity({user_id,function(identity)
        MySQL.execute("vRP/update_user_identity_history",{
            firstname = data.nome,
            name = data.sobrenome,
            user_id = user_id,
            age = data.idade,
            registration = identity.registration,
            historia = data.historia,
            made = "feito",
            phone = identity.phone,
            sexo = data.sexo
        })
    end})
    TriggerClientEvent("fechar:identity",player)
end)

RegisterServerEvent("concluido")
AddEventHandler("concluido", function()
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})
    TriggerClientEvent("amorim:notify2", player, "sucess","Você fez a identidade com sucesso!")
    Wait(3000)
    vRP.addXP({user_id,500})
end)

RegisterServerEvent("load:identity")
AddEventHandler("load:identity", function(data)
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})
        local meio = data.sexo
        if meio == "feminino" then
            TriggerClientEvent("spawn:identity", player, "mp_f_freemode_01")
        elseif meio == "masculino" then
            TriggerClientEvent("spawn:identity", player,"mp_m_freemode_01")
        end
end)

-- RegisterServerEvent("teste_identity")
-- AddEventHandler("teste_identity", function()
--     local user_id = vRP.getUserId({source})
--     local player = vRP.getUserSource({user_id})
--     MySQL.query("vRP/pegarMade",{user_id = user_id},function(result,affected)
--         local feito = result[1].made
--         print(feito)
--         MySQL.query("vRP/pegarHistoria",{user_id = user_id},function(result,affected)
--             local historia = result[1].historia
--             print(historia)
--         end)
--     end)
-- end)


AddEventHandler("vRP:playerSpawn", function(user_id,source,first_spawn)
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})
    if first_spawn then
        MySQL.query("vRP/pegarMade",{user_id = user_id}, function(result,affected)
            local verify = result[1].made
            if verify == "feito" then
                TriggerClientEvent("fechar:identity",player)
            else
                TriggerClientEvent("effects:identity",player)
                Wait(1500)
                TriggerClientEvent("openidentity:nui",player)
            end
        end)
    end
end)