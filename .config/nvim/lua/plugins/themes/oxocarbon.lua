return {
	"nyoom-engineering/oxocarbon.nvim",
	name = "oxocarbon",
	config = function()
		vim.cmd("colorscheme oxocarbon")
		vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
		vim.api.nvim_set_hl(0, "NormalFLoat", { bg = "none" })
	end,
}
