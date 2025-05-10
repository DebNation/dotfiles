return {
  "embark-theme/vim",
  as     = "embark",
  config = function()
    vim.cmd("colorscheme embark")
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFLoat", { bg = "none" })
  end
}
