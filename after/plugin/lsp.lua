local lsp_zero = require('lsp-zero')
lsp_zero.on_attach(function(client, bufnr)
    lsp_zero.default_keymaps({buffer = bufnr})
end)

require('mason').setup({})
require('mason-lspconfig').setup({
    handlers = {
        lsp_zero.default_setup,
        lua_ls = function()
            local lua_opts = lsp_zero.nvim_lua_ls()
            require('lspconfig').lua_ls.setup(lua_opts)
        end,
        rust_analyzer = lsp_zero.noop,
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

lsp_zero.setup()

-- Trouble
vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>", { silent = true, noremap = true })

vim.diagnostic.config({
    virtual_text = true,
})
