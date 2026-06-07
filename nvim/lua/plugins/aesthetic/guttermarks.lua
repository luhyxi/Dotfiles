local gh = require("misc.const").gh

vim.pack.add({
    { src = gh("dimtion/guttermarks.nvim")},
})

require("guttermarks").setup({
})
