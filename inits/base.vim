" Base configs with no plugins
source $HOME/.config/nvim/configs/settings.vim
source $HOME/.config/nvim/configs/mappings.vim

call plug#begin("~/.config/nvim/plugged/")
    " Prettyify this mfer
    Plug 'gruvbox-community/gruvbox'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'sheerun/vim-polyglot'
    Plug 'Yggdroot/indentLine'

    " Utilities
    Plug 'voldikss/vim-floaterm'

call plug#end()

colorscheme gruvbox
highlight Normal guibg=none

" Prettufy
source $HOME/.config/nvim/configs/airline.vim
source $HOME/.config/nvim/configs/indentline.vim

" Utilities
source $HOME/.config/nvim/configs/floaterm.vim
