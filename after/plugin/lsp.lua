local lsp = require('lsp-zero')
lsp.preset('recommended')
lsp.nvim_workspace()

lsp.configure('lua_ls', {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
})

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

lsp.setup()

-- Treesitter folding
vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'

-- Trouble
vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>", { silent = true, noremap = true })

vim.diagnostic.config({
    virtual_text = true,
})
