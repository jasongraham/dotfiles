return {
    "Vonr/align.nvim",
    branch = "v2",
    keys = {
        { mode = "x", "<leader>a", desc = "+Align" },
        {
            mode = "x",
            "<leader>aa",
            function()
                require("align").align_to_char({
                    length = 1,
                })
            end,
            desc = "Align to character",
        },
        {
            mode = "x",
            "<leader>aw",
            function()
                require("align").align_to_string({
                    preview = true,
                    regex = false,
                })
            end,
            desc = "Align to literal string with previews",
        },
        {
            mode = "x",
            "<leader>ar",
            function()
                require("align").align_to_string({
                    preview = true,
                    regex = true,
                })
            end,
            desc = "Align to vim regex with previews",
        },
    },
}
