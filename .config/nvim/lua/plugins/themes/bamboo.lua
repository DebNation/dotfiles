-- Using lazy.nvim
return {
  'ribru17/bamboo.nvim',
  lazy = false,
  name = "bamboo",
  priority = 1000,
  config = function()
    require('bamboo').setup {
       style = 'multiplex',
      transparent = true,
    }
    vim.cmd("colorscheme bamboo")
  end
}
