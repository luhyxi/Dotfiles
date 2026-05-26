local gh = require("misc.const").gh

vim.pack.add({
    { src = gh("akinsho/toggleterm.nvim"), name = "toggleterm" },
})

require("toggleterm").setup({
    size = 20,
    open_mapping = "<C-t>",
    hide_numbers = true,
    shade_terminals = true,
    persist_size = true,
    close_on_exit = true,
    direction = "float",
    float_opts = {
        border = "curved",
        winblend = 0,
    },
})
