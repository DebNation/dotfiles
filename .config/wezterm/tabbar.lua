local wezterm = require("wezterm")
local M = {}

function M.apply_to_config(config)
	-- Hide tab bar if only one tab
	config.hide_tab_bar_if_only_one_tab = true
end

return M
