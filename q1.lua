function getRarity(items)
    local chance = math.random(1, 100)
    local eligibleItems = {}

    for _, item in pairs(items) do
        if item.chance >= chance then
            print(item.item, item.chance, chance)
            table.insert(eligibleItems, item)
        end
    end

    if #eligibleItems > 0 then
        local selectedIdx = math.random(1, #eligibleItems)
        print(selectedIdx)
        return eligibleItems[selectedIdx]
    else
        return getRarity(items)
    end
end
