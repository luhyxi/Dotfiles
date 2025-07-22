return {
    {
        "williamboman/mason.nvim",
        opts = {
            ensure_installed = { "csharpier", "netcoredbg" }
        }
    },
    {
        "williamboman/mason-lspconfig.nvim",
        opts = {
            ensure_installed = { "lua_ls", "omnisharp", "ts_ls", "bash-language-server"},
        },
        dependencies = {
            "williamboman/mason.nvim",
            "neovim/nvim-lspconfig",
            "hrsh7th/nvim-cmp",
            "hrsh7th/cmp-nvim-lsp",
        },
        config = function()
            local lspconfig = require("lspconfig")

            -- Get capabilities from nvim-cmp
            local capabilities = require('cmp_nvim_lsp').default_capabilities()

            -- Setup LSP servers with nvim-cmp capabilities
            lspconfig.lua_ls.setup({
                capabilities = capabilities,
            })
            lspconfig.omnisharp.setup({
                capabilities = capabilities,
            })
            lspconfig.ts_ls.setup({
                capabilities = capabilities,
            })
            lspconfig.bashls.setup({
                capabilities = capabilities,
            })
        end
    },
}
