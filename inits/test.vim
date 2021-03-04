" Base configs with no plugins
source $HOME/.config/nvim/configs/settings.vim
source $HOME/.config/nvim/configs/mappings.vim
source $HOME/.config/nvim/configs/autocmds.vim

call plug#begin("~/.config/nvim/plugged/")
    " Prettyify this mfer
    Plug 'gruvbox-community/gruvbox'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'sheerun/vim-polyglot'
    Plug 'Yggdroot/indentLine'

    " Utilities
    Plug 'preservim/nerdcommenter'
    Plug 'junegunn/fzf'
    Plug 'junegunn/fzf.vim'
    Plug 'voldikss/vim-floaterm'

    " LSP+DAP support
    Plug 'neovim/nvim-lspconfig'
    Plug 'ojroques/nvim-lspfuzzy'
    Plug 'nvim-lua/completion-nvim'
    Plug 'mfussenegger/nvim-dap'

call plug#end()

colorscheme gruvbox
highlight Normal guibg=none

" Prettufy
source $HOME/.config/nvim/configs/airline.vim
source $HOME/.config/nvim/configs/indentline.vim

" Utilities
source $HOME/.config/nvim/configs/commenter.vim
source $HOME/.config/nvim/configs/fzf.vim
source $HOME/.config/nvim/configs/floaterm.vim

" LSP + DAP
source $HOME/.config/nvim/configs/autocomplete.vim
source $HOME/.config/nvim/configs/lsp.vim
