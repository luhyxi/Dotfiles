vim.g.mapleader = ","
vim.g.maplocalleader = ","

require("config.lazy")
require("config.keymaps")
require("config.vim_cmd")

require("lazy").setup("plugins")


vim.cmd.colorscheme "catppuccin"
