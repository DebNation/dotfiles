return {
	"LunarVim/horizon.nvim",
	config = function()
		require("horizon").setup({})
		vim.cmd("colorscheme horizon")
	end,
}
