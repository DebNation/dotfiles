-- disable netrw at the very start of your init.lua
-- vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true
--vim.keymap.set('n', 'I',     vim.cmd.tree.toggle_gitignore_filter)
-- OR setup with some options
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
    git_ignored = false
  },
})

vim.keymap.set("n", "<leader>e", vim.cmd.NvimTreeToggle)
