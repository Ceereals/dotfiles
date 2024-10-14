local nvcheatsheet = require('nvcheatsheet')
local opts = {
	{
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
			['Test'] = {
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
}
nvcheatsheet.setup(opts)

-- You can also close it with <Esc>
vim.keymap.set('n', '<F1>', nvcheatsheet.toggle)

