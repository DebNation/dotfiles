return {
	"sho-87/kanagawa-paper.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		vim.cmd("colorscheme kanagawa-paper")
		-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
		-- vim.api.nvim_set_hl(0, "NormalFLoat", { bg = "none" })
	end,
}
