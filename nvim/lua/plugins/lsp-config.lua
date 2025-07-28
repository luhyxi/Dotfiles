return {
    {
        "williamboman/mason.nvim",
        opts = {
            ensure_installed = { "csharpier", "netcoredbg" }
        }
    },
    {
        "nvimtools/none-ls.nvim",
        opts = function(_, opts)
            local nls = require("null-ls").builtins
            opts.sources = vim.list_extend(opts.sources or {}, {
                nls.formatting.biome.with({
                    args = { "format", "--stdin-file-path", "$FILENAME" },
                }),
            })
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        opts = {
            ensure_installed = { "lua_ls", "omnisharp", "ts_ls", "bash-language-server", "biome"},
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
                documentFormattingProvider = false,
            })
            lspconfig.bashls.setup({
                capabilities = capabilities,
            })
            lspconfig.biome.setup({
                capabilities = capabilities,
            })
            vim.api.nvim_create_autocmd("BufWritePre", {
                pattern = { "*.js", "*.jsx", "*.ts", "*.tsx", "*.json" },
                callback = function()
                    vim.lsp.buf.code_action({
                        filter = function(action)
                            return action.title == "Organize Imports"
                        end,
                        apply = true,
                    })
                    vim.lsp.buf.format({ timeout_ms = 1000 })
                end,
            })
        end
    },
}
