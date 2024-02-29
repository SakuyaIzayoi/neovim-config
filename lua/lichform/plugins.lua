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
    'aserowy/tmux.nvim',
    { 'nathangrigg/vim-beancount', ft = 'beancount' },
    { 'hashivim/vim-terraform', ft = 'terraform' },
    { 'pearofducks/ansible-vim', ft = 'yaml' },
    { 'nvim-treesitter/nvim-treesitter', build = ":TSUpdate" },
    'nvim-tree/nvim-web-devicons',
    'nvim-tree/nvim-tree.lua',
    { 'akinsho/bufferline.nvim', tag = 'v4.*', dependencies = {'nvim-tree/nvim-web-devicons'} },
    { 'kylechui/nvim-surround', tag = '*', config = function() require('nvim-surround').setup({}) end },
    'jiangmiao/auto-pairs',
    'sainnhe/gruvbox-material',
    { 'rose-pine/neovim', name = 'rose-pine' },
    { 'dstein64/vim-startuptime', cmd = "StartupTime" },
    { 'nvim-telescope/telescope.nvim', tag = '0.1.5', dependencies = { 'nvim-lua/plenary.nvim' } },
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' },
    { 'nvim-lualine/lualine.nvim', dependencies = { 'nvim-tree/nvim-web-devicons' } },
    'xiyaowong/nvim-transparent',
    { 'ThePrimeagen/harpoon', branch = 'harpoon2', dependencies = { 'nvim-lua/plenary.nvim' } },
    'mbbill/undotree',
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
            'hrsh7th/nvim-cmp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
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
        build = function()
            require('gitsigns').setup()
        end
    },
    {
        'folke/trouble.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        build = function ()
            require('trouble').setup {}
        end,
    },
    { 'kevinhwang91/nvim-ufo', dependencies = 'kevinhwang91/promise-async' },
    {
        'startup-nvim/startup.nvim',
        dependencies = {
            'nvim-telescope/telescope.nvim',
            'nvim-lua/plenary.nvim',
        },
        build = function ()
            require('startup').setup({ theme = 'lichform' })
        end,
    },
    'folke/neodev.nvim',
    {
        'mrcjkb/rustaceanvim',
        tag = '4.*'
    }
})
