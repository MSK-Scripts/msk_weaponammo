RegisterNetEvent('msk_weaponammo:openAttachmentMenu')
AddEventHandler('msk_weaponammo:openAttachmentMenu', function()
    if Config.Menu:match('ESX') then
        OpenAttachmentMenuESX() -- ESX Menu
    elseif Config.Menu:match('NativeUI') then
        OpenAttachmentMenuNativeUI() -- NativeUI
    elseif Config.Menu:match('RageMenu') then
        OpenAttachmentMenuRageMenu() -- RageMenu
    end
end)

OpenAttachmentMenuESX = function()
    local playerPed = PlayerPedId()
	local hash = GetSelectedPedWeapon(playerPed)
    local weapon = ESX.GetWeaponFromHash(hash)

    if not weapon then Config.Notification(nil, Translation[Config.Locale]['no_weapon']) return end

    local elements = {
		{label = Translation[Config.Locale]['weapon_components'], value = 'components'},
	}
    ESX.UI.Menu.CloseAll()
    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'components', {
		title    = Translation[Config.Locale]['weapon_components'],
		align    = 'top-left',
		elements = elements
	}, function(data, menu)
		if data.current.value == 'components' then
            local elements = {
                {label = Translation[Config.Locale]['scope'], value = 'scope'},
                {label = Translation[Config.Locale]['grip'], value = 'grip'},
                {label = Translation[Config.Locale]['flashlight'], value = 'flashlight'},
                {label = Translation[Config.Locale]['clip_extended'], value = 'clip_extended'},
                {label = Translation[Config.Locale]['suppressor'], value = 'suppressor'},
                {label = Translation[Config.Locale]['luxary_finish'], value = 'luxary_finish'},
                {label = Translation[Config.Locale]['tint'], value = 'tint'},
            }
            ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'weapon_attachments', {
                title    = Translation[Config.Locale]['weapon_components'],
                align    = 'top-left',
                elements = elements
            }, function(data2, menu2)
                local action = data2.current.value

                if action == 'tint' then
                    TriggerServerEvent('msk_weaponammo:removeWeaponTint', weapon.name)
                else
                    TriggerServerEvent('msk_weaponammo:removeWeaponComponent', weapon.name, action)
                end
            end, function(data2, menu2)
                menu2.close()
            end)
		end
	end, function(data, menu)
		menu.close()
	end)
end

---- NativeUI ----

if Config.Menu:match('NativeUI') then
    local _menuPool = nil

    CreateThread(function()
        while true do
            local sleep = 1
            
            if _menuPool then
                if _menuPool:IsAnyMenuOpen() then
                    _menuPool:ProcessMenus()
                elseif not _menuPool:IsAnyMenuOpen() then 
                    _menuPool:Remove()
                end
            end
            
            Wait(sleep)
        end
    end)

    local Items = {
        {name = Translation[Config.Locale]['scope'], desc = Translation[Config.Locale]['remove_scope'], comtype = 'scope', type = 'component'},
        {name = Translation[Config.Locale]['grip'], desc = Translation[Config.Locale]['remove_grip'], comtype = 'grip', type = 'component'},
        {name = Translation[Config.Locale]['flashlight'], desc = Translation[Config.Locale]['remove_flashlight'], comtype = 'flashlight', type = 'component'},
        {name = Translation[Config.Locale]['clip_extended'], desc = Translation[Config.Locale]['remove_clip_extended'], comtype = 'clip_extended', type = 'component'},
        {name = Translation[Config.Locale]['suppressor'], desc = Translation[Config.Locale]['remove_suppressor'], comtype = 'suppressor', type = 'component'},
        {name = Translation[Config.Locale]['luxary_finish'], desc = Translation[Config.Locale]['remove_luxary_finish'], comtype = 'luxary_finish', type = 'component'},
        {name = Translation[Config.Locale]['tint'], desc = Translation[Config.Locale]['remove_tint'], type = 'tint'},
    }

    OpenAttachmentMenuNativeUI = function()
        if _menuPool then 
            _menuPool:Remove()
            _menuPool = nil
        end
        _menuPool = NativeUI.CreatePool()

        local playerPed = PlayerPedId()
        local hash = GetSelectedPedWeapon(playerPed)
        local weapon = ESX.GetWeaponFromHash(hash)

        if not weapon then Config.Notification(nil, Translation[Config.Locale]['no_weapon']) return end

        local mainMenu = NativeUI.CreateMenu(Translation[Config.Locale]['weapon_components'], '~b~'.. Translation[Config.Locale]['remove_components'])
        _menuPool:Add(mainMenu)

        local Components = _menuPool:AddSubMenu(mainMenu, Translation[Config.Locale]['components'])

        for k,v in pairs(Items) do
            local ComponentList = NativeUI.CreateItem(v.name, '~b~'.. v.desc)
            Components:AddItem(ComponentList)
            
            ComponentList.Activated = function(sender, index)
                if v.type == 'component' then
                    TriggerServerEvent('msk_weaponammo:removeWeaponComponent', weapon.name, v.comtype)
                elseif v.type == 'tint' then
                    TriggerServerEvent('msk_weaponammo:removeWeaponTint', weapon.name)
                end
            end
        end

        mainMenu:Visible(true)
        _menuPool:RefreshIndex()
        _menuPool:MouseControlsEnabled(false)
        _menuPool:MouseEdgeEnabled(false)
        _menuPool:ControlDisablingEnabled(false)
    end
