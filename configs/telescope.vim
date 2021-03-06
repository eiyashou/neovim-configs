" vim:ft=lua
"

" Find files using Telescope command-line sugar. "
nnoremap <leader>ff :lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg :lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>ft :lua require('telescope.builtin').grep_string({search = 'TODO'})<cr>
nnoremap <leader>fb :lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh :lua require('telescope.builtin').help_tags()<cr>
nnoremap <leader>fc :lua require('telescope.builtin').find_files({prompt="Dotfiles", cwd="~/.config/nvim/"})<cr>

nnoremap <leader>vfd :lua require('telescope.builtin').lsp_workspace_diagnostics()<cr>
nnoremap <leader>vca :lua require('telescope.builtin').lsp_code_Actions()<cr>

nnoremap <leader>gc :lua require('telescope.builtin').git_commits({layout_strategy = "horizontal"})<cr>
nnoremap <leader>gb :lua require('telescope.builtin').git_branches()<cr>
nnoremap <leader>gs :lua require('telescope.builtin').git_status({layout_strategy = "horizontal"})<cr>

lua << EOF

local actions = require('telescope.actions')
require('telescope').setup{ defaults = {
    layout_strategy = "vertical",
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
