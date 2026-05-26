local gh = require("misc.const").gh

vim.g.vimwiki_list = {
    {
        path = "~/Documents/wiki/",
        syntax = "markdown",
        ext = ".md",
        auto_diary_note = 1,
    },
}
vim.g.vimwiki_global_ext = 0

vim.pack.add({
    { src = gh("vimwiki/vimwiki") },
})

vim.api.nvim_create_autocmd("BufNewFile", {
    pattern = "*diary/*.md",
    command = "0r! ~/Documents/wiki/diary.py '%'",
})

vim.api.nvim_create_user_command("DiaryTemplate", function()
    vim.cmd("silent 0r !~/Documents/wiki/diary/generate-diary-template '%'")
end, {})
