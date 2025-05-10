return {
  "neanias/everforest-nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("everforest").setup({
      transparent_background_level = 100,
      italics = true,
      dim_inactive_windows = false,
    })
    vim.cmd("colorscheme everforest")
  end
}
