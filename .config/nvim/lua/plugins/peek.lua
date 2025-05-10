return {
	"toppair/peek.nvim",
	event = { "VeryLazy" },
	build = "deno task --quiet build:fast",
	config = function()
		require("peek").setup({})
		vim.api.nvim_create_user_command("PeekOpen", function()
			require("peek").open()
		end, {})
		vim.api.nvim_create_user_command("PeekClose", function()
			require("peek").close()
		end, {})
	end,
}
