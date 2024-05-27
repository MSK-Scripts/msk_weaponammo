Config = {}
----------------------------------------------------------------
Config.Locale = 'de'
Config.Debug = true
Config.VersionChecker = true
----------------------------------------------------------------
Config.Menu = 'NativeUI' -- Set to 'ESX' if you want ESX Menu || Set to 'NativeUI' if you want NativeUI
Config.AntiWeaponPunch = true -- Set false if you don't want to use this
Config.Animation = true -- Set false if you dont want an animation

Config.SavePlayer = true

Config.enableMaxAmmo = true -- Set false to deactivate this feature
Config.checkMaxAmmo = {
	['weaclip'] = 250,
	['weabox'] = 250,

	['pistolclip'] = 80,
	['smgclip'] = 120,
	['shotgunclip'] = 80,
	['rifleclip'] = 180,
	['mgclip'] = 250,
	['sniperclip'] = 120,
	['throwableclip'] = 25,
}

Config.Hotkey = {
	enable = true, -- Set to false if you dont want to use ammo Item by pressing a Key
	key = 45, -- default: 45 = R // https://docs.fivem.net/docs/game-references/controls/
}
----------------------------------------------------------------
-- !!! This function is clientside AND serverside !!!
Config.Notification = function(source, message)
    if IsDuplicityVersion() then -- serverside
        MSK.Notification(source, 'MSK WeaponAmmo', message, 'info')
    else -- clientside
        MSK.Notification('MSK WeaponAmmo', message, 'info')
    end
