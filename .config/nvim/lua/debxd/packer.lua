-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd.packadd("packer.nvim")

return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.3",
		-- or                            , branch = '0.1.x',
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })
	use("nvim-treesitter/playground")
	use("ThePrimeagen/harpoon")
	use("mbbill/undotree")
	use("tpope/vim-fugitive")
	-- LSP
	use({
		"VonHeikemen/lsp-zero.nvim",
		branch = "v2.x",
		requires = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" }, -- Required
			{ "williamboman/mason.nvim" }, -- Optional
			{ "williamboman/mason-lspconfig.nvim" }, -- Optional

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" }, -- Required
			{ "hrsh7th/cmp-nvim-lsp" }, -- Required
			{ "L3MON4D3/LuaSnip" }, -- Required
		},
	})
	use({
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	})
	use({
		"nvim-tree/nvim-tree.lua",
		requires = {
			"nvim-tree/nvim-web-devicons", -- optional
		},
	})

	use({
		"nvim-lualine/lualine.nvim",
		requires = { "nvim-tree/nvim-web-devicons", opt = true },
	})
	use("mhartington/formatter.nvim")
	use("windwp/nvim-autopairs")
	use("windwp/nvim-ts-autotag")
	use("JoosepAlviste/nvim-ts-context-commentstring")
	use("akinsho/toggleterm.nvim")
	use("stefanlogue/hydrate.nvim")
	use("f-person/git-blame.nvim")
	use("kylechui/nvim-surround")
	use("leafOfTree/vim-matchtag")
	use("andymass/vim-matchup")
	use("wakatime/vim-wakatime")
	-- nvim v0.7.2
	use({
		"kdheepak/lazygit.nvim",
		config = function()
			require("telescope").load_extension("lazygit")
		end,
	})
	-- THEMES

	use({ "rose-pine/neovim", as = "rose-pine" })
	use("kvrohit/mellow.nvim")
	use("Mofiqul/dracula.nvim")
	use("DebXD/oh-lucy.nvim")
	use("savq/melange-nvim")
	use("rebelot/kanagawa.nvim")
	use("sainnhe/everforest")
	use("ramojus/mellifluous.nvim")
	use({ "catppuccin/nvim", as = "catppuccin" })
	use("EdenEast/nightfox.nvim")
	use("folke/tokyonight.nvim")
	use("rmehri01/onenord.nvim")
	use("LunarVim/horizon.nvim")
	use("vigoux/oak")
	use("projekt0n/caret.nvim")
	use("sainnhe/gruvbox-material")
	--Formatter
	use("stevearc/conform.nvim")
end)
