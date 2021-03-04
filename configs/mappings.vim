let mapleader = ' '

nnoremap <S-TAB>        :bprev<CR>
nnoremap <TAB>          :bnext<CR>

nnoremap <Leader>qw     <C-w>c
nnoremap <Leader>qq     :q!<CR>
nnoremap <C-s>          :wa!<CR>
nnoremap <C-q>          :bw!<CR>

vnoremap <              <gv
vnoremap >              >gv

nnoremap <C-p>          "+p
vnoremap <C-p>          "+p
vnoremap <C-c>          "*y :let @+=@*<CR>

nnoremap <leader>kk     :terminal curl cht.sh/
