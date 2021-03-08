" Base configs with no plugins
source $HOME/.config/nvim/configs/settings.vim
source $HOME/.config/nvim/configs/mappings.vim

call plug#begin("~/.config/nvim/plugged/")
    " Prettyify this mfer
    Plug 'gruvbox-community/gruvbox'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'sheerun/vim-polyglot'
    Plug 'thaerkh/vim-indentguides'

    " Utilities
    Plug 'voldikss/vim-floaterm'
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'

    " LSP support
    Plug 'neovim/nvim-lspconfig'
    Plug 'nvim-lua/completion-nvim'

call plug#end()

colorscheme gruvbox
highlight Normal guibg=none

" Prettufy
source $HOME/.config/nvim/configs/airline.vim
source $HOME/.config/nvim/configs/indents.vim

" Utilities
source $HOME/.config/nvim/configs/floaterm.vim
source $HOME/.config/nvim/configs/telescope.vim

" LSP
source $HOME/.config/nvim/configs/autocomplete.vim
source $HOME/.config/nvim/configs/lsp.vim
