# MSK WeaponAmmo
Usable Clips, Components & Tints

* Forum: https://forum.cfx.re/t/esx-msk-weaponammo-clips-components-tints/4793783
* Discord Support: https://discord.gg/5hHSBRHvJE

**!!! We do not support inventories that have weapons as items !!!**

## Installation
If you are using ESX Menu and NOT one of the others, go to `fxmanifest.lua` and delete `'@NativeUI/NativeUI.lua',` and `'@ragemenu/ragemenu.lua'`

If you are using ESX Legacy and NOT ESX 1.2 then do this:
```lua
Config.SavePlayer = {
	enable = true,
	version = 'legacy' -- Set this to 'legacy'
}
```

Then go to `es_extended/server/common.lua` and add 

```lua
exports('getCoreObject', function() return Core end)
```

below this: 

```lua
exports('getSharedObject', function() 
    return ESX 
end)
```

It should look like this: https://prnt.sc/-El6-xwHQgOp

**Please restart your Server after the Edits!**

## Requirements
* [ESX](https://github.com/esx-framework/esx_core)
* NativeUI *(optional)*
* [RageMenu](https://github.com/EnteNico/ragemenu) *(optional)*