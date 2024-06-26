RegisterNetEvent('msk_weaponammo:addWeaponClip')
AddEventHandler('msk_weaponammo:addWeaponClip', function(weaponName, clip)
	local src = source
	local xPlayer = ESX.GetPlayerFromId(src)
	local ammo = Config.WeaponAmmoClips[clip]
	local hasItem = xPlayer.getInventoryItem(clip)
	
	if not ammo then logging('error', 'Invalid ammo Item! Look at Config.WeaponAmmoClips if the item is configured.') return end
	weaponName = weaponName:upper()

	if hasItem and hasItem.count > 0 then
		if Config.enableMaxAmmo then
			for k, v in ipairs(xPlayer.loadout) do
				if v.name == weaponName then
					logging('debug', ('Weapon match with %s and %s! Checking Config.checkMaxAmmo...'):format(v.name, weaponName))
					logging('debug', ('Ammo in Weapon: %s, Ammo in Clip: %s, Ammo after Relaod: %s, MaxAmmo in Config: %s'):format(v.ammo, ammo, v.ammo + ammo, Config.checkMaxAmmo[clip]))

					if (v.ammo + ammo) <= Config.checkMaxAmmo[clip] then
						TriggerClientEvent('msk_weaponammo:runAnimation', src)
						xPlayer.addWeaponAmmo(weaponName, ammo)
						TriggerClientEvent('msk_weaponammo:updateAmmo', src, weaponName, ammo)
						Config.Notification(src, Translation[Config.Locale]['used_clip']:format(hasItem.label))
						
						if Config.Removeables[clip] then xPlayer.removeInventoryItem(clip, 1) end
						logging('debug', ('Ammo was added to Weapon %s. Used clip was %s.'):format(weaponName, clip))

						saveESXPlayer(xPlayer)
					else
						Config.Notification(src, Translation[Config.Locale]['check_maxammo'])
					end

					break
				end
			end
		else
			logging('debug', ('Weapon: %s, Item: %s, Ammo: %s'):format(weaponName, clip, ammo))
			TriggerClientEvent('msk_weaponammo:runAnimation', src)
			xPlayer.addWeaponAmmo(weaponName, ammo)
			TriggerClientEvent('msk_weaponammo:updateAmmo', src, weaponName, ammo)
			Config.Notification(src, Translation[Config.Locale]['used_clip']:format(hasItem.label))

			if Config.Removeables[clip] then
				xPlayer.removeInventoryItem(clip, 1)
			end

			logging('debug', ('Ammo was added to Weapon %s. Used clip was %s.'):format(weaponName, clip))
			
			saveESXPlayer(xPlayer)
		end
	else
		Config.Notification(src, Translation[Config.Locale]['no_ammo'])
	end
end)

-- Add/Remove Weapon Component
RegisterNetEvent('msk_weaponammo:addWeaponComponent')
AddEventHandler('msk_weaponammo:addWeaponComponent', function(weaponName, component)
	local src = source
	local xPlayer = ESX.GetPlayerFromId(src)
	local hasItem = xPlayer.getInventoryItem(component)

	weaponName = weaponName:upper()

	local hasComponent = xPlayer.hasWeaponComponent(weaponName, component)

	if hasComponent then
		Config.Notification(src, Translation[Config.Locale]['has_component'])
	else
		xPlayer.addWeaponComponent(weaponName, component)
		Config.Notification(src, Translation[Config.Locale]['used_attachment']:format(hasItem.label))

		if Config.Removeables[component] then
			xPlayer.removeInventoryItem(component, 1)
		end

		logging('debug', ('Component was added to Weapon %s. Used attachment was %s.'):format(weaponName, component))
		saveESXPlayer(xPlayer)
	end
end)

RegisterNetEvent('msk_weaponammo:removeWeaponComponent')
AddEventHandler('msk_weaponammo:removeWeaponComponent', function(weaponName, component)
	local src = source
	local xPlayer = ESX.GetPlayerFromId(src)

	weaponName = weaponName:upper()

	local hasComponent = xPlayer.hasWeaponComponent(weaponName, component)
	local hasItem = xPlayer.getInventoryItem(component)

	if hasComponent then
		xPlayer.removeWeaponComponent(weaponName, component)

		if Config.Removeables[component] then
			xPlayer.addInventoryItem(component, 1)
		end

		if Config.Removeables['attachment_remover'] then
			xPlayer.removeInventoryItem('attachment_remover', 1)
		end

		Config.Notification(src, Translation[Config.Locale]['used_attachment_remover']:format(hasItem.label))
		logging('debug', ('Component was removed from Weapon %s. Used attachment was %s.'):format(weaponName, component))
		saveESXPlayer(xPlayer)
	else 
		Config.Notification(src, Translation[Config.Locale]['no_component'])
	end
end)

