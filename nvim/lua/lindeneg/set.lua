-- line numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- indent
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- long running undotree cache
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = vim.fn.expand("~/.vim/undodir")
vim.opt.undofile = true

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.termguicolors = true

vim.opt.wrap = false
--vim.opt.colorcolumn = "90"
vim.opt.scrolloff = 8
vim.opt.updatetime = 50

