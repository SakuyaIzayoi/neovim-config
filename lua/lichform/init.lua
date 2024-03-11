-- Lichform

vim.g.mapleader = ","
vim.g.maplocalleader = ","

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

local lazy_opts = {
    checker = {
        enabled = true,
        notify = false,
    },
}

require('lazy').setup('lichform.plugins', lazy_opts)
require('lichform.set')
require('lichform.keybinds')
