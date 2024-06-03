return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	version = "*",
	config = function()
		-- import mason
		local mason = require("mason")

		local mason_lspconfig = require("mason-lspconfig")
		local mason_tool_installer = require("mason-tool-installer")

		-- enable mason and configure icons
		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		mason_lspconfig.setup({
			-- list of servers for mason to install
			ensure_installed = {
				"bashls",
				"cssls",
				"lua_ls",
				"ruff",
				"rust_analyzer",
				"taplo",
				"typos_lsp",
				"yamlls",
			},
		})

		mason_tool_installer.setup({
			ensure_installed = {
				"prettier", -- fmt
				"ruff", -- python fmt/lint
				"rustfmt", -- rust
				"stylua", -- lua fmt
				"luacheck", -- lua linter
				"shellcheck", --bash/sh linter
			},
		})
	end,
}
