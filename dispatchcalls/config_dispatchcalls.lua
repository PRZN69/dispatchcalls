--[[
    Sonoran Plugins

    Plugin Configuration

    Put all needed configuration in this file.
]]
config = {
    enabled = true,
    pluginName = "dispatchcalls", -- name your plugin here
    pluginAuthor = "PRZN", -- author
    requiresPlugins = {"locations"}, -- required plugins for this plugin to work, separated by commas
    configVersion = "1.0.0",
}

if config.enabled then
    Config.RegisterPluginConfig(config.pluginName, config)
end
