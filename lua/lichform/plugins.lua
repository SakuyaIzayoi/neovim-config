local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = ","
require("lazy").setup({
    {
        'aserowy/tmux.nvim',
        config = function()
            require('tmux').setup()
        end,
    },
    { 'nathangrigg/vim-beancount', ft = 'beancount' },
    { 'hashivim/vim-terraform', ft = 'terraform' },
    { 'pearofducks/ansible-vim', ft = 'yaml' },
    { 'nvim-treesitter/nvim-treesitter', build = ":TSUpdate" },
    {
        'nvim-tree/nvim-web-devicons',
        lazy = true,
    },
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
        tag = 'v4.5.0',
        dependencies = {'nvim-tree/nvim-web-devicons'},
        config = function() require('bufferline').setup() end,
    },
    { 'kylechui/nvim-surround', config = function() require('nvim-surround').setup() end },
    'jiangmiao/auto-pairs',
    'sainnhe/gruvbox-material',
    { 'rose-pine/neovim', name = 'rose-pine', priority = 1000 },
    { 'dstein64/vim-startuptime', cmd = "StartupTime" },
    { 'nvim-telescope/telescope.nvim', tag = '0.1.5', dependencies = { 'nvim-lua/plenary.nvim' } },
    {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function() require('lualine').setup({
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
    'xiyaowong/nvim-transparent',
    { 'ThePrimeagen/harpoon', branch = 'harpoon2', dependencies = { 'nvim-lua/plenary.nvim' } },
    {
        'mbbill/undotree',
        keys = {
            { '<leader>u', '<cmd>UndotreeToggle<cr>', desc = "UndoTree" },
        },
    },
    'IndianBoy42/tree-sitter-just',

    -- LSP
    {
        'VonHeikemen/lsp-zero.nvim',
        dependencies = {
            -- Basic LSP Support
            'neovim/nvim-lspconfig',
            {
                'williamboman/mason.nvim',
                build = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
            'williamboman/mason-lspconfig.nvim',

            -- Autocomplete
            {
                'hrsh7th/nvim-cmp',
                event = "InsertEnter",
                dependencies = {
                    'hrsh7th/cmp-buffer',
                    'hrsh7th/cmp-path',
                }
            },
            'saadparwaiz1/cmp_luasnip',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-nvim-lua',

            -- Snippets
            'L3MON4D3/LuaSnip',
            'rafamadriz/friendly-snippets'
        },
    },
    {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup()
        end
    },
    {
        'folke/trouble.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
    },
    { 'kevinhwang91/nvim-ufo', dependencies = 'kevinhwang91/promise-async' },
    {
        'startup-nvim/startup.nvim',
        dependencies = {
            'nvim-telescope/telescope.nvim',
            'nvim-lua/plenary.nvim',
        },
        config = function ()
            require('startup').setup({ theme = 'lichform' })
        end,
    },
    'folke/neodev.nvim',
    {
        'mrcjkb/rustaceanvim',
        ft = 'rust',
    }
},
{
    checker = {
        enabled = true,
        notify = false,
    }
})
