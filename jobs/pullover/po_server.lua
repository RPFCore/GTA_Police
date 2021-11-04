RegisterServerEvent('ticket')
AddEventHandler('ticket', function(string)
  TriggerClientEvent('chatMessage', -1, string)
end)

local rpfVersion = "1.0"

print("")
print("----------------[RPF]----------------")
print("RPF:SYSTEM - RPF SUCCESFULLY LOADED")
print("RPF:SYSTEM - RUNNING ON v" .. rpfVersion)
print("---------------------------------------")

TriggerClientEvent('chatMessage', -1, "RPF ^6v" .. rpfVersion, { 0, 0, 0}, " SUCCESFULLY LOADED!")