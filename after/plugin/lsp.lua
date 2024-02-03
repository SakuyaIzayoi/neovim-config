local lsp = require('lsp-zero').preset({})
lsp.nvim_workspace()

-- rust-tools uses nvim-lspconfig under the hood so skip lsp-zero's config
lsp.skip_server_setup({ 'rust-analyzer' })
local rt = require('rust-tools')
rt.setup({
    server = {
        on_attach = function(_, bufnr)
            vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
        end,
        settings = {
            ["rust-analyzer"] = {
                checkOnSave = {
                    command = "clippy"
                },
            },
        },
    },
})

require('neodev').setup({})
require('lspconfig').lua_ls.setup({
    settings = {
        Lua = {
            completion = {
                callSnippet = "Replace"
            },
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
})

lsp.setup()

-- Trouble
vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>", { silent = true, noremap = true })

vim.diagnostic.config({
    virtual_text = true,
})
