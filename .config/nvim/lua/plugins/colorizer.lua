return {
	"NvChad/nvim-colorizer.lua",
	config = function()
		require("colorizer").setup({
			user_default_options = {
				tailwind = true,
				names = false, -- disable named colors like "yellow"
			},
			filetypes = { "html", "css", "javascript", "typescript", "tsx", "jsx" }, -- restrict to frontend files
		})

		-- execute colorizer as soon as possible
		vim.defer_fn(function()
			require("colorizer").attach_to_buffer(0)
		end, 0)
	end,
}
