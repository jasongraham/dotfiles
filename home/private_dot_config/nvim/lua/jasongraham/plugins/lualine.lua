return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons", "arkav/lualine-lsp-progress" },
	config = function()
		local lualine = require("lualine")
		local lazy_status = require("lazy.status") -- to configure lazy pending updates count
		--
		lualine.setup({
			options = {
				theme = "gruvbox-material",
				globalstatus = true,
			},
			sections = {
				lualine_c = {
					{ "filename" },
					{ "lsp_progress" },
				},
				lualine_x = {
					{
						lazy_status.updates,
						cond = lazy_status.has_updates,
						color = { fg = "#ff9e64" },
					},
					{ "encoding" },
					{ "fileformat" },
					{ "filetype" },
				},
			},
			tabline = {
				lualine_a = { "buffers" },
			},
			extensions = { "lazy", "mason", "trouble" },
		})
	end,
}
