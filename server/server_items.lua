AddEventHandler('onResourceStart', function(resource)
	if resource == GetCurrentResourceName() then
		local items = MySQL.query.await("SELECT name FROM items")

		local itemList = { -- This items will be uploaded to database automatically
			{name = 'weaclip', label = 'Weapon Clip', weight = 1, rare = 0, can_remove = 1}, 
			{name = 'weabox', label = 'Weapon Box', weight = 2, rare = 0, can_remove = 1}, 
			{name = 'pistolclip', label = 'Pistol Clip', weight = 1, rare = 0, can_remove = 1},
			{name = 'smgclip', label = 'SMG Clip', weight = 1, rare = 0, can_remove = 1},
			{name = 'shotgunclip', label = 'Shotgun Clip', weight = 1, rare = 0, can_remove = 1},
			{name = 'rifleclip', label = 'Rifle Clip', weight = 1, rare = 0, can_remove = 1},
			{name = 'mgclip', label = 'MG Clip', weight = 1, rare = 0, can_remove = 1},
			{name = 'sniperclip', label = 'Sniper Clip', weight = 1, rare = 0, can_remove = 1},
			{name = 'throwableclip', label = 'Throwable Clip', weight = 1, rare = 0, can_remove = 1},
			{name = 'scope', label = 'Scope', weight = 1, rare = 0, can_remove = 1},
			{name = 'grip', label = 'Grip', weight = 1, rare = 0, can_remove = 1},
			{name = 'flashlight', label = 'Flashlight', weight = 1, rare = 0, can_remove = 1},
			{name = 'clip_extended', label = 'Extended Clip', weight = 1, rare = 0, can_remove = 1},
			{name = 'suppressor', label = 'Suppressor', weight = 1, rare = 0, can_remove = 1},
			{name = 'attachment_remover', label = 'Attachement Remover', weight = 1, rare = 0, can_remove = 1},
			{name = 'luxary_finish', label = 'Luxury Finish', weight = 1, rare = 0, can_remove = 1},
			{name = 'tint_green', label = 'Green', weight = 1, rare = 0, can_remove = 1},
			{name = 'tint_gold', label = 'Gold', weight = 1, rare = 0, can_remove = 1},
			{name = 'tint_pink', label = 'Pink', weight = 1, rare = 0, can_remove = 1},
			{name = 'tint_army', label = 'Army', weight = 1, rare = 0, can_remove = 1},
			{name = 'tint_lspd', label = 'LSPD', weight = 1, rare = 0, can_remove = 1},
			{name = 'tint_orange', label = 'Orange', weight = 1, rare = 0, can_remove = 1},
			{name = 'tint_platinum', label = 'Platinum', weight = 1, rare = 0, can_remove = 1}
		}

		if items then
			for k, v in pairs(itemList) do
				local contains, item = items_contains(items, v.name)
				
				if not contains then
					logging('debug', '^1 Item ^3 ' .. v.name .. ' ^1 not exists, inserting item... ^0')
					local insertItem = MySQL.query.await("INSERT INTO items (name, label, weight, rare, can_remove) VALUES ('" .. v.name .. "', '" .. v.label .. "', '" .. v.weight .. "', '" .. v.rare .. "', '" .. v.can_remove .. "');")
					
					if insertItem then
						logging('debug', '^2 Successfully ^3 inserted ^2 Item ^3 ' .. v.name .. ' ^2 in ^3 items ^0')
						print('^1Please restart your Server! Otherwise the Items won\'t work!^0')
					end
				end
			end
		end
	end
end)

----------------------------------------------------------------
--------------------- CUSTOM ITEMS -----------------------------
----------------------------------------------------------------

-- !!! You can add Weapon Clips and Weapon Components !!!
-- !!! You have to configure them in the config.lua !!!

-- xPlayer.triggerEvent('msk_weaponammo:checkItem', 'itemname') -- Weapon Clip
-- xPlayer.triggerEvent('msk_weaponammo:addComponent', 'itemname') -- Weapon Component


ESX.RegisterUsableItem('polweaclip', function(source) -- Requested by spotxgrphy
	local xPlayer = ESX.GetPlayerFromId(source)
	
	xPlayer.triggerEvent('msk_weaponammo:checkItem', 'polweaclip')
end)

