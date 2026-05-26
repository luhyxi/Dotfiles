local gh = require("misc.const").gh

vim.pack.add({
    { src = gh("williamboman/mason.nvim"), name = "mason" },
    { src = gh("williamboman/mason-lspconfig.nvim") },
    { src = gh("neovim/nvim-lspconfig") },
})

require("mason").setup({
    registries = {
        "github:Crashdummyy/mason-registry",
        "github:mason-org/mason-registry",
    },
})

require("mason-lspconfig").setup({
    automatic_installation = false,
})

local capabilities = require("blink.cmp").get_lsp_capabilities()

require("mason.lua_ls").setup(capabilities)
require("mason.ts_ls").setup(capabilities)
require("mason.denols").setup(capabilities)
require("mason.biome").setup(capabilities)
require("mason.gopls").setup(capabilities)
require("mason.clangd").setup(capabilities)
require("mason.bashls").setup(capabilities)
require("mason.python").setup(capabilities)
