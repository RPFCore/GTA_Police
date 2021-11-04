RegisterNetEvent("GTA_Police:AnalyseTarget")
AddEventHandler("GTA_Police:AnalyseTarget", function(target)
    local source = source
    local targetPed = GetPlayerPed(target)
    local targetHealth = GetEntityHealth(targetPed)

    if(targetHealth >= 190)then 
        TriggerClientEvent("NUI-Notification", source, {"Le Citoyen est en bonne santer.", "success"})
        TriggerClientEvent("NUI-Notification", target, {"Vous êtes en bonne santer.", "success"})
    elseif(targetHealth >= 175) then 
        TriggerClientEvent("NUI-Notification", source, {"Le Citoyen présente quelque ématone mais rien de critique.", "success"})
        TriggerClientEvent("NUI-Notification", target, {"Vous présenter quelque ématone mais rien de critique.", "success"})
    else
        TriggerClientEvent("NUI-Notification", source, {"Le Citoyen présente quelque bléssure grave il doit être soigner sur le champ.", "success"})
        TriggerClientEvent("NUI-Notification", target, {"Vous présenter quelque bléssure grave.", "success"})
    end
end)

RegisterNetEvent("GTA_Police:RequestHealTarget")
AddEventHandler("GTA_Police:RequestHealTarget", function(target)
    local source = source
    TriggerClientEvent("GTA_Police:HealhTarget", target)
    TriggerClientEvent("NUI-Notification", source, {"Citoyen soigné", "success"})
    TriggerClientEvent("NUI-Notification", target, {"Le médecin vous a soigner", "success"})
end)

RegisterNetEvent("GTA_Police:RequestReviveTarget")
AddEventHandler("GTA_Police:RequestReviveTarget", function(target)
    local source = source
    local targetPed = GetPlayerPed(target)
    local targetHealth = GetEntityHealth(targetPed)

    if (targetHealth < 100) then
        TriggerClientEvent("GTA_Police:ReviveTargetAnimationSource", source)

        Wait(5000)

        TriggerClientEvent("GTA_Police:ReviveTarget", target)
        TriggerClientEvent("NUI-Notification", source, {"Citoyen réanimer", "success"})
        TriggerClientEvent("NUI-Notification", target, {"Le médecin vous a fait reprendre conscience.", "success"})
    else
        TriggerClientEvent("NUI-Notification", source, {"Le Citoyen est conscien", "success"})
    end
end)

RegisterNetEvent("GTA_Police:RequestFactureServer")
AddEventHandler("GTA_Police:RequestFactureServer", function(target, facture)
    local source = source
    TriggerClientEvent("GTA_Police:RequestFactureTarget", target, facture)
    TriggerClientEvent("NUI-Notification", source, {"Vous avez envoyé une demande de facture.", "success"})
    TriggerClientEvent("NUI-Notification", target, {"Vous avez reçu une facture.", "success"})
end)

RegisterNetEvent("GTA_Police:FactureAutoriser")
AddEventHandler("GTA_Police:FactureAutoriser", function(target, facture)
    local source = source

    MySQL.Async.fetchAll('SELECT argent FROM gta_medic_stockage',{}, function(res)
        local argent = res[1].argent + facture
        MySQL.Async.execute("UPDATE gta_medic_stockage SET argent=@newArgent", {['@newArgent'] = tonumber(argent)})
    end)

    TriggerClientEvent("NUI-Notification", target, {"Le citoyen a payé la facture.", "success"})
    TriggerClientEvent("NUI-Notification", source, {"Vous avez payé votre facture.", "success"})
end)


RegisterNetEvent("GTA_Police:FactureRefuser")
AddEventHandler("GTA_Police:FactureRefuser", function(target)
    local source = source
    TriggerClientEvent("NUI-Notification", target, {"Le citoyen a refuser de payé la facture.", "success"})
    TriggerClientEvent("NUI-Notification", source, {"Vous avez refuser de payé votre facture.", "success"})
end)

RegisterNetEvent("GTA_Police:GetAllStock")
AddEventHandler("GTA_Police:GetAllStock", function()
    local source = source
    MySQL.Async.fetchAll('SELECT * FROM gta_medic_stockage',{}, function(res2)
        TriggerClientEvent("GTA_Police:RefreshStockage", source, res2)
    end)
end)

