return {
	"eddyekofo94/gruvbox-flat.nvim",
	priority = 1000,
	enabled = true,
	config = function()
		vim.g.gruvbox_transparent = 1
		vim.cmd([[colorscheme gruvbox-flat]])
	end,
}
