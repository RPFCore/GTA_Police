
----> MENU :
local mainMenu = RageUI.CreateMenu("Menu Police", "New York Police District.")
local subInterCitoyen = RageUI.CreateSubMenu(mainMenu, "Menu Police", "Gestion Controle.")
local subInterCitoyen2 = RageUI.CreateSubMenu(mainMenu, "Menu Police", "Gestion Dialogue.")
local subInterCitoyen3 = RageUI.CreateSubMenu(mainMenu, "Menu Police", "Gestion Deplacement.")
local subInterCitoyen4 = RageUI.CreateSubMenu(mainMenu, "Menu Police", "Gestion Equipement.")
local subInterCitoyen5 = RageUI.CreateSubMenu(mainMenu, "Menu Police", "Gestion Mission.")
--local subInterCitoyen6 = RageUI.CreateSubMenu(mainMenu, "Menu Police", "Gestion Dialogue.")

--> Main Menu :
function OnMainMenu()
    RageUI.IsVisible(mainMenu, function()
        RageUI.Button("Intéraction Controle", "~y~- ARRESTATION EN PIETON~w~\nViser le civile avec une arme et ~g~FLECHE DROITE~w~ pour le mettre a genoux, Touche ~g~E~w~ sur le clavier.\n~y~- ARRESTATION EN VEHICULE~w~\nVous devez avoir une voiture de service et mettre en route les giros et faite en suite ~g~SHIFT~w~ sur le clavier ou ~g~A~w~ sur la manette. Le conducteur ne pourra plus bouger même si vous stopper les giros.", {}, true, {onSelected = function() end}, subInterCitoyen)
        RageUI.Button("Intéraction Dialogue", "~g~- PARLER AVEC UN CIVILE~w~\nDurent toutes les interaction. Vous avez des dialogue pour chaque situation qui vous sont proposer dans ce menu. Vous pouvez aussi mettre des amandes et gagner des primes", {}, true, {onSelected = function() end}, subInterCitoyen2)
        RageUI.Button("Intéraction Deplacement", "~g~- FAIRE SUVRE UN CIVILE~w~\nVous pouvez demander à un civile de vous suivre une fois que le controle de plaque soit effectuer.\n~g~- APPELER UNE DEPANNEUSE~w~\nUne fois le civile en etat d'arrestation vous pouvez contacter la depanneuse pour evacuer sont véhicule\n~g~- EVACUER UN SUSPECT~w~\nUne fois que vous avez fini l'intervention, votre suspect menotter peut partir avec l'agent que vous avez contacter.", {}, true, {onSelected = function() end}, subInterCitoyen3)
        RageUI.Button("Intéraction Equipement", "~g~- VOS ARMEES DE SERVICE~w~\nVous trouverez ici vos armes de service qui vous seront repris une fois terminer votre patrouille.", {}, true, {onSelected = function() end}, subInterCitoyen)
        RageUI.Button("Intéraction Mission", "~g~- APPELER LE CENTRALE~w~\nDes affaire sont toujours en cours à ~b~New York City~w~ , contactez le centre pour avoir la plus urgente et intervenez !", {}, true, {onSelected = function() end}, subInterCitoyen2)
   --     RageUI.Button("Intéraction Dialogue", "~g~- PARLER AVEC UN CIVILE~w~\n", {}, true, {onSelected = function() end}, subInterCitoyen3)
    end, function()end)
end


