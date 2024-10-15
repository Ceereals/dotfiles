require("conform").setup({
  formatters_by_ft = {
    php = { "pint", "php_cs_fixer", stop_after_first = true },
    javascript = { "prettierd", "prettier", stop_after_first = true },
  },
  default_format_opts = {
    lsp_format = "fallback",
  },
  format_on_save = {
    timeout_ms = 500,
    lsp_format = "fallback",
  }
})
