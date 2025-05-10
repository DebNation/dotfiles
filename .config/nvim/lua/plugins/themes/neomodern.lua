return {
	"cdmill/neomodern.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("neomodern").setup({
			-- optional configuration here
			style = "coffecat",
			transparent = false,
		})
		vim.cmd("colorscheme neomodern")
	end,
}
