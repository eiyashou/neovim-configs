" vim:ft=lua
"

" Find files using Telescope command-line sugar. "
nnoremap <silent> <leader>ff :lua require('telescope.builtin').find_files()<cr>
nnoremap <silent> <leader>fg :lua require('telescope.builtin').live_grep()<cr>
nnoremap <silent> <leader>ft :lua require('telescope.builtin').grep_string({search = 'TODO'})<cr>
nnoremap <silent> <leader>fb :lua require('telescope.builtin').buffers()<cr>
nnoremap <silent> <leader>fh :lua require('telescope.builtin').help_tags()<cr>
nnoremap <silent> <leader>fc :lua require('telescope.builtin').find_files({prompt="Dotfiles", cwd="~/.config/nvim/"})<cr>

nnoremap <silent> <leader>vfd :lua require('telescope.builtin').lsp_workspace_diagnostics()<cr>
nnoremap <silent> <leader>vca :lua require('telescope.builtin').lsp_code_Actions()<cr>

nnoremap <silent> <leader>gc :lua require('telescope.builtin').git_commits({layout_strategy = "horizontal"})<cr>
nnoremap <silent> <leader>gb :lua require('telescope.builtin').git_branches()<cr>
nnoremap <silent> <leader>gs :lua require('telescope.builtin').git_status({layout_strategy = "horizontal"})<cr>

lua << EOF

local actions = require('telescope.actions')
require('telescope').setup{ defaults = {
    mappings = {
        i = {
            ["<c-c>"] = false,
            ["<C-d>"] = false,
            ["<C-u>"] = false,
            ["<C-Up>"] = actions.preview_scrolling_up,
            ["<C-Down>"] = actions.preview_scrolling_down,
        },
        n = {
            ["<C-d>"] = false,
            ["<C-u>"] = false,
            ["<C-Up>"] = actions.preview_scrolling_up,
            ["<C-Down>"] = actions.preview_scrolling_down,
        },
    },
}}

EOF
