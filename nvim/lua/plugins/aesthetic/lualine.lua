local gh = require("misc.const").gh

vim.pack.add({
    { src = gh("nvim-lualine/lualine.nvim"), name = "lualine"},
})

require("lualine").setup({
    options = {
        theme = "vscode",
    },
})
