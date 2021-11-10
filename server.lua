local QBCore = exports['qb-core']:GetCoreObject()

TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)

RegisterServerEvent('RoutePizza:Payment')
AddEventHandler('RoutePizza:Payment', function()
	local _source = source
	local Player = QBCore.Functions.GetPlayer(_source)
    local fooiKans = math.random(1, 10)
    local fooiAmount = math.random(5, 8)
    local amount = 0
    
    amount = 3
    print("Fooikans: "..fooiKans)
    if fooiKans >= 7 then
        print(amount)        
        TriggerClientEvent("QBCore:Notify", _source, "U hebt €"..amount.." ontvangen. U hebt een extra fooi gekregen van €"..fooiAmount.." !!", "success")

        amount = amount + fooiAmount
        Player.Functions.AddMoney("cash", amount, "sold-pizza")
    else
        TriggerClientEvent("QBCore:Notify", _source, "U hebt €"..amount.." ontvangen", "success")
        Player.Functions.AddMoney("cash", amount, "sold-pizza")
    end

    Player.Functions.AddMoney("cash", amount, "sold-pizza")
    TriggerClientEvent("QBCore:Notify", _source, "U hebt €"..amount.." ontvangen", "success")
end)

RegisterServerEvent('RoutePizza:TakeDeposit')
AddEventHandler('RoutePizza:TakeDeposit', function()print(amount)
	local _source = source
	local Player = QBCore.Functions.GetPlayer(_source)
    Player.Functions.RemoveMoney("cash", _source, "pizza-deposit")
    TriggerClientEvent("QBCore:Notify", _source, "Er is een aanbetaling van €100 in rekening gebracht", "error")
end)

RegisterServerEvent('RoutePizza:ReturnDeposit')
AddEventHandler('RoutePizza:ReturnDeposit', function(info)
	local _source = source
    local Player = QBCore.Functions.GetPlayer(_source)
    
    if info == 'cancel' then
        Player.Functions.AddMoney("cash", 100, "pizza-return-vehicle")
        TriggerClientEvent("QBCore:Notify", _source, "U heeft het voertuig ingeleverd en uw borg terug gekregen", "success")
    elseif info == 'end' then
        Player.Functions.AddMoney("cash", 10, "pizza-return-vehicle")
        TriggerClientEvent("QBCore:Notify", _source, "U heeft het voertuig ingeleverd en uw borg terug gekregen", "success")
    end
end)
