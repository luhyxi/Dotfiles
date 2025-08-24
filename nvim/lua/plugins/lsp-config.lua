return {
    {
        "williamboman/mason.nvim",
        opts = {
            registries = {
                'github:Crashdummyy/mason-registry', -- Add this registry
                'github:mason-org/mason-registry',
            },
        },
    },
    {
        "lewis6991/gitsigns.nvim",
        opts = {},
    },
        "williamboman/mason-lspconfig.nvim",
        opts = {
            ensure_installed = { "lua_ls", "ts_ls", "biome", "omnisharp", "gopls" },
    },
        dependencies = {
            "williamboman/mason.nvim",
            "neovim/nvim-lspconfig",
            "saghen/blink.cmp",
    },
}
