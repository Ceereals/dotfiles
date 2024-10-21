require("nvim-tree").setup({
  git = {
    ignore = false,
  },
  filters = {
    custom = { "^\\.git", "^\\.DS_Store", "^\\.idea", "^\\.vscode", "^\\.phpunit.cache" },
  }
})
