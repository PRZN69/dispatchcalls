--[[
    Sonaran CAD Plugins

    Plugin Name: dispatchcalls
    Creator: PRZN
    Description: Implements custom dispatch calls
]]

CreateThread(function() Config.LoadPlugin("dispatchcalls", function(pluginConfig)

if pluginConfig.enabled then

    registerApiType("NEW_DISPATCH", "emergency")

    -- Client TraficStop request
    RegisterServerEvent('SonoranCAD::dispatchcalls:SendTrafficApi')
    AddEventHandler('SonoranCAD::dispatchcalls:SendTrafficApi', function(origin, status, priority, address, postal, title, code, description, units, notes, source)
        -- send an event to be consumed by other resources
        TriggerEvent("SonoranCAD::dispatchcalls:cadIncomingTraffic", origin, status, priority, address, postal, title, code, description, units, notes, source)
        if Config.apiSendEnabled then
            local data = {
                ['serverId'] = Config.serverId, 
                ['origin'] = origin, 
                ['status'] = status, 
                ['priority'] = priority, 
                ['block'] = "", -- not used, but required
                ['postal'] = postal, --TODO
                ['address'] = address, 
                ['title'] = title, 
                ['code'] = code, 
                ['description'] = description, 
                ['units'] = units,
                ['notes'] = notes -- required
            }
            debugLog("sending Dispatch!")
            performApiRequest({data}, 'NEW_DISPATCH', function() end)
        else
            debugPrint("[SonoranCAD] API sending is disabled. Traffic Stop ignored.")
        end
    end)

end

end) end)
