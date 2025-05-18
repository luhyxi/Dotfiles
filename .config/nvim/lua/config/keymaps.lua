local map = vim.keymap.set

local builtin = require("telescope.builtin")

map('n', '<C-p>', builtin.find_files, {})
map('n', '<leader>f', builtin.live_grep, {})






