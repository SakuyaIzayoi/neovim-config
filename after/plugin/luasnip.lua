local cmp = require("cmp")
local cmp_action = require('lsp-zero').cmp_action()

require('luasnip.loaders.from_vscode').lazy_load()

cmp.setup({
  preselect = 'item',
  completion = {
      completeopt = 'menu,menuone,noinsert'
  },
  sources = {
      {name = 'path'},
      {name = 'nvim_lsp'},
      {name = 'nvim_lua'},
      {name = 'buffer', keyword_length = 3},
      {name = 'luasnip', keyword_length = 2},
  },
  mapping = {
    ['<CR>'] = cmp.mapping.confirm({select = false}),
    ["<Tab>"] = cmp_action.luasnip_supertab(),
    ["<S-Tab>"] = cmp_action.luasnip_shift_supertab(),
  },
})
