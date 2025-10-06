local opt = vim.opt
local cmd = vim.cmd

-- setting plugins up
--cmd('filetype plugin indent on')

-- tab/space settings
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true

opt.number = true
opt.relativenumber = true

-- search settings
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false
opt.incsearch = true

-- visual settings
opt.colorcolumn = "140"
opt.signcolumn = "yes"

-- file handling
opt.undofile = true
opt.autoread = true

-- misc configs
opt.clipboard = "unnamedplus"
opt.iskeyword:append("-")
opt.mouse = "a"
opt.wrap = false
opt.whichwrap:append("<,>,h,l,[,]")
opt.winborder = "rounded"
