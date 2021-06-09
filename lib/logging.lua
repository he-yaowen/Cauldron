local logLevels = {
    { name = "ERROR", color = "ffff0000" },
    { name = "WARNING", color = "ffff9900" },
    { name = "INFO", color = "ffffffff" },
    { name = "DEBUG", color = "ff00ffff" },
}

--- Prints messages in the default chat frame in game.
-- @param level logging level
-- @param text message text
-- @param ... additional arguments
--
local function PrintLogMessage(level, text, ...)
    if level > Cauldron_GetConfig("logLevel", 3) then
        return
    end

    print(string.format("|c%s[%s] %s|r", logLevels[level]["color"], logLevels[level]["name"], string.format(text, ...)))
end

--- Prints error messages.
-- @param text message text
-- @param ... additional arguments
--
function Cauldron_Error(text, ...)
    PrintLogMessage(1, text, ...)
end

--- Prints warning messages.
-- @param text message text
-- @param ... additional arguments
--
function Cauldron_Warning(text, ...)
    PrintLogMessage(2, text, ...)
end

--- Prints information messages.
-- @param text message text
-- @param ... additional arguments
--
function Cauldron_Info(text, ...)
    PrintLogMessage(3, text, ...)
end

--- Prints debugging messages.
-- @param text message text
-- @param ... additional arguments
--
function Cauldron_Debug(text, ...)
    PrintLogMessage(4, text, ...)
end
