-- Keybinds
vim.g.maplocalleader = ','

local function map(mode, lhs, rhs, opts)
    local options = {noremap = true, silent = true}
    if opts then
        options = vim.tbl_extend('force', options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

function _G.check_back_space()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

function _G.open_file(f)
    vim.cmd('e ' .. f)
end

map('n', '<leader><space>', '<cmd>noh<cr>')

-- Buffer/Window Movement
map('n', '<A-N>', '<cmd>bnext<cr>')
map('n', '<A-P>', '<cmd>bprev<cr>')
map('n', '<C-H>', '<C-w>h')
map('n', '<C-J>', '<C-w>j')
map('n', '<C-K>', '<C-w>k')
map('n', '<C-L>', '<C-w>l')

map('n', '<C-d>', '<C-d>zz')
map('n', '<C-u>', '<C-u>zz')

map('v', 'J', ":m '>+1<CR>gv=gv")
map('v', 'K', ":m '<-2<CR>gv=gv")

map('n', '<leader>k', '<cmd>cnext<CR>zz')
map('n', '<leader>j', '<cmd>cprev<CR>zz')

-- Grungo
map('n', 'Q', '<nop>')

-- Paste buffer trickery
map('x', '<leader>p', '\"_dP')

vim.keymap.set('n', '<leader>af', function()
    vim.lsp.buf.format()
end)

map('n', '<leader>qf', '<cmd>lua vim.lsp.buf.code_action()<CR>')

-- Neovide keybinds
if vim.g.neovide then
    vim.keymap.set('n', '<C-c>', '"+y')
    vim.keymap.set('n', '<C-v>', '"+P')
    vim.keymap.set('i', '<C-v>', '<ESC>l"+Pli')
end

