local gh = require("misc.const").gh

vim.pack.add({
    {
        src = gh("nvim-treesitter/nvim-treesitter"),
        build = ":TSUpdate",
        install_dir = vim.fn.stdpath("data") .. "/site",
    },
})
