lib.callback.register('arcade:useToken', function(source)
    return exports.ox_inventory:RemoveItem(source, 'coins', 1)
end)



lib.callback.register('exchange:moneyToCoins', function(source, amount, costPerCoin)
    local inventory = exports.ox_inventory
    local totalCost = amount * costPerCoin

    print(('[exchange] Player %s wants %s coins for %s money'):format(source, amount, totalCost))

    local hasMoney = inventory:Search(source, 'count', 'money')
    print('[exchange] Player has money:', hasMoney)

    if hasMoney < totalCost then
        print('[exchange] Not enough money')
        return { success = false, reason = 'Not enough money!' }
    end

    local removed = inventory:RemoveItem(source, 'money', totalCost)
    print('[exchange] RemoveItem result:', removed)

    if not removed then
        print('[exchange] Failed to remove money')
        return { success = false, reason = 'Could not remove money.' }
    end

    inventory:AddItem(source, 'coins', amount)
    print(('[exchange] Added %s coin(s) to player'):format(amount))

    return { success = true, coins = amount }
end)






