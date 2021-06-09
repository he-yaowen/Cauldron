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
