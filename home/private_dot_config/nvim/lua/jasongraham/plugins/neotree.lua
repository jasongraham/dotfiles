return {
	"nvim-neo-tree/neo-tree.nvim",
	version = "^3",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
		-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
	},
	cmd = "Neotree",
	keys = {
		{ "<leader>ee", "<cmd>Neotree toggle<cr>", "Neotree" },
		{ "<leader>ef", "<cmd>Neotree reveal<cr>", "Neotree" },
		{ "<leader>eg", "<cmd>Neotree git_status<cr>", "Neotree git status" },
		{ "<leader>eb", "<cmd>Neotree buffers<cr>", "Neotree buffers" },
		{ "<leader>es", "<cmd>Neotree document_symbols<cr>", "Neotree doc symbols" },
		{ "<leader>ex", "<cmd>Neotree close<cr>", "Neotree close" },
	},
	config = function()
		local neotree = require("neo-tree")
		neotree.setup({
			follow_current_file = { enabled = true },
		})
	end,
}
