let mapleader = ' '

" Tab navigation
nnoremap <S-TAB>        :bprev<CR>
nnoremap <TAB>          :bnext<CR>

" Saving/quitting stuff
nnoremap <Leader>qw     <C-w>c
nnoremap <Leader>qq     :qa!<CR>
nnoremap <Leader>qb     :bw!<CR>
nnoremap <C-s>          :wa!<CR>
inoremap <C-s>          <ESC>:wa!<CR>i
nnoremap <C-q>          :bw!<CR>
inoremap <C-q>          <ESC>:bw!<CR>i

" Tab/untabbing
vnoremap <              <gv
vnoremap >              >gv

" Copypasting
nnoremap <C-p>          "+p
vnoremap <C-p>          "+p
vnoremap <C-c>          "*y :let @+=@*<CR>

" Commenting
augroup commenting_blocks_of_code
  autocmd!
  autocmd FileType c,cpp,java,scala           let b:comment_leader = '// '
  autocmd FileType sh,ruby,python,conf,fstab  let b:comment_leader = '# '
  autocmd FileType tex                        let b:comment_leader = '% '
  autocmd FileType mail                       let b:comment_leader = '> '
  autocmd FileType vim                        let b:comment_leader = '" '
  autocmd FileType lua,haskell                let b:comment_leader = '-- '
augroup END
noremap <silent> <leader>cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
noremap <silent> <leader>ce :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>

" Misc utilities
nnoremap <leader>kk         :terminal curl cht.sh/
nnoremap <leader>sf         /
nnoremap <leader><space>    :
nnoremap <leader>fs         :20Lexplore<CR>
au FileType html,vim,xhtml,xml inoremap < <lt>><ESC>i| inoremap > <c-r>=ClosePair('>')<CR>
