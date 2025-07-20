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
            lspconfig.lua_ls.setup({})
            lspconfig.omnisharp.setup({})
            lspconfig.ts_ls.setup({})
        end
    },
}
