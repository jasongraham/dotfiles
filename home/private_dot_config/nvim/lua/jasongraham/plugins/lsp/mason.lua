return {
    {
        "mason-org/mason-lspconfig.nvim",
        version = "^2",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "mason-org/mason.nvim",
            "neovim/nvim-lspconfig",
        },
        opts = {
            -- list of servers for mason to install
            ensure_installed = {
                "bashls",
                "lua_ls",
                "pyright",
                "ruff",
                "rust_analyzer",
                "taplo",
                "typos_lsp",
                "tinymist",
                "yamlls",
            },
        },
    },
    {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        event = { "BufReadPre", "BufNewFile" },
        opts = {
            ensure_installed = {
                "ruff", -- python fmt/lint
                "rustfmt", -- rust
                "stylua", -- lua fmt
                "luacheck", -- lua linter
                "shellcheck", --bash/sh linter
            },
        },
    },
    {
        "mason-org/mason.nvim",
        build = ":MasonUpdate",
        cmd = "Mason",
        version = "^2",
        opts = {
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                },
            },
        },
    },
}
