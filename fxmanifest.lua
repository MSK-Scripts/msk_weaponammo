fx_version 'adamant'
games { 'gta5' }

author 'Musiker15 - MSK Scripts'
name 'msk_weaponammo'
description 'Ammunition, Components & Tints'
version '8.7.3'

lua54 'yes'

shared_scripts {
	'@msk_core/import.lua',
	'config.lua',
	'translation.lua'
}

client_scripts {
	'@NativeUI/NativeUI.lua', -- Remove this if you don't use NativeUI // Go to menu.lua and remove ALL of the NativeUI Code
	'@ragemenu/ragemenu.lua', -- Remove this if you don't use RageMenu // Go to menu.lua and remove ALL of the RageMenu Code
	'client/*.lua'
}

server_scripts {
	'@oxmysql/lib/MySQL.lua',
	'server/server.lua',
	'server/server_*.lua'
}

dependencies {
	'es_extended',
	'oxmysql',
	'msk_core'
}