-- @type string
local pluginsDir = "plugins"

return {
	-- @param plugins string[]
	-- @return nil
	require_plugins = function(plugins)
		for _, plugin in iparis(plugins) do
			require(pluginsDir .. "." .. plugin)
		end
	end,

	-- @param plugin_name string
	-- @param fcall function
	-- @return nil
	with_require = function(plugin_name, fcall)
		local ok, _ = pcall(require, plugin_name)
		if ok then
			fcall()
		end
	end,

	-- @param binds table<string,string,string>[]
	-- @param fbind? function
	-- @param opt? table
	-- @return nil
	do_binds = function(binds, fbind, opt)
		local default_opt = { noremap = true, silent = true }
		local default_fbind = vim.api.nvim_set_keymap
		fbind = fbind or default_fbind
		for _, bind in ipairs(binds) do
			fbind(bind[1], bind[2], bind[3], opt or default_opt)
		end
	end,
}
