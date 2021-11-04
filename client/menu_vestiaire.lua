
----> MENU :
mainVestiaire = RageUI.CreateMenu("Vestiaire", "New York Police District.")

--> VAR :
local bisPlayerOnService, bisGiletOrangeOn = false, false

--> Main Menu :
function OnVestiaireMenu()
    RageUI.IsVisible(mainVestiaire, function()
        RageUI.Checkbox('Prise de service', "", bisPlayerOnService, {}, {
            onChecked = function()
                TriggerServerEvent("GTA:UpdateService", 1)
                TriggerEvent("GTA_Police:AfficherBlipsPoint")  --> On ajoute les blips.
                TriggerEvent("NUI-Notification", {"Prise de service"})
                TriggerEvent("GTA_Police:OnService")
                TriggerServerEvent("player:serviceOn", "NYPD") --> On lui give le service pour recevoir les appel d'urgence.
            end,
            onUnChecked = function()
                TriggerServerEvent("GTA:LoadVetement")
                TriggerServerEvent("GTA:UpdateService", 0)
                TriggerEvent("NUI-Notification", {"Fin de service"})
                TriggerEvent("GTA_Police:RetirerBlipsPoint") --> On retire les blips 
                TriggerServerEvent("player:serviceOff", "NYPD") --> On lui retire le service pour  ne plus recevoir les appel d'urgence.
            end,
            onSelected = function(Index)
                bisPlayerOnService = Index
            end
        })

        RageUI.Checkbox("Gilet Orange", "", isGiletJauneOn, {}, {
                onChecked = function()
                    if GetEntityModel(ped) == 1885233650 then --Homme
                        SetPedComponentVariation(ped, 8, 59, 1, 0)
                    elseif GetEntityModel(ped) == -1667301416 then --Femme
                        SetPedComponentVariation(ped, 8, 36, 1, 0)
                    end
                end,
                onUnChecked = function()
                    SetPedComponentVariation(ped, 8, 15, 0, 0)
                end,
                onSelected = function(Index)
                    isGiletJauneOn = Index
                end
        })

        RageUI.Checkbox("Gilet par balle", "", isGiletOn, {}, {
                onChecked = function()
                    if GetEntityModel(ped) == 1885233650 then --Homme
                        SetPedComponentVariation(ped, 9, 10, 1, 2)
                        SetPedArmour(ped, 100)
                    elseif GetEntityModel(ped) == -1667301416 then --Femme
                        SetPedComponentVariation(ped, 9, 9, 1, 2)
                        SetPedArmour(ped, 100)
                    end
                end,
                onUnChecked = function()
                    SetPedComponentVariation(ped, 9, 14, 1, 2)  
                    SetPedArmour(ped, 0)
                end,
                onSelected = function(Index)
                    isGiletOn = Index
                end
        })
    end, function()end)
end