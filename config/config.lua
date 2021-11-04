--- GTA_Police for nCoreGTA by RPF-Studio. BETA 1.0 @cedricalpatch
--- Github : https://github.com/cedricalpatch

Config = {
    Locations = {
        [1] = {        
            ["Blip"] = { --> Position du poste de police.
                ["x"] = 459.21, ["y"] = -1008.07, ["z"] = 28.26
            },

            ["Service"] = { --> Position prise de service.
                ["x"] = 450.174, ["y"] = -992.276, ["z"] = 30.6896
            },

            --> Position d'accès au garage medic.
            ["GaragePosition"] = {
                    ["x"] = 459.21, ["y"] = -1008.07, ["z"] = 28.26
            },

            --> Position du véhicule pour le ranger.
            ["RentrerVehicule"] = { 
                    ["x"] = 451.89, ["y"] = -997.19, ["z"] = 25.76
            },
            --> Position du stockage.
            ["StockageMenu"] = { 
                ["x"] = 452.372, ["y"] = -980.519, ["z"] = 30.6896
            },
        },
    },
}


Config.Stockage = {}

--O T H E R--
reverseWithPlayer = true  --While using mimic, the stopped vehicle will reverse with you, if set to 'false' the stopped vehicle will accelerate when you reverse.
towfadetime = 6