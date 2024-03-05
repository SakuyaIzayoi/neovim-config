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
        config = function ()
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
        end
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
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.5',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            local builtin = require('telescope.builtin')
            vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
            vim.keymap.set('n', '<C-p>', builtin.git_files, {})
            vim.keymap.set('n', '<leader>ps', function()
                builtin.grep_string({ search = vim.fn.input("Grep > ") });
            end)

            vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
            vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
            vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
            vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

            vim.keymap.set('n', '<leader>gd', builtin.diagnostics, {})
            vim.keymap.set('n', '<leader>gk', builtin.keymaps, {})
            vim.keymap.set('n', '<leader>gr', builtin.registers, {})
        end
    },
    {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build',
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

    -- BEGIN LSP
    {
        'VonHeikemen/lsp-zero.nvim',
        lazy = true,
        init = function()
            vim.g.lsp_zero_extend_cmp = 0
            vim.g.lsp_zero_extend_lspconfig = 0
        end,
    },
    {
        'williamboman/mason.nvim',
        lazy = false,
        config = true,
    },
    -- Autocomplete
    {
        'hrsh7th/nvim-cmp',
        event = "InsertEnter",
        dependencies = {
            {
                'L3MON4D3/LuaSnip',
                dependencies = {
                    'rafamadriz/friendly-snippets',
                },
            },
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
        },
        config = function()
            local lsp_zero = require('lsp-zero')
            lsp_zero.extend_cmp()

            local cmp = require('cmp')
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
        end,
    },
    'saadparwaiz1/cmp_luasnip',
    'hrsh7th/cmp-nvim-lua',

    -- LSP
    {
        'neovim/nvim-lspconfig',
        cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
        event = { 'BufReadPre', 'BufNewFile' },
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'williamboman/mason-lspconfig.nvim',
        },
        config = function()
            local lsp_zero = require('lsp-zero')
            lsp_zero.extend_lspconfig()

            lsp_zero.on_attach(function(client, bufnr)
                lsp_zero.default_keymaps({buffer = bufnr})
            end)

            require('mason-lspconfig').setup({
                ensure_installed = {},
                handlers = {
                    lsp_zero.default_setup,
                    lua_ls = function()
                        local lua_opts = lsp_zero.nvim_lua_ls()
                        require('lspconfig').lua_ls.setup(lua_opts)
                    end,
                    rust_analyzer = lsp_zero.noop,
                }
            })
        end,
    },
    -- END LSP
    {
        'lewis6991/gitsigns.nvim',
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
    {
        'folke/neodev.nvim',
        config = function() require('neodev').setup({}) end
    },
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
