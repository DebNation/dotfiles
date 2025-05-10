return {
  'comfysage/evergarden',
  config = function()
    require("evergarden").setup({
      transparent_background = true,
      contrast_dark = 'hard', -- 'hard'|'medium'|'soft'
    })
    vim.cmd("colorscheme evergarden")
  end
}
