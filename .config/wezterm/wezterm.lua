local wezterm = require("wezterm")
local act = wezterm.action

local config = wezterm.config_builder()

-- Leader/prefix key, like tmux’s Ctrl-b or other
config.leader = { key = "b", mods = "CTRL", timeout_milliseconds = 1000 }

local tabbar = require("tabbar")
-- tabbar.apply_to_config(config)

-- Font, theme, etc (tweak as needed)
config.font = wezterm.font({ family = "JetBrainsMono Nerd Font" })
config.font_size = 15
config.default_prog = { "/bin/bash", "-l" }

-- Use custom colors
config.colors = {
	-- Primary colors
	foreground = "#ebdbb2", -- light1
	background = "#000000", -- dark0_hard

	-- Normal ANSI colors
	ansi = {
		"#282828", -- black (dark0_hard)
		"#cc241d", -- red (neutral_red)
		"#98971a", -- green (neutral_green)
		"#d79921", -- yellow (neutral_yellow)
		"#458588", -- blue (neutral_blue)
		"#b16286", -- magenta / neutral_purple
		"#689d6a", -- cyan / neutral_aqua
		"#a89984", -- white / light4
	},

	-- Bright ANSI colors
	brights = {
		"#928374", -- bright black (light3)
		"#fb4934", -- bright red
		"#b8bb26", -- bright green
		"#fabd2f", -- bright yellow
		"#83a598", -- bright blue
		"#d3869b", -- bright magenta / purple
		"#8ec07c", -- bright cyan / aqua
		"#ebdbb2", -- bright white (light1)
	},

	-- Optional: cursor & selection colors
	cursor_bg = "#ebdbb2",
	cursor_fg = "#000000",
	cursor_border = "#ebdbb2",

	selection_fg = "#000000",
	selection_bg = "#ebdbb2",

	-- Optional: color of split lines between panes
	split = "#444444",
}

-- Optional: show tab bar, maybe at bottom
config.hide_tab_bar_if_only_one_tab = false
config.tab_bar_at_bottom = true

-- Keybindings to mimic tmux
config.keys = {
	-- Split panes
	{
		key = "-",
		mods = "LEADER",
		action = act.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "\\",
		mods = "LEADER",
		action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},

	-- Navigate between panes
	{
		key = "h",
		mods = "LEADER",
		action = act.ActivatePaneDirection("Left"),
	},
	{
		key = "j",
		mods = "LEADER",
		action = act.ActivatePaneDirection("Down"),
	},
	{
		key = "k",
		mods = "LEADER",
		action = act.ActivatePaneDirection("Up"),
	},
	{
		key = "l",
		mods = "LEADER",
		action = act.ActivatePaneDirection("Right"),
	},

	-- Resize panes
	{
		key = "H",
		mods = "LEADER|SHIFT",
		action = act.AdjustPaneSize({ "Left", 5 }),
	},
	{
		key = "J",
		mods = "LEADER|SHIFT",
		action = act.AdjustPaneSize({ "Down", 5 }),
	},
	{
		key = "K",
		mods = "LEADER|SHIFT",
		action = act.AdjustPaneSize({ "Up", 5 }),
	},
	{
		key = "L",
		mods = "LEADER|SHIFT",
		action = act.AdjustPaneSize({ "Right", 5 }),
	},

	-- Tabs (tmux windows)
	{
		key = "c",
		mods = "LEADER",
		action = act.SpawnTab("CurrentPaneDomain"),
	},
	{
		key = "n",
		mods = "LEADER",
		action = act.ActivateTabRelative(1),
	},
	{
		key = "p",
		mods = "LEADER",
		action = act.ActivateTabRelative(-1),
	},
	-- Jump to specific tab with number
	-- assuming you want 1-9
	{
		key = "1",
		mods = "LEADER",
		action = act.ActivateTab(0),
	},
	{
		key = "2",
		mods = "LEADER",
		action = act.ActivateTab(1),
	},

	{
		key = "3",
		mods = "LEADER",
		action = act.ActivateTab(1),
	},
	{
		key = "4",
		mods = "LEADER",
		action = act.ActivateTab(1),
	},

	{
		key = "5",
		mods = "LEADER",
		action = act.ActivateTab(1),
	},
	-- etc up to 9...

	-- Close pane/tab
	{
		key = "x",
		mods = "LEADER",
		action = act.CloseCurrentPane({ confirm = true }),
	},
	{
		key = "&",
		mods = "LEADER|SHIFT",
		action = act.CloseCurrentTab({ confirm = true }),
	},

	-- Toggle “zoom” on current pane
	{
		key = "m",
		mods = "LEADER",
		action = act.TogglePaneZoomState,
	},

	-- Copy mode (like tmux copy mode)
	{
		key = "[",
		mods = "LEADER",
		action = act.ActivateCopyMode,
	},
}

return config
