return {
	"ptdewey/darkearth-nvim",
	priority = 1000,
  config = function()
    vim.cmd("colorscheme darkearth")
    -- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    -- vim.api.nvim_set_hl(0, "NormalFLoat", { bg = "none" })
  end
}
