AddEventHandler('chatMessage', function(s, n, m)
	local message = string.lower(m)
	if message == "/callout knife" then
		CancelEvent()
		--------------
		TriggerClientEvent('rpf:knifeCallout', s)
		Wait(1000)
		TriggerClientEvent('rpf:notification', -1)
	elseif message == "/callout veh" then
		CancelEvent()
		--------------
		TriggerClientEvent('rpf:abandonedVeh', s)
		Wait(1000)
		TriggerClientEvent('rpf:notification', -1)
	elseif message == "/callout shoplift" then
		CancelEvent()
		--------------
		TriggerClientEvent('rpf:shoplifting:spawn', s)
		Wait(2000)
		TriggerClientEvent('rpf:shoplifting', -1)
		TriggerClientEvent('rpf:notification', -1)
	elseif message == "/callout fight" then
		CancelEvent()
		--------------
		TriggerClientEvent('rpf:fight:spawn', s)
		Wait(2000)
		TriggerClientEvent('rpf:fight', -1)
		TriggerClientEvent('rpf:notification', -1)
	elseif message == "/callout shots" then
		CancelEvent()
		--------------
		TriggerClientEvent('rpf:shots:spawn', s)
		Wait(2000)
		TriggerClientEvent('rpf:shots', -1)
		TriggerClientEvent('rpf:notification', -1)
	elseif message == "/callout crazy" then
		CancelEvent()
		--------------
		TriggerClientEvent('rpf:crazy:spawn', s)
		Wait(2000)
		TriggerClientEvent('rpf:crazy', -1)
		TriggerClientEvent('rpf:notification', -1)
	elseif message == "/callout armed" then
		CancelEvent()
		--------------
		TriggerClientEvent('rpf:weapon:spawn', s)
		Wait(2000)
		TriggerClientEvent('rpf:weapon', -1)
		TriggerClientEvent('rpf:notification', -1)
	end
end)