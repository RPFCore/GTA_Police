
----> MENU :
mainGarage = RageUI.CreateMenu("Garage", "New York Police District.")

--> Main Menu :
function OnMenuGarage()
    RageUI.IsVisible(mainGarage, function()
        RageUI.Button("Police", "Model 1998", {}, true, {onSelected = function()
            local vSpawnLocation = {x = 459.21, y = -1008.07, z = 28.26, h = 281.25}
            TriggerEvent("SpawnVehicule", "police", vSpawnLocation)
            TriggerEvent("NUI-Notification", {"Votre véhicule vous attend !"})
            RageUI.CloseAll(true)
        end})
        RageUI.Button("Police 2", "Model 1989", {}, true, {onSelected = function()
            local vSpawnLocation = {x = 459.21, y = -1008.07, z = 28.26, h = 281.25}
            TriggerEvent("SpawnVehicule", "police2", vSpawnLocation)
            TriggerEvent("NUI-Notification", {"Votre véhicule vous attend !"})
            RageUI.CloseAll(true) 
        end})
    end, function()end)
end