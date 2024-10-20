local servers = require("servers")

return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		require("mason").setup()

		require("mason-lspconfig").setup({
			automatic_installation = true,
			ensure_installed = servers.lsp_ensure,
		})

		require("mason-tool-installer").setup({
			ensure_installed = servers.tool_ensure,
		})
	end,
}
