local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vrp_arsenal")
BMclient = Tunnel.getInterface("vrp_basic_menu")

RegisterServerEvent("recruta")
AddEventHandler("recruta", function()
    local source = source
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})
    vRPclient.giveWeapons(player,{{
        ["WEAPON_COMBATPISTOL"] = {ammo=250},
        ["WEAPON_NIGHTSTICK"] = {ammo=250},
        ["WEAPON_STUNGUN"] = {ammo=200}
      }, true})
      TriggerClientEvent("colete", source)
	vRPclient.notify(player,{"~g~Recebeu seus Equipamentos."})
end)

RegisterServerEvent("soldado")
AddEventHandler("soldado", function()
    local source = source
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})
    vRPclient.giveWeapons(player,{{
        ["WEAPON_COMBATPISTOL"] = {ammo=250},
        ["WEAPON_PUMPSHOTGUN"] = {ammo=50},
        ["WEAPON_NIGHTSTICK"] = {ammo=250},
        ["WEAPON_STUNGUN"] = {ammo=200}
      }, true})
      TriggerClientEvent("colete", source)
	vRPclient.notify(player,{"~g~Recebeu seus Equipamentos."})
end)

RegisterServerEvent("cabo")
AddEventHandler("cabo", function()
    local source = source
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})
    vRPclient.giveWeapons(player,{{
        ["WEAPON_COMBATPISTOL"] = {ammo=250},
	    ["WEAPON_PUMPSHOTGUN"] = {ammo=50},
	    ["WEAPON_SMG"] = {ammo=250},
        ["WEAPON_NIGHTSTICK"] = {ammo=250},
        ["WEAPON_STUNGUN"] = {ammo=200},
      }, true})
      TriggerClientEvent("colete", source)
    vRPclient.notify(player,{"~g~Recebeu seus Equipamentos."})
end)

RegisterServerEvent("sgt3")
AddEventHandler("sgt3", function()
    local source = source
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})
    vRPclient.giveWeapons(player,{{
        ["WEAPON_COMBATPISTOL"] = {ammo=250},
	    ["WEAPON_PUMPSHOTGUN"] = {ammo=50},
	    ["WEAPON_SMG"] = {ammo=250},
        ["WEAPON_NIGHTSTICK"] = {ammo=250},
        ["WEAPON_STUNGUN"] = {ammo=200},
      }, true})
      TriggerClientEvent("colete", source)
    vRPclient.notify(player,{"~g~Recebeu seus Equipamentos."})
end)

RegisterServerEvent("sgt2")
AddEventHandler("sgt2", function()
    local source = source
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})
    vRPclient.giveWeapons(player,{{
        ["WEAPON_COMBATPISTOL"] = {ammo=250},
	    ["WEAPON_PUMPSHOTGUN"] = {ammo=50},
	    ["WEAPON_CARBINERIFLE"] = {ammo=200},
        ["WEAPON_NIGHTSTICK"] = {ammo=250},
        ["WEAPON_STUNGUN"] = {ammo=200},
      }, true})
      TriggerClientEvent("colete", source)
    vRPclient.notify(player,{"~g~Recebeu seus Equipamentos."})
end)

RegisterServerEvent("sgt1")
AddEventHandler("sgt1", function()
    local source = source
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})
    vRPclient.giveWeapons(player,{{
        ["WEAPON_COMBATPISTOL"] = {ammo=250},
	    ["WEAPON_PUMPSHOTGUN"] = {ammo=50},
	    ["WEAPON_CARBINERIFLE"] = {ammo=250},
        ["WEAPON_NIGHTSTICK"] = {ammo=250},
        ["WEAPON_STUNGUN"] = {ammo=200},
      }, true})
      TriggerClientEvent("colete", source)
    vRPclient.notify(player,{"~g~Recebeu seus Equipamentos."})
end)

