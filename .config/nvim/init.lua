vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "
vim.cmd("set relativenumber")
--FOLDING
vim.cmd("set foldmethod=manual")
vim.cmd("set foldcolumn=1")
-- vim.cmd("set foldlevel=99")
-- vim.cmd("set foldexpr=nvim_treesitter#foldexpr()")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to left window", remap = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to lower window", remap = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to upper window", remap = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to right window", remap = true })

require("remap")
require("set")
require("neovide")
require("highlightYank")
require("lazy").setup("plugins")

-- vim.lsp.config("rust_analyzer", {
-- 	settings = {
-- 		["rust-analyzer"] = {
-- 			cargo = {
-- 				features = "all", -- Enable all features
-- 			},
-- 		},
-- 	},
-- })
