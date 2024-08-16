return {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons", "folke/todo-comments.nvim" },
    version = "^3",
    cmd = "Trouble",
    opts = { use_diagnostic_signs = true },
    keys = {
        { "<leader>x", desc = "+Trouble" },
        { "<leader>xx", "<cmd>Trouble diagnostics toggle<CR>", desc = "Diagnostics (Trouble)" },
        { "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<CR>", desc = "Buffer Diagnostics (Trouble)" },
        { "<leader>xL", "<cmd>Trouble loclist toggle<CR>", desc = "Location List (Trouble)" },
        { "<leader>xQ", "<cmd>Trouble qflist toggle<CR>", desc = "Quickfix List (Trouble)" },
        {
            "<leader>xl",
            "<cmd>Trouble lsp toggle focus=false win.position=right<CR>",
            desc = "LSP definitions / refs / ...",
        },
        { "<leader>xt", "<cmd>Trouble todo toggle<CR>", desc = "Open todos in trouble" },
    },
}
