return {


  {
    'nvim-telescope/telescope.nvim',
    dependecies = { 'nvim-lua/plenary.nvim' }
  },
  { 'projekt0n/github-nvim-theme',     name = 'github-theme' },
  { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
  'nvim-treesitter/playground',
  'mbbill/undotree',
  'tpope/vim-fugitive',
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" }
  },
  { 'VonHeikemen/lsp-zero.nvim', branch = 'v4.x' },
  { 'neovim/nvim-lspconfig' },
  { 'hrsh7th/cmp-nvim-lsp' },
  { 'hrsh7th/nvim-cmp' },
  {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  },
  { 'm4xshen/autoclose.nvim' },
  { 'onsails/lspkind.nvim' },
  {
    'smartinellimarco/nvcheatsheet.nvim',
    opts = {
      -- Default header
      header = {
        "                                      ",
        "                                      ",
        "                                      ",
        "█▀▀ █░█ █▀▀ ▄▀█ ▀█▀ █▀ █░█ █▀▀ █▀▀ ▀█▀",
        "█▄▄ █▀█ ██▄ █▀█ ░█░ ▄█ █▀█ ██▄ ██▄ ░█░",
        "                                      ",
        "                                      ",
        "                                      ",
      },
      -- Example keymaps (this doesn't create any)
      keymaps = {
        ['Commands'] = {
          { 'Toggle oil (closes without saving)', '<leader>q' },
          { 'Select entry', '⏎' },
          { 'Select entry', 'l' },
          { 'Go to parent', 'h' },
          { 'Open vertical split', '⌃v' },
          { 'Open horizontal split', '⌃x' },
          { 'Go to current working directory', '.' },
        },
        ['Cmp'] = {
          { 'Select entry', '⌃f' },
          { 'Next result - Jump to next snippet placeholder', '⌃n' },
          { 'Previous result - Jump to previous snippet placeholder', '⌃p' },
          { 'Scroll up in preview', '⌃u' },
          { 'Scroll down in preview', '⌃d' },
          { 'Abort autocompletion', '⌃e' },
        },
        ['Comment'] = {
          { 'Comment line toggle',                             'gcc' },
          { 'Comment block toggle',                            'gbc' },
          { 'Comment visual selection',                        'gc' },
          { 'Comment visual selection using block delimiters', 'gb' },
          { 'Comment out text object line wise',               'gc<motion>' },
          { 'Comment out text object block wise',              'gb<motion>' },
          { 'Add comment on the line above',                   'gcO' },
          { 'Add comment on the line below',                   'gco' },
          { 'Add comment at the end of line',                  'gcA' },
        },
      },
    }
  },
  { "supermaven-inc/supermaven-nvim" },
  { 'akinsho/toggleterm.nvim',       version = "*", config = true },
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
  },
  {
    'stevearc/conform.nvim',
    opts = {},
  },

}
