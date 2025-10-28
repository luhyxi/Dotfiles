local map = vim.keymap.set
local nvim_tmux_nav = require("nvim-tmux-navigation")

local builtin = require("telescope.builtin")

-- Explorer stuff
map("n", "<leader>f", builtin.find_files, { desc = "Find files in the working directory" })
map("n", "<leader>g", builtin.live_grep, { desc = "Live GREPs the working directory" })
map("n", "<leader>b", builtin.buffers, { desc = "Opens GREP for recent buffers" })
map("n", "<leader>q", ":quit<CR>", { desc = "Quits buffer" })
map("n", "<leader>w", ":write<CR>", { desc = "Writes to buffer" })

-- Insert mode stuff
map("i", "<A-d>", [[<Esc>dwi]], { noremap = true, silent = true, desc = "Deletes next word" })

-- Tab stuff
map("n", "<leader>tt", ":tabnew<CR>", { desc = "New tab" })
map("n", "<leader>tq", ":tabclose<CR>", { desc = "Close tab" })
map("n", "<A-,>", "gT", { desc = "Go to previous tab" })
map("n", "<A-.>", "gt", { desc = "Go to next tab" })

-- Splitter resizing and stuff
map("n", "<A-S-k>", "<cmd>resize +2<CR>", { desc = "Increase window height" })
map("n", "<A-S-j>", "<cmd>resize -2<CR>", { desc = "Decrease window height" })
map("n", "<A-S-h>", "<cmd>vertical resize -2<CR>", { desc = "Decrease window width" })
map("n", "<A-S-l>", "<cmd>vertical resize +2<CR>", { desc = "Increase window width" })
map("n", "<A-h>", "<C-w>h", { desc = "Move to left window" })
map("n", "<A-j>", "<C-w>j", { desc = "Move to bottom window" })
map("n", "<A-k>", "<C-w>k", { desc = "Move to top window" })
map("n", "<A-l>", "<C-w>l", { desc = "Move to right window" })

-- LSP Keymaps
map("n", "K", vim.lsp.buf.hover, { desc = "Display info over function" })
map("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic error messages" })
map("n", "gd", vim.lsp.buf.definition, {})
map("n", "gD", "<cmd>tab split | lua vim.lsp.buf.definition()<CR>", {})

map(
    "n",
    "grr",
    vim.lsp.buf.references,
    { desc = "Lists all the references to the symbol under the cursor in the quickfix window" }
)

map("n", "d", '"_d', { noremap = true, silent = true, desc = "Delete without copying" })
map("v", "d", '"_d', { noremap = true, silent = true, desc = "Delete without copying" })
map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Show avalible code actions" })
map("n", "<leader>=", "gg=G", { desc = "Format entire file with = operator" })

-- tmux keymaps
map("n", "<C-h>", nvim_tmux_nav.NvimTmuxNavigateLeft)
map("n", "<C-j>", nvim_tmux_nav.NvimTmuxNavigateDown)
map("n", "<C-k>", nvim_tmux_nav.NvimTmuxNavigateUp)
map("n", "<C-l>", nvim_tmux_nav.NvimTmuxNavigateRight)
map("n", "<C-\\>", nvim_tmux_nav.NvimTmuxNavigateLastActive)
map("n", "<C-Space>", nvim_tmux_nav.NvimTmuxNavigateNext)
