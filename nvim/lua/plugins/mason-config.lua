return {
    {
        "williamboman/mason-lspconfig.nvim",

        dependencies = {
            "williamboman/mason.nvim",
            "neovim/nvim-lspconfig",
            "saghen/blink.cmp",
        },

        config = function()
            require("mason-lspconfig").setup({
                automatic_installation = false,
            })

            local lspconfig = require("lspconfig")
            local capabilities = require("blink.cmp").get_lsp_capabilities()

            -- shared on_attach for all LSPs
            local on_attach = function(client, bufnr) end

            -- General configs for every single lsp
            -- lua_ls
            local lua_ls = require("mason.lua_ls")
            lua_ls.setup(capabilities, on_attach)

            -- ts_ls
            local ts_ls = require("mason.ts_ls")
            ts_ls.setup(capabilities, on_attach)

            -- biome
            local biome = require("mason.biome")
            biome.setup(capabilities, on_attach)
            -- gopls
            local gopls = require("mason.gopls")
            gopls.setup(capabilities, on_attach)
        end,
    },
}
