return {
	"ramojus/mellifluous.nvim",
	-- version = "v0.*", -- uncomment for stable config (some features might be missed if/when v1 comes out)
	config = function()
		require("mellifluous").setup({})
		vim.cmd("colorscheme mellifluous")
		vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
	end,
}
