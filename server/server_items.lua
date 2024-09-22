AddEventHandler('onResourceStart', function(resource)
	if resource == GetCurrentResourceName() then
		local items = MySQL.query.await("SELECT name FROM items")

		local itemList = { -- This items will be uploaded to database automatically
			{name = 'weaclip', label = Translation[Config.Locale]['weaclip'], weight = 1, rare = 0, can_remove = 1}, 
			{name = 'weabox', label = Translation[Config.Locale]['weabox'], weight = 2, rare = 0, can_remove = 1}, 
			{name = 'pistolclip', label = Translation[Config.Locale]['pistolclip'], weight = 1, rare = 0, can_remove = 1},
			{name = 'smgclip', label = Translation[Config.Locale]['smgclip'], weight = 1, rare = 0, can_remove = 1},
			{name = 'shotgunclip', label = Translation[Config.Locale]['shotgunclip'], weight = 1, rare = 0, can_remove = 1},
			{name = 'rifleclip', label = Translation[Config.Locale]['rifleclip'], weight = 1, rare = 0, can_remove = 1},
			{name = 'mgclip', label = Translation[Config.Locale]['mgclip'], weight = 1, rare = 0, can_remove = 1},
			{name = 'sniperclip', label = Translation[Config.Locale]['sniperclip'], weight = 1, rare = 0, can_remove = 1},
			{name = 'throwableclip', label = Translation[Config.Locale]['throwableclip'], weight = 1, rare = 0, can_remove = 1},

			{name = 'attachment_remover', label = Translation[Config.Locale]['component_remover'], weight = 1, rare = 0, can_remove = 1},
			{name = 'scope', label = Translation[Config.Locale]['component_scope'], weight = 1, rare = 0, can_remove = 1},
			{name = 'scope_holo', label = Translation[Config.Locale]['component_scope_holo'], weight = 1, rare = 0, can_remove = 1},
			{name = 'scope_small', label = Translation[Config.Locale]['component_scope_small'], weight = 1, rare = 0, can_remove = 1},
			{name = 'scope_medium', label = Translation[Config.Locale]['component_scope_medium'], weight = 1, rare = 0, can_remove = 1},
			{name = 'scope_large', label = Translation[Config.Locale]['component_scope_large'], weight = 1, rare = 0, can_remove = 1},
			{name = 'scope_advanced', label = Translation[Config.Locale]['component_scope_advanced'], weight = 1, rare = 0, can_remove = 1},
			{name = 'grip', label = Translation[Config.Locale]['component_grip'], weight = 1, rare = 0, can_remove = 1},
			{name = 'flashlight', label = Translation[Config.Locale]['component_flashlight'], weight = 1, rare = 0, can_remove = 1},
			{name = 'clip_default', label = Translation[Config.Locale]['component_clip_default'], weight = 1, rare = 0, can_remove = 1},
			{name = 'clip_extended', label = Translation[Config.Locale]['component_clip_extended'], weight = 1, rare = 0, can_remove = 1},
			{name = 'clip_drum', label = Translation[Config.Locale]['component_clip_drum'], weight = 1, rare = 0, can_remove = 1},
			{name = 'clip_box', label = Translation[Config.Locale]['component_clip_box'], weight = 1, rare = 0, can_remove = 1},
			{name = 'suppressor', label = Translation[Config.Locale]['component_suppressor'], weight = 1, rare = 0, can_remove = 1},
			{name = 'compensator', label = Translation[Config.Locale]['component_compensator'], weight = 1, rare = 0, can_remove = 1},
			{name = 'luxary_finish', label = Translation[Config.Locale]['component_luxary_finish'], weight = 1, rare = 0, can_remove = 1},

			{name = 'tint_green', label = Translation[Config.Locale]['tint_green'], weight = 1, rare = 0, can_remove = 1},
			{name = 'tint_gold', label = Translation[Config.Locale]['tint_gold'], weight = 1, rare = 0, can_remove = 1},
			{name = 'tint_pink', label = Translation[Config.Locale]['tint_pink'], weight = 1, rare = 0, can_remove = 1},
			{name = 'tint_army', label = Translation[Config.Locale]['tint_army'], weight = 1, rare = 0, can_remove = 1},
			{name = 'tint_lspd', label = Translation[Config.Locale]['tint_lspd'], weight = 1, rare = 0, can_remove = 1},
			{name = 'tint_orange', label = Translation[Config.Locale]['tint_orange'], weight = 1, rare = 0, can_remove = 1},
			{name = 'tint_platinum', label = Translation[Config.Locale]['tint_platinum'], weight = 1, rare = 0, can_remove = 1}
		}

		if items then
			for k, v in pairs(itemList) do
				local contains, item = items_contains(items, v.name)
				
				if not contains then
					logging('debug', '^1 Item ^3 ' .. v.name .. ' ^1 not exists, inserting item... ^0')
					local insertItem = MySQL.query.await("INSERT INTO items (name, label, weight, rare, can_remove) VALUES ('" .. v.name .. "', '" .. v.label .. "', '" .. v.weight .. "', '" .. v.rare .. "', '" .. v.can_remove .. "');")
					
					if insertItem then
						logging('debug', '^2Successfully ^3inserted ^2Item ^3' .. v.name .. ' ^2in ^3items ^0')
						print('^1Please restart your Server! Otherwise the Items won\'t work!^0')
					end
				else
					-- Update Label
					-- MySQL.update("UPDATE items SET label = ? WHERE name = ?", {v.label, v.name})
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

-- TriggerClientEvent('msk_weaponammo:checkItem', source, 'itemName') -- Weapon Clip
-- TriggerClientEvent('msk_weaponammo:addComponent', source, 'itemName') -- Weapon Component

----------------------------------------------------------------
-------------------- ORIGINAL ITEMS ----------------------------
----------------------------------------------------------------

-- Usable Items
ESX.RegisterUsableItem('weaclip', function(source)
	TriggerClientEvent('msk_weaponammo:checkItem', source, 'weaclip')
end)

ESX.RegisterUsableItem('weabox', function(source)
	TriggerClientEvent('msk_weaponammo:checkItem', source, 'weabox')
end)

ESX.RegisterUsableItem('pistolclip', function(source)
	TriggerClientEvent('msk_weaponammo:checkItem', source, 'pistolclip')
end)

ESX.RegisterUsableItem('smgclip', function(source)
	TriggerClientEvent('msk_weaponammo:checkItem', source, 'smgclip')
end)

ESX.RegisterUsableItem('shotgunclip', function(source)
	TriggerClientEvent('msk_weaponammo:checkItem', source, 'shotgunclip')
end)

ESX.RegisterUsableItem('rifleclip', function(source)
	TriggerClientEvent('msk_weaponammo:checkItem', source, 'rifleclip')
end)

ESX.RegisterUsableItem('mgclip', function(source)
	TriggerClientEvent('msk_weaponammo:checkItem', source, 'mgclip')
end)

ESX.RegisterUsableItem('sniperclip', function(source)
	TriggerClientEvent('msk_weaponammo:checkItem', source, 'sniperclip')
end)

ESX.RegisterUsableItem('throwableclip', function(source)
	TriggerClientEvent('msk_weaponammo:checkItem', source, 'throwableclip')
end)

----------------------------------------------------------------
-------------------- Component Items ---------------------------
----------------------------------------------------------------

ESX.RegisterUsableItem('scope', function(source)
	TriggerClientEvent('msk_weaponammo:addComponent', source, 'scope')
end)

ESX.RegisterUsableItem('scope_holo', function(source)
	TriggerClientEvent('msk_weaponammo:addComponent', source, 'scope_holo')
end)

ESX.RegisterUsableItem('scope_small', function(source)
	TriggerClientEvent('msk_weaponammo:addComponent', source, 'scope_small')
end)

ESX.RegisterUsableItem('scope_medium', function(source)
	TriggerClientEvent('msk_weaponammo:addComponent', source, 'scope_medium')
end)

ESX.RegisterUsableItem('scope_large', function(source)
	TriggerClientEvent('msk_weaponammo:addComponent', source, 'scope_large')
end)

ESX.RegisterUsableItem('scope_advanced', function(source)
	TriggerClientEvent('msk_weaponammo:addComponent', source, 'scope_advanced')
end)

ESX.RegisterUsableItem('grip', function(source)
	TriggerClientEvent('msk_weaponammo:addComponent', source, 'grip')
end)

ESX.RegisterUsableItem('flashlight', function(source)
	TriggerClientEvent('msk_weaponammo:addComponent', source, 'flashlight')
end)

ESX.RegisterUsableItem('clip_default', function(source)
	TriggerClientEvent('msk_weaponammo:addComponent', source, 'clip_default')
end)

ESX.RegisterUsableItem('clip_extended', function(source)
	TriggerClientEvent('msk_weaponammo:addComponent', source, 'clip_extended')
end)

ESX.RegisterUsableItem('clip_drum', function(source)
	TriggerClientEvent('msk_weaponammo:addComponent', source, 'clip_drum')
end)

ESX.RegisterUsableItem('clip_box', function(source)
	TriggerClientEvent('msk_weaponammo:addComponent', source, 'clip_box')
end)

ESX.RegisterUsableItem('suppressor', function(source)
	TriggerClientEvent('msk_weaponammo:addComponent', source, 'suppressor')
end)

ESX.RegisterUsableItem('compensator', function(source)
	TriggerClientEvent('msk_weaponammo:addComponent', source, 'compensator')
end)

ESX.RegisterUsableItem('luxary_finish', function(source)
	TriggerClientEvent('msk_weaponammo:addComponent', source, 'luxary_finish')
end)

----------------------------------------------------------------
------------------------ Tint Items ----------------------------
----------------------------------------------------------------

ESX.RegisterUsableItem('tint_green', function(source)
	TriggerClientEvent('msk_weaponammo:addTint', source, 'tint_green')
end)

ESX.RegisterUsableItem('tint_gold', function(source)
	TriggerClientEvent('msk_weaponammo:addTint', source, 'tint_gold')
end)

ESX.RegisterUsableItem('tint_pink', function(source)
	TriggerClientEvent('msk_weaponammo:addTint', source, 'tint_pink')
end)

ESX.RegisterUsableItem('tint_army', function(source)
	TriggerClientEvent('msk_weaponammo:addTint', source, 'tint_army')
end)

ESX.RegisterUsableItem('tint_lspd', function(source)
	TriggerClientEvent('msk_weaponammo:addTint', source, 'tint_lspd')
end)

ESX.RegisterUsableItem('tint_orange', function(source)
	TriggerClientEvent('msk_weaponammo:addTint', source, 'tint_orange')
end)

ESX.RegisterUsableItem('tint_platinum', function(source)
	TriggerClientEvent('msk_weaponammo:addTint', source, 'tint_platinum')
end)

----------------------------------------------------------------
--------------------- Component Remover ------------------------
----------------------------------------------------------------

ESX.RegisterUsableItem('attachment_remover', function(source)
	TriggerClientEvent('msk_weaponammo:openAttachmentMenu', source)
end)