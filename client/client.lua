ESX = exports["es_extended"]:getSharedObject()

if Config.AntiWeaponPunch then
    CreateThread(function()
        while true do
            local sleep = 0

            if IsPedArmed(PlayerPedId(), 4) then
                DisableControlAction(0, 140, true)
                DisableControlAction(0, 141, true)
                DisableControlAction(0, 142, true)
            end

			-- SetWeaponDamageModifier(GetHashKey("WEAPON_UNARMED"), 0.1)

			Wait(sleep)
        end
    end)
end

if Config.Hotkey.enable then
	CreateThread(function()
		while true do
			local sleep = 0

			if IsControlJustPressed(0, Config.Hotkey.key) then
				local playerPed = PlayerPedId()
				local hash = GetSelectedPedWeapon(playerPed)
				
				if IsPedArmed(playerPed, 4) then
					if hash then
						local weapon = ESX.GetWeaponFromHash(hash)
						local itemName = MSK.TriggerCallback('msk_weaponammo:getItem', weapon.name)
						logging('debug', ('[HOTKEY] [Add Ammo] Item: ^3%s^0, Weapon: ^3%s^0'):format(itemName, weapon.name))

						if itemName then
							TriggerServerEvent('msk_weaponammo:addWeaponClip', weapon.name, itemName)
						else
							Config.Notification(nil, Translation[Config.Locale]['not_correct_weapon'])
						end
					end
				else
					logging('debug', '[HOTKEY] [Add Ammo] No Weapon in your Hand')
				end
			end

			Wait(sleep)
		end
	end)
end

-- Check Item for Weapon
RegisterNetEvent('msk_weaponammo:checkItem')
AddEventHandler('msk_weaponammo:checkItem', function(clip)
    local playerPed = PlayerPedId()
	local hash = GetSelectedPedWeapon(playerPed)

	if IsPedArmed(playerPed, 4) then
		if hash then
			local weapon = ESX.GetWeaponFromHash(hash)

			if not Config.Weapons[clip] then return logging('debug', ('[ITEM] [Add Ammo] Item ^3%s^0 is not configured in config.lua'):format(clip)) end
			logging('debug', ('[ITEM] [Add Ammo] Item: ^3%s^0, Weapon: ^3%s^0'):format(clip, weapon.name))

			if MSK.Table_Contains(Config.Weapons[clip], weapon.name) then
				TriggerServerEvent('msk_weaponammo:addWeaponClip', weapon.name, clip)
			else
				Config.Notification(nil, Translation[Config.Locale]['not_correct_weapon'])
			end
		end
	else
		Config.Notification(nil, Translation[Config.Locale]['no_weapon'])
	end
end)

RegisterNetEvent('msk_weaponammo:addComponent')
AddEventHandler('msk_weaponammo:addComponent', function(component)
	local playerPed = PlayerPedId()
	local hash = GetSelectedPedWeapon(playerPed)
	
	if IsPedArmed(playerPed, 4) then
		if hash then
			local weapon = ESX.GetWeaponFromHash(hash)
			local weaponComponent = ESX.GetWeaponComponent(weapon.name, component)
			logging('debug', '[Add Component]', weapon.name, weaponComponent or 'Component not found')

			if weaponComponent then
				TriggerServerEvent('msk_weaponammo:addWeaponComponent', weapon.name, component)
			else
				logging('debug', ('Can not attach component ^2%s^0 to weapon ^2%s^0'):format(component, weapon.name))
				Config.Notification(nil, Translation[Config.Locale]['not_correct_component'])
			end
		end
	end
end)

RegisterNetEvent('msk_weaponammo:addTint')
AddEventHandler('msk_weaponammo:addTint', function(tint)
	local playerPed = PlayerPedId()
	local hash = GetSelectedPedWeapon(playerPed)
	
	if IsPedArmed(playerPed, 4) then
		if hash then
			local weapon = ESX.GetWeaponFromHash(hash)
			TriggerServerEvent('msk_weaponammo:addWeaponTint', weapon.name, tint)
		end
	end
end)

RegisterNetEvent('msk_weaponammo:runAnimation')
AddEventHandler('msk_weaponammo:runAnimation', function()
	if not Config.Animation then return end
	TaskReloadWeapon(PlayerPedId(), 1)
end)

logging = function(code, ...)
    if Config.Debug then
        local script = "[^2"..GetCurrentResourceName().."^0]"
        MSK.logging(script, code, ...)
    end
end