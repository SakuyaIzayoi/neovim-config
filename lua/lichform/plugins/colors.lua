return {
	{
		"sainnhe/gruvbox-material",
		enabled = false,
		config = function()
			vim.g.gruvbox_material_background = "medium"
			vim.g.gruvbox_material_foreground = "material"
			vim.g.gruvbox_material_enable_bold = true
			--vim.g.gruvbox_material_transparent_background = true
			vim.g.gruvbox_material_diagnostic_text_highlight = true
			vim.g.gruvbox_material_diagnostic_line_highlight = true
		end,
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
		priority = 1000,
		opts = {
			highlight_groups = {
				["@variable"] = { italic = false },
			},
		},
		config = function(_, opts)
			require("rose-pine").setup(opts)
			vim.cmd("colorscheme rose-pine")
		end,
	},
	{
		"xiyaowong/nvim-transparent",
		keys = {
			{ "<leader>tt", "<cmd>TransparentToggle<cr>", desc = "TransparentToggle" },
		},
		config = function()
			require("transparent").setup()
		end,
	},
}
