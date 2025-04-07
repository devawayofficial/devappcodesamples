RegisterServerEvent('resource:sv:AddItem', function(itemadd, amount)
    local source = source
    local Player = Core.Functions.GetPlayer(source)
   
 if Player.Functions.AddItem(itemadd, tonumber(amount)) then
        TriggerClientEvent('inventory:client:ItemBox', source, Core.Shared.Items[itemadd], 'add', amount)
    end
end)
