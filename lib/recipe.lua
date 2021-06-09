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
