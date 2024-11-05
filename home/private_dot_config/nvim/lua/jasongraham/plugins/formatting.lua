return {
    "stevearc/conform.nvim",
    version = "*",
    event = { "BufReadPre", "BufNewFile" },
    keys = {
        {
            "<leader>mp",
            function()
                require("conform").format({
                    lsp_fallback = true,
                    async = false,
                    timeout_ms = 1000,
                })
            end,
            desc = "Format file or range (in visual mode)",
            mode = { "n", "v" },
        },
    },
    opts = {
        formatters_by_ft = {
            lua = { "stylua" },
            python = {
                "ruff_fix",
                "ruff_format",
                "ruff_organize_imports",
            },
            toml = { "taplo" },
            rust = { "rustfmt" },
        },
        format_on_save = {
            lsp_fallback = true,
            async = false,
            timeout_ms = 1000,
        },
    },
}
