return {
	"szw/vim-maximizer",
	event = { "BufReadPre", "BufNewFile" },
	keys = {
		{ "<leader>sm", "<cmd>MaximizerToggle<CR>", desc = "Maximize/minimize a split" },
	},
}
