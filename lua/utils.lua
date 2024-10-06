-- @type string
local pluginsDir = 'plugins'

return {
  -- @param plugins string[]
  require_plugins = function(plugins)
    for _,plugin in iparis(plugins) do
      require(pluginsDir .. '.' .. plugin)
    end
  end,

  -- @param plugin_name string
  -- @param fcall function
  with_require = function(plugin_name, fcall)
    local ok, _ = pcall(require, plugin_name)
    if ok then fcall() end
  end
}
