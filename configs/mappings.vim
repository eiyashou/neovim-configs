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

" Window Nav
nnoremap <C-Left>       <C-w>h
nnoremap <C-Down>       <C-w>j
nnoremap <C-Up>         <C-w>k
nnoremap <C-Right>      <C-w>l

" Misc utilities
nnoremap <silent> <leader>rc         :source $MYVIMRC<CR>
nnoremap <silent> <leader>fs         :20Lexplore<CR>
nnoremap <leader>kk                  :call CheatSheet(input('Insert language: '), input('Insert question: '))<CR>

function! CheatSheet(language, question)
    let que = strlen(a:question) ? "/" . join(split(a:question), "+") : ""
    execute "term curl cht.sh/" . a:language . l:que
endfunction

" " AUTOCOMMANDS

" Commenting
augroup CommentingCodeAuto
    autocmd!
    autocmd Filetype c,cpp,java                 let b:commentCommand='// '
    autocmd Filetype sh,conf,fstab,ruby,python  let b:commentCommand='# '
    autocmd Filetype tex                        let b:commentCommand='% '
    autocmd Filetype vim                        let b:commentCommand='" '
    autocmd Filetype lua,haskell                let b:commentCommand='-- '
    autocmd Filetype dosini                     let b:commentCommand='; '
    autocmd Filetype xdefaults                  let b:commentCommand='! '
augroup END

noremap <silent> <expr> CC ':<S-Left>exe "<S-Right>normal! ^i".b:commentCommand<CR>'
noremap <silent> <expr> <leader>cc (synIDattr(synID(line("."), col("."), 0), "name") =~ 'comment\c') ?
                                    \ ':<S-Left>exe "<S-Right>normal! ^" . strlen(b:commentCommand) . "x"<CR>' :
                                    \ ':<S-Left>exe "<S-Right>normal! ^i" . b:commentCommand<CR>'


" Wow! Snippet hell!!
let g:toggleSnippets = 1
function! ToggleSnippets()
    let g:toggleSnippets = 1 - g:toggleSnippets
    echom "Snippets o" . (g:toggleSnippets ? "n" : "ff") . "!"
    call RefreshToggleSnippets()
endfunction

function! RefreshToggleSnippets()
    if g:toggleSnippets == 1
        augroup SnippetsAuto
            autocmd!

            " Wrapping
            autocmd FileType html,vim,xhtml,xml,c,cpp,h,hpp
                \ inoremap < <lt>><ESC>i
            autocmd FileType c,cpp,h,hpp,rs,vim,python
                \ inoremap ( ()<ESC>i
            autocmd FileType c,cpp,h,hpp,rs
                \ inoremap { {}<ESC>i
            autocmd FileType python,rs
                \ inoremap [ []<ESC>i

            " All the file templates
            autocmd BufNewFile *.tex
                \ execute "normal! i\\documentclass{article}\n\n\\title{}\n\\date{}\n\\author{}\n\n\\begin{document}\n\\maketitle\n\n\n\n\\end{document}" |
                \ execute "normal! kk"
            autocmd BufNewFile {main,debug}.c
                \ execute "normal! i#include <stdio.h>\n#include <string.h>\n#include <stdlib.h>\n\n\nint main(){\n\n}" |
                \ execute "normal! ki \t"
            autocmd BufNewFile {main,debug}.cpp
                \ execute "normal! i#include <iostream>\n\n\nint main(){\n\n}" |
                \ execute "normal! ki \t"
            autocmd BufNewFile *.{h,hpp}
                \ let b:gatename = "__" . substitute(toupper(expand("%:t")), "\\.", "_", "g") . "__" |
                \ execute "normal! i#ifndef " . b:gatename . "\n#define " . b:gatename . "\n\n\n\n#endif /* " . b:gatename . " */" |
                \ execute "normal! 4gg"

        augroup END

    else
        autocmd! SnippetsAuto
    endif
endfunction

nnoremap <silent> <leader>ts    :call ToggleSnippets()<CR>
call RefreshToggleSnippets()


" White Trimming
let g:toggleTrimming = 1
function! ToggleTrimming()
    let g:toggleTrimming = 1 - g:toggleTrimming
    echom "White Space Trimming o" . (g:toggleTrimming ? "n" : "ff") . "!"
    call RefreshToggleTrimming()
endfunction

function! RefreshToggleTrimming()
    if g:toggleTrimming == 1
        augroup TrimWhiteSpaceAuto
            autocmd!
            autocmd BufWritePre *
                \ let b:save_view = winsaveview() |
                \ keeppatterns %s/\s\+$//e        |
                \ call winrestview(b:save_view)
        augroup END
    else
        autocmd! TrimWhiteSpaceAuto
    endif
endfunction

nnoremap <silent> <leader>tt    :call ToggleTrimming()<CR>
autocmd BufWinEnter * call RefreshToggleTrimming()
