local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vrp_bike_gym")
vRPCgym = Tunnel.getInterface("vrp_bike_gym","vrp_bike_gym")

vRPgym = {}
Tunnel.bindInterface("vrp_bike_gym",vRPgym)
Proxy.addInterface("vrp_bike_gym",vRPgym)




function vRPgym.gainStrenght(strenght)
	user_id = vRP.getUserId({source})
	
	local parts = splitString("physical.strength",".")
    if #parts == 2 then
        vRP.varyExp({user_id,parts[1],parts[2],tonumber(strenght)})
    end
end