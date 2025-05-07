return {
    {
        "williamboman/mason-lspconfig.nvim",
        version = "^1",
        event = { "BufReadPre", "BufNewFile" },
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
        "williamboman/mason.nvim",
        build = ":MasonUpdate",
        cmd = "Mason",
        version = "^1",
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
