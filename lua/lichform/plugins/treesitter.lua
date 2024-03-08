return {
    'nvim-treesitter/nvim-treesitter',
    build = ":TSUpdate",
    event = { 'BufReadPost', 'BufNewFile', 'BufWritePre' },
    main = 'nvim-treesitter.configs',
    opts = {
        auto_install = true,
        highlight = {
            enable = true,
        },
        indent = {
            enable = true,
        },
        ensure_installed = {
            'c',
            'lua',
            'vim',
            'vimdoc',
            'query',
        },
    },
    {
        'IndianBoy42/tree-sitter-just',
        ft = 'just',
    },
}
