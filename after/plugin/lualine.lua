require('lualine').setup {
    sections = {
        lualine_z = { "os.date('%a %I:%M%p')" }
    },
    options = {
        theme = 'gruvbox-material'
    },
    extensions = {'nvim-tree'}
}
