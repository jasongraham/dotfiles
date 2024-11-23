return {
    {
        "folke/zen-mode.nvim",
        cmd = "ZenMode",
        dependencies = { "folke/twilight.nvim" },
        opts = {},
    },
    {
        "folke/twilight.nvim",
        cmd = {
            "Twilight",
            "TwilightEnable",
            "TwilightDisable",
        },
        opts = {},
    },
}
