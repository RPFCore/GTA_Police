local requestFacture = false
local factureMontant = 0
local Duree = 1000


RegisterNetEvent("GTA_Police:HealhTarget")
AddEventHandler("GTA_Police:HealhTarget", function()
    local ped = GetPlayerPed(-1)
    SetEntityHealth(ped, 200)
end)

RegisterNetEvent("GTA_Police:ReviveTarget")
AddEventHandler("GTA_Police:ReviveTarget", function()
    local ped = GetPlayerPed(-1)
    local x, y, z = table.unpack(GetEntityCoords(ped , true))

    RequestAnimDict('mini@cpr@char_b@cpr_str')
    while not HasAnimDictLoaded('mini@cpr@char_b@cpr_str') do
        Citizen.Wait(10)
    end
        
    local myPed = PlayerPedId()
    local animation = 'cpr_success'
    local flags = 262144
    TaskPlayAnim(myPed, 'mini@cpr@char_b@cpr_str', animation, 8.0, -8, -1, flags, 0, 0, 0, 0)

    SetEntityHealth(ped, 100.0)
    local pos = GetEntityCoords(ped)
	local h = GetEntityHeading(ped)
	ResurrectPed(ped)
	SetEntityHealth(ped, 200)
	ClearPedTasksImmediately(ped)
	NetworkResurrectLocalPlayer(pos.x, pos.y, pos.z + 0.0, h, true, true, false)
end)

RegisterNetEvent("GTA_Police:ReviveTargetAnimationSource")
AddEventHandler("GTA_Police:ReviveTargetAnimationSource", function()
    TriggerEvent("TaskPlayAnimation", GetPlayerPed(-1), 'mini@cpr@char_a@cpr_def', 'cpr_pumpchest_idle', _, 262144) 

    Wait(1000)

    TriggerEvent("TaskPlayAnimation", GetPlayerPed(-1), 'mini@cpr@char_a@cpr_str', 'cpr_pumpchest', _, 262144) 

    Wait(1000)

    TriggerEvent("TaskPlayAnimation", GetPlayerPed(-1), 'mini@cpr@char_a@cpr_str', 'cpr_pumpchest', _, 262144)

    Wait(1000)

    TriggerEvent("TaskPlayAnimation", GetPlayerPed(-1), 'mini@cpr@char_a@cpr_str', 'cpr_pumpchest', _, 262144)

    Wait(1000)

    TriggerEvent("TaskPlayAnimation", GetPlayerPed(-1), 'mini@cpr@char_a@cpr_str', 'cpr_pumpchest', _, 262144)

    Wait(1000)

    TriggerEvent("TaskPlayAnimation", GetPlayerPed(-1), 'mini@cpr@char_a@cpr_str', 'cpr_pumpchest', _, 262144)
end)


RegisterNetEvent("GTA_Police:RequestFactureTarget")
AddEventHandler("GTA_Police:RequestFactureTarget", function(montant)
    Duree = 0
    requestFacture = true
    factureMontant = montant
    PlaySound(-1, "Out_Of_Bounds_Timer", "DLC_HEISTS_GENERAL_FRONTEND_SOUNDS", 0, 0, 1)
    TriggerEvent("NUI-Notification", {"Y pour payer votre facture L pour refuser", "success"})
end)

--on affiche les blips :
local nypdSortieVeh, nypdRangerVeh  = nil, nil
RegisterNetEvent("GTA_Police:AfficherBlipsPoint")
AddEventHandler('GTA_Police:AfficherBlipsPoint', function ()
    nypdSortieVeh = AddBlipForCoord(459.21, -1008.07, 28.26)
    SetBlipSprite(nypdSortieVeh,225)		
    SetBlipColour(nypdSortieVeh, 5)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString('Entrée du garage') 
	EndTextCommandSetBlipName(nypdSortieVeh)
	
	nypdRangerVeh = AddBlipForCoord(451.89, -997.19, 25.76)
	SetBlipSprite(nypdRangerVeh,225)		
	SetBlipColour(nypdRangerVeh, 69)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString('Ranger votre véhicule')
	EndTextCommandSetBlipName(nypdRangerVeh)
end)

RegisterNetEvent("GTA_Police:RetirerBlipsPoint")
AddEventHandler("GTA_Police:RetirerBlipsPoint", function ()
    if nypdSortieVeh ~= nil and DoesBlipExist(nypdSortieVeh) then
        Citizen.InvokeNative(0x86A652570E5F25DD,Citizen.PointerValueIntInitialized(nypdSortieVeh))
        nypdSortieVeh = nil
	end
	
	if nypdRangerVeh ~= nil and DoesBlipExist(nypdRangerVeh) then
		Citizen.InvokeNative(0x86A652570E5F25DD,Citizen.PointerValueIntInitialized(nypdRangerVeh))
		nypdRangerVeh = nil
	end
end)


