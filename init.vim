set encoding=utf-8
syntax on
set termguicolors
filetype plugin indent on
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab smarttab autoindent
set incsearch ignorecase smartcase hlsearch
set ruler laststatus=2 showcmd showmode
set list listchars=trail:»,tab:»-
set wrap breakindent
set encoding=utf-8
set number
set title
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set autoread                    "Reload files changed outside vim

set wildmode=list:longest,full
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1
set fileformat=unix
set hidden

set noswapfile			"Lets delete the swaps and backups, I don't seem to use them properly
set nobackup
set nowb

set splitright
set splitbelow
set mouse=a

let mapleader =","

call plug#begin()
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'jiangmiao/auto-pairs'
    Plug 'morhetz/gruvbox'
    Plug 'tpope/vim-dispatch'
    Plug 'voldikss/vim-floaterm'
    Plug 'neovim/nvim-lspconfig'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
call plug#end()


let g:Powerline_symbols = 'fancy'
let g:airline_powerline_fonts = 1
let g:promptline_powerline_symbols = 1
let g:airline#extensions#tmuxline#enabled = 1 "We need a nice looking tmuxline

nmap <leader>b :Clap buffers<CR>
nmap <leader>a :Clap grep2<CR>
nmap <leader>p :Clap filer<CR>
tnoremap <leader>t <C-\><C-n>:FloatermToggle<CR>
nnoremap <leader>t :FloatermToggle<CR>

nmap <F3> :bp<ENTER>
nmap <F4> :bn<ENTER>
nmap <F6> :bp\|sp\|bn\|bd <ENTER>

colorscheme gruvbox
