return {
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
		keys = {
			{
				"<leader>a",
				function()
					require("harpoon"):list():add()
				end,
				desc = "Harpoon Add",
			},
			{
				"<M-1>",
				function()
					require("harpoon"):list():select(1)
				end,
				desc = "Harpoon File 1",
			},
			{
				"<M-2>",
				function()
					require("harpoon"):list():select(2)
				end,
				desc = "Harpoon File 2",
			},
			{
				"<M-3>",
				function()
					require("harpoon"):list():select(3)
				end,
				desc = "Harpoon File 3",
			},
			{
				"<M-4>",
				function()
					require("harpoon"):list():select(4)
				end,
				desc = "Harpoon File 4",
			},
			"<C-e>",
		},
		config = function()
			local harpoon = require("harpoon")
			harpoon:setup({})

			-- vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
			local conf = require("telescope.config").values
			local function toggle_telescope(harpoon_files)
				local file_paths = {}
				for _, item in ipairs(harpoon_files.items) do
					table.insert(file_paths, item.value)
				end

				require("telescope.pickers")
					.new({}, {
						prompt_title = "Harpoon",
						finder = require("telescope.finders").new_table({
							results = file_paths,
						}),
						previewer = conf.file_previewer({}),
						sorter = conf.generic_sorter({}),
					})
					:find()
			end
			vim.keymap.set("n", "<C-e>", function()
				toggle_telescope(harpoon:list())
			end, { desc = "Open harpoon window" })
		end,
	},
}
