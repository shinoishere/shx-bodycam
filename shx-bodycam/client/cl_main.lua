local isAxonOn = false

RegisterCommand("bodycam", function()
	TriggerServerEvent("shx-bodycam/server/openBodycam")
	PutClothes(Config.DrawableId, Config.TextureId)
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

PutClothes = function(drawableId, textureId)
    local playerPed = PlayerPedId()

    while not HasAnimDictLoaded("clothingtie") do 
        RequestAnimDict("clothingtie") 
        Wait(100) 
    end
	
    TaskPlayAnim(playerPed, "clothingtie", "try_tie_negative_a", 3.0, 3.0, 1200, 51, 0, false, false, false)
    SetPedComponentVariation(playerPed, 9, drawableId, textureId, 0)
end
