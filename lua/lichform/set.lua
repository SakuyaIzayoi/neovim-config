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

if vim.loop.os_uname().sysname == 'Windows_NT' then
    local homedir = os.getenv("UserProfile")
    vim.opt.undodir = homedir .. "/.vim/undodir"
    vim.api.nvim_set_current_dir(homedir .. "/Desktop/dev")
else
    vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
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

-- Bookmarks for startup
vim.g.startup_bookmarks = {
    ["P"] = '~/AppData/Local/nvim/lua/lichform/packer.lua',
    ["K"] = '~/AppData/Local/nvim/lua/lichform/keybinds.lua',
    ["L"] = '~/AppData/Local/nvim/after/plugin/lsp.lua',
}

