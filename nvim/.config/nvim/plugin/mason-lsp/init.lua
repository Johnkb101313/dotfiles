require('mason').setup()
require('mason-lspconfig').setup()

local capabilities = require('cmp_nvim_lsp').default_capabilities()

local function lsp(server_name)
    require("lspconfig")[server_name].setup({capabilities = capabilities})
end

require('mason-lspconfig').setup_handlers {
    lsp('lua_ls'), lsp('tsserver'), lsp('clangd')
}

-- Keymap
local keymap = vim.keymap.set
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- :help vim.diagnostic.*
keymap('n', '<space>e', vim.diagnostic.open_float)
keymap('n', '[d', vim.diagnostic.goto_prev)
keymap('n', ']d', vim.diagnostic.goto_next)
keymap('n', '<space>q', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer

augroup('UserLspConfig', {clear = true})

autocmd('LspAttach', {
    group = 'UserLspConfig',
    callback = function(ev)

        -- Buffer local mappings.
        -- :help vim.lsp.*
        local opts = {buffer = ev.buf}
        keymap('n', 'gD', vim.lsp.buf.declaration, opts)
        keymap('n', 'gd', vim.lsp.buf.definition, opts)
        keymap('n', 'K', vim.lsp.buf.hover, opts)
        keymap('n', 'gi', vim.lsp.buf.implementation, opts)
        keymap('n', '<C-k>', vim.lsp.buf.signature_help, opts)
        keymap('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
        keymap('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
        keymap('n', '<space>wl', function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, opts)
        keymap('n', '<space>D', vim.lsp.buf.type_definition, opts)
        keymap('n', '<space>rn', vim.lsp.buf.rename, opts)

        keymap({'n', 'v'}, '<space>ca', vim.lsp.buf.code_action, opts)
        keymap('n', 'gr', vim.lsp.buf.references, opts)
        keymap('n', '<space>f',
               function() vim.lsp.buf.format {async = true} end, opts)
    end
})
