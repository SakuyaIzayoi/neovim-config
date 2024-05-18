-- Keybinds
local function map(mode, lhs, rhs, opts)
	local options = { noremap = true, silent = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map("n", "<leader><space>", "<cmd>noh<cr>")

-- Buffer/Window Movement
map("n", "<A-N>", "<cmd>bnext<cr>")
map("n", "<A-P>", "<cmd>bprev<cr>")

map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

map("n", "<leader>k", "<cmd>cnext<CR>zz")
map("n", "<leader>j", "<cmd>cprev<CR>zz")

-- Grungo
map("n", "Q", "<nop>", { desc = "Grungo" })
map("n", "q:", "<nop>", { desc = "Grungo" })

-- Paste buffer trickery
map("x", "<leader>p", '"_dP')

vim.keymap.set("n", "<leader>qf", function()
	vim.lsp.buf.code_action()
end, { noremap = true, silent = true, desc = "LSP Code Action" })

-- Neovide keybinds
if vim.g.neovide then
	vim.keymap.set("n", "<C-c>", '"+y')
	vim.keymap.set("n", "<C-v>", '"+P')
	vim.keymap.set("i", "<C-v>", '<ESC>l"+Pli')
end

vim.keymap.set("n", "<leader>tih", function()
	vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({}))
end, { noremap = true, silent = true, desc = "Toggle Inlay Hints" })