RegisterNetEvent("GTA_Police:RetirerArgentPropreStockage")
AddEventHandler("GTA_Police:RetirerArgentPropreStockage", function(qty)
    local source = source
    MySQL.Async.fetchAll('SELECT argent FROM gta_medic_stockage',{}, function(res)
        local argentPropre = res[1].argent
        if (argentPropre >= qty) then
            argentPropre = argentPropre - qty
            MySQL.Async.execute("UPDATE gta_medic_stockage SET argent=@newArgent", {['@newArgent'] = tonumber(argentPropre)})
            TriggerClientEvent("GTA_Inventaire:AjouterItem", source, "cash", qty)
            TriggerClientEvent("NUI-Notification", source, {"Vous avez retirer de l'argent propre dans le coffre."})
        else
            TriggerClientEvent("NUI-Notification", source, {"Montant supérieur au montant disponible.", "warning"})
        end
    end)
end)

RegisterNetEvent("GTA_Police:RetirerArgentSaleStockage")
AddEventHandler("GTA_Police:RetirerArgentSaleStockage", function(qty)
    local source = source
    MySQL.Async.fetchAll('SELECT argent_sale FROM gta_medic_stockage',{}, function(res)
        local argentSale = res[1].argent_sale
        if (argentSale >= qty) then
            argentSale = argentSale - qty
            MySQL.Async.execute("UPDATE gta_medic_stockage SET argent_sale=@newArgent", {['@newArgent'] = tonumber(argentSale)})
            TriggerClientEvent("GTA_Inventaire:AjouterItem", source, "dirty", qty)
            TriggerClientEvent("NUI-Notification",source, {"Vous avez retirer de l'argent sale dans le coffre."})
        else
            TriggerClientEvent("NUI-Notification", source, {"Montant supérieur au montant disponible.", "warning"})
        end
    end)
end)

RegisterNetEvent("GTA_Police:DeposerArgentPropreStockage")
AddEventHandler("GTA_Police:DeposerArgentPropreStockage", function(qty)
    local source = source

    TriggerEvent('GTA_Inventaire:GetItemQty', source, "cash", function(qtyItem, itemid)
        if (qtyItem >= qty) then 
            MySQL.Async.fetchAll('SELECT argent FROM gta_medic_stockage',{}, function(res)
                local argentPropre = res[1].argent + qty
                MySQL.Async.execute("UPDATE gta_medic_stockage SET argent=@newArgent", {['@newArgent'] = tonumber(argentPropre)})
                TriggerClientEvent('GTA_Inventaire:RetirerItem', source, "cash", qty)
                TriggerClientEvent("NUI-Notification", source, {"Vous avez deposer de l'argent propre dans le coffre."})
            end)
        else
			TriggerClientEvent("NUI-Notification", source, {"Montant supérieur au montant disponible.", "warning", "fa fa-exclamation-circle fa-2x"})
        end
    end)
end)

RegisterNetEvent("GTA_Police:DeposerArgentSaleStockage")
AddEventHandler("GTA_Police:DeposerArgentSaleStockage", function(qty)
    local source = source

    TriggerEvent('GTA_Inventaire:GetItemQty', source, "dirty", function(qtyItem, itemid)
        if (qtyItem >= qty) then 
            MySQL.Async.fetchAll('SELECT argent_sale FROM gta_medic_stockage',{}, function(res)
                local argentSale = res[1].argent_sale + qty
                MySQL.Async.execute("UPDATE gta_medic_stockage SET argent_sale=@newArgent", {['@newArgent'] = tonumber(argentSale)})
                TriggerClientEvent('GTA_Inventaire:RetirerItem', source, "dirty", qty)
                TriggerClientEvent("NUI-Notification", source, {"Vous avez deposer de l'argent sale dans le coffre."})
            end)
        else
			TriggerClientEvent("NUI-Notification", source, {"Montant supérieur au montant disponible.", "warning", "fa fa-exclamation-circle fa-2x"})
        end
    end)
end)