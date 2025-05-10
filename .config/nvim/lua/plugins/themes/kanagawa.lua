return {
	"rebelot/kanagawa.nvim",
	name = "kanagawa",
	config = function()
		require("kanagawa").setup({
			-- transparent = true,
			-- theme = "dragon",
		})

		vim.cmd("colorscheme kanagawa-wave")
	end,
}
