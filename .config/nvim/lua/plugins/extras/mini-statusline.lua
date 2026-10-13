return {
	"nvim-mini/mini.statusline",
	version = false,
	event = "VeryLazy",
	config = function()
		local statusline = require("mini.statusline")
		statusline.setup({
			use_icons = vim.g.have_nerd_font,
		})

		local function set_transparent()
			local groups = {
				"StatusLine",
				"StatusLineNC",
				"MiniStatuslineDevinfo",
				"MiniStatuslineFileinfo",
				"MiniStatuslineFilename",
				"MiniStatuslineInactive",
			}
			for _, hl in ipairs(groups) do
				vim.api.nvim_set_hl(0, hl, { bg = "NONE" })
			end
		end

		set_transparent()

		-- Reapply highlights if a colorscheme is loaded or changed later
		vim.api.nvim_create_autocmd("ColorScheme", {
			callback = set_transparent,
		})
	end,
}
