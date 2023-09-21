require('lualine').setup {
    sections = {
        lualine_z = { "os.date('%a %I:%M%p')" }
    },
    options = {
        theme = 'rose-pine'
    },
    extensions = {'nvim-tree'}
}
