RegisterNetEvent("dw_drugdealing:server:sell", function(drug, zone)
    local src = source
    local amount = math.random(1, 3)
    while not exports["qb-inventory"]:HasItem(src, drug, amount) do 
        Wait(1)
        amount = math.random(1, 3)
    end
    local price = currentSalePrices[drug].zones[zone] * amount
    QBCore.Functions.GetPlayer(src).Functions.AddMoney("cash", price, "Sold drugs | " .. drug)
    exports["qb-inventory"]:RemoveItem(src, drug, amount)
    local dep = Config.zones[zone][drug].deprecation
    local newPrice = price - dep
    if newPrice > Config.zones[zone][drug].min then currentSalePrices[drug].zones[zone] = newPrice end
end)
