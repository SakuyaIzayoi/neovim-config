return {
	{
		"aserowy/tmux.nvim",
		config = function()
			require("tmux").setup()
		end,
	},
	{ "nathangrigg/vim-beancount", ft = "beancount" },
	{ "hashivim/vim-terraform", ft = "terraform" },
	{ "pearofducks/ansible-vim", ft = "yaml" },
	{ "nvim-tree/nvim-web-devicons", lazy = true },
	{
		"nvim-tree/nvim-tree.lua",
		cmd = "NvimTreeToggle",
		keys = {
			{ "<F8>", "<cmd>NvimTreeToggle<cr>", desc = "Toggle NvimTree" },
		},
		config = function()
			require("nvim-tree").setup()
		end,
	},
    {
        "stevearc/oil.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function ()
            require("oil").setup {
                columns = { "icon" },
                keymaps = {
                    ["<C-h>"] = false,
                    ["M-h"] = "actions.select_split",
                },
                view_options = {
                    show_hidden = true,
                },
            }

            -- Open parent directory in current window
            vim.keymap.set("n", "-", "<cmd>Oil<cr>", { desc = "Open parent directory" })

            -- Open parent directory in floating window
            vim.keymap.set("n", "<space>-", require("oil").toggle_float)
        end,
    },
	{
		"akinsho/bufferline.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = true,
	},
	{
		"kylechui/nvim-surround",
		event = "InsertEnter",
		config = function()
			require("nvim-surround").setup()
		end,
	},
	{
		"altermo/ultimate-autopair.nvim",
		event = { "InsertEnter", "CmdlineEnter" },
		branch = "v0.6",
		config = function()
			require("ultimate-autopair").setup()
		end,
	},
	{ "dstein64/vim-startuptime", cmd = "StartupTime" },
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			sections = {
				lualine_x = {
					{
						require("lazy.status").updates,
						cond = require("lazy.status").has_updates,
						color = { fg = "#f6c177" },
					},
				},
				lualine_z = { 'os.date("%a %-I:%M%P")' },
			},
			options = {
				theme = "auto",
				disabled_filetypes = { statusline = { "startup" } },
			},
			extensions = { "nvim-tree", "trouble" },
		},
	},
	{
		"mbbill/undotree",
		cmd = { "UndotreeToggle" },
		keys = {
			{ "<leader>u", "<cmd>UndotreeToggle<cr>", desc = "UndoTree" },
		},
	},
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = true,
	},
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		keys = {
			{ "<leader>xx", "<cmd>TroubleToggle<cr>", noremap = true },
		},
	},
	{
		"kevinhwang91/nvim-ufo",
		dependencies = "kevinhwang91/promise-async",
		event = { "BufReadPost", "BufNewFile", "BufWritePre" },
		keys = {
			{
				"zR",
				function()
					require("ufo").openAllFolds()
				end,
				desc = "UFO OpenAllFolds",
			},
			{
				"zM",
				function()
					require("ufo").closeAllFolds()
				end,
				desc = "UFO CloseAllFolds",
			},
		},
		config = function()
			vim.o.foldcolumn = "0"
			vim.o.foldlevel = 99
			vim.o.foldlevelstart = 99
			vim.o.foldenable = true

			require("ufo").setup()
		end,
	},
	{
		"startup-nvim/startup.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		opts = {
			theme = "lichform",
		},
	},
	{
		"folke/neodev.nvim",
		ft = "lua",
	},
}
