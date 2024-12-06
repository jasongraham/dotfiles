return {
    "goolord/alpha-nvim",
    event = "VimEnter",
    opts = function()
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
        -- stylua: ignore
        dashboard.section.buttons.val = {
            dashboard.button("e",           " > New File",             ":ene<CR>"),
            dashboard.button("<leader> ff", "󰱼 > Find File",            ":Telescope find_files<CR>"),
            dashboard.button("<leader> fr", "󰁯 > Find Recent Files",    ":Telescope oldfiles<CR>"),
            dashboard.button("<leader> fs", " > Find String",          ":Telescope live_grep<CR>"),
            dashboard.button("s",           " > Settings",             ":e $MYVIMRC | :cd %:p:h | :Neotree<CR>"),
            dashboard.button("q",           " > Quit NVIM",            ":qa<CR>"),
        }
        return dashboard
    end,
    config = function(_, dashboard)
        -- close Lazy and re-open when the dashboard is ready
        if vim.o.filetype == "lazy" then
            vim.cmd.close()
            vim.api.nvim_create_autocmd("User", {
                once = true,
                pattern = "AlphaReady",
                callback = function()
                    require("lazy").show()
                end,
            })
        end

        -- Send config to alpha
        require("alpha").setup(dashboard.opts)

        -- Disable folding on alpha buffer
        vim.cmd.autocmd("Filetype", "alpha", "setlocal", "nofoldenable")

        -- Show lazy.nvim startup time
        vim.api.nvim_create_autocmd("User", {
            once = true,
            pattern = "LazyVimStarted",
            callback = function()
                local stats = require("lazy").stats()
                local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
                dashboard.section.footer.val = "⚡ Neovim loaded "
                    .. stats.loaded
                    .. "/"
                    .. stats.count
                    .. " plugins in "
                    .. ms
                    .. "ms"
                pcall(vim.cmd.AlphaRedraw)
            end,
        })
    end,
}
