vim.g.mapleader = ","
vim.g.maplocalleader = ","

local map = vim.keymap.set

local builtin = require("telescope.builtin")

-- Explorer stuff
map('n', '<C-p>', builtin.find_files, { desc = 'Find files in the working directory'})
map('n', '<leader>f', builtin.live_grep, { desc = 'Live GREPs the working directory'})
map('n', '<C-b>', ':Neotree filesystem reveal left<CR>', { desc = 'Opens the explorer'})
map('n', '<C-CR>', '<C-]>', { desc = 'go-to-definition' })

-- Tab stuff
map('n', '<leader>tt', ':tabnew<CR>', { desc = 'New tab' })
map('n', '<leader>tq', ':tabclose<CR>', { desc = 'Close tab' })
map('n', '<A-,>', 'gT', { desc = 'Go to previous tab' })
map('n', '<A-.>', 'gt', { desc = 'Go to next tab' })

-- Splitter resizing and stuff
map('n', '<A-S-k>', '<cmd>resize +2<CR>', { desc = 'Increase window height' })
map('n', '<A-S-j>', '<cmd>resize -2<CR>', { desc = 'Decrease window height' })
map('n', '<A-S-h>', '<cmd>vertical resize -2<CR>', { desc = 'Decrease window width' })
map('n', '<A-S-l>', '<cmd>vertical resize +2<CR>', { desc = 'Increase window width' })
map('n', '<A-h>', '<C-w>h', { desc = 'Move to left window' })
map('n', '<A-j>', '<C-w>j', { desc = 'Move to bottom window' })
map('n', '<A-k>', '<C-w>k', { desc = 'Move to top window' })
map('n', '<A-l>', '<C-w>l', { desc = 'Move to right window' })

-- LSP Keymaps
map('n', 'K', vim.lsp.buf.hover, { desc = 'Display info over function'})
map('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic error messages' })
map('n', 'gd', vim.lsp.buf.definition, { })
map({'n', 'v'}, '<leader>ca', vim.lsp.buf.code_action, { })
map('n', '<leader>d', '"_dd', { noremap = true, silent = true })