end
---------------------------------------------------
Config.WeaponAmmoClips = { -- Will give this many bullets to player
	-- Items are used for all types of weapons
	['weaclip'] = 30,
	['weabox'] = 150,
	-- Items are used for only that kind of weapon type
	['pistolclip'] = 12,
	['smgclip'] = 30,
	['shotgunclip'] = 25,
	['rifleclip'] = 25,
	['mgclip'] = 50,
	['sniperclip'] = 15,
	['throwableclip'] = 5,

	-- CUSTOM ITEMS // Add them in server_items.lua
	['itemname'] = true,
}
----------------------------------------------------------------
-- Set true if you like to remove item when used
Config.Removeables = {
	-- Weapon Clips
	['weaclip'] = true,
	['weabox'] = true,
	['pistolclip'] = true,
	['smgclip'] = true,
	['shotgunclip'] = true,
	['rifleclip'] = true,
	['mgclip'] = true,
	['sniperclip'] = true,
	['throwableclip'] = true,

	-- Weapon Attachments
	['scope'] = true,
	['scope_holo'] = true,
	['scope_small'] = true,
	['scope_medium'] = true,
	['scope_large'] = true,
	['scope_advanced'] = true,
	['grip'] = true,
	['flashlight'] = true,
	['clip_default'] = true,
	['clip_extended'] = true,
	['clip_drum'] = true,
	['clip_box'] = true,
	['suppressor'] = true,
	['compensator'] = true,
	['luxary_finish'] = true,
	['attachment_remover'] = false, -- This item removes Weapon Components and opens the Menu // recommended set to false

	-- Weapon Tints
	['tint_green'] = true,
	['tint_gold'] = true,
	['tint_pink'] = true,
	['tint_army'] = true,
	['tint_lspd'] = true,
	['tint_orange'] = true,
	['tint_platinum'] = true,

	-- CUSTOM ITEMS // Add them in server_items.lua
	['itemname'] = true,
}
----------------------------------------------------------------
-- Please don't TOUCH if you don't know what you are doing!!
Config.Weapons = {
	['pistolclip'] = {
		'WEAPON_PISTOL',
		'WEAPON_PISTOL_MK2',
		'WEAPON_COMBATPISTOL',
		'WEAPON_APPISTOL',
		'WEAPON_PISTOL50',
		'WEAPON_SNSPISTOL',
		'WEAPON_SNSPISTOL_MK2',
		'WEAPON_HEAVYPISTOL',
		'WEAPON_VINTAGEPISTOL',
		'WEAPON_MARKSMANPISTOL',
		'WEAPON_REVOLVER',
		'WEAPON_REVOLVER_MK2',
		'WEAPON_DOUBLEACTION',
		'WEAPON_CERAMICPISTOL',
		'WEAPON_NAVYREVOLVER',
		'WEAPON_GADGETPISTOL',
	},
	['smgclip'] = {
		'WEAPON_MICROSMG',
		'WEAPON_SMG',
		'WEAPON_SMG_MK2',
		'WEAPON_ASSAULTSMG',
		'WEAPON_COMBATPDW',
		'WEAPON_MACHINEPISTOL',
		'WEAPON_MINISMG',
	},
	['shotgunclip'] = {
		'WEAPON_PUMPSHOTGUN',
		'WEAPON_PUMPSHOTGUN_MK2',
		'WEAPON_SAWNOFFSHOTGUN',
		'WEAPON_ASSAULTSHOTGUN',
		'WEAPON_BULLPUPSHOTGUN',
		'WEAPON_MUSKET',
		'WEAPON_HEAVYSHOTGUN',
		'WEAPON_DBSHOTGUN',
		'WEAPON_AUTOSHOTGUN',
		'WEAPON_COMBATSHOTGUN',
	},
	['rifleclip'] = {
		'WEAPON_ASSAULTRIFLE',
		'WEAPON_ASSAULTRIFLE_MK2',
		'WEAPON_CARBINERIFLE',
		'WEAPON_CARBINERIFLE_MK2',
		'WEAPON_ADVANCEDRIFLE',
		'WEAPON_SPECIALCARBINE',
		'WEAPON_SPECIALCARBINE_MK2',
		'WEAPON_BULLPUPRIFLE',
		'WEAPON_BULLPUPRIFLE_MK2',
		'WEAPON_COMPACTRIFLE',
		'WEAPON_MILITARYRIFLE',
		'WEAPON_HEAVYRIFLE',
		'WEAPON_TACTICALRIFLE',
	},
	['mgclip'] = {
		'WEAPON_MG',
		'WEAPON_COMBATMG',
		'WEAPON_COMBATMG_MK2',
		'WEAPON_GUSENBERG',
	},
	['sniperclip'] = {
		'WEAPON_SNIPERRIFLE',
		'WEAPON_HEAVYSNIPER',
		'WEAPON_HEAVYSNIPER_MK2',
		'WEAPON_MARKSMANRIFLE',
		'WEAPON_MARKSMANRIFLE_MK2',
		'WEAPON_PRECISIONRIFLE',
	},
	['throwableclip'] = {
		'WEAPON_FLAREGUN',
	},
	['weaclip'] = {
		-- Pistols
		'WEAPON_PISTOL',
		'WEAPON_PISTOL_MK2',
		'WEAPON_COMBATPISTOL',
		'WEAPON_APPISTOL',
		'WEAPON_PISTOL50',
		'WEAPON_SNSPISTOL',
		'WEAPON_SNSPISTOL_MK2',
		'WEAPON_HEAVYPISTOL',
		'WEAPON_VINTAGEPISTOL',
		'WEAPON_MARKSMANPISTOL',
		'WEAPON_REVOLVER',
		'WEAPON_REVOLVER_MK2',
		'WEAPON_DOUBLEACTION',
		'WEAPON_CERAMICPISTOL',
		'WEAPON_NAVYREVOLVER',
		'WEAPON_GADGETPISTOL',

		-- SMGS
		'WEAPON_MICROSMG',
		'WEAPON_SMG',
		'WEAPON_SMG_MK2',
		'WEAPON_ASSAULTSMG',
		'WEAPON_COMBATPDW',
		'WEAPON_MACHINEPISTOL',
		'WEAPON_MINISMG',

		-- Shotguns
		'WEAPON_PUMPSHOTGUN',
		'WEAPON_PUMPSHOTGUN_MK2',
		'WEAPON_SAWNOFFSHOTGUN',
		'WEAPON_ASSAULTSHOTGUN',
		'WEAPON_BULLPUPSHOTGUN',
		'WEAPON_MUSKET',
		'WEAPON_HEAVYSHOTGUN',
		'WEAPON_DBSHOTGUN',
		'WEAPON_AUTOSHOTGUN',
		'WEAPON_COMBATSHOTGUN',

		-- Rifles
		'WEAPON_ASSAULTRIFLE',
		'WEAPON_ASSAULTRIFLE_MK2',
		'WEAPON_CARBINERIFLE',
		'WEAPON_CARBINERIFLE_MK2',
		'WEAPON_ADVANCEDRIFLE',
		'WEAPON_SPECIALCARBINE',
		'WEAPON_SPECIALCARBINE_MK2',
		'WEAPON_BULLPUPRIFLE',
		'WEAPON_BULLPUPRIFLE_MK2',
		'WEAPON_COMPACTRIFLE',
		'WEAPON_MILITARYRIFLE',
		'WEAPON_HEAVYRIFLE',
		'WEAPON_TACTICALRIFLE',

		-- MGs
		'WEAPON_MG',
		'WEAPON_COMBATMG',
		'WEAPON_COMBATMG_MK2',
		'WEAPON_GUSENBERG',

		-- Snipers
		'WEAPON_SNIPERRIFLE',
		'WEAPON_HEAVYSNIPER',
		'WEAPON_HEAVYSNIPER_MK2',
		'WEAPON_MARKSMANRIFLE',
		'WEAPON_MARKSMANRIFLE_MK2',
		'WEAPON_PRECISIONRIFLE',

		-- Throwables
		'WEAPON_FLAREGUN',
	},
	['weabox'] = {
		-- Pistols
		'WEAPON_PISTOL',
		'WEAPON_PISTOL_MK2',
		'WEAPON_COMBATPISTOL',
		'WEAPON_APPISTOL',
		'WEAPON_PISTOL50',
		'WEAPON_SNSPISTOL',
		'WEAPON_SNSPISTOL_MK2',
		'WEAPON_HEAVYPISTOL',
		'WEAPON_VINTAGEPISTOL',
		'WEAPON_MARKSMANPISTOL',
		'WEAPON_REVOLVER',
		'WEAPON_REVOLVER_MK2',
		'WEAPON_DOUBLEACTION',
		'WEAPON_CERAMICPISTOL',
		'WEAPON_NAVYREVOLVER',
		'WEAPON_GADGETPISTOL',

		-- SMGS
		'WEAPON_MICROSMG',
		'WEAPON_SMG',
		'WEAPON_SMG_MK2',
		'WEAPON_ASSAULTSMG',
		'WEAPON_COMBATPDW',
		'WEAPON_MACHINEPISTOL',
		'WEAPON_MINISMG',

		-- Shotguns
		'WEAPON_PUMPSHOTGUN',
		'WEAPON_PUMPSHOTGUN_MK2',
		'WEAPON_SAWNOFFSHOTGUN',
		'WEAPON_ASSAULTSHOTGUN',
		'WEAPON_BULLPUPSHOTGUN',
		'WEAPON_MUSKET',
		'WEAPON_HEAVYSHOTGUN',
		'WEAPON_DBSHOTGUN',
		'WEAPON_AUTOSHOTGUN',
		'WEAPON_COMBATSHOTGUN',

		-- Rifles
		'WEAPON_ASSAULTRIFLE',
		'WEAPON_ASSAULTRIFLE_MK2',
		'WEAPON_CARBINERIFLE',
		'WEAPON_CARBINERIFLE_MK2',
		'WEAPON_ADVANCEDRIFLE',
		'WEAPON_SPECIALCARBINE',
		'WEAPON_SPECIALCARBINE_MK2',
		'WEAPON_BULLPUPRIFLE',
		'WEAPON_BULLPUPRIFLE_MK2',
		'WEAPON_COMPACTRIFLE',
		'WEAPON_MILITARYRIFLE',
		'WEAPON_HEAVYRIFLE',
		'WEAPON_TACTICALRIFLE',

		-- MGs
		'WEAPON_MG',
		'WEAPON_COMBATMG',
		'WEAPON_COMBATMG_MK2',
		'WEAPON_GUSENBERG',

		-- Snipers
		'WEAPON_SNIPERRIFLE',
		'WEAPON_HEAVYSNIPER',
		'WEAPON_HEAVYSNIPER_MK2',
		'WEAPON_MARKSMANRIFLE',
		'WEAPON_MARKSMANRIFLE_MK2',
		'WEAPON_PRECISIONRIFLE',

		-- Throwables
		'WEAPON_FLAREGUN',
	},
}