return {

  "stevearc/conform.nvim",
  config = function()
    local conform = require("conform")
    require("conform").setup({
      formatters_by_ft = {
        lua = { "stylua" },
        javascript = { "prettierd", "prettier" },
        typescript = { "prettierd", "prettier", },
        javascriptreact = { "prettierd", "prettier" },
        typescriptreact = { "prettierd", "prettier", },
        html = { "prettierd", "prettier", },
        css = { "prettierd", "prettier", },
        json = { "prettierd", "prettier", },
        yaml = { "prettierd", "prettier", },
        markdown = { "prettierd", "prettier", },
        rust = {"rusfmt"},
        go = {"gofmt"}
      },
      -- format on leader + f
      vim.keymap.set("n", "<leader>f", function()
        conform.format({

          lsp_fallback = true,
          timeout_ms = 500,
        })
      end
      )

    })
  end
}
