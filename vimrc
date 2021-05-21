:set t_Co=256
:syntax enable
:set sw=4
:set tabstop=4
:set expandtab
:filetype on
:set wildignore=*.o,*.hi
:set encoding=utf-8
:command Spell :setlocal spell spelllang=en_us
:set mouse=a

nmap <F3> :bp<ENTER>
nmap <F4> :bn<ENTER>
nmap <F6> :bp\|sp\|bn\|bd <ENTER>

"NeoBundle Scripts-----------------------------
if has('vim_starting')
    set nocompatible               " Be iMproved

    " Required:
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle'))
"
" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/vimproc', {
		\ 'build' : {
		\     'windows' : 'tools\\update-dll-mingw',
		\     'cygwin' : 'make -f make_cygwin.mak',
		\     'mac' : 'make -f make_mac.mak',
		\     'unix' : 'make -f make_unix.mak',
		\    },
		\ }
if (v:version < 703)
    NeoBundle 'Shougo/unite.vim', {'rev' : 'a533d95433da314b99e86e7a6ce55766c3bf8475'}
else
    NeoBundle 'Shougo/unite.vim'
endif
NeoBundle 'Shougo/neomru.vim'

NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-fugitive'
" if (v:version >= 730)
"   NeoBundle 'easymotion/vim-easymotion'
" endif
NeoBundle 'justinmk/vim-sneak'
NeoBundle 'bling/vim-airline'
NeoBundle 'Shougo/unite-outline'
NeoBundle 'jiangmiao/auto-pairs'
NeoBundle 'vim-scripts/gtags.vim'
NeoBundle 'hewes/unite-gtags'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'camelcasemotion'

"My Additional plugins
NeoBundle 'edkolev/tmuxline.vim'
let g:commentary_map_backslash = 0
NeoBundle 'tpope/vim-commentary'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'edkolev/promptline.vim'
NeoBundle 'octol/vim-cpp-enhanced-highlight'
NeoBundle 'Shougo/vimfiler.vim'
NeoBundle "altercation/vim-colors-solarized"
"
"End of My Plugins
"
"" You can specify revision/branch/tag.
""NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }
"
" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"End NeoBundle Scripts-------------------------

"--------neosnippets
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
"imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
"		\ "\<Plug>(neosnippet_expand_or_jump)"
"		\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
		\ "\<Plug>(neosnippet_expand_or_jump)"
		\: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
    set conceallevel=2 concealcursor=i
endif
"---------end neosnippets

"Unite
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
"call unite#custom#source('file_rec/async','sorters','sorter_rank', )
" replacing unite with ctrl-p
let g:unite_data_directory='~/.vim/.cache/unite'
let g:unite_enable_start_insert=1
let g:unite_source_history_yank_enable=1
let g:unite_prompt='» '
let g:unite_split_rule = 'botright'
if executable('ag')
    let g:unite_source_grep_command='ag'
    let g:unite_source_grep_default_opts='--nocolor --nogroup -S -C4'
    let g:unite_source_grep_recursive_opt=''
endif

"`set ttimeout
set ttimeoutlen=50

:command -nargs=1 Todolist noautocmd vimgrep /TODO/j <args>/**/*
set title
set makeprg=make

" ================ General Config ====================

set number                      "Line numbers are good
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set autoread                    "Reload files changed outside vim

set hidden
let mapleader=","

set noswapfile			"Lets delete the swaps and backups, I don't seem to use them properly
set nobackup
set nowb

set list listchars=tab:\ \ ,trail:·

set nowrap       "Don
set linebreak    "Wrap lines at convenient points
filetype plugin on
filetype indent on
set smartindent

" ================ Folds ============================

set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

" ================ Completion =======================

set wildmode=list:longest,full
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

"" ================ Scrolling ========================

set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

" ================ Search ===========================

set incsearch       " Find the next match as we type the search
set hlsearch        " Highlight searches by default
set ignorecase      " Ignore case when searching...
set smartcase       " ...unless we type a capital

" ================ Status ===========================
set laststatus=2
"=====================My Mappings====================
"
let g:airline#extensions#tabline#enabled = 1
nnoremap <C-p> :Unite file -no-split -resume file_rec/async<cr>
nnoremap <C-p>p :Unite file_mru -no-split  <cr>
nnoremap <leader>p :Unite buffer<CR>
nnoremap <leader>n :VimFilerExplorer<CR>
"inoremap <ESC> <ESC><ESC>

let g:Powerline_symbols = 'fancy'
let g:airline_powerline_fonts = 1
let g:promptline_powerline_symbols = 1
let g:airline#extensions#tmuxline#enabled = 1 "We need a nice looking tmuxline
set csprg=gtags-cscope
:colorscheme desert

"living with the typos
:command WQ wq
:command Wq wq
:command W w
:command Q q

"================NeoComplete settings============
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
"let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
"=======================Vim Marching============
let g:marching_clang_command="clang"
let g:marching_enable_neocomplete = 1
"=======================Vim Filer================
:let g:vimfiler_as_default_explorer = 1 "replace netrw as the default filer

