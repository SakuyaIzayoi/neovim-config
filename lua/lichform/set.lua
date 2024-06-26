vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.mouse = "nv"

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false

local statedir = vim.fn.stdpath("state")
if vim.uv.os_uname().sysname == "Windows_NT" then
  local homedir = os.getenv("UserProfile")
  vim.opt.undodir = statedir .. "/undodir"
  vim.api.nvim_set_current_dir(homedir .. "/Desktop/dev")

  -- PowerShell
  vim.opt.shell = "pwsh.exe"
  vim.opt.shellcmdflag = "-NoLogo -ExecutionPolicy RemoteSigned -Command"
  vim.opt.shellxquote = ""
  vim.opt.shellquote = ""
  vim.opt.shellpipe = "| Out-File -Encoding UTF8 %s"
  vim.opt.shellredir = "| Out-File -Encoding UTF8 %s"
else
  vim.opt.undodir = statedir .. "/undodir"
end
vim.opt.undofile = true

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.hidden = true
vim.opt.updatetime = 50
vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

if vim.g.neovide then
  vim.o.guifont = "FiraCode NFM"
end

local config_dir = vim.fn.stdpath("config")
-- Bookmarks for startup
vim.g.startup_bookmarks = {
  ["P"] = config_dir .. "/lua/lichform/plugins/init.lua",
  ["K"] = config_dir .. "/lua/lichform/keybinds.lua",
}

vim.diagnostic.config({
  virtual_text = true,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "lua" },
  callback = function()
    vim.bo.tabstop = 2
    vim.bo.shiftwidth = 2
  end,
  desc = "Set tab width for Lua",
})