ESX.RegisterUsableItem('polweabox', function(source) -- Requested by spotxgrphy
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.triggerEvent('msk_weaponammo:checkItem', 'polweabox')
end)

----------------------------------------------------------------
-------------------- ORIGINAL ITEMS ----------------------------
----------------------------------------------------------------

-- Usable Items
ESX.RegisterUsableItem('weaclip', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	
	xPlayer.triggerEvent('msk_weaponammo:checkItem', 'weaclip')
end)

ESX.RegisterUsableItem('weabox', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.triggerEvent('msk_weaponammo:checkItem', 'weabox')
end)

ESX.RegisterUsableItem('pistolclip', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	
	xPlayer.triggerEvent('msk_weaponammo:checkItem', 'pistolclip')
end)

ESX.RegisterUsableItem('smgclip', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	
	xPlayer.triggerEvent('msk_weaponammo:checkItem', 'smgclip')
end)

ESX.RegisterUsableItem('shotgunclip', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	
	xPlayer.triggerEvent('msk_weaponammo:checkItem', 'shotgunclip')
end)

ESX.RegisterUsableItem('rifleclip', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	
	xPlayer.triggerEvent('msk_weaponammo:checkItem', 'rifleclip')
end)

ESX.RegisterUsableItem('mgclip', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	
	xPlayer.triggerEvent('msk_weaponammo:checkItem', 'mgclip')
end)

ESX.RegisterUsableItem('sniperclip', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	
	xPlayer.triggerEvent('msk_weaponammo:checkItem', 'sniperclip')
end)

ESX.RegisterUsableItem('throwableclip', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	
	xPlayer.triggerEvent('msk_weaponammo:checkItem', 'throwableclip')
end)

----------------------------------------------------------------
-------------------- Component Items ---------------------------
----------------------------------------------------------------

ESX.RegisterUsableItem('scope', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	
	xPlayer.triggerEvent('msk_weaponammo:addComponent', 'scope')
end)

ESX.RegisterUsableItem('grip', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	
	xPlayer.triggerEvent('msk_weaponammo:addComponent', 'grip')
end)

ESX.RegisterUsableItem('flashlight', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	
	xPlayer.triggerEvent('msk_weaponammo:addComponent', 'flashlight')
end)

ESX.RegisterUsableItem('clip_extended', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	
	xPlayer.triggerEvent('msk_weaponammo:addComponent', 'clip_extended')
end)

ESX.RegisterUsableItem('suppressor', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	
	xPlayer.triggerEvent('msk_weaponammo:addComponent', 'suppressor')
end)

ESX.RegisterUsableItem('luxary_finish', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	
	xPlayer.triggerEvent('msk_weaponammo:addComponent', 'luxary_finish')
end)

----------------------------------------------------------------
------------------------ Tint Items ----------------------------
----------------------------------------------------------------

ESX.RegisterUsableItem('tint_green', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	
    xPlayer.triggerEvent('msk_weaponammo:addTint', 'tint_green')
end)

ESX.RegisterUsableItem('tint_gold', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	
	xPlayer.triggerEvent('msk_weaponammo:addTint', 'tint_gold')
end)

ESX.RegisterUsableItem('tint_pink', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	
	xPlayer.triggerEvent('msk_weaponammo:addTint', 'tint_pink')
end)

ESX.RegisterUsableItem('tint_army', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	
	xPlayer.triggerEvent('msk_weaponammo:addTint', 'tint_army')
end)

ESX.RegisterUsableItem('tint_lspd', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	
	xPlayer.triggerEvent('msk_weaponammo:addTint', 'tint_lspd')
end)

ESX.RegisterUsableItem('tint_orange', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	
	xPlayer.triggerEvent('msk_weaponammo:addTint', 'tint_orange')
end)

ESX.RegisterUsableItem('tint_platinum', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	
	xPlayer.triggerEvent('msk_weaponammo:addTint', 'tint_platinum')
end)

----------------------------------------------------------------
--------------------- Component Remover ------------------------
----------------------------------------------------------------

ESX.RegisterUsableItem('attachment_remover', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.triggerEvent('msk_weaponammo:openAttachmentMenu')
end)