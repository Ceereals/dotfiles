vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", function()
	local api = require("nvim-tree.api")
	api.tree.toggle()
end)
