let mapleader = ' '

nnoremap <S-TAB>        :bprev<CR>
nnoremap <TAB>          :bnext<CR>

nnoremap <Leader>qw     <C-w>c
nnoremap <Leader>qq     :q!<CR>
nnoremap <Leader>qs     :wq!<CR>
nnoremap <C-s>          :wa!<CR>
inoremap <C-s>          <ESC>:wa!<CR>i
nnoremap <C-q>          :bw!<CR>
inoremap <C-q>          <ESC>:bw!<CR>i

vnoremap <              <gv
vnoremap >              >gv

nnoremap <C-p>          "+p
vnoremap <C-p>          "+p
vnoremap <C-c>          "*y :let @+=@*<CR>

nnoremap <leader>kk         :terminal curl cht.sh/
nnoremap <leader>s          /
nnoremap <leader><space>    :
nnoremap <leader>fe         :Vexplore<CR>

au FileType html,vim,xhtml,xml inoremap < <lt>><ESC>i| inoremap > <c-r>=ClosePair('>')<CR>
