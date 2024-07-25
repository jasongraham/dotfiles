return {
    {
        "sainnhe/gruvbox-material",
        lazy = false,
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
            -- load the colorscheme here
            vim.g.gruvbox_material_foreground = "material"
            vim.g.gruvbox_material_background = "hard"
            vim.g.gruvbox_material_enable_bold = 1
            vim.g.gruvbox_material_enable_italic = 1
            vim.cmd.colorscheme("gruvbox-material")
        end,
    },
}
