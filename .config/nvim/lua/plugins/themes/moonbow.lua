return {
	"arturgoms/moonbow.nvim",
	name = "moonbow",
	config = function()
		require("moonbow").setup({
			transparent = true,
			-- theme = "wave",
		})

		vim.cmd("colorscheme moonbow")
	end,
}
