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

-- System pre-defined handlers
Cauldron_RegisterEvent("RECIPE_LOADED", function()
    return
end)

Cauldron_RegisterEvent("RECIPE_QUERY_ENABLE", function(_, recipe)
    return recipe.enable
end)

Cauldron_RegisterEvent("RECIPE_ENABLE", function()
    return
end)

Cauldron_RegisterEvent("RECIPE_QUERY_DISABLE", function()
    return true
end)

Cauldron_RegisterEvent("RECIPE_DISABLE", function()
    return
end)