--> Citoyen menu :
function OnSubCitoyenMenu() 
    RageUI.IsVisible(subInterCitoyen, function()

        RageUI.Button("Recherche Identité", "Prenez les papiers du civile avant de questionner le centrale dans le menu ~b~Dialogue.", {}, true, {onSelected = function()
            driverName = tostring(driverName)
                    if driverQuestioned == true then
                        name = driverName
                    elseif driverName == "nil" then
                        name = ""
                    elseif driverQuestioned == false then
                        name = ""
                    end
                    DisplayOnscreenKeyboard(1, "FMMC_MPM_NA", "", tostring(name), "", "", "", 30)
                        while (UpdateOnscreenKeyboard() == 0) do
                            DisableAllControlActions(0);
                            Wait(0);
                        end
                        if (GetOnscreenKeyboardResult()) then
                            local result = GetOnscreenKeyboardResult()
                            name = result
                            name = string.gsub(name, "(%a)([%w_']*)", titleCase)
                            TriggerEvent("rpf:runid")
                        end
        end})

        RageUI.Button("Demander de descendre", "Demander au civile de descendre du véhicule.", {}, true, {onSelected = function()
        TriggerEvent("rpf:exite")
        end})

        RageUI.Button("Test Alcoolemie", "Faite un test pour savoir si le civile est positif avec sont taux. Vous pouvez luis demander avant dans les dialogues si il a conssomer de l'alcool", {}, true, {onSelected = function()
            TriggerEvent("rpf:breath")
        end})

        RageUI.Button("Test Drogue", "Faite un test pour savoir si le civile est positif avec sont taux. Vous pouvez luis demander avant dans les dialogues si il a conssomer de la drogue", {}, true, {onSelected = function()
            local target = GetPlayerServerId(GetClosestPlayer())
            TriggerEvent("rpf:drug")
        end})

        RageUI.Button("Fouiller le civile", "Faite une fouille pour savoir si le civile est en pocession d'oject dangereux. Vous pouvez luis demander avant dans les dialogues si il à des abject dangereux ", {}, true, {onSelected = function()
            TriggerEvent("rpf:search")
        end})

        RageUI.Button("Mettre à Genoux/Deboue", "Vous pourvez demande à un civile de ce mettre a genoux/deboue avant toutes interpelation. Appuiez a nouveau pour le laisser ce remettre deboue.", {}, true, {onSelected = function()
            local target = GetPlayerServerId(GetClosestPlayer())
            TriggerEvent("rpf:arr:kneel")
        end})

        RageUI.Button("Menotter/Démenotter un civile", "Viser le civile avec une arme ou pas, et faire ~g~FLECHE DROITE~w~ pour le mettre a genoux, Touche ~g~E~w~ sur le clavier.\nEn suite seulement vous pourrez luis passer les menotte !!\nUne fois menotter le civile vous suit partous ou vous allez.", {}, true, {onSelected = function()
            TriggerEvent("rpf:arr:handcuff")
        end})

        RageUI.Button("Demander de partir", "Demander au civile de remonter dans son véhicule et de partir.", {}, true, {onSelected = function()
        TriggerEvent("rpf:mount")
        end})

        RageUI.Button("~b~Attacher un civile", "Vous attachez le joueur a vous pour eviter toutes accident. Appuiez a nouveau pour le lacher.", {}, true, {onSelected = function()
            local target = GetPlayerServerId(GetClosestPlayer())
            TriggerEvent("rpf:arr:grab")
        end})

        RageUI.Button("~r~Suprimé l'intéraction", "Annuler l'interaction en cours si vous avez besoin.", {}, true, {onSelected = function()
            TriggerEvent("rpf:arr:book")
        end})
    end, function()end)

    RageUI.IsVisible(subInterCitoyen2, function()
            local Dialogue = speech
            local Amande = price

            RageUI.List("Dialogue", {
                { Name = "Normal", Value = Normal},
                { Name = "Aggressive", Value = Aggressive},
            }, index_dialogue, "Choisi comment tu souhaite parler au civile.", {}, true, {
                onListChange = function(Dialogue, Type)
                    index_dialogue = Dialogue  
                    Type = Type["Value"]
                end
            })

            RageUI.List("Amande", {
                { Name = "$100", Value = 100.0 },
                { Name = "$200", Value = 200.0 },
                { Name = "$300", Value = 300.0 },
            }, index_Amande, "Choisi la valeur de son Amande.", {}, true, {
                onListChange = function(Amande, Item)
                    index_Amande = Amande  
                    Item = Item["Value"]
                end
            })

            RageUI.Button("Dire bonjour", "Choisi avant le debut, le dilogue Normale ou agressif.", {}, true, {onSelected = function()
            TriggerEvent("rpf:hello")
            end})

            RageUI.Button("Demander les papiers", "Demander au civile de vous donner ces papiers. ~g~Il doit ce trouvait en voiture !", {}, true, {onSelected = function()
            TriggerEvent("rpf:askid")
            end})

            RageUI.Button("Question sur l'alcool", "Demander si le civile a bu quelque chose dernierement ? ~b~Vous pouvez poser plusieur question...", {}, true, {onSelected = function()
            TriggerEvent("rpf:drunk:q")
            end})

            RageUI.Button("Question sur la drogue", "Demander si le civile a consomer de la drogue dernierement ? ~b~Vous pouvez poser plusieur question...", {}, true, {onSelected = function()
                TriggerEvent("rpf:drug:q")
            end})

            RageUI.Button("Objet Illegale", "Demander si il a rien d'illeguale dans le vehicule ? ~b~Vous pouvez poser plusieur question...", {}, true, {onSelected = function()
                TriggerEvent("rpf:illegal:q")
            end})

            RageUI.Button("Fouiller le vehicule", "Demander pour fouiller le vehicule si vous ne trouverez rien ? ~b~Vous pouvez poser plusieur question...", {}, true, {onSelected = function()
                TriggerEvent("rpf:search:q")
            end})

            RageUI.Button("Ca va pour cette fois", "Laissez repartir le civile librement même si il est pas clean.", {}, true, {onSelected = function()
                TriggerEvent("rpf:warn")
            end})

            RageUI.Button("Tous est OK !", "Laissez repartir le civile librement. ~b~RAS", {}, true, {onSelected = function()
                TriggerEvent("rpf:release")
            end})

            RageUI.Button("Mettre en etat d'arrestation", "~b~- ARRESTION APPEL CENTRAL\nDemande autorisation pour l'arrestation et empecher le civile de repartir librement.", {}, true, {onSelected = function()
            if stoppedVeh ~= nil then
            Citizen.CreateThread(function()
            if fleeing == true then
            pitting = false
            local vehicleHash = GetEntityModel(stoppedVeh)
            ShowNotification("~b~Offcier:~w~ Demande pour mise en etat d'arrestation ~y~"..GetLabelText(GetDisplayNameFromVehicleModel(vehicleHash)).."~w~.")
            pitWait = math.random(3,10)
            Wait(pitWait * 1000)
            ShowNotification("~b~Permission pour arrestation ~g~ACCORDER~w~.")
            pitting = true
            while pitting do
                Citizen.Wait(0)
                if GetEntitySpeed(stoppedVeh) < 5 then
                stopped = true
                SetVehicleUndriveable(stoppedVeh, true)
                SetVehicleEngineHealth(stoppedVeh, -4000)
                mimicking = false
                lockedin = false
                Wait(1000)
                ShowNotification("~b~Arrestation ~g~REUSSI~w~.")
                pitting = false
                end
                end
            end
            end)
            end
            end})

            RageUI.Button("Editer l'amande", "Donner la raison pour la quel vous editez une amande à ce civile.", {}, true, {onSelected = function()
                DisplayOnscreenKeyboard(1, "FMMC_MPM_NA", "", "", "", "", "", 30)
                    while (UpdateOnscreenKeyboard() == 0) do
                        DisableAllControlActions(0);
                        Wait(0);
                    end
                    if (GetOnscreenKeyboardResult()) then
                        local result = GetOnscreenKeyboardResult()
                        reason = result
                    end
            end})

            RageUI.Button("Donner l'amande", "Une fois que vous aurez editer votre amande vous pourrez la donner au civile !", {}, true, {onSelected = function()
                local myname = NetworkPlayerGetName(PlayerId())
                if reason == nil or price == nil then
                    ShowNotification("~r~Merci d'editer une amande et de choisi le prix avant !")
                else
                TriggerEvent('rpf:ticket')
                ---- add money
                end
            end})

    end, function()end)

    RageUI.IsVisible(subInterCitoyen3, function()

            local Dialogue = speech

            RageUI.List("Dialogue", {
                { Name = "Normal", Value = Normal},
                { Name = "Aggressive", Value = Aggressive},
            }, index_dialogue, "Choisi comment tu souhaite parler au civile.", {}, true, {
                onListChange = function(Dialogue, Type)
                    index_dialogue = Dialogue  
                    Type = Type["Value"]
                end
            })

        RageUI.Button("Recherche plaque véhicule", "", {}, true, {onSelected = function()
            TriggerEvent("rpf:getplate")
                    vehPlateNum = tostring(vehPlateNum)
                    if vehPlateNum == "nil" then
                        numPlate = ""
                    else
                        numPlate = vehPlateNum
                    end
                    DisplayOnscreenKeyboard(1, "FMMC_MPM_NA", "", numPlate, "", "", "", 30)
                        while (UpdateOnscreenKeyboard() == 0) do
                            DisableAllControlActions(0);
                            Wait(0);
                        end
                        if (GetOnscreenKeyboardResult()) then
                            local result = GetOnscreenKeyboardResult()
                            plate = result
                            plate = string.upper(plate)
                            TriggerEvent("rpf:runplate")
                        end
        end})

        RageUI.Button("Demander de vous suivre", "Apres avoir controler la plaque du vehicule d'un civile, le civile vous suit mai attention n'aller pas trop vite la vitesse est limité !", {}, true, {onSelected = function()
            TriggerEvent("rpf:follow")
        end})

        RageUI.Button("Appeler la depanneuse", "Une fois le civile en etat d'arrestation.", {}, true, {onSelected = function()
            TriggerEvent('rpf:spawnTow')
        end})

        RageUI.Button("Transport de Prisonier", "Une fois le civile en etat d'arrestation et menotter.", {}, true, {onSelected = function()
            TriggerEvent("rpf:arr:pt")
        end})

        RageUI.Button("Appeler la depanneuse", "Une fois le civile en etat d'arrestation.", {}, true, {onSelected = function()
            TriggerEvent('rpf:spawnTow')
        end})
        
        RageUI.Button("~y~Debloquer un ~b~CIVILE", "Vous avez activez la fonctionne mime. Le PNJ va faire exactement les memes mouvement que vous.", {}, true, {onSelected = function()
            TriggerEvent("rpf:mimic")
        end})

    end, function()end)

    RageUI.IsVisible(subInterCitoyen4, function()
        RageUI.Button("Equipement de service", "Il vous seront repris quant vous ne serais plus en service, ce ne sont pas vos armes personnel.", {}, true, {onSelected = function()
            local player = GetPlayerPed(-1)
            hasWeapons = false
        Citizen.CreateThread(function()
            if hasWeapons == false then
                hasWeapons = true
                local pistol = GetHashKey("WEAPON_COMBATPISTOL")
                local taser = GetHashKey("WEAPON_STUNGUN")
                local baton = GetHashKey("WEAPON_NIGHTSTICK")
                local torch = GetHashKey("WEAPON_FLASHLIGHT")
                GiveWeaponToPed(player, pistol, 1000, 0, 1)
                GiveWeaponComponentToPed(player, pistol, GetHashKey("COMPONENT_AT_PI_FLSH"))
                GiveWeaponToPed(player, taser, 1000, 0, 0)
                GiveWeaponToPed(player, baton, 1000, 0, 0)
                GiveWeaponToPed(player, torch, 1000, 0, 0)
                ShowNotification("Vous avez votre equipement.")
            else
                RemoveAllPedWeapons(player,true)
                hasWeapons = false
                ShowNotification("Vous avez rendu votre equipement.")
            end
        end)
        end})

        RageUI.Button("Carabine", "Vous la trouverez dans les véhicules de service. Il vous seront repris quant vous ne serais plus en service, ce ne sont pas vos armes personnel.", {}, true, {onSelected = function()
            local target = GetPlayerServerId(GetClosestPlayer())
            local player = GetPlayerPed(-1)
            local rifle = GetHashKey('WEAPON_CARBINERIFLE')
        local hascarbine = HasPedGotWeapon(player, rifle, false)
        local isinpolveh = IsPedInAnyPoliceVehicle(player)
        Citizen.CreateThread(function()
        if isinpolveh and (hascarbine == false) then
            GiveWeaponToPed(player, rifle, 50, 0, true)
            ShowNotification("Vous avez pris la carabine.")
        elseif isinpolveh and (hascarbine == 1) then
            RemoveWeaponFromPed(player, rifle)
            ShowNotification("Vous avez ranger la carabine.")
        else
            ShowNotification("~r~Vous devez etre dans un véhicule de service !")
        end
        end)
        end})

        RageUI.Button("Fusil a pompe", "Vous la trouverez dans les véhicules de service.", {}, true, {onSelected = function()
                local player = GetPlayerPed(-1)
         local rifle = GetHashKey('WEAPON_PUMPSHOTGUN')
        local hascarbine = HasPedGotWeapon(player, rifle, false)
        local isinpolveh = IsPedInAnyPoliceVehicle(player)
        Citizen.CreateThread(function()
        if isinpolveh and (hascarbine == false) then
            GiveWeaponToPed(player, rifle, 50, 0, true)
            ShowNotification("Vous avez pris le Fusil a pompe.")
        elseif isinpolveh and (hascarbine == 1) then
            RemoveWeaponFromPed(player, rifle)
            ShowNotification("Vous avez ranger le Fusil a pompe.")
        else
            ShowNotification("~r~Vous devez etre dans un véhicule de service !")
        end
        end)
        end})

        RageUI.Button("~r~Jetter vos equipement", "Nimporte qui pourra les récupérer.", {}, true, {onSelected = function()
        pos = GetEntityCoords(GetPlayerPed(-1))
        SetPedDropsInventoryWeapon(GetPlayerPed(-1), GetSelectedPedWeapon(GetPlayerPed(-1)), pos.x, pos.y, pos.z, 0)
        end})

    end, function()end)

    RageUI.IsVisible(subInterCitoyen5, function()
            local Dialogue = speech

            RageUI.List("Dialogue", {
                { Name = "Normal", Value = Normal},
                { Name = "Aggressive", Value = Aggressive},
            }, index_dialogue, "Choisi comment tu souhaite parler au civile.", {}, true, {
                onListChange = function(Dialogue, Type)
                    index_dialogue = Dialogue  
                    Type = Type["Value"]
                end
            })

        RageUI.Button("Appeler le centrale", "~g~- INTERVENTION EN COURS~w~\nChoisi avant le debut le dilogue, Normale ou agressif. Pour verrifier si il y à une intervention en cours.", {}, true, {onSelected = function()
            if enableRandomEvents then
              ShowNotification("Événements aléatoires: ~r~ Indisponible.")
              enableRandomEvents = false
            else
              ShowNotification("Événements aléatoires: ~g~Disponible.")
              enableRandomEvents = true
            end
        end})

        RageUI.Button("Véhicule suspect !", "Voir si il y a des vehicule suspect ou abandonner dans la ville.", {}, true, {onSelected = function()
            local target = GetPlayerServerId(GetClosestPlayer())
            TriggerEvent('rpf:randveh')
        end})

        RageUI.Button("Négociation codes4-1", "~r~Ne fonction que pour les codes4 - WIP\n~g~Luis demander de poser sont arme !\nChoisi avant le debut, le dilogue Normale ou agressif.", {}, true, {onSelected = function()
            if callID == "weapon" then
            TriggerEvent("rpf:weapon:drop:q")
            else
            ShowNotification("Situation ~g~Code 4~w~ Fini.")
            TriggerEvent("rpf:code4")
            end
        end})

        RageUI.Button("Négociation codes4-2", "~r~Ne fonction que pour les codes4 - WIP~g~Luis demander de ce mettre face a vous !\nChoisi avant le debut, le dilogue Normale ou agressif.", {}, true, {onSelected = function()
            if callID == "weapon" then
            TriggerEvent("pis:weapon:face:q")
            else
            ShowNotification("Situation ~g~Code 4~w~ Fini.")
            TriggerEvent("rpf:code4")
            end
        end})

        RageUI.Button("Négociation codes4-3", "~r~Ne fonction que pour les codes4 - ~y~WIP~w~Luis demander de ce mettre à genoux pour pouvoir en suite luis mettre les menottes !\nChoisi avant le debut, le dilogue Normale ou agressif.", {}, true, {onSelected = function()
            if callID == "weapon" then
            TriggerEvent("rpf:weapon:knees:q")
            else
            ShowNotification("Situation ~g~Code 4~w~ Fini.")
            TriggerEvent("rpf:code4")
            end
        end})

        RageUI.Button("Négociation codes4-4", "~r~Ne fonction que pour les codes4 - ~y~WIP~w~Faire des menace pour que le suspect ce laisse arreter !\nChoisi avant le debut, le dilogue Normale ou agressif.", {}, true, {onSelected = function()
            if callID == "weapon" then
            TriggerEvent("pis:weapon:threat:q")
            else
            ShowNotification("Situation ~g~Code 4~w~ Fini.")
            TriggerEvent("rpf:code4")
            end
        end})

    end, function()end)
end

-------------------------------> Control :
RegisterCommand('NYPD', function()
if (exports.nCoreGTA:GetPlayerJob() ~= "NYPD") then return end
    RageUI.Visible(mainMenu, not RageUI.Visible(mainMenu))
    DisableControlAction(0, 172, true) --DESACTIVE CONTROLL HAUT  
end, false)