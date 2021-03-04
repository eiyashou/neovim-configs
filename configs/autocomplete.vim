autocmd BufEnter * lua require'completion'.on_attach()

inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

set completeopt=menuone,noinsert,noselect

let g:completion_enable_auto_popup = 0
let g:completion_sorting = "length"
let g:completion_matching_ignore_case = 1
let g:completion_matching_smart_case = 1
let g:completion_timer_cycle = 200

imap <tab> <Plug>(completion_smart_tab)
imap <s-tab> <Plug>(completion_smart_s_tab)

augroup CompletionTriggerCharacter
    autocmd!
    autocmd BufEnter * let g:completion_trigger_character = ['.']
    autocmd BufEnter *.c,*.cpp let g:completion_trigger_character = ['.', '::']
augroup end

let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy', 'all']
let g:completion_chain_complete_list = {
            \ 'default' : {
            \     'default': [
            \         {'complete_items': ['lsp', 'path']},
            \         {'mode': '<c-p>'},
            \         {'mode': '<c-n>'}],
            \     'string': [
            \         {'complete_items': ['path']},
            \         {'mode': '<c-p>'},
            \         {'mode': '<c-n>'}],
            \     },
            \ 'latex' : {
            \     'default': [
            \         {'complete_items': ['lsp']},
            \         {'mode': '<c-p>'},
            \         {'mode': '<c-n>'}],
            \     'string': [
            \         {'complete_items': ['path']},
            \         {'mode': '<c-p>'},
            \         {'mode': '<c-n>'}],
            \     },
			\'c' : {
            \     'default': [
            \         {'complete_items': ['lsp']},
            \         {'mode': '<c-p>'},
            \         {'mode': '<c-n>'}],
            \     'string': [
            \         {'complete_items': ['path']},
            \         {'mode': '<c-p>'},
            \         {'mode': '<c-n>'}],
            \     }
            \ }
