return {
  {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("conform").setup({
        formatters_by_ft = {
          lua = { "stylua" },
          vim = { "vimlint" }, -- Vimlint for Vim script files
          vimdoc = { "vimlint" }, -- Same formatter as Vim
          typescript = { "prettier" }, -- Prettier for TypeScript
          javascript = { "prettier" }, -- Prettier for JavaScript
          python = { "black" }, -- Black for Python
          go = { "gofmt" }, -- Gofmt for Go
          java = { "google_java_format" }, -- Google Java Format for Java
          sql = { "sql_formatter" }, -- SQL Formatter for SQL
          json = { "prettier" }, -- Prettier for JSON
          yaml = { "prettier" }, -- Prettier for YAML
          markdown = { "prettier" }, -- Prettier for Markdown
          markdown_inline = { "prettier" },
        },
        format_on_save = {
          enabled = true,
          timeout_ms = 1000,
        },
        log_level = vim.log.levels.ERROR, -- Reduce verbosity
        notify_on_error = true,
        notify_no_formatters = true,
      })
    end,
  },
}
