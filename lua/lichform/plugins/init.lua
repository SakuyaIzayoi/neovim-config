return {
  { "aserowy/tmux.nvim", config = true },
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
    config = true,
  },
  {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
      { "-", "<cmd>Oil<cr>", desc = "Oil: Open parent directory" },
      {
        "<space>-",
        function()
          require("oil").toggle_float()
        end,
        desc = "Oil: Open parent dir in floating window",
      },
    },
    cmd = "Oil",
    opts = {
      columns = { "icon" },
      keymaps = {
        ["<C-h>"] = false,
        ["M-h"] = "actions.select_split",
      },
      view_options = {
        show_hidden = true,
      },
    },
    config = true,
  },
  {
    "akinsho/bufferline.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = true,
  },
  {
    "kylechui/nvim-surround",
    event = "InsertEnter",
    config = true,
  },
  {
    "altermo/ultimate-autopair.nvim",
    event = { "InsertEnter", "CmdlineEnter" },
    branch = "v0.6",
    config = true,
  },
  { "dstein64/vim-startuptime", cmd = "StartupTime" },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = function()
      local icons = require("lichform.config").icons.diagnostics
      return {
        sections = {
          lualine_b = {
            "branch",
            "diff",
            {
              "diagnostics",
              sources = { "nvim_lsp" },
              symbols = {
                error = icons.Error,
                warn = icons.Warn,
                info = icons.Info,
                hint = icons.Hint,
              },
            },
          },
          lualine_x = {
            {
              require("lazy.status").updates,
              cond = require("lazy.status").has_updates,
              color = { fg = "#f6c177" },
            },
            "encoding",
            "fileformat",
            "filetype",
          },
          lualine_z = { "location", "os.date('%a %-I:%M%P')" },
        },
        options = {
          theme = "auto",
          globalstatus = true,
          disabled_filetypes = { statusline = { "startup" } },
        },
        extensions = { "nvim-tree", "trouble", "lazy", "mason", "oil" },
      }
    end,
  },
  {
    "mbbill/undotree",
    cmd = { "UndotreeToggle" },
    keys = {
      { "<leader>u", "<cmd>UndotreeToggle<cr>", desc = "Toggle UndoTree" },
    },
  },
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = true,
  },
  {
    "folke/trouble.nvim",
    branch = "dev",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd = "Trouble",
    keys = {
      { "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", desc = "Toggle Diagnostics (Trouble)" },
      { "<leader>cs", "<cmd>Trouble symbols toggle focus=false<cr>", desc = "Symbols (Trouble)" },
      { "<leader>xL", "<cmd>Trouble loclist toggle<cr>", desc = "Location list (Trouble)" },
      { "<leader>xQ", "<cmd>Trouble qflist toggle<cr>", desc = "Quickfix list (Trouble)" },
    },
    opts = {},
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
        desc = "UFO: Open All Folds",
      },
      {
        "zM",
        function()
          require("ufo").closeAllFolds()
        end,
        desc = "UFO: Close All Folds",
      },
    },
    init = function()
      vim.o.foldcolumn = "0"
      vim.o.foldlevel = 99
      vim.o.foldlevelstart = 99
      vim.o.foldenable = true
    end,
    config = true,
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
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {
      groups = {
        { "z", group = "fold" },
        { "<leader>c", group = "code" },
        { "<leader>f", group = "filecode" },
        { "<leader>t", group = "toggles" },
      },
    },
    config = function(_, opts)
      local wk = require("which-key")
      wk.add(opts.groups)
    end,
  },
  {
    "rcarriga/nvim-notify",
    keys = {
      {
        "<leader>nd",
        function()
          require("notify").dismiss({ silent = true, pending = true })
        end,
      },
    },
    opts = {
      stages = "static",
      timeout = 3000,
      max_height = function()
        return math.floor(vim.o.lines * 0.75)
      end,
      max_width = function()
        return math.floor(vim.o.columns * 0.75)
      end,
      on_open = function(win)
        vim.api.nvim_win_set_config(win, { zindex = 100 })
      end,
    },
    init = function()
      vim.notify = require("notify")
    end,
  },
  {
    "mfussenegger/nvim-ansible",
    ft = "yaml",
  },
}
