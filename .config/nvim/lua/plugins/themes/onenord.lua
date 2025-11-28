return {
	"rmehri01/onenord.nvim",
	as = "onenord",
	config = function()
		require("onenord").setup({
			theme = "dark", -- "dark" or "light". Alternatively, remove the option and set vim.o.background instead
			borders = true, -- Split window borders
			styles = {
				comments = "NONE",
				strings = "NONE",
				keywords = "NONE",
				functions = "bold",
				variables = "NONE",
				diagnostics = "underline",
			},
			disable = {
				background = true, -- Disable setting the background color
				float_background = true, -- Disable setting the background color for floating windows
				cursorline = false, -- Disable the cursorline
				eob_lines = true, -- Hide the end-of-buffer lines
			},
			-- Inverse highlight for different groups
			inverse = {
				match_paren = false,
			},
		})
		vim.cmd("colorscheme onenord")
	end,
}
