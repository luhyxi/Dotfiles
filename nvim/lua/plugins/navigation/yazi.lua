local gh = require("misc.const").gh

vim.pack.add({
    { src = gh("mikavilpas/yazi.nvim"), name = "yazi" },
})

local ok, yazi = pcall(require, "yazi")
if ok then
    yazi.setup({
        open_for_directories = true,
        keymaps = {
            show_help = "<f1>",
            change_working_directory = "<c-w>",
        },
    })
    vim.g.loaded_netrwPlugin = 1
    vim.api.nvim_create_autocmd("UIEnter", {
        callback = function()
            require("yazi").setup({
                open_for_directories = true,
            })
        end,
    })
end
