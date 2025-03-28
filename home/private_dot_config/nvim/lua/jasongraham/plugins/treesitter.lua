return {
    "nvim-treesitter/nvim-treesitter",
    version = "*",
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
    dependencies = {
        "windwp/nvim-ts-autotag",
        "mrhh69/nvim-kitty",
    },
    opts = {
        highlight = { enable = true },
        -- enable indentation
        indent = { enable = true },
        -- enable autotagging (w/ nvim-ts-autotag plugin)
        autotag = { enable = true },
        -- automatically install any that are missing
        auto_install = true,
        -- ensure these language parsers are installed
        ensure_installed = {
            "bash",
            "diff",
            "git_config",
            "git_rebase",
            "gitattributes",
            "gitcommit",
            "gitignore",
            "hyprlang",
            "lua",
            "markdown",
            "markdown_inline",
            "python",
            "rust",
            "toml",
            "vim",
            "vimdoc",
            "yaml",
        },
        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = "<C-space>",
                node_incremental = "<C-space>",
                scope_incremental = false,
                node_decremental = "<bs>",
            },
        },
    },
    config = function(_, opts)
        vim.filetype.add({
            extension = { rasi = "rasi" },
            pattern = {
                [".*/kitty/.*%.conf"] = "kitty",
                [".*/hypr/.*%.conf"] = "hyprlang",
            },
        })

        require("nvim-treesitter.configs").setup(opts)
    end,
}
