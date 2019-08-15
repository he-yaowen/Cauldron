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

-- Loads recipes after player login
local frame = CreateFrame("Frame")
frame:RegisterEvent("PLAYER_LOGIN")
frame:SetScript("OnEvent", function()
    for name, recipe in pairs(Cauldron.recipes) do
        recipe.__runtime = {
            name = name,
            enabled = false,
        }

        Cauldron_RaiseEvent("RECIPE_LOADED", recipe)

        if recipe.enable then
            Cauldron_EnableRecipe(recipe)
        end
    end
end)
