
----> MENU :
mainStockage = RageUI.CreateMenu("Stockage", "New York Police District.")
local subStockage = RageUI.CreateSubMenu(mainStockage, "Stockage", "New York Police District.")

local index = 1
local secondIndex = 1
--> Main Menu :
function OnMenuStockage()
    RageUI.IsVisible(mainStockage, function()
        RageUI.Button("Vérifier le stock", "", {}, true, {onSelected = function() TriggerServerEvent("GTA_Police:GetAllStock") end}, subStockage)
    end, function()end)


    RageUI.IsVisible(subStockage, function()
         for k, v in pairs(Config.Stockage) do 
            if (v.argent >= 0) then
                RageUI.List('💵  Argent Propre ~g~' ..v.argent .. "$", {
                    { Name = "Récuperer" },
                    { Name = "Déposer" }
                }, index, "", {}, true, {
                    onListChange = function(Index, Item) index = Index; end,
        
                    onSelected = function(Index, Item)
                        if Index == 1 then 
                            local qty = InputNombre("Montant à retirer")
                            if qty == nil then
                                TriggerEvent("NUI-Notification", {"Quantité non valide.", "warning", "fa fa-exclamation-circle fa-2x", "warning"})
                            else
                                TriggerServerEvent('GTA_Police:RetirerArgentPropreStockage', tonumber(qty))
                            end
                            RageUI.CloseAll(true)
                        elseif Index == 2 then 
                            local qty = InputNombre("Montant à déposer")
                            if qty == nil then
                                TriggerEvent("NUI-Notification", {"Quantité non valide.", "warning", "fa fa-exclamation-circle fa-2x", "warning"})
                            else
                                TriggerServerEvent('GTA_Police:DeposerArgentPropreStockage', tonumber(qty))
                            end
                            RageUI.CloseAll(true)
                        end
                    end,
                })
            end

            if (v.argent_sale >= 0) then
                RageUI.List('💴   Argent sale ~r~' ..v.argent_sale .. "$", {
                    { Name = "Récuperer" },
                    { Name = "Déposer" }
                }, secondIndex or 1, "", {}, true, {
                    onListChange = function(Index, Item) secondIndex = Index; end,
        
                    onSelected = function(Index, Item)
                        if Index == 1 then 
                            local qty = InputNombre("Montant à retirer")
                            if qty == nil then
                                TriggerEvent("NUI-Notification", {"Quantité non valide.", "warning", "fa fa-exclamation-circle fa-2x", "warning"})
                            else
                                TriggerServerEvent('GTA_Police:RetirerArgentSaleStockage', tonumber(qty))
                            end
                            RageUI.CloseAll(true)
                        elseif Index == 2 then 
                            local qty = InputNombre("Montant à déposer")
                            if qty == nil then
                                TriggerEvent("NUI-Notification", {"Quantité non valide.", "warning", "fa fa-exclamation-circle fa-2x", "warning"})
                            else
                                TriggerServerEvent('GTA_Police:DeposerArgentSaleStockage', tonumber(qty))
                            end
                            RageUI.CloseAll(true)
                        end
                    end,
                })
            end
        end
    end, function()end)
end