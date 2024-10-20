local utils = require("utils")

return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		require("telescope").setup()
		local builtin = require("telescope.builtin")
		utils.do_binds({
			{ "n", "<leader>ff", builtin.find_files },
			{ "n", "<leader>fg", builtin.live_grep },
			{ "n", "<leader>fb", builtin.buffers },
			{ "n", "<leader>fn", builtin.help_tags },
		}, vim.keymap.set)
	end,
}
