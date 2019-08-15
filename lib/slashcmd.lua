--
-- Copyright (C) 2019 HE Yaowen <he.yaowen@hotmail.com>
--
-- This program is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with this program.  If not, see <http://www.gnu.org/licenses/>.
--

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
