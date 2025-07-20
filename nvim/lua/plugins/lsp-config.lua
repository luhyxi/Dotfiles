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
            ensure_installed = { "lua_ls", "omnisharp", "ts_ls"},
        },
        dependencies = {
            "williamboman/mason.nvim",
            "neovim/nvim-lspconfig",
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

        end
    },
}
