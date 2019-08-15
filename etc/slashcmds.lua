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

Cauldron.slashCommands["help"] = {
    description = "Show help information",
    handler = function()
        local slashCommands = Cauldron.slashCommands

        for name, cmd in pairs(slashCommands) do
            print(string.format("|cffffff00%s|r: %s", name, cmd.description))
        end
    end
}

Cauldron.slashCommands["list"] = {
    description = "Lists all recipes",
    handler = function(pattern)
        local recipes = Cauldron.recipes

        if next(recipes) == nil then
            Cauldron_Info("No recipes found")
            return
        end

        for name, recipe in pairs(recipes) do
            if pattern and name:match(".*" .. pattern .. ".*") then
                local description = type(recipe.description) == "string" and
                        recipe.description or "[No description]"

                print(string.format("|cffffff00%s|r [%s]: %s", name,
                    recipe.__runtime.enabled and "|cff00ff00enabled|r" or "|cffff0000disabled|r", description))
            end
        end
    end
}

Cauldron.slashCommands["enable"] = {
    description = "Enable recipe by the given name",
    handler = function(name)
        Cauldron_EnableRecipe(Cauldron.recipes[name], true)
    end
}

Cauldron.slashCommands["disable"] = {
    description = "Disable recipe by the given name",
    handler = function(name)
        Cauldron_DisableRecipe(Cauldron.recipes[name], true)
    end
}
