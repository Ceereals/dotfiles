return {


	{
		'nvim-telescope/telescope.nvim',
		dependecies = { 'nvim-lua/plenary.nvim' }
	},
	"rose-pine/neovim",
	{ 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
	'nvim-treesitter/playground',
	'mbbill/undotree',
	'tpope/vim-fugitive',
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" }
	},
	{ 'VonHeikemen/lsp-zero.nvim',       branch = 'v4.x' },
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
		'smartinellimarco/nvcheatsheet.nvim'
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

}
