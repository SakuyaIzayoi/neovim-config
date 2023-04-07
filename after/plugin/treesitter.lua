require('nvim-treesitter.configs').setup {
    auto_install = true,
    highlight = {
        enable = true,
    }
}

require('tree-sitter-just').setup({})
