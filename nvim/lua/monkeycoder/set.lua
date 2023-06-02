vim.opt.guicursor = ""  -- fat cursor

vim.opt.number = true  -- show line numbers
vim.opt.relativenumber = true -- use relative numbers

vim.opt.tabstop = 4 -- 4 spaces for a tab
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true -- expand into spaces for tabs

vim.opt.smartindent = true -- try to be smart while indenting

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

vim.opt.splitright = true
vim.opt.splitbelow = true

