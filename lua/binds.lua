local utils = require("utils")
local vbind = vim.keymap.set

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- save
utils.do_binds({
	{ "n", "<leader>sa", "<esc>:wall<cr>" },
	{ "i", "<leader>sa", "<esc>:wall<cr>" },
})

-- better window navigation
utils.do_binds({
	{ "n", "<C-l>", "<C-w>l" },
	{ "n", "<C-h>", "<C-w>h" },
	{ "n", "<C-j>", "<C-w>j" },
	{ "n", "<C-k>", "<C-w>k" },
})
