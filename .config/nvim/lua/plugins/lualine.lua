return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local conditions = {
			buffer_not_empty = function()
				return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
			end,
			hide_in_width = function()
				return vim.fn.winwidth(0) > 80
			end,
			check_git_workspace = function()
				local filepath = vim.fn.expand("%:p:h")
				local gitdir = vim.fn.finddir(".git", filepath .. ";")
				return gitdir and #gitdir > 0 and #gitdir < #filepath
			end,
		}

		local config = {
			options = {
				component_separators = "",
				section_separators = "",
				theme = "gruvbox", -- ✅ Use official theme
			},
			sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_y = {},
				lualine_z = {},
				lualine_c = {},
				lualine_x = { "filetype" },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_y = {},
				lualine_z = {},
				lualine_c = {},
				lualine_x = {},
			},
		}

		local function ins_left(component)
			table.insert(config.sections.lualine_c, component)
		end

		local function ins_right(component)
			table.insert(config.sections.lualine_x, component)
		end

		ins_left({
			function()
				return "▊"
			end,
			color = { fg = "#89b4fa" }, -- fallback color
			padding = { left = 0, right = 1 },
		})

		ins_left({
			function()
				return ""
			end,
			color = function()
				local mode_color = {
					n = "#cc241d", -- red
					i = "#98971a", -- green
					v = "#458588", -- blue
					[""] = "#458588", -- blue (Visual block)
					V = "#458588", -- blue (Visual line)
					c = "#b16286", -- magenta (Command)
					no = "#cc241d", -- red
					s = "#d79921", -- yellow (Select)
					S = "#d79921", -- yellow
					[""] = "#d79921", -- yellow (Select block)
					ic = "#fabd2f", -- bright yellow (Insert completion)
					R = "#b16286", -- magenta (Replace)
					Rv = "#b16286", -- magenta (Virtual Replace)
					cv = "#cc241d", -- red (Ex mode)
					ce = "#cc241d", -- red (Normal Ex)
					r = "#689d6a", -- cyan (Hit-enter prompt)
					rm = "#689d6a", -- cyan (More prompt)
					["r?"] = "#689d6a", -- cyan (Confirm prompt)
					["!"] = "#cc241d", -- red (Shell)
					t = "#cc241d", -- red (Terminal)
				}
				return { fg = mode_color[vim.fn.mode()] }
			end,
			padding = { right = 1 },
		})

		ins_left({ "filesize", cond = conditions.buffer_not_empty })
		ins_left({
			"filename",
			cond = conditions.buffer_not_empty,
			color = { fg = "#cba6f7", gui = "bold" },
		})
		ins_left({ "location" })
		ins_left({ "progress", color = { gui = "bold" } })

		ins_left({
			"diagnostics",
			sources = { "nvim_diagnostic" },
			symbols = { error = " ", warn = " ", info = " " },
			diagnostics_color = {
				error = { fg = "#f38ba8" },
				warn = { fg = "#f9e2af" },
				info = { fg = "#94e2d5" },
			},
		})

		ins_left({
			function()
				return "%="
			end,
		})

		ins_right({
			function()
				local msg = "No Active Lsp"
				local buf_ft = vim.api.nvim_get_option_value("filetype", { buf = 0 })
				local clients = vim.lsp.get_clients()
				if next(clients) == nil then
					return msg
				end
				for _, client in ipairs(clients) do
					local filetypes = client.config.filetypes
					if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
						return client.name
					end
				end
				return msg
			end,
			icon = " ",
			color = { fg = "#a6e3a1", gui = "bold" },
		})

		ins_right({
			"branch",
			icon = "",
			color = { fg = "#cba6f7", gui = "bold" },
		})

		ins_right({
			"diff",
			symbols = { added = " ", modified = "󰝤 ", removed = " " },
			diff_color = {
				added = { fg = "#a6e3a1" },
				modified = { fg = "#fab387" },
				removed = { fg = "#f38ba8" },
			},
			cond = conditions.hide_in_width,
		})

		ins_right({
			function()
				return "▊"
			end,
			color = { fg = "#89b4fa" },
			padding = { left = 1 },
		})

		require("lualine").setup(config)
	end,
}
