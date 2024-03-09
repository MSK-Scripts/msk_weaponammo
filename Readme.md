**!!! We do not support inventories that have weapons as items like ox_inventory !!!**

**!!! We do not support inventories that have weapons as items like ox_inventory !!!**

**!!! We do not support inventories that have weapons as items like ox_inventory !!!**

**!!! We do not support inventories that have weapons as items like ox_inventory !!!**

## Installation
If you are using ESX Menu and NOT one of the others, go to `fxmanifest.lua` and delete `'@NativeUI/NativeUI.lua',` and `'@ragemenu/ragemenu.lua'`

If you are using ESX 1.2 then do this:
```lua
Config.SavePlayer = {
	enable = true,
	version = '1.2' -- Set this to '1.2'
}
```

If you are using ESX Legacy then do this:
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