end

-- RageMenu

if Config.Menu:match('RageMenu') then
    local mainMenu

    OpenAttachmentMenuRageMenu = function()
        local playerPed = PlayerPedId()
        local hash = GetSelectedPedWeapon(playerPed)
        local weapon = ESX.GetWeaponFromHash(hash)

        if not weapon then Config.Notification(nil, Translation[Config.Locale]['no_weapon']) return end

        local Items = {
            {name = Translation[Config.Locale]['scope'], desc = Translation[Config.Locale]['remove_scope'], comtype = 'scope', type = 'component'},
            {name = Translation[Config.Locale]['grip'], desc = Translation[Config.Locale]['remove_grip'], comtype = 'grip', type = 'component'},
            {name = Translation[Config.Locale]['flashlight'], desc = Translation[Config.Locale]['remove_flashlight'], comtype = 'flashlight', type = 'component'},
            {name = Translation[Config.Locale]['clip_extended'], desc = Translation[Config.Locale]['remove_clip_extended'], comtype = 'clip_extended', type = 'component'},
            {name = Translation[Config.Locale]['suppressor'], desc = Translation[Config.Locale]['remove_suppressor'], comtype = 'suppressor', type = 'component'},
            {name = Translation[Config.Locale]['luxary_finish'], desc = Translation[Config.Locale]['remove_luxary_finish'], comtype = 'luxary_finish', type = 'component'},
            {name = Translation[Config.Locale]['tint'], desc = Translation[Config.Locale]['remove_tint'], type = 'tint'},
        }

        mainMenu = RageMenu:CreateMenu(Translation[Config.Locale]['weapon_components'], '~b~'.. Translation[Config.Locale]['remove_components'])
        local components = RageMenu:CreateMenu(Translation[Config.Locale]['components'], Translation[Config.Locale]['components'])
        mainMenu:AddSubmenu(components, Translation[Config.Locale]['components'], '')

        for k, v in pairs(Items) do
            components:AddButton(v.name, '~b~' .. v.desc):On('click', function(item)
                if v.type == 'component' then
                    TriggerServerEvent('msk_weaponammo:removeWeaponComponent', weapon.name, v.comtype)
                elseif v.type == 'tint' then
                    TriggerServerEvent('msk_weaponammo:removeWeaponTint', weapon.name)
                end
            end)
        end

        RageMenu:OpenMenu(mainMenu)
    end

    AddEventHandler('onResourceStop', function(resource)
        if GetCurrentResourceName() == resource then
            RageMenu:Close(mainMenu)
        end
    end)
end