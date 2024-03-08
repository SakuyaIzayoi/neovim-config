return {
    {
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
    },
    {
        'IndianBoy42/tree-sitter-just',
        ft = 'just',
    },
    {
        'nvim-treesitter/nvim-treesitter-context',
        event = { 'BufReadPost', 'BufNewFile', 'BufWritePre' },
        opts = { mode = 'cursor', max_lines = 3 },
        keys = {
            {
                '<leader>cc',
                function()
                    local tsc = require('treesitter-context')
                    tsc.toggle()
                end,
                desc = "Toggle Treesitter Context",
            },
        },
    },
}
