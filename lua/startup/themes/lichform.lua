local user_bookmarks = vim.g.startup_bookmarks

local bookmark_texts = { "Bookmarks", "" }
local user_bookmark_mappings = {}

if not user_bookmarks then
    user_bookmarks = {}
    bookmark_texts = {}
end

for key, file in pairs(user_bookmarks) do
    bookmark_texts[#bookmark_texts+1] = key .. " " .. file
end

for key, file in pairs(user_bookmarks) do
    user_bookmark_mappings[key] = "<cmd>e " .. file .. "<CR>"
end

local settings = {
    header = {
        type = "text",
        oldfiles_directory = false,
        align = "center",
        fold_section = false,
        title = "Header",
        margin = 5,
        content = {
            '      ..    .                                                                                 ',
            'x .d88"    @88>              .uef^"       oec :                                               ',
            ' 5888R     %8P             :d88E         @88888         u.      .u    .      ..    .     :    ',
            ' \'888R      .          .   `888E         8"*88%   ...ue888b   .d88B :@8c   .888: x888  x888.  ',
            '  888R    .@88u   .udR88N   888E .z8k    8b.      888R Y888r ="8888f8888r ~`8888~\'888X`?888f` ',
            '  888R   \'\'888E` <888\'888k  888E~?888L  u888888>  888R I888>   4888>\'88"    X888  888X \'888>  ',
            '  888R     888E  9888 \'Y"   888E  888E   8888R    888R I888>   4888> \'      X888  888X \'888>  ',
            '  888R     888E  9888       888E  888E   8888P    888R I888>   4888>        X888  888X \'888>  ',
            '  888R     888E  9888       888E  888E   *888>   u8888cJ888   .d888L .+     X888  888X \'888>  ',
            ' .888B .   888&  ?8888u../  888E  888E   4888     "*888*P"    ^"8888*"     "*88%""*88" \'888!` ',
            ' ^*888%    R888"  "8888P\'  m888N= 888>   \'888       \'Y"          "Y"         `~    "    `"`   ',
            '   "%       ""      "P\'     `Y"   888     88R                                                 ',
            '                                 J88"     88>                                                 ',
            '                                 @%       48                                                  ',
            '                               :"         \'8                                                  ',
        },
        highlight = "Statement",
        default_color = "",
        oldfiles_amount = 0,
    },
    body = {
        type = "mapping",
        oldfiles_directory = false,
        align = "center",
        fold_section = false,
        title = "Basic Commands",
        margin = 5,
        content = {
            { " Find File", "Telescope find_files", "<leader>ff" },
            { " Find Word", "Telescope live_grep", "<leader>lg" },
            { " Recent Files", "Telescope oldfiles", "<leader>of" },
            { " File Browser", "Telescope file_browser", "<leader>fb" },
            { " New File", "lua require'startup'.new_file()", "<leader>nf" },
        },
        highlight = "String",
        default_color = "",
        oldfiles_amount = 0,
    },
    bookmarks = {
        type = "text",
        align = "center",
        margin = 5,
        content = bookmark_texts,
        highlight = "String",
    },
    footer = {
        type = "text",
        oldfiles_directory = false,
        align = "center",
        fold_section = false,
        title = "Footer",
        margin = 5,
        content = { "😭 😭 😭" },
        highlight = "Number",
        default_color = "",
        oldfiles_amount = 0,
    },
    options = {
        after = function ()
            require("startup").create_mappings(user_bookmark_mappings)
        end,
        mapping_keys = true,
        empty_lines_between_mappings = true,
        disable_statuslines = true,
        paddings = { 1, 3, 2, 2, 1 }
    },
    mappings = {
        execute_command = "<CR>",
        open_file = "o",
        open_file_split = "<c-o>",
        open_section = "<TAB>",
        open_help = "?",
    },
    colors = {
        background = "#1f2227",
        folded_section = "#56b6c2"
    },
    parts = { "header", "body", "bookmarks", "footer" },
}
return settings
