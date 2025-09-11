return {

	"stevearc/conform.nvim",
	config = function()
		local conform = require("conform")
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				javascript = { "prettierd" },
				typescript = { "prettierd" },
				javascriptreact = { "prettierd" },
				typescriptreact = { "prettierd" },
				html = { "prettierd" },
				css = { "prettierd" },
				json = { "prettierd" },
				yaml = { "prettierd" },
				markdown = { "prettierd" },
				rust = { "rusfmt" },
				go = { "gofmt" },
				blade = { "blade-formatter" },
				php = { "intelephense" },
			},
			-- format on leader + f
			vim.keymap.set("n", "<leader>f", function()
				conform.format({

					lsp_fallback = true,
					timeout_ms = 500,
				})
			end),
		})
	end,
}
