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
