" vim:ft=lua
"

nnoremap <leader>vd     :lua vim.lsp.buf.definition()<CR>
nnoremap <leader>vi     :lua vim.lsp.buf.implementation()<CR>
nnoremap <leader>vsh    :lua vim.lsp.buf.signature_help()<CR>
nnoremap <leader>vrr    :lua vim.lsp.buf.references()<CR>
nnoremap <leader>vrn    :lua vim.lsp.buf.rename()<CR>
nnoremap <leader>vh     :lua vim.lsp.buf.hover()<CR>
nnoremap <leader>vn     :lua vim.lsp.diagnostic.goto_next()<CR>

let &t_8f = "\<ESC>[38;2;%lu;%lu;%lum"
let &t_8b = "\<ESC>[48;2;%lu;%lu;%lum"

lua << EOF

local lsp = require'lspconfig'

local on_attach = function(client, bufnr)
    -- Set autocommands conditional on server_capabilities
    if client.resolved_capabilities.document_highlight then
        vim.api.nvim_exec([[
            :hi LspReferenceRead cterm=bold ctermbg=red guibg=LightYellow
            :hi LspReferenceText cterm=bold ctermbg=red guibg=LightYellow
            :hi LspReferenceWrite cterm=bold ctermbg=red guibg=LightYellow
            augroup lsp_document_highlight
                autocmd! * <buffer>
                autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
                autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
            augroup END
        ]], false)
    end
end

lsp.ccls.setup {

    on_attach = on_attach;

    root_dir = lsp.util.root_pattern(".git", ".ccls");

    init_options = {
        compilationDatabaseDirectory = "build";
        cache = {
            directory = "/tmp/ccls-cache";
        };
        index = {
            threads = 0;
        };
        clang = {
            excludeArgs = { "-frounding-math" } ;
        };
    }

}

lsp.texlab.setup {
    on_attach = on_attach;

    settings = {
        latex = {
            build = {
                onSave = true
            },
            lint = {
                onSave = true,
                onChange = false
            }
        }
    }
}

EOF
