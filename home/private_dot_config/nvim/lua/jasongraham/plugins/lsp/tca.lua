return {
    "rachartier/tiny-code-action.nvim",
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
