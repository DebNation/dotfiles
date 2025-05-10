return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		enabled = vim.g.have_nerd_font, -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
	},
	config = function()
		vim.keymap.set("n", "<leader>e", "<Cmd>Neotree toggle<CR>")

		-- Configure diagnostic signs using vim.diagnostic.config()
		vim.diagnostic.config({
			signs = {
				active = true,
				values = {
					{ name = "DiagnosticSignError", text = "", texthl = "DiagnosticSignError" },
					{ name = "DiagnosticSignWarn", text = "", texthl = "DiagnosticSignWarn" },
					{ name = "DiagnosticSignInfo", text = "", texthl = "DiagnosticSignInfo" },
					{ name = "DiagnosticSignHint", text = "󰌵", texthl = "DiagnosticSignHint" },
				},
			},
		})

		require("neo-tree").setup({
			window = {
				position = "left",
				width = 30,
			},
		})
	end,
}
