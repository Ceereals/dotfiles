require("ceereals.remap")
require("ceereals.lazy")

-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- enable 24-bit color
vim.opt.termguicolors = true


-- set indentation to 2 spaces
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.bo.softtabstop = 2


vim.filetype.add({
  extension = {
    mdx = 'mdx'
  }
})
