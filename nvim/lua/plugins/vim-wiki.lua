return {
    {
        "vimwiki/vimwiki",
        init = function()
            vim.g.vimwiki_list = {
                {
                    path = "~/Documents/wiki/",
                    syntax = "markdown",
                    ext = ".md",
                    auto_diary_note = 1,
                },
            }
            vim.g.vimwiki_global_ext = 0
            vim.api.nvim_create_user_command("DiaryTemplate", function()
                vim.cmd("silent 0r !~/Documents/wiki/diary/generate-diary-template '%'")
            end, {})
        end,
    },
}
