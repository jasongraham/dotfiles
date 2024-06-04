return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons", "folke/todo-comments.nvim" },
	event = { "BufReadPre", "BufNewFile" },
	version = "^3",
	cmd = "Trouble",
	keys = {
		{ "<leader>xx", "<cmd>Trouble diagnostics toggle filter.buf=0<CR>", desc = "Buffer Diagnostics (Trouble)" },
		{ "<leader>xX", "<cmd>Trouble diagnostics toggle<CR>", desc = "Project Diagnostics (Trouble)" },
		{ "<leader>xq", "<cmd>Trouble qflist toggle<CR>", desc = "Open trouble quickfix list" },
		{
			"<leader>xl",
			"<cmd>Trouble lsp toggle focus=false win.position=right<CR>",
			desc = "LSP definitions / refs / ...",
		},
		{ "<leader>xt", "<cmd>Trouble todo toggle<CR>", desc = "Open todos in trouble" },
	},

	-- Required for actually being ready and available
	config = true,
}
