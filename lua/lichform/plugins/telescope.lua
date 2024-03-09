return {
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.5',
        cmd = 'Telescope',
        keys = {
            { '<C-p>',      function() require('telescope.builtin').git_files() end, desc = 'Telescope Git Files' },
            {
                '<leader>ps',
                function() require('telescope.builtin').grep_string({ search = vim.fn.input('Grep> ') }) end,
                desc = 'Telescope Git Files'
            },
            { '<leader>ff', require('telescope.builtin').find_files,                 desc = 'Telescope Find Files' },
            { '<leader>fg', require('telescope.builtin').live_grep,                  desc = 'Telescope Live Grep' },
            { '<leader>fb', require('telescope.builtin').buffers,                    desc = 'Telescope Buffers' },
            { '<leader>fh', require('telescope.builtin').help_tags,                  desc = 'Telescope Help Tags' },
            { '<leader>gd', require('telescope.builtin').diagnostics,                desc = 'Telescope Diagnostics' },
            { '<leader>gk', require('telescope.builtin').keymaps,                    desc = 'Telescope Keymaps' },
            { '<leader>gr', require('telescope.builtin').registers,                  desc = 'Telescope Registers' },
        },
        dependencies = {
            'nvim-lua/plenary.nvim',
            {
                'nvim-telescope/telescope-fzf-native.nvim',
                build =
                'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build',
            },
        },
    },
}
