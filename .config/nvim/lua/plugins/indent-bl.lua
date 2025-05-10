return {
  -- Add indentation guides even on blank lines
  'lukas-reineke/indent-blankline.nvim',
  -- Enable `lukas-reineke/indent-blankline.nvim`
  -- See `:help indent_blankline.txt`
  config = function()
    require('ibl').setup {
      indent = {
        char = "▏", -- This is a slightly thinner char than the default one, check :help ibl.config.indent.char
      },
      scope = { enabled = true }
    }
  end,
}
