local map = vim.keymap.set
local nvim_tmux_nav = require("nvim-tmux-navigation")

local builtin = require("telescope.builtin")

-- Explorer stuff
map("n", "<leader>f", builtin.find_files, { desc = "Find files in the working directory" })
map("n", "<leader>g", builtin.live_grep, { desc = "Live GREPs the working directory" })
map("n", "<leader>b", builtin.buffers, { desc = "Opens GREP for recent buffers" })
map("n", "<leader>q", ":quit<CR>", { desc = "Quits buffer" })
map("n", "<leader>w", ":write<CR>", { desc = "Writes to buffer" })

-- LSP Keymaps
map("n", "K", vim.lsp.buf.hover, { desc = "Display info over function" })
map("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic error messages" })
map("n", "gd", builtin.lsp_definitions, { desc = "Go to definition (Telescope)" })

map("n", "grr", builtin.lsp_references, { desc = "Lists all references using Telescope" })

map("n", "gtd", builtin.lsp_type_definitions, { desc = "Go to type definition (Telescope)" })

map("n", "d", '"_d', { noremap = true, silent = true, desc = "Delete without copying" })
map("v", "d", '"_d', { noremap = true, silent = true, desc = "Delete without copying" })
map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Show avalible code actions" })
map("n", "<leader>=", vim.lsp.buf.format, { desc = "Format entire file with = operator" })

map("n", "<leader>G", ":Gitsigns preview_hunk<CR>", { desc = "Preview git hunk" })

-- tmux keymaps
map("n", "<C-h>", nvim_tmux_nav.NvimTmuxNavigateLeft)
map("n", "<C-j>", nvim_tmux_nav.NvimTmuxNavigateDown)
map("n", "<C-k>", nvim_tmux_nav.NvimTmuxNavigateUp)
map("n", "<C-l>", nvim_tmux_nav.NvimTmuxNavigateRight)
map("n", "<C-\\>", nvim_tmux_nav.NvimTmuxNavigateLastActive)
map("n", "<C-Space>", nvim_tmux_nav.NvimTmuxNavigateNext)
