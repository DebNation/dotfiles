return {
	"vague2k/vague.nvim",
	priority = 1000,
	lazy = false,
	config = function()
		require("vague").setup({
			transparent = true,
		})

		vim.cmd("colorscheme vague")
	end,
}
