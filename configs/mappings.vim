let mapleader = ' '

"" NORMAL KEYMAPS ""
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

" Misc utilities
nnoremap <leader>rc         :source $MYVIMRC<CR>
nnoremap <leader><space>    :
nnoremap <leader>fs         :20Lexplore<CR>

"" AUTOCOMMANDS ""

" Trimming white space off
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup TrimWhiteSpaceAuto
    autocmd!
    autocmd BufWritePre * :call TrimWhitespace()
augroup END

" Commenting
augroup CommentingCodeAuto
    autocmd!
    " //
    autocmd Filetype c,cpp,java
            \ let b:commentCommand='I// ' |
            \ let b:unCommentCommand='^xxx'

    " #
    autocmd Filetype sh,conf,fstab,ruby,python
            \ let b:commentCommand='I# ' |
            \ let b:unCommentCommand='^xx'

    " %
    autocmd Filetype tex
            \ let b:commentCommand='I% ' |
            \ let b:unCommentCommand='^xx'

    " "
    autocmd Filetype vim
            \ let b:commentCommand='I" ' |
            \ let b:unCommentCommand='^xx'

    " --
    autocmd Filetype lua,haskell
            \ let b:commentCommand='I-- ' |
            \ let b:unCommentCommand='^xxx'
augroup END

noremap <silent> <expr> <leader>cc (synIDattr(synID(line("."), col("."), 0), "name") =~ 'comment\c') ?
                                    \ ':<S-Left>exe "<S-Right>normal! ".b:unCommentCommand<CR>' :
                                    \ ':<S-Left>exe "<S-Right>normal! ".b:commentCommand<CR>'

" Snippets
augroup SnippetsAuto
    autocmd!
    " For a wrapping <> experience
    autocmd FileType html,vim,xhtml,xml,c,cpp,h,hpp
            \ inoremap < <lt>><ESC>i

    autocmd FileType c,cpp,h,hpp,rs,vim,python
            \ inoremap ( ()<ESC>i

    " Useful guard for latex
    function! s:insert_tex()
        execute "normal! i\\documentclass{article}\n\n\\title{}\n\\date{}\n\\author{}\n\n\\begin{document}\n\\maketitle\n\n\n\n\\end{document}"
        execute "normal! kk"
    endfunction
    autocmd BufNewFile *.tex call <SID>insert_tex()

    " Useful auto-snippet for .h/.hpp headers
    function! s:insert_gates()
        let gatename = "__" . substitute(toupper(expand("%:t")), "\\.", "_", "g") . "__"
        execute "normal! i#ifndef " . gatename
        execute "normal! o#define " . gatename . " "
        execute "normal! Go#endif /* " . gatename . " */"
        execute "normal! 2gg3o"
        execute "normal! k"
    endfunction
    autocmd BufNewFile *.{h,hpp} call <SID>insert_gates()
augroup END
