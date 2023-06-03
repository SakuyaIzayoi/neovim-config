vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    --use 'christoomey/vim-tmux-navigator'
    use 'aserowy/tmux.nvim'
    use { 'nathangrigg/vim-beancount', ft = 'beancount' }
    use { 'hashivim/vim-terraform', ft = { 'terraform' } }
    use { 'elixir-editors/vim-elixir', ft = { 'elixir' } }
    use { 'pearofducks/ansible-vim', ft = { 'yaml' } }
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use 'kyazdani42/nvim-web-devicons'
    use 'kyazdani42/nvim-tree.lua'
    use { 'akinsho/bufferline.nvim', tag = 'v4.*', requires = 'kyazdani42/nvim-web-devicons' }
    use { 'kylechui/nvim-surround',
        tag = '*',
        config = function()
            require("nvim-surround").setup({})
        end
    }
    use 'jiangmiao/auto-pairs'
    use 'sainnhe/gruvbox-material'
    use { 'dstein64/vim-startuptime', cmd = { 'StartupTime' } }
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        requires = { { 'nvim-lua/plenary.nvim' } } }
    use {
        'nvim-telescope/telescope-fzf-native.nvim',
        run =
        'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    use { 'xiyaowong/nvim-transparent' }
    use { 'ThePrimeagen/harpoon' }
    use { 'mbbill/undotree' }
    use { 'IndianBoy42/tree-sitter-just' }

    -- LSP
    use {
        'VonHeikemen/lsp-zero.nvim',
        requires = {
            -- Basic LSP Support
            { 'neovim/nvim-lspconfig' },
            {
                'williamboman/mason.nvim',
                run = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
            { 'williamboman/mason-lspconfig.nvim' },

            -- Autocomplete
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },

            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },
        }
    }
    use {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup()
        end
    }
    use { 'simrat39/rust-tools.nvim' }
    use { 'folke/trouble.nvim',
        requires = 'nvim-tree/nvim-web-devicons',
        config = function()
            require("trouble").setup {}
        end }
    use { 'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async' }
    use {
        'startup-nvim/startup.nvim',
        requires = { 'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim' },
        config = function()
            require("startup").setup({theme = "lichform"})
        end
    }
end)
