return {
	"vyfor/cord.nvim",
	build = ":Cord update",
	opts = function()
		return {
			display = {
				theme = "default",
				flavor = "dark",
			},
			lazy = {
				-- change default idle icon to keyboard
				icon = require("cord.api.icon").get("keyboard"),
			},
		}
	end,
}