RegisterNetEvent("GTA_Police:OnService")
AddEventHandler("GTA_Police:OnService", function()
    local ped = GetPlayerPed(-1)
    if  exports.nCoreGTA:GetPlayerJobGrade() == "Cadet" then
            if GetEntityModel(ped) == 1885233650 then
                SetPedComponentVariation(ped, 3, 30, 0, 0)--Gants
                SetPedComponentVariation(ped, 4, 35, 0, 0)--Jean
                SetPedComponentVariation(ped, 6, 24, 0, 0)--Chaussure
                SetPedComponentVariation(ped, 8, 59, 0, 0) --Gilet Cadet
                SetPedComponentVariation(ped, 11, 55, 0, 0)--Veste
                SetPedPropIndex(ped, 2, 2, 0, 1)--Oreillete
                SetPedPropIndex(ped, 6, 3, 0, 1)--Montre
                SetPedPropIndex(ped, 1, 7, 0, 1)--Lunette
            elseif GetEntityModel(ped) == -1667301416 then
                SetPedComponentVariation(ped, 4, 34, 0, 0)--Pantalon
                SetPedComponentVariation(ped, 6, 24, 0, 0)--Chaussure
                SetPedComponentVariation(ped, 8, 36, 0, 0) --Gilet Cadet
                SetPedComponentVariation(ped, 11, 48, 0, 0)--Veste
                SetPedPropIndex(ped, 2, 2, 0, 1)--Oreillete
                SetPedPropIndex(ped, 6, 3, 0, 1)--Montre
                SetPedPropIndex(ped, 1, 7, 0, 1)--Lunette
            end
    elseif exports.nCoreGTA:GetPlayerJobGrade() == "Sergent" then
        if GetEntityModel(ped) == 1885233650 then
                SetPedComponentVariation(ped, 3, 30, 0, 0)--Gants
                SetPedComponentVariation(ped, 4, 35, 0, 0)--Jean
                SetPedComponentVariation(ped, 6, 24, 0, 0)--Chaussure
                SetPedComponentVariation(ped, 8, 58, 0, 0)--mattraque
                SetPedComponentVariation(ped, 11, 55, 0, 0)--Veste
                SetPedPropIndex(ped, 2, 2, 0, 1)--Oreillete
                SetPedPropIndex(ped, 6, 3, 0, 1)--Montre
                SetPedPropIndex(ped, 1, 7, 0, 1)--Lunette
            elseif GetEntityModel(ped) == -1667301416 then
                SetPedComponentVariation(ped, 4, 34, 0, 0)--Pantalon
                SetPedComponentVariation(ped, 6, 24, 0, 0)--Chaussure
                SetPedComponentVariation(ped, 8, 35, 0, 0)
                SetPedComponentVariation(ped, 11, 48, 0, 0)--Veste
                SetPedPropIndex(ped, 2, 2, 0, 1)--Oreillete
                SetPedPropIndex(ped, 6, 3, 0, 1)--Montre
                SetPedPropIndex(ped, 1, 7, 0, 1)--Lunette
        end
    end
end)

RegisterNetEvent("GTA_Police:RefreshStockage")
AddEventHandler("GTA_Police:RefreshStockage", function(res2)
    Config.Stockage = res2
end)

Citizen.CreateThread(function() 
	while true do
		Citizen.Wait(Duree)
        local target = GetPlayerServerId(GetClosestPlayer())
        
        if requestFacture then
            DrawRect(0.912000000000001, 0.292, 0.185, 0.205, 0, 0, 0, 150)
			DrawAdvancedText(0.966000000000001, 0.220, 0.005, 0.0028, 0.7, "Facture ~b~Police", 255, 255, 255, 255, 1, 1)
			DrawAdvancedText(0.924000000000001, 0.278, 0.005, 0.0028, 0.4, "Montant ~g~"..factureMontant .. "$", 255, 255, 255, 255, 6, 1)
        end
        
		if IsControlJustPressed(1, 246) and requestFacture then --Y
            if target ~= 0 then
				requestFacture = false
                TriggerServerEvent("GTA:RetirerArgentBanque", factureMontant)
				TriggerServerEvent("GTA_Police:FactureAutoriser", target, factureMontant)
			else
                TriggerEvent("NUI-Notification", {"Aucune personne devant vous.", "warning", "fa fa-exclamation-circle fa-2x", "warning"})
            end
            Duree = 1000
        elseif IsControlJustPressed(1, 182) and requestFacture then --L
            if target ~= 0 then
				TriggerServerEvent("GTA_Police:FactureRefuser", target)
			else
                TriggerEvent("NUI-Notification", {"Aucune personne devant vous.", "warning", "fa fa-exclamation-circle fa-2x", "warning"})
			end
            requestFacture = false
            Duree = 1000
        end
	end
end)