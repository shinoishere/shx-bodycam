if Config.Framework == "qbcore" or Config.Framework == "qbox" then
    QBCore = exports["qb-core"]:GetCoreObject()
elseif Config.Framework == "esx" then
    ESX = exports["es_extended"]:getSharedObject()
end

RegisterNetEvent("shx-bodycam/server/openBodycam")
AddEventHandler("shx-bodycam/server/openBodycam", function()
	if Config.Framework == "qbcore" or Config.Framework == "qbox" then
		local sentData = QBCore.Functions.GetPlayer(source)
		if sentData then
			local fName = string.sub(sentData.PlayerData.charinfo.firstname, 1, 1)
			local callsign = sentData.PlayerData.metadata["callsign"]
			if not callsign then return end
			local finalName = fName..". "..sentData.PlayerData.charinfo.lastname.." ["..callsign.."]"
			local dept = Config.axonDepartments[sentData.PlayerData.job.name]
			if not dept then return end
			local jobinfo = sentData.PlayerData.job
			local rank = "Below Cadet"
			if jobinfo then
				rank = sentData.PlayerData.job.grade.name
			end
		TriggerClientEvent("shx-bodycam/client/toggleOpen", source, finalName, dept, rank)
		end
	elseif Config.Framework == "esx" then
		local sentData = ESX.GetPlayerFromId(source)
		if sentData then
			local fName = string.sub(sentData.get("firstName"), 1, 1)
			local finalName = fName..". "..sentData.get("lastName")
			local dept = Config.axonDepartments[sentData.job.name]
			if not dept then return end
			local jobinfo = sentData.job
			local rank = "Below Cadet"
			if jobinfo then
				rank = sentData.job.grade_name
			end
		TriggerClientEvent("shx-bodycam/client/toggleOpen", source, finalName, dept, rank)
		end
	end
end)
