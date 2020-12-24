--[[
  __  __           _            _                 _  __                         _____  
 |  \/  |         | |          | |               | |/ /                        |  __ \ 
 | \  / | __ _  __| | ___      | |__  _   _      | ' / __ _ ___ _ __   ___ _ __| |__) |
 | |\/| |/ _` |/ _` |/ _ \     | '_ \| | | |     |  < / _` / __| '_ \ / _ \ '__|  _  / 
 | |  | | (_| | (_| |  __/     | |_) | |_| |     | . \ (_| \__ \ |_) |  __/ |  | | \ \ 
 |_|  |_|\__,_|\__,_|\___|     |_.__/ \__, |     |_|\_\__,_|___/ .__/ \___|_|  |_|  \_\
                                       __/ |                   | |                     
                                      |___/                    |_|                     

  Author: Kasper Rasmussen
  Steam: https://steamcommunity.com/id/kasperrasmussen
]]

local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP", "kasperr_helpdesk")

-- Server events
RegisterServerEvent("kasperr_helpdesk:getCases")
AddEventHandler("kasperr_helpdesk:getCases", function()
    local user_id = vRP.getUserId({source})
    local _source = source
    showMyCases(user_id, _source)
end)

RegisterServerEvent("kasperr_helpdesk:getCase")
AddEventHandler("kasperr_helpdesk:getCase", function(id)
    local user_id = vRP.getUserId({source})
    local _source = source
    openCase(id, _source, user_id)
end)

RegisterServerEvent("kasperr_helpdesk:applyReply")
AddEventHandler("kasperr_helpdesk:applyReply", function(message, id)
    local user_id = vRP.getUserId({source})
    local _source = source
    addReply(user_id, message, id)
    openCase(id, _source, user_id)
end)

RegisterServerEvent("kasperr_helpdesk:closeCase")
AddEventHandler("kasperr_helpdesk:closeCase", function(id)
    local user_id = vRP.getUserId({source})
    local _source = source
    closeCase(id)
    openCase(id, _source, user_id)
end)

RegisterServerEvent("kasperr_helpdesk:deleteCase")
AddEventHandler("kasperr_helpdesk:deleteCase", function(id)
    local user_id = vRP.getUserId({source})
    local _source = source
    deleteCase(id)
    showMyCases(user_id, _source)
end)

RegisterServerEvent("kasperr_helpdesk:newCase")
AddEventHandler("kasperr_helpdesk:newCase", function(title, message)
    local user_id = vRP.getUserId({source})
    local _source = source
    newCase(user_id, title, message)
    showMyCases(user_id, _source)
    players = {}
    local users = vRP.getUsers({})
    for k,v in pairs(users) do
        local player = vRP.getUserSource({tonumber(k)})
        if vRP.hasPermission({k,"admin.mod"}) and player ~= nil then
            table.insert(players,player)
        end
    end

    for k,v in pairs(players) do
        TriggerClientEvent("amorim:notify2", v, "sucess","Novo ticket de ADMIN")
    end
end)

RegisterServerEvent("kasperr_helpdesk:getSupportCases")
AddEventHandler("kasperr_helpdesk:getSupportCases", function()
    local user_id = vRP.getUserId({source})
    local _source = source
    showSupportCases(_source, user_id)
end)

RegisterServerEvent("kasperr_helpdesk:gotoPlayer")
AddEventHandler("kasperr_helpdesk:gotoPlayer", function(targetID)
    local user_id = vRP.getUserId({source})
    local _source = source
    local targetPlayer = vRP.getUserSource({tonumber(targetID)})
    if targetPlayer ~= nil then
      vRPclient.getPosition(targetPlayer,{},function(x,y,z)
        vRPclient.teleport(_source,{x,y,z})
      end)
    end
end)

-- Open menu functions
function showMyCases(user_id, _source)
    MySQL.Async.fetchAll('SELECT * FROM kasperr_helpdesk_cases WHERE user_id = @user_id', {
        ["@user_id"] = user_id
    }, function(data)
        local supportPermissions = false
        if vRP.hasPermission({user_id, Config.RequiredSupportPermission}) then
            supportPermissions = true
        end
        TriggerClientEvent("kasperr_helpdesk:showMyCases", _source, data, {
            supportPermissions = supportPermissions
        })
    end)
end

function showSupportCases(_source, user_id)
    MySQL.Async.fetchAll('SELECT * FROM kasperr_helpdesk_cases WHERE status = 1', {}, function(data)
        local supportPermissions = false
        if vRP.hasPermission({user_id, Config.RequiredSupportPermission}) then
            supportPermissions = true
        end
        TriggerClientEvent("kasperr_helpdesk:showSupportCases", _source, data, {
            supportPermissions = supportPermissions
        })
    end)
end

function openCase(id, _source, user_id)
    getCase(id, function(case)
        if #case > 0 then
            getCaseReplies(id, function(replies)
                local supportPermissions = false
                if vRP.hasPermission({user_id, Config.RequiredSupportPermission}) then
                    supportPermissions = true
                end
                TriggerClientEvent("kasperr_helpdesk:openCase", _source, case[1], replies, {
                    supportPermissions = supportPermissions
                })
            end)
        else
            print("træls")
            --TriggerClientEvent("kasperr_helpdesk:nuiNotification", _source, "")
        end
    end)
end

-- SQL functions
function getCase(id, cb)
    MySQL.Async.fetchAll('SELECT * FROM kasperr_helpdesk_cases WHERE id = @id', {
        ["@id"] = id
    }, function(data)
        cb(data)
    end)
end

function getCaseReplies(id, cb)
    MySQL.Async.fetchAll('SELECT * FROM kasperr_helpdesk_replies WHERE case_id = @id', {
        ["@id"] = id
    }, function(data)
        cb(data)
    end)
end

function addReply(user_id, message, id)
    MySQL.Sync.execute("INSERT INTO kasperr_helpdesk_replies SET user_id = @user_id, message = @message, case_id = @case_id", {
        ['@user_id'] = user_id, 
        ['@message'] = message,
        ['@case_id'] = id
    })
end

function closeCase(id)
    MySQL.Sync.execute("UPDATE kasperr_helpdesk_cases SET status = 0 WHERE id = @case_id", {
        ['@case_id'] = id
    })
end

function deleteCase(id)
    MySQL.Sync.execute("DELETE FROM kasperr_helpdesk_cases WHERE id = @case_id", {
        ['@case_id'] = id
    })
end

function newCase(user_id, title, message)
    MySQL.Sync.execute("INSERT INTO kasperr_helpdesk_cases SET user_id = @user_id, title = @title, message = @message", {
        ['@user_id'] = user_id, 
        ['@title'] = title,
        ['@message'] = message
    })
end

-- Register menu builder
local open_menu = {function(player,choice)
	TriggerClientEvent("kasperr_helpdesk:openGui", player)
end}

vRP.registerMenuBuilder({"admin", function(add, data)
    local user_id = vRP.getUserId({data.player})
    if user_id ~= nil then
      local choices = {}
      choices["Tickets"] = open_menu
      add(choices)
    end
end})