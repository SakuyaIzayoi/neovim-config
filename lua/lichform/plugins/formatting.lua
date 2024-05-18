return {
	{
		"stevearc/conform.nvim",
		keys = {
			{
				"<leader>bf",
				function()
					require("conform").format()
				end,
				mode = "n",
				desc = "Format buffer",
			},
		},
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "black" },
				rust = { "rustfmt" },
			},
		},
	},
}
