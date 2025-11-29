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

            local capabilities = require("blink.cmp").get_lsp_capabilities()

            local on_attach = function(client, bufnr)
            end

            -- General configs for every lsp
            require("mason.lua_ls").setup(capabilities, on_attach)
            require("mason.ts_ls").setup(capabilities, on_attach)
            require("mason.biome").setup(capabilities, on_attach)
            require("mason.gopls").setup(capabilities, on_attach)
            require("mason.clangd").setup(capabilities, on_attach)
        end,
    },
}
