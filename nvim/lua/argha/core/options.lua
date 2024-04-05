vim.cmd("let g:netrw_liststyle = 3")

local opt =vim.opt

opt.relativenumber = true
opt.number = true

-- tabs and indents --
opt.tabstop = 2  -- 2 spaces for tabs
opt.shiftwidth = 2 -- 2 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting a new one

opt.wrap = false

-- search settings --
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if case is included in patern, switch to case-sensitive


opt.cursorline = true
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes" -- show sign column so text doesn't shift
opt.backspace = "indent,eol,start" -- make backspace work as modern apps expect
opt.clipboard:append('unnamedplus') -- use system clipboard  

-- split settings
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- spilt horizontal window to the bottom
