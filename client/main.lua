local QBCore = exports['qb-core']:GetCoreObject()
local copsCalled = false
local CurrentCops = 0
local PlayerJob = {}
local onDuty = false

CreateThread(function()
    Wait(1000)
    if QBCore.Functions.GetPlayerData().job ~= nil and next(QBCore.Functions.GetPlayerData().job) then
        PlayerJob = QBCore.Functions.GetPlayerData().job
    end
end)

CreateThread(function()
    while true do
        Wait(1000 * 60 * 5)
        if copsCalled then
            copsCalled = false
        end
    end
end)

CreateThread(function()
    Wait(1000)
    setupSafes()
end)

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    PlayerJob = QBCore.Functions.GetPlayerData().job
    onDuty = true
end)

RegisterNetEvent('QBCore:Client:SetDuty', function(duty)
    onDuty = duty
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate', function(JobInfo)
    PlayerJob = JobInfo
    onDuty = true
end)

RegisterNetEvent('police:SetCopCount', function(amount)
    CurrentCops = amount
end)

function IsWearingHandshoes()
    local armIndex = GetPedDrawableVariation(PlayerPedId(), 3)
    local model = GetEntityModel(PlayerPedId())
    local retval = true

    if model == `mp_m_freemode_01` then
        if Config.MaleNoHandshoes[armIndex] ~= nil and Config.MaleNoHandshoes[armIndex] then
            retval = false
        end
    else
        if Config.FemaleNoHandshoes[armIndex] ~= nil and Config.FemaleNoHandshoes[armIndex] then
            retval = false
        end
    end
    return retval
end

function setupSafes()
    QBCore.Functions.TriggerCallback('qb-storerobbery:server:getSafeStatus', function(Safes)
        for k, v in pairs(Safes) do
            Config.Safes[k].robbed = Safes[k].robbed
        end
    end)
end

local function crackSafe(safe)
    if not Config.Safes[safe].robbed then
        if CurrentCops >= Config.MinimumStoreRobberyPolice then
            if QBCore.Functions.HasItem("lockpick") then
                if math.random(1, 100) <= 65 and not IsWearingHandshoes() then
                    local pos = QBCore.Functions.GetCoords(PlayerPedId())
                    TriggerServerEvent("evidence:server:CreateFingerDrop", pos)
                end
                if math.random(100) <= 50 then
                    TriggerServerEvent('hud:server:GainStress', math.random(1, 3))
                end
                TriggerServerEvent("QBCore:Server:RemoveItem", "lockpick", 1)
                TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items["lockpick"], "remove")
                local cameraId = Config.Safes[safe].camId
                exports['qb-dispatch']:StoreRobbery(cameraId)
                exports['thermite']:OpenHackingGame(5, 6, function(success)
                    if success then
                        TriggerServerEvent("qb-storerobbery:server:setSafeStatus", safe)
                        TriggerServerEvent('qb-phone:server:sendNewMail', {
                            sender = "匿名者",
                            subject = "你成功繞過了安全機制",
                            message = "嘿！看起來你已經成功繞過了安全機制，接下來保險箱的破解作業交給我們，大約需要五分鐘左右",
                            button = {}
                        })
                        QBCore.Functions.Notify('稍後保險箱即將打開', 'success', 3000)
                        SetTimeout(5 * (60 * 1000), function()
                            TriggerServerEvent("qb-storerobbery:server:setSafeCrackStatus", safe)
                        end)
                    else
                        QBCore.Functions.Notify('破解失敗', 'error', 3000)
                    end
                end)
            else
                QBCore.Functions.Notify('你沒有需要的物品', 'error', 3000)
            end
        else
            QBCore.Functions.Notify('保全系統已封鎖', 'error', 3000)
        end
    else
        QBCore.Functions.Notify('保險箱暫時無法使用', 'error', 3000)
    end
end

local function openSafe(safe)
    if not Config.Safes[safe].robbed then
        QBCore.Functions.Notify('保險箱還沒破解', 'error', 3000)
    elseif not Config.Safes[safe].cracked and Config.Safes[safe].robbed then
        QBCore.Functions.Notify('保險箱正在進行破解', 'error', 3000)
    elseif Config.Safes[safe].cracked and Config.Safes[safe].robbed and Config.Safes[safe].opened then
        QBCore.Functions.Notify('保險箱已被洗劫一空', 'error', 3000)
    elseif not Config.Safes[safe].opened and Config.Safes[safe].cracked then
        TriggerServerEvent("qb-storerobbery:server:SafeReward", safe)
        TriggerServerEvent("qb-storerobbery:server:setSafeOpenStatus", safe)
    end
end

RegisterNetEvent('qb-storerobbery:client:setRegisterStatus', function(batch, val)
    -- Has to be a better way maybe like adding a unique id to identify the register
    if(type(batch) ~= "table") then
        Config.Registers[batch] = val
    else
        for k, v in pairs(batch) do
            Config.Registers[k] = batch[k]
        end
    end
end)

RegisterNetEvent('qb-storerobbery:client:setSafeStatus', function(safe, bool)
    Config.Safes[safe].robbed = bool
end)

RegisterNetEvent('qb-storerobbery:client:setSafeCrackStatus', function(safe, bool)
    Config.Safes[safe].cracked = bool
    QBCore.Functions.Notify('現在可以打開保險箱了', 'success', 3000)
end)

RegisterNetEvent('qb-storerobbery:client:setSafeOpenStatus', function(safe, bool)
    Config.Safes[safe].opened = bool
end)

CreateThread(function()
    for safe, v in pairs(Config.Safes) do
        exports['qb-target']:RemoveZone('CrackSafe'..safe)
        exports['qb-target']:AddBoxZone('CrackSafe'..safe, vector3(v.coords.x, v.coords.y, v.coords.z), v.length, v.width, {
            name = 'CrackSafe'..safe,
            heading = v.heading,
            debugPoly = false,
            minZ = v.minZ,
            maxZ = v.maxZ,
            }, {
                options = {
                    {
                        icon = 'fas fa-user',
                        label = '打開保險箱',
                        action = function()
                            openSafe(safe)
                        end,
                        canInteract = function()
                            if v.opened then 
                                return false 
                            end
                            return true
                        end
                    }, {
                        icon = 'fas fa-user',
                        label = '破解保險箱',
                        action = function()
                            crackSafe(safe)
                        end,
                        canInteract = function()
                            if v.robbed and v.cracked then 
                                return false 
                            end
                            return true
                        end
                    },
                },
                distance = 3.5
            })
    end
end)
