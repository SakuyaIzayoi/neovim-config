vim.o.foldcolumn = '0'
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true

local ufo = require('ufo')

vim.keymap.set('n', 'zR', ufo.openAllFolds)
vim.keymap.set('n', 'zM', ufo.closeAllFolds)

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true
}
local langauge_servers = require('lspconfig').util.available_servers()
for _, ls in ipairs(langauge_servers) do
    require('lspconfig')[ls].setup({
        capabilities = capabilities
    })
end
ufo.setup()
