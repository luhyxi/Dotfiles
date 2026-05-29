local map = vim.keymap.set

vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- Explorer stuff
map("n", "<leader>f", function() require("telescope.builtin").find_files() end, { desc = "Find files in the working directory" })
map("n", "<leader>g", function() require("telescope.builtin").live_grep() end, { desc = "Live GREPs the working directory" })
map("n", "<leader>b", function() require("telescope.builtin").buffers() end, { desc = "Opens GREP for recent buffers" })
map("n", "<leader>q", ":quit<CR>", { desc = "Quits buffer" })
map("n", "<leader>w", ":write<CR>", { desc = "Writes to buffer" })

-- LSP Keymaps
map("n", "K", vim.lsp.buf.hover, { desc = "Display info over function" })
map("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic error messages" })
map("n", "gd", function() require("telescope.builtin").lsp_definitions() end, { desc = "Go to definition (Telescope)" })

map("n", "grr", function() require("telescope.builtin").lsp_references() end, { desc = "Lists all references using Telescope" })

map("n", "gtd", function() require("telescope.builtin").lsp_type_definitions() end, { desc = "Go to type definition (Telescope)" })

map("n", "d", '"_d', { noremap = true, silent = true, desc = "Delete without copying" })
map("v", "d", '"_d', { noremap = true, silent = true, desc = "Delete without copying" })
map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Show avalible code actions" })

map("n", "<leader>=", vim.lsp.buf.format, { desc = "Format entire file with = operator" })

map("n", "<leader>G", ":Gitsigns preview_hunk<CR>", { desc = "Preview git hunk" })

-- yazi keymaps
map("n", "<leader>y", "<cmd>Yazi<cr>", { desc = "Open yazi at the current file" })

-- tmux keymaps
map("n", "<C-h>", function() require("nvim-tmux-navigation").NvimTmuxNavigateLeft() end)
map("n", "<C-j>", function() require("nvim-tmux-navigation").NvimTmuxNavigateDown() end)
map("n", "<C-k>", function() require("nvim-tmux-navigation").NvimTmuxNavigateUp() end)
map("n", "<C-l>", function() require("nvim-tmux-navigation").NvimTmuxNavigateRight() end)
map("n", "<C-\\>", function() require("nvim-tmux-navigation").NvimTmuxNavigateLastActive() end)
map("n", "<C-Space>", function() require("nvim-tmux-navigation").NvimTmuxNavigateNext() end)
