local opt = vim.opt
local cmd = vim.cmd

-- Setting plugins up
cmd('filetype plugin indent on')


-- Tab/Space settings
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true

opt.number = true
opt.relativenumber = true

-- Misc configs
opt.clipboard = "unnamedplus"
