ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    ESX.PlayerData.job = job
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  ESX.PlayerData = xPlayer
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
		local ped = PlayerPedId()
        if DoesEntityExist( ped ) and not IsEntityDead( ped ) then
            if ESX.PlayerData.job ~= nil and ESX.PlayerData.job.name == 'police' or ESX.PlayerData.job ~= nil and ESX.PlayerData.job.name == 'ambulance' then
				if IsControlJustReleased( 0, 19 ) then
					ExecuteCommand('e c')
				else
					if IsControlJustPressed( 0, 19 ) then
						ExecuteCommand('e radio')
                    end
                end
			end 
		end 
	end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
		local ped = PlayerPedId()
        if DoesEntityExist( ped ) and not IsEntityDead( ped ) then
            if ESX.PlayerData.job ~= nil and ESX.PlayerData.job.name ~= 'police' and ESX.PlayerData.job.name ~= 'ambulance' then
				if IsControlJustReleased( 0, 19 ) then
                    ExecuteCommand('e c')
				else
					if IsControlJustPressed( 0, 19 ) and not IsPlayerFreeAiming(PlayerId()) then
						ExecuteCommand('e phonecall')
                    end
                end
			end 
		end 
	end
end)
