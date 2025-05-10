return {
  "Alexis12119/nightly.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("nightly").setup({
      transparent = true,
    })
    vim.cmd("colorscheme nightly")
  end
}
