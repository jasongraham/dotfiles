return {
	{
		"sainnhe/gruvbox-material",
		priority = 1000, -- make sure to load this before all the other start plugins
		gruvbox_material_foreground = "material",
		gruvbox_material_background = "hard",
		config = function()
			-- load the colorscheme here
			vim.cmd.colorscheme("gruvbox-material")
		end,
	},
}
