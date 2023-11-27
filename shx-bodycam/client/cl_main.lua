local isAxonOn = false

RegisterCommand("bodycam", function()
	TriggerServerEvent("shx-bodycam/server/openBodycam")
end)

RegisterNetEvent("shx-bodycam/client/openEvent")
AddEventHandler("shx-bodycam/client/openEvent", function()
	TriggerServerEvent("shx-bodycam/server/openBodycam")
end)

RegisterNetEvent("shx-bodycam/client/toggleOpen")
AddEventHandler("shx-bodycam/client/toggleOpen", function(finalname, dept, rank)
	if isAxonOn then
		SendNUIMessage({show = false, type = "axon" })
		isAxonOn = false
		return
	end

	SendNUIMessage({show = true, type = "axon", name = finalname, dept = dept, rank = rank })
	isAxonOn = true
end)