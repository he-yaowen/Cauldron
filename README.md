# Cauldron

**Cauldron** is an add-on for game World of Warcraft. It provides essential
mechanisms to let players customize various things based on user-defined Lua
tables (so-called recipes).

*NOTE: Cauldron is just the platform for mechanisms, you need to load this
add-on with other extensions for concrate features.*

## What's recipe?

Technically speaking, recipes are Lua tables defined within global variable
`Cauldron.recipes`. There are only two optional attributes are pre-defined
for recipes, which means even an empty table is workable for Cauldron too.

Example:

```lua
Cauldron.recipes["recipe-name"] = {
    -- Enable this recipe automatically (optional, false by default)
    enable = false,

    -- Description of this recipe (optional)
    description = "text...",
}
```

## How recipe works?

Cauldron only supplies the basic mechanisms for recipe handling. Concrete
features are implemented with extensions.

You can write an extension, or integrate Cauldron with various different
extensions. The most important thing for you is being creative to make
Cauldron unique for yourself!

## How to create a recipe

Variable `Cauldron.recipes` is global, you can define your recipes in
any Lua script files as long as World of Warcraft can loads them. However
there are some hints:

1. It's not recommended to put recipes in `Cauldron` directory, it is
   the essential add-on for all extensions.

2. You can put your recipes into the corresponding extensions' directories.
   For example, you installed an extension named `Cauldron_Bindings` which
   adds a new attribute "bindings" for your recipes. Therefore you can put all
   your "bindings" recipes under directory `Cauldron_Bindings`.

3. If you are familiar with add-on loading mechanisms, you can create a new
   add-on, put all recipe files under this add-on directory and load your
   recipes by `.toc` file.

## Slash commands

All slash commands begin with `/cauldron`.

### `help`

Show help information.

### `list [KEYWORD]`

Lists recipes and enable/disable status. If KEYWORD is specified, just lists
recipes with KEYWORD in their names, or else all recipes will be listed.

### `enable <RECIPE_NAME>`

Enables the specified recipe, this command enable the recipe forcedly,
which means event `RECIPE_QUERY_ENABLE` won't be raised.

### `disable <RECIPE_NAME>`

Disables the specified recipe, this command disable the recipe forcedly,
which means event `RECIPE_QUERY_DISABLE` won't be raised.

## License

Copyright (C) 2019 HE Yaowen <he.yaowen@hotmail.com>

The GNU General Public License (GPL) version 3, see [COPYING](./COPYING).
