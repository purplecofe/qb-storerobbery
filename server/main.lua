local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('qb-storerobbery:server:setSafeStatus', function(safe)
    local src = source
	local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent('qb-storerobbery:client:setSafeStatus', -1, safe, true)
    Config.Safes[safe].robbed = true
    TriggerEvent('qb-log:server:CreateLog', 'storerobbery', 'Store Robbery', "green", "**"..GetPlayerName(src) .. " (citizenid: "..Player.PlayerData.citizenid.." | id: "..Player.PlayerData.source..")** just started a robbery")

    SetTimeout(math.random(30, 60) * (60 * 1000), function()
        TriggerClientEvent('qb-storerobbery:client:setSafeStatus', -1, safe, false)
        Config.Safes[safe].robbed = false
        Config.Safes[safe].opened = false
        Config.Safes[safe].cracked = false
    end)
end)

RegisterNetEvent('qb-storerobbery:server:setSafeCrackStatus', function(safe)
    TriggerClientEvent('qb-storerobbery:client:setSafeCrackStatus', -1, safe, true)
    Config.Safes[safe].cracked = true
end)

RegisterNetEvent('qb-storerobbery:server:setSafeOpenStatus', function(safe)
    TriggerClientEvent('qb-storerobbery:client:setSafeOpenStatus', -1, safe, true)
    Config.Safes[safe].opened = true
end)

RegisterNetEvent('qb-storerobbery:server:SafeReward', function(safe)
    local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	local amount = math.random(60,100)
    local info = {worth = 50}

	Player.Functions.AddItem('cash_roll', amount, false, info)
	TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['cash_roll'], "add", amount)
    TriggerEvent("qb-log:server:CreateLog", "storerobbery", "Store Rewards", "default", "**".. GetPlayerName(src) .. "** (citizenid: *"..Player.PlayerData.citizenid.."* | id: *"..src.."*)"..' Received the following from the store robbery. **Loot**: cash_roll ' .. amount.. 'x')
    -- local luck = math.random(1, 100)
    -- local odd = math.random(1, 100)
    -- if luck <= 10 then
    --     Player.Functions.AddItem("rolex", math.random(3, 7))
    --     TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["rolex"], "add")
    --     if luck == odd then
    --         Wait(500)
    --         Player.Functions.AddItem("goldbar", 1)
    --         TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["goldbar"], "add")
    --     end
    -- end
end)

QBCore.Functions.CreateCallback('qb-storerobbery:server:getSafeStatus', function(source, cb)
    cb(Config.Safes)
end)
