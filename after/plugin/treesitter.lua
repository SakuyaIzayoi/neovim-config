require('nvim-treesitter.configs').setup {
    auto_install = true,
    sync_install = false,
    ignore_install = {},
    highlight = {
        enable = true,
    },
    ensure_installed = {
        'c',
        'lua',
        'vim',
        'vimdoc',
        'query',
    },
    modules = {},
}

require('tree-sitter-just').setup({})
