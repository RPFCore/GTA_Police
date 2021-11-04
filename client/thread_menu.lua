-------------------------------> Main Thread :
local dureeThread = 1000
Citizen.CreateThread(function()
    while (true) do
        dureeThread = 1000
        if (exports.nCoreGTA:GetPlayerJob() ~= "NYPD") then else 
            dureeThread = 0
            OnMainMenu()
            OnSubCitoyenMenu()
            OnVestiaireMenu()
            OnMenuGarage()
            OnMenuStockage()
        end
        Citizen.Wait(dureeThread)
    end
end)