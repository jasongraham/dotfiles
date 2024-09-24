return {
    "mrjones2014/legendary.nvim",
    -- sqlite is only needed if you want to use frecency sorting
    dependencies = { "kkharji/sqlite.lua" },
    version = "*",
    -- since legendary.nvim handles all your keymaps/commands,
    -- its recommended to load legendary.nvim before other plugins
    priority = 10000,
    lazy = false,
    opts = {
        extensions = {
            lazy_nvim = { auto_register = true },
            which_key = { auto_register = true },
        },
    },
}
