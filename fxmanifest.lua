fx_version 'cerulean'
games { 'gta5' }

author 'Musiker15 - MSK Scripts'
name 'msk_weaponammo'
description 'Ammunition, Components & Tints'
version '8.8.0'

lua54 'yes'

shared_scripts {
	'@es_extended/imports.lua',
	'@msk_core/import.lua',
	'config.lua',
	'translation.lua'
}

client_scripts {
	'@NativeUI/NativeUI.lua', -- Remove this if you don't use NativeUI // Go to menu.lua and remove ALL of the NativeUI Code
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