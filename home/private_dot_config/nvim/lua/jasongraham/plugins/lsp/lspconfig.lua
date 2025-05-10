return {
    "neovim/nvim-lspconfig",
    version = "^2",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
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
        {
            "mason-org/mason-lspconfig.nvim",
            version = "^2",
            opts = {
                -- use mason-tool-installer for this
                ensure_installed = {},
                automatic_installation = false,
            },
        },
        {
            "WhoIsSethDaniel/mason-tool-installer.nvim",
            build = ":MasonToolsUpdate",
            opts = {
                ensure_installed = {
                    "bashls",
                    "lua_ls",
                    "luacheck",
                    "pyright",
                    "ruff",
                    "rust_analyzer",
                    "rustfmt",
                    "shellcheck",
                    "stylua",
                    "taplo",
                    "tinymist",
                    "typos_lsp",
                    "yamlls",
                },
            },
        },

        "saghen/blink.cmp",
    },
    config = function()
        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("UserLspConfig", {}),
            callback = function(ev)
                local map = function(keys, func, desc, mode)
                    mode = mode or "n"
                    vim.keymap.set(mode, keys, func, { buffer = ev.buf, desc = "LSP: " .. desc })
                end

                vim.lsp.inlay_hint.enable()

                -- set keybinds
                map("gD", vim.lsp.buf.declaration, "Go to declaration")
                map("<leader>ca", vim.lsp.buf.code_action, "See available code actions")
                map("<leader>rn", vim.lsp.buf.rename, "Smart rename")
                map("K", vim.lsp.buf.hover, "Show hover documentation")
            end,
        })

        -- Change the Diagnostic symbols in the sign column (gutter)
        local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
        for type, icon in pairs(signs) do
            local hl = "DiagnosticSign" .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
        end

        -- used to enable autocompletion (assign to every lsp server config)
        vim.lsp.config("*", {
            capabilities = require("blink.cmp").get_lsp_capabilities(),
        })

        -- Individual customized settings for specific lsp servers
        vim.lsp.config("lua_ls", {
            settings = {
                Lua = {
                    -- make the language server recognize "vim" global
                    diagnostics = {
                        globals = { "vim" },
                    },
                    completion = {
                        callSnippet = "Replace",
                    },
                },
            },
        })
        vim.lsp.config("pyright", {
            filetypes = { "python" },
            settings = {
                pyright = {
                    -- Using Ruff's import organizer
                    disableOrganizeImports = true,
                },
                python = {
                    analysis = {
                        -- Ignore all files for analysis to exclusively use Ruff for linting
                        ignore = { "*" },
                        autoSearchPaths = true,
                        diagnosticMode = "openFilesOnly",
                        useLibraryCodeForTypes = true,
                    },
                },
            },
        })
    end,
}
