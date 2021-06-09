-- Configurations
Cauldron.config = {}

--- Returns configuration value by key name.
-- @param key key name
-- @param default default value
-- @return configuration value
--
function Cauldron_GetConfig(key, default)
    if Cauldron.config[key] ~= nil then
        return Cauldron.config[key]
    else
        return default
    end
end
