vim.opt.termguicolors = true
vim.g.gruvbox_material_background = 'medium'
vim.g.gruvbox_material_foreground = 'material'
vim.g.gruvbox_material_enable_bold = true
--vim.g.gruvbox_material_transparent_background = true
vim.g.gruvbox_material_diagnostic_text_highlight = true
vim.g.gruvbox_material_diagnostic_line_highlight = true
require('rose-pine').setup({
	highlight_groups = {
		['@variable'] = { italic = false },
	},
})
vim.cmd('color rose-pine')

require('transparent').setup {
}
