return {
    "rachartier/tiny-code-action.nvim",
    dependencies = {
        { "nvim-lua/plenary.nvim" },
        { "nvim-telescope/telescope.nvim" },
    },
    event = "LspAttach",
    opts = {
        backend = "difftastic",
    },
    keys = {
        {
            "<leader>ca",
            function()
                require("tiny-code-action").code_action()
            end,
            desc = "Tiny Code Action",
        },
    },
}
