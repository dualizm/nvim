local utils = require("utils")
local servers = require("servers")

return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "folke/neodev.nvim", opts = {} },
	},
	config = function()
		local nvim_lsp = require("lspconfig")
		local mason_lspconfig = require("mason-lspconfig")

		local protocol = require("vim.lsp.protocol")

		local on_attach = function(client, bufnr)
			-- format on save
			if client.server_capabilities.documentFormattingProvider then
				vim.api.nvim_create_autocmd("BufWritePre", {
					group = vim.api.nvim_create_augroup("Format", { clear = true }),
					buffer = bufnr,
					callback = function()
						vim.lsp.buf.format()
					end,
				})
			end
		end

		utils.do_binds({
			{ "n", "<leader>e", vim.diagnostic.open_float },
			{ "n", "[d", vim.diagnostic.goto_prev },
			{ "n", "]d", vim.diagnostic.goto_next },
			{ "n", "<leader>q", vim.diagnostic.setloclist },
		}, vim.keymap.set)

		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		local handlers = {
			function(server)
				nvim_lsp[server].setup({
					capabilities = capabilities,
				})
			end,
		}

		for _, server in pairs(servers.lsp_ensure) do
			handlers[server] = function()
				nvim_lsp[server].setup({
					on_attach = on_attach,
					capabilities = capabilities,
				})
			end
		end

		mason_lspconfig.setup_handlers(handlers)
	end,
}
