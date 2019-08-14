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

-- Recipe table
Cauldron.recipes = {}

--- Enables a recipe.
-- @param recipe recipe to enable
-- @param force whether force
--
function Cauldron_EnableRecipe(recipe, force)
    if recipe.__runtime.enabled then return end

    if force or Cauldron_RaiseEvent("RECIPE_QUERY_ENABLE", recipe) ~= false then
        Cauldron_RaiseEvent("RECIPE_ENABLE", recipe)
        recipe.__runtime.enabled = true

        Cauldron_Info("Recipe '%s' |cff00ff00enabled|r.", recipe.__runtime.name)
    end
end

--- Disables a recipe.
-- @param recipe recipe to disable
-- @param force whether force
--
function Cauldron_DisableRecipe(recipe, force)
    if not recipe.__runtime.enabled then return end

    if force or Cauldron_RaiseEvent("RECIPE_QUERY_DISABLE", recipe) ~= false then
        Cauldron_RaiseEvent("RECIPE_DISABLE", recipe)
        recipe.__runtime.enabled = false

        Cauldron_Info("Recipe '%s' |cffff0000disabled|r.", recipe.__runtime.name)
    end
end
