return {
	{
		"williamboman/mason.nvim",
		config = function()
			vim.keymap.set("n", "<leader>m", ":Mason<CR>", {})
			require("mason").setup()
		end,
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		config = function()
			local ensure_installed = {
				"stylua", -- Used to format Lua code
				"prettier",
				"eslint",
			}
			require("mason-tool-installer").setup({ ensure_installed = ensure_installed })
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"ts_ls", 
					"html",
					"cssls",
					"tailwindcss",
					"gopls",
					"clangd",
					"rust_analyzer",
          "tombi"
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = { "saghen/blink.cmp" },
		opts = {
			servers = {
				lua_ls = {},
				rust_analyzer = {},
			},
		},
		config = function(_, opts)
			local lspconfig = require("lspconfig")
			local blink = require("blink.cmp")

			for server, config in pairs(opts.servers) do
				config.capabilities = blink.get_lsp_capabilities(config.capabilities)
				lspconfig[server].setup(config)
			end

			-- Global LSP keymaps
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
			vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float)
		end,
	},
	vim.diagnostic.config({
		virtual_text = true,
	}),
}
