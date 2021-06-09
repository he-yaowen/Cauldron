Cauldron.slashCommands = {}

_G['SLASH_CAULDRON1'] = '/cauldron'

local slashCommands = Cauldron.slashCommands

--- Runs the given slash command.
-- @param str slash command and arguments
--
SlashCmdList['CAULDRON'] = function(str)
    local cmd, args = str:match("([^ ]+) *(.*)")

    if not cmd then
        cmd = 'help'
    end

    if not slashCommands[cmd] then
        Cauldron_Error('Unknown command "%s".', string.lower(cmd))
        return
    end

    slashCommands[cmd]['handler'](args)
end
