return {
    {
        'aserowy/tmux.nvim',
        config = function()
            require('tmux').setup()
        end,
    },
    { 'nathangrigg/vim-beancount', ft = 'beancount' },
    { 'hashivim/vim-terraform',    ft = 'terraform' },
    { 'pearofducks/ansible-vim',   ft = 'yaml' },
    {
        'nvim-treesitter/nvim-treesitter',
        build = ":TSUpdate",
        event = { 'BufReadPost', 'BufNewFile', 'BufWritePre' },
        config = function()
            require('nvim-treesitter.configs').setup({
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
            })
        end,
    },
    {
        'IndianBoy42/tree-sitter-just',
        ft = 'just',
    },
    { 'nvim-tree/nvim-web-devicons', lazy = true },
    {
        'nvim-tree/nvim-tree.lua',
        cmd = 'NvimTreeToggle',
        keys = {
            { '<F8>', '<cmd>NvimTreeToggle<cr>', desc = "Toggle NvimTree" },
        },
        config = function() require('nvim-tree').setup() end,
    },
    {
        'akinsho/bufferline.nvim',
        version = 'v4.5.*',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function() require('bufferline').setup() end,
    },
    {
        'kylechui/nvim-surround',
        event = 'InsertEnter',
        config = function()
            require('nvim-surround').setup()
        end
    },
    {
        'altermo/ultimate-autopair.nvim',
        event = { 'InsertEnter', 'CmdlineEnter' },
        branch = 'v0.6',
        config = function()
            require('ultimate-autopair').setup()
        end
    },
    { 'dstein64/vim-startuptime',    cmd = "StartupTime" },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require('lualine').setup({
                sections = {
                    lualine_x = {
                        {
                            require('lazy.status').updates,
                            cond = require('lazy.status').has_updates,
                            color = { fg = '#f6c177' },
                        },
                    },
                    lualine_z = { 'os.date("%a %I:%M%p")' },
                },
                options = {
                    theme = 'rose-pine',
                },
                extensions = { 'nvim-tree' }
            })
        end,
    },
    {
        'mbbill/undotree',
        keys = {
            { '<leader>u', '<cmd>UndotreeToggle<cr>', desc = "UndoTree" },
        },
    },
    {
        'lewis6991/gitsigns.nvim',
        event = { 'BufReadPre', 'BufNewFile' },
        config = function()
            require('gitsigns').setup()
        end
    },
    {
        'folke/trouble.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        keys = {
            { '<leader>xx', '<cmd>TroubleToggle<cr>', noremap = true },
        },
    },
    {
        'kevinhwang91/nvim-ufo',
        dependencies = 'kevinhwang91/promise-async',
        event = { 'BufReadPost', 'BufNewFile', 'BufWritePre' },
        config = function()
            vim.o.foldcolumn = '0'
            vim.o.foldlevel = 99
            vim.o.foldlevelstart = 99
            vim.o.foldenable = true

            local ufo = require('ufo')

            vim.keymap.set('n', 'zR', ufo.openAllFolds)
            vim.keymap.set('n', 'zM', ufo.closeAllFolds)

            ufo.setup()
        end,
    },
    {
        'startup-nvim/startup.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
        },
        config = function()
            require('startup').setup({ theme = 'lichform' })
        end,
    },
    {
        'folke/neodev.nvim',
        event = { 'BufReadPost', 'BufNewFile', 'BufWritePre' },
        config = function() require('neodev').setup({}) end
    },
    {
        'mrcjkb/rustaceanvim',
        ft = 'rust',
    }
}
