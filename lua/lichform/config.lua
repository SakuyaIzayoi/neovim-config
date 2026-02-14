return {
  icons = {
    diagnostics = {
      Error = " ",
      Warn = " ",
      Hint = " ",
      Info = " ",
    },
  },
  lsp = {
    lua_ls = {
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
          -- workspace = {
          --   library = vim.api.nvim_get_runtime_file("", true)
          -- },
          telemetry = {
            enable = false
          },
        },
      },
    },
  },
}
