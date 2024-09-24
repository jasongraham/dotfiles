return {
    {
        "folke/lazydev.nvim",
        version = "*",
        ft = "lua", -- only load on lua files
        cmd = "LazyDev",
        opts = {
            library = {
                -- See the configuration section for more details
                -- Load luvit types when the `vim.uv` word is found
                { path = "luvit-meta/library", words = { "vim%.uv" } },
                "lazy.nvim",
            },
        },
    },
    { "Bilal2453/luvit-meta", ft = "lua" }, -- optional `vim.uv` typings
}
