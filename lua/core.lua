--[[
-- @filename core.lua
-- @author: dualizm
-- @brief: Enabling useful options
--]]

local options = {
	-- @category tabs and spaces

	---[[ automatic addition of margins
	smarttab = true,
	--]]

	---[[ real tab character C-V<Tab>
	expandtab = true,
	--]]

	---[[ number of visual spaces per TAB
	tabstop = 2,
	--]]

	---[[ number of spaces in tab when editing
	softtabstop = 2,
	--]]

	---[[ insert n spaces on a tab
	shiftwidth = 2,
	--]]

	---[[ indent equal to the indent of the prev line
	autoindent = true,
	--]]

	---[[ smart alignment
	smartindent = true,
	--]]

	-- @category lines

	---[[ show relative number
	relativenumber = true,
	--]]

	---[[ show absolute number
	number = true,
	--]]

	---[[ lines are displayed without visual wrap
	wrap = false,
	--]]

	---[[ indicate folds and nesting levels
	foldcolumn = "2",
	--]]

	---[[ show (partical) command in the last line of the screen
	showcmd = true,
	--]]

	--[[ show cursor current line
  cursorline = true,
--]]

	--[[ adding text beyond that limit
  textwidth = 80,
--]]

	-- @category search

	---[[ search as characters are entered
	incsearch = true,
	--]]

	---[[ ignore case in search patterns
	ignorecase = true,
	--]]

	---[[ override 'ignorecase'
	smartcase = true,
	--]]

	---[[ do not highlight matches
	---   if the search pattern contains upper case characters
	hlsearch = false,
	--]]

	-- @category encoding

	---[[ character encoding in file
	fileencoding = "utf8",
	--]]

	---[[ character encoding
	encoding = "utf8",
	--]]

	---[[ set the font for the gui
	guifont = "Jetbrains Mono:h12",
	--]]

	-- @category colors

	---[[ syntax highlighting
	syntax = "on",
	--]]

	---[[ enable 24-bit RGB in TUI
	termguicolors = true,
	--]]

	---[[ check spell
	spell = true,
	--]]
}

-- set all options
for option, value in pairs(options) do
	vim.opt[option] = value
end

-- set autocomands
local acmd = vim.api.nvim_create_autocmd

---[[
acmd("TextYankPost", {
	desc = "Hightlight selection on yank",
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({ higroup = "IncSearch", timeout = 500 })
	end,
})
--]]

--[[
acmd('VimEnter', {
	desc = 'Greets the user',
	pattern = '*',
	command = 'echo "Hello, " . $USER . "!"'
})
--]]

local filesConfig = {
	---[[
	{
		pattern = "make",
		command = "set noexpandtab nocin",
	},
	--]]

	---[[
	{
		pattern = "html",
		command = "set noexpandtab nocin textwidth=360",
	},
	--]]

	---[[
	{
		pattern = "css",
		command = "set noexpandtab nocin",
	},
	--]]

	---[[
	{
		pattern = "python",
		command = "set nocin",
	},
	--]]
}

for _, config in ipairs(filesConfig) do
	acmd("filetype", config)
end