RegisterServerEvent("subten")
AddEventHandler("subten", function()
    local source = source
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})
    vRPclient.giveWeapons(player,{{
        ["WEAPON_COMBATPISTOL"] = {ammo=250},
	    ["WEAPON_PUMPSHOTGUN"] = {ammo=50},
	    ["WEAPON_CARBINERIFLE"] = {ammo=250},
        ["WEAPON_NIGHTSTICK"] = {ammo=250},
        ["WEAPON_STUNGUN"] = {ammo=200},
      }, true})
      TriggerClientEvent("colete", source)
    vRPclient.notify(player,{"~g~Recebeu seus Equipamentos."})
end)

RegisterServerEvent("ten2")
AddEventHandler("ten2", function()
    local source = source
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})
    vRPclient.giveWeapons(player,{{
        ["WEAPON_COMBATPISTOL"] = {ammo=250},
	    ["WEAPON_PUMPSHOTGUN"] = {ammo=50},
	    ["WEAPON_CARBINERIFLE"] = {ammo=250},
        ["WEAPON_NIGHTSTICK"] = {ammo=250},
        ["WEAPON_STUNGUN"] = {ammo=200},
      }, true})
      TriggerClientEvent("colete", source)
    vRPclient.notify(player,{"~g~Recebeu seus Equipamentos."})
end)

RegisterServerEvent("ten1")
AddEventHandler("ten1", function()
    local source = source
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})
    vRPclient.giveWeapons(player,{{
        ["WEAPON_COMBATPISTOL"] = {ammo=250},
	    ["WEAPON_PUMPSHOTGUN"] = {ammo=50},
	    ["WEAPON_CARBINERIFLE"] = {ammo=250},
        ["WEAPON_NIGHTSTICK"] = {ammo=250},
        ["WEAPON_STUNGUN"] = {ammo=200},
      }, true})
      TriggerClientEvent("colete", source)
    vRPclient.notify(player,{"~g~Recebeu seus Equipamentos."})
end)

RegisterServerEvent("capitao")
AddEventHandler("capitao", function()
    local source = source
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})
    vRPclient.giveWeapons(player,{{
        ["WEAPON_COMBATPISTOL"] = {ammo=250},
	    ["WEAPON_PUMPSHOTGUN"] = {ammo=50},
	    ["WEAPON_CARBINERIFLE"] = {ammo=250},
        ["WEAPON_NIGHTSTICK"] = {ammo=250},
        ["WEAPON_STUNGUN"] = {ammo=200},
      }, true})
      TriggerClientEvent("colete", source)
    vRPclient.notify(player,{"~g~Recebeu seus Equipamentos."})
end)

RegisterServerEvent("major")
AddEventHandler("major", function()
    local source = source
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})
    vRPclient.giveWeapons(player,{{
        ["WEAPON_COMBATPISTOL"] = {ammo=250},
	    ["WEAPON_PUMPSHOTGUN"] = {ammo=50},
	    ["WEAPON_CARBINERIFLE"] = {ammo=250},
        ["WEAPON_NIGHTSTICK"] = {ammo=250},
        ["WEAPON_STUNGUN"] = {ammo=200},
      }, true})
      TriggerClientEvent("colete", source)
    vRPclient.notify(player,{"~g~Recebeu seus Equipamentos."})
end)

RegisterServerEvent("tencel")
AddEventHandler("tencel", function()
    local source = source
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})
    vRPclient.giveWeapons(player,{{
        ["WEAPON_COMBATPISTOL"] = {ammo=250},
	    ["WEAPON_PUMPSHOTGUN"] = {ammo=50},
	    ["WEAPON_CARBINERIFLE"] = {ammo=250},
        ["WEAPON_NIGHTSTICK"] = {ammo=250},
        ["WEAPON_STUNGUN"] = {ammo=200},
      }, true})
      TriggerClientEvent("colete", source)
    vRPclient.notify(player,{"~g~Recebeu seus Equipamentos."})
end)

