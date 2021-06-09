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

        if Cauldron_RaiseEvent("RECIPE_QUERY_ENABLE", recipe) then
            Cauldron_EnableRecipe(recipe)
        end
    end
end)
