vim.opt.termguicolors = true
vim.g.gruvbox_material_background = 'medium'
vim.g.gruvbox_material_foreground = 'material'
vim.g.gruvbox_material_enable_bold = true
--vim.g.gruvbox_material_transparent_background = true
vim.g.gruvbox_material_diagnostic_text_highlight = true
vim.g.gruvbox_material_diagnostic_line_highlight = true
vim.cmd('color gruvbox-material')

require('transparent').setup {
}
