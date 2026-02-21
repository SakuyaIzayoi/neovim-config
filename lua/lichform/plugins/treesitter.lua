return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    branch = "main",
	build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile", "BufWritePre" },
    cmd = { "TSUpdateSync", "TSUpdate", "TSInstall", "TSLog", "TSUninstall" },
    dependencies = {
      {
        "nvim-treesitter/nvim-treesitter-textobjects",
      },
    },
    opts = {
      highlight = {
        enable = true,
      },
      indent = {
        enable = true,
      },
      ensure_installed = {
        "bash",
        "c",
        "diff",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "query",
        "regex",
        "vim",
        "vimdoc",
        "yaml",
      },
    },
	config = function(_, opts)
	  local TS = require("nvim-treesitter")
	  TS.setup(opts)
	  TS.install(opts.ensure_installed)
	end,
  },
  {
    "IndianBoy42/tree-sitter-just",
    ft = "just",
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
	enabled = true,
    event = { "BufReadPost", "BufNewFile", "BufWritePre" },
    opts = { mode = "cursor", max_lines = 3 },
    keys = {
      {
        "<leader>tc",
        function()
          local tsc = require("treesitter-context")
          tsc.toggle()
        end,
        desc = "Toggle Treesitter Context",
      },
    },
  },
  {
    "RRethy/nvim-treesitter-textsubjects",
	enabled = false,
    main = "nvim-treesitter.configs",
    opts = {
      textsubjects = {
        enable = true,
        prev_selection = ",",
        keymaps = {
          ["."] = "textsubjects-smart",
          [";"] = "textsubjects-container-outer",
          ["i;"] = { "textsubjects-container", desc = "Select inside containers (classes, functions, etc.)" },
        },
      },
    },
  },
}