MSK.Register('msk_weaponammo:getItem', function(source, weaponName)
	local src = source
	local xPlayer = ESX.GetPlayerFromId(src)
	local match = false
	local items = {}

	for k, v in pairs(Config.Weapons) do
		for i, weapon in pairs(v) do
			if weapon:upper() == weaponName:upper() then
				local hasItem = xPlayer.getInventoryItem(k)

				if hasItem and hasItem.count >= 1 then
					match = true
					items[#items + 1] = hasItem.name
				end
			end
		end
	end

	return match and items[1] or false
end)

-- Add/Remove Weapon Tints
RegisterNetEvent('msk_weaponammo:addWeaponTint')
AddEventHandler('msk_weaponammo:addWeaponTint', function(weaponName, tint)
	local src = source
	local xPlayer = ESX.GetPlayerFromId(src)
	local hasItem = xPlayer.getInventoryItem(tint)

	weaponName = weaponName:upper()

	if tint == 'tint_green' then
		xPlayer.setWeaponTint(weaponName, 1)
	elseif tint == 'tint_gold' then
		xPlayer.setWeaponTint(weaponName, 2)
	elseif tint == 'tint_pink' then
		xPlayer.setWeaponTint(weaponName, 3)
	elseif tint == 'tint_army' then
		xPlayer.setWeaponTint(weaponName, 4)
	elseif tint == 'tint_lspd' then
		xPlayer.setWeaponTint(weaponName, 5)
	elseif tint == 'tint_orange' then
		xPlayer.setWeaponTint(weaponName, 6)
	elseif tint == 'tint_platinum' then
		xPlayer.setWeaponTint(weaponName, 7)
	end

	if Config.Removeables[tint] then
		xPlayer.removeInventoryItem(tint, 1)
	end

	Config.Notification(src, Translation[Config.Locale]['added_tint']:format(hasItem.label))
	logging('debug', ('Tint was added to Weapon %s. Used tint was %s.'):format(weaponName, tint))
	saveESXPlayer(xPlayer)
end)

RegisterNetEvent('msk_weaponammo:removeWeaponTint')
AddEventHandler('msk_weaponammo:removeWeaponTint', function(weaponName)
	local src = source
	local xPlayer = ESX.GetPlayerFromId(src)

	weaponName = weaponName:upper()

	local tint = xPlayer.getWeaponTint(weaponName)
	xPlayer.setWeaponTint(weaponName, 0)

	if tint == 1 then
		if Config.Removeables['tint_green'] then
			xPlayer.addInventoryItem('tint_green', 1)
		end
	elseif tint == 2 then
		if Config.Removeables['tint_gold'] then
			xPlayer.addInventoryItem('tint_gold', 1)
		end
	elseif tint == 3 then
		if Config.Removeables['tint_pink'] then
			xPlayer.addInventoryItem('tint_pink', 1)
		end
	elseif tint == 4 then
		if Config.Removeables['tint_army'] then
			xPlayer.addInventoryItem('tint_army', 1)
		end
	elseif tint == 5 then
		if Config.Removeables['tint_lspd'] then
			xPlayer.addInventoryItem('tint_lspd', 1)
		end
	elseif tint == 6 then
		if Config.Removeables['tint_orange'] then
			xPlayer.addInventoryItem('tint_orange', 1)
		end
	elseif tint == 7 then
		if Config.Removeables['tint_platinum'] then
			xPlayer.addInventoryItem('tint_platinum', 1)
		end
	else
		logging('debug', 'No Weapon Tint found')
	end

	Config.Notification(src, Translation[Config.Locale]['removed_tint'])
	
	if Config.Removeables['attachment_remover'] then
		xPlayer.removeInventoryItem('attachment_remover', 1)
	end
	saveESXPlayer(xPlayer)
end)

logging = function(code, ...)
    if not Config.Debug then return end
    MSK.Logging(code, ...)
end

function items_contains(items, item)
	for k, v in pairs(items) do
		if v.name == item then
			return true, item
		end
	end
	return false
end

function saveESXPlayer(xPlayer)
	if not Config.SavePlayer then return end
	MySQL.update("UPDATE users SET loadout = ? WHERE identifier = ?", {json.encode(xPlayer.getLoadout(true)), xPlayer.identifier})
end

GithubUpdater = function()
    local GetCurrentVersion = function()
	    return GetResourceMetadata(GetCurrentResourceName(), "version")
    end

	local isVersionIncluded = function(Versions, cVersion)
		for k, v in pairs(Versions) do
			if v.version == cVersion then
				return true
			end
		end

		return false
	end
    
    local CurrentVersion = GetCurrentVersion()
    local resourceName = "^0[^2"..GetCurrentResourceName().."^0]"

    if Config.VersionChecker then
        PerformHttpRequest('https://raw.githubusercontent.com/Musiker15/VERSIONS/main/WeaponAmmo.json', function(errorCode, jsonString, headers)
			if not jsonString then 
                print(resourceName .. '^1Update Check failed ^3Please Update to the latest Version:^9 https://github.com/MSK-Scripts/msk_weaponammo ^0')
                print(resourceName .. '^2 ✓ Resource loaded^0 - ^5Current Version: ^0' .. CurrentVersion)
                return
            end

			local decoded = json.decode(jsonString)
            local version = decoded[1].version

            if CurrentVersion == version then
                print(resourceName .. '^2 ✓ Resource is Up to Date^0 - ^5Current Version: ^2' .. CurrentVersion .. '^0')
            elseif CurrentVersion ~= version then
                print(resourceName .. '^1 ✗ Resource Outdated. Please Update!^0 - ^5Current Version: ^1' .. CurrentVersion .. '^0')
                print('^5Latest Version: ^2' .. version .. '^0 - ^6Download here:^9 https://github.com/MSK-Scripts/msk_weaponammo/releases/tag/v'.. version .. '^0')
				print('')
				if not string.find(CurrentVersion, 'beta') then
					for i=1, #decoded do 
						if decoded[i]['version'] == CurrentVersion then
							break
						elseif not isVersionIncluded(decoded, CurrentVersion) then
							print('^1You are using an^3 UNSUPPORTED VERSION^1 of ^0' .. resourceName)
							break
						end

						if decoded[i]['changelogs'] then
							print('^3Changelogs v' .. decoded[i]['version'] .. '^0')

							for _, c in ipairs(decoded[i]['changelogs']) do
								print(c)
							end
						end
					end
				else
					print('^1You are using the^3 BETA VERSION^1 of ^0' .. resourceName)
				end
            end
        end)
    else
        print(resourceName .. '^2 ✓ Resource loaded^0 - ^5Current Version: ^2' .. CurrentVersion .. '^0')
    end
end
GithubUpdater()