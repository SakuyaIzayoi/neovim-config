return {
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
        cmd = 'Mason',
        build = ':MasonUpdate',
        config = true,
    },
    -- Autocomplete
    {
        'hrsh7th/nvim-cmp',
        event = "InsertEnter",
        dependencies = {
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-nvim-lua',
            'hrsh7th/cmp-nvim-lsp',
            'onsails/lspkind.nvim',
        },
        opts = function()
            local lsp_zero = require('lsp-zero')
            lsp_zero.extend_cmp()

            local cmp = require('cmp')
            local cmp_action = require('lsp-zero').cmp_action()
            local lspkind = require('lspkind')

            return {
                preselect = 'item',
                completion = {
                    completeopt = 'menu,menuone,noinsert'
                },
                sources = {
                    { name = 'path' },
                    { name = 'nvim_lsp' },
                    { name = 'nvim_lua' },
                    { name = 'buffer',  keyword_length = 3 },
                },
                mapping = {
                    ['<CR>'] = cmp.mapping.confirm({ select = false }),
                    ["<Tab>"] = cmp_action.luasnip_supertab(),
                    ["<S-Tab>"] = cmp_action.luasnip_shift_supertab(),
                },
                formatting = {
                    format = lspkind.cmp_format({
                        mode = 'symbol_text',
                        maxwidth = 50,
                        ellipsis_char = '...',
                        show_labelDetails = true,
                    })
                }
            }
        end,
        config = function(_, opts)
            for _, source in ipairs(opts.sources) do
                source.group_index = source.group_index or 1
            end
            require('cmp').setup(opts)
        end,
    },
    {
        'L3MON4D3/LuaSnip',
        dependencies = {
            {
                'rafamadriz/friendly-snippets',
                config = function()
                    require('luasnip.loaders.from_vscode').lazy_load()
                end,
            },
            {
                'nvim-cmp',
                dependencies = {
                    'saadparwaiz1/cmp_luasnip',
                },
                opts = function(_, opts)
                    opts.snippet = {
                        expand = function(args)
                            require('luasnip').lsp_expand(args.body)
                        end,
                    }
                    table.insert(opts.sources, { name = 'luasnip' })
                end,
            },
        },
        keys = {
            {
                '<tab>',
                function()
                    return require('luasnip').jumpable(1) and '<Plug>luasnip-jump-next' or '<tab>'
                end,
                expr = true,
                silent = true,
                mode = 'i',
            },
            { '<tab>',   function() require('luasnip').jump(1) end,  mode = 's' },
            { '<s-tab>', function() require('luasnip').jump(-1) end, mode = { 'i', 's' } },
        },
    },
    {
        'williamboman/mason-lspconfig.nvim',
        lazy = true,
    },
    -- LSP
    {
        'neovim/nvim-lspconfig',
        cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
        event = { 'BufReadPre', 'BufNewFile' },
        config = function()
            local lsp_zero = require('lsp-zero')
            lsp_zero.extend_lspconfig()

            vim.g.inlay_hints_enabled = true

            lsp_zero.on_attach(function(client, bufnr)
                lsp_zero.default_keymaps({ buffer = bufnr })
                vim.lsp.inlay_hint.enable(bufnr, true)
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
    {
        'mrcjkb/rustaceanvim',
        dependencies = {
            'mfussenegger/nvim-dap',
        },
        ft = 'rust',
        config = function ()
            local lsp_zero = require('lsp-zero')
            vim.g.rustaceanvim = {
                server = {
                    capabilities = lsp_zero.get_capabilities()
                },
            }
        end,
    }
}
