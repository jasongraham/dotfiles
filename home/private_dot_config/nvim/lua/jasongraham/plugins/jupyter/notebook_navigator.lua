return {
    {
        "GCBallesteros/NotebookNavigator.nvim",
        keys = {
            {
                "]h",
                function()
                    require("notebook-navigator").move_cell("d")
                end,
                desc = "Move cell down (Jupyter)",
            },
            {
                "[h",
                function()
                    require("notebook-navigator").move_cell("u")
                end,
                desc = "Move cell up (Jupyter)",
            },
            { "<leader>jX", "<cmd>lua require('notebook-navigator').run_cell()<cr>", desc = "Run Cell (Jupyter)" },
            {
                "<leader>jx",
                "<cmd>lua require('notebook-navigator').run_and_move()<cr>",
                desc = "Run and Move (Jupyter)",
            },
        },
        dependencies = {
            -- "echasnovski/mini.comment",
            "numToStr/Comment.nvim",
            -- "hkupty/iron.nvim", -- repl provider
            -- "akinsho/toggleterm.nvim", -- alternative repl provider
            {
                "benlubas/molten-nvim", -- alternative repl provider
                version = "^1.0.0", -- use version <2.0.0 to avoid breaking changes
                build = ":UpdateRemotePlugins",
            },
            "anuvyklack/hydra.nvim",
        },
        opts = { activate_hydra_keys = "<leader>h" },
    },
}
