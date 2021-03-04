" Basic configs

set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent

set relativenumber
set nohlsearch
set noerrorbells
set hidden
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.config/nvim/undodir/
set undofile
set incsearch
set termguicolors
set scrolloff=8
set noshowmode
set signcolumn=yes
set encoding=utf-8
set t_Co=256
set mouse=a
set clipboard=unnamedplus
set updatetime=300

set modeline
set modelines=2

set cmdheight=2
set shortmess+=c

let g:netrw_banner=0
let g:netrw_browse_split=4
let g:netrw_altv=0
let g:netrw_winsize=20
let g:netrw_preview=1
let g:netrw_alto=0
let g:netrw_liststyle=3
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'
