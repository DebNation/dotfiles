return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	build = ":TSUpdate",
	lazy = false,
	config = function()
		local ts = require("nvim-treesitter")

		-- Ensure basic parsers are installed
		local parsers = {
			"bash",
			"c",
			"diff",
			"html",
			"lua",
			"luadoc",
			"markdown",
			"markdown_inline",
			"query",
			"vim",
			"vimdoc",
		}
		ts.install(parsers)

		---@param buf integer
		---@param language string
		local function treesitter_try_attach(buf, language)
			-- Check if a parser exists and load it
			if not vim.treesitter.language.add(language) then
				return
			end

			-- Enable syntax highlighting and other treesitter features
			vim.treesitter.start(buf, language)

			-- Enable treesitter-based folds (optional)
			-- vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
			-- vim.wo.foldmethod = "expr"

			-- Check if treesitter indentation is available for this language
			local has_indent_query = vim.treesitter.query.get(language, "indents") ~= nil
			if has_indent_query then
				vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
			end
		end

		local available_parsers = ts.get_available()

		vim.api.nvim_create_autocmd("FileType", {
			callback = function(args)
				local buf, filetype = args.buf, args.match

				local language = vim.treesitter.language.get_lang(filetype)
				if not language then
					return
				end

				local installed_parsers = ts.get_installed("parsers")

				if vim.tbl_contains(installed_parsers, language) then
					-- Enable the parser if already installed
					treesitter_try_attach(buf, language)
				elseif vim.tbl_contains(available_parsers, language) then
					-- Auto-install and attach once ready
					ts.install(language):await(function()
						treesitter_try_attach(buf, language)
					end)
				else
					-- Fallback attach attempt
					treesitter_try_attach(buf, language)
				end
			end,
		})
	end,
}
