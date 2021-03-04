fun! GotoWindow(id)
    :call win_gotoid(a:id)
endfun
func! AddToWatch()
    let word = expand("<cexpr>")
    call vimspector#AddWatch(word)
endfunction

 let g:vimspector_base_dir = expand('$HOME/.config/vimspector-config')
 let g:vimspector_sidebar_width = 60

 nnoremap <leader>dc :call GotoWindow(g:vimspector_session_windows.code)<CR>
 nnoremap <leader>dv :call GotoWindow(g:vimspector_session_windows.variables)<CR>
 nnoremap <leader>dw :call GotoWindow(g:vimspector_session_windows.watches)<CR>
 nnoremap <leader>ds :call GotoWindow(g:vimspector_session_windows.stack_trace)<CR>
 nnoremap <leader>do :call GotoWindow(g:vimspector_session_windows.output)<CR>

 nnoremap <leader>dd :call vimspector#Launch()<CR>
 nnoremap <leader>de :call vimspector#Reset()<CR>
 nnoremap <leader>d_ :call vimspector#Restart()<CR>
 nnoremap <leader>d<space> :call vimspector#Continue()<CR>

 nnoremap <leader>di :call AddToWatch()<CR>
 nnoremap <leader>dX :call vimspector#ClearBreakpoints()<CR>
 nnoremap <leader>dx :call vimspector#ToggleBreakpoint()<CR>

 nnoremap <leader>d<Up>    :call vimspector#StepOut()
 nnoremap <leader>d<Down>  :call vimspector#StepInto()
 nnoremap <leader>d<Right> :call vimspector#StepOver()

 nnoremap <leader>drc :call vimspector#RunToCursor()<CR>

 let g:vimspector_sign_priority = {
    \    'vimspectorBP':         998,
    \    'vimspectorBPCond':     997,
    \    'vimspectorBPDisabled': 996,
    \    'vimspectorPC':         999,
    \ }
