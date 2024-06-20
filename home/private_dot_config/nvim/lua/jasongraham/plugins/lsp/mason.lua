return {
    {
        "williamboman/mason-lspconfig.nvim",
        event = { "BufReadPre", "BufNewFile" },
        opts = {
            -- list of servers for mason to install
            ensure_installed = {
                "bashls",
                "lua_ls",
                "ruff",
                "rust_analyzer",
                "taplo",
                "typos_lsp",
                "yamlls",
            },
        },
    },
    {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        event = { "BufReadPre", "BufNewFile" },
        opts = {
            ensure_installed = {
                "prettier", -- fmt
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
        version = "*",
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
