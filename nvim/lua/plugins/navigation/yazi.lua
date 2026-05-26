local gh = require("misc.const").gh

vim.pack.add({
    { src = gh("mikavilpas/yazi.nvim"), name = "yazi" },
})

require("yazi").setup({
    open_for_directories = true,
    keymaps = {
        show_help = "<f1>",
        change_working_directory = "<c-w>",
    },
})

vim.keymap.set("n", "<leader>y", "<cmd>Yazi<cr>", { desc = "Open yazi at the current file" })
