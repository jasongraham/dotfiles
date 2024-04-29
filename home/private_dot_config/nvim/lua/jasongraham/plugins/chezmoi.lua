return {
	"xvzc/chezmoi.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		require("chezmoi").setup({
			-- your configurations
		})
	end,
}
