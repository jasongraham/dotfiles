return {
    "goolord/alpha-nvim",
    event = "VimEnter",
    config = function()
        local alpha = require("alpha")
        local dashboard = require("alpha.themes.dashboard")

        -- Set header
        dashboard.section.header.val = {
            "                                                     ",
            "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
            "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
            "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
            "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
            "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
            "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
            "                                                     ",
        }

        -- Set menu
        dashboard.section.buttons.val = {
            dashboard.button("e", " > New File", ":ene<CR>"),
            dashboard.button("<leader> ee", " > Toggle file explorer", ":Neotree show<CR>"),
            dashboard.button("<leader> ff", "󰱼 > Find File", ":Telescope find_files<CR>"),
            dashboard.button("<leader> fr", "󰁯 > Find Recent Files", ":Telescope oldfiles<CR>"),
            dashboard.button("<leader> fs", " > Find String", ":Telescope live_grep<CR>"),
            dashboard.button("s", " > Settings", ":e $MYVIMRC | :cd %:p:h | :Neotree<CR>"),
            dashboard.button("q", " > Quit NVIM", ":qa<CR>"),
        }

        -- Send config to alpha
        alpha.setup(dashboard.opts)

        -- Disable folding on alpha buffer
        vim.cmd.autocmd("Filetype", "alpha", "setlocal", "nofoldenable")
    end,
}