RegisterServerEvent("cel")
AddEventHandler("cel", function()
    local source = source
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})
    vRPclient.giveWeapons(player,{{
        ["WEAPON_COMBATPISTOL"] = {ammo=250},
	    ["WEAPON_PUMPSHOTGUN"] = {ammo=50},
	    ["WEAPON_CARBINERIFLE"] = {ammo=250},
        ["WEAPON_NIGHTSTICK"] = {ammo=250},
        ["WEAPON_STUNGUN"] = {ammo=200},
      }, true})
      TriggerClientEvent("colete", source)
    vRPclient.notify(player,{"~g~Recebeu seus Equipamentos."})
end)

RegisterServerEvent("comandante")
AddEventHandler("comandante", function()
    local source = source
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})
    vRPclient.giveWeapons(player,{{
        ["WEAPON_COMBATPISTOL"] = {ammo=250},
	    ["WEAPON_PUMPSHOTGUN"] = {ammo=50},
	    ["WEAPON_SMG"] = {ammo=250},
	    ["WEAPON_CARBINERIFLE"] = {ammo=250},
        ["WEAPON_NIGHTSTICK"] = {ammo=250},
        ["WEAPON_STUNGUN"] = {ammo=200},
      }, true})
      TriggerClientEvent("colete", source)
    vRPclient.notify(player,{"~g~Recebeu seus Equipamentos."})
end)

RegisterServerEvent("test")
AddEventHandler("test", function()
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})
    
    if vRP.hasPermission({user_id, "recruta.kit"}) then
        TriggerClientEvent("recruta", source)
    elseif vRP.hasPermission({user_id, "soldado.kit"}) then
        TriggerClientEvent("soldado", source)
	elseif vRP.hasPermission({user_id, "cabo.kit"}) then
        TriggerClientEvent("cabo", source)
	elseif vRP.hasPermission({user_id, "sgt3.kit"}) then
        TriggerClientEvent("sgt3", source)
    elseif vRP.hasPermission({user_id, "sgt2.kit"}) then
        TriggerClientEvent("sgt2", source)
    elseif vRP.hasPermission({user_id, "sgt1.kit"}) then
        TriggerClientEvent("sgt1", source)
    elseif vRP.hasPermission({user_id, "subten.kit"}) then
        TriggerClientEvent("subten", source)
    elseif vRP.hasPermission({user_id, "ten2.kit"}) then
        TriggerClientEvent("ten2", source)
    elseif vRP.hasPermission({user_id, "ten1.kit"}) then
        TriggerClientEvent("ten1", source)		
    elseif vRP.hasPermission({user_id, "capitao.kit"}) then
        TriggerClientEvent("capitao", source)
    elseif vRP.hasPermission({user_id, "major.kit"}) then
        TriggerClientEvent("major", source)	
    elseif vRP.hasPermission({user_id, "tencel.kit"}) then
        TriggerClientEvent("tencel", source)
    elseif vRP.hasPermission({user_id, "cel.kit"}) then
        TriggerClientEvent("cel", source)
    elseif vRP.hasPermission({user_id, "comandante.kit"}) then
        TriggerClientEvent("comandante", source)
    else
        vRPclient.notify(player,{"~r~Você não possui nenhuma Permissão."})
    end 
end)

-- RegisterServerEvent("test")
-- AddEventHandler("test", function()
--     local user_id = vRP.getUserId({source})
--     local player = vRP.getUserSource({user_id})

--     if vRP.hasGroup({user_id,"[PMERJ] Recruta"}) then
--         TriggerClientEvent("recruta", source)
--     elseif vRP.hasGroup({user_id,"[PMERJ] Soldado"}) or vRP.hasGroup({user_id,"[BOPE] Soldado"}) then
--         TriggerClientEvent("soldado", source)
--     elseif vRP.hasGroup({user_id,"[PMERJ] Cabo"}) or vRP.hasGroup({user_id,"[BOPE] Cabo"}) then
--         TriggerClientEvent("cabo", source)
--     elseif vRP.hasGroup({user_id,"[PMERJ] 3º Sargento"}) or vRP.hasGroup({user_id})
--     end

-- end)