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
        theme = "catppuccin", -- ✅ Use official theme
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
          n = "#f38ba8",
          i = "#a6e3a1",
          v = "#89b4fa",
          [""] = "#89b4fa",
          V = "#89b4fa",
          c = "#cba6f7",
          no = "#f38ba8",
          s = "#fab387",
          S = "#fab387",
          [""] = "#fab387",
          ic = "#f9e2af",
          R = "#cba6f7",
          Rv = "#cba6f7",
          cv = "#f38ba8",
          ce = "#f38ba8",
          r = "#94e2d5",
          rm = "#94e2d5",
          ["r?"] = "#94e2d5",
          ["!"] = "#f38ba8",
          t = "#f38ba8",
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
