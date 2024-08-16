return {
    "nvim-neo-tree/neo-tree.nvim",
    version = "^3",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
        -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    cmd = "Neotree",
    keys = {
        { "<leader>e", desc = "+Neotree" },
        { "<leader>ee", "<cmd>Neotree toggle<cr>", desc = "Neotree toggle" },
        { "<leader>ef", "<cmd>Neotree reveal<cr>", desc = "Neotree reveal" },
        { "<leader>eg", "<cmd>Neotree git_status<cr>", desc = "Neotree git status" },
        { "<leader>eb", "<cmd>Neotree buffers<cr>", desc = "Neotree buffers" },
        { "<leader>es", "<cmd>Neotree document_symbols<cr>", desc = "Neotree doc symbols" },
        { "<leader>ex", "<cmd>Neotree close<cr>", desc = "Neotree close" },
    },
    opts = { follow_current_file = { enabled = true } },
}
