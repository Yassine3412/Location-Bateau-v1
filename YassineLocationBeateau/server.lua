
ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent('buy:location')
AddEventHandler('buy:location', function()
local _source = source
local xPlayer = ESX.GetPlayerFromId(source)
local xMoney = xPlayer.getMoney()

                if xMoney >= 130 then

        xPlayer.removeMoney(0)
TriggerClientEvent('esx:showNotification', source, "~r~Achat~w~ effectué !")
    else
TriggerClientEvent('esx:showNotification', source, "Vous n'avez assez ~r~d\'argent")
    end
end)

RegisterNetEvent('es:activateMoney')
AddEventHandler('es:activateMoney', function(money)
    ESX.PlayerData.money = money
end)