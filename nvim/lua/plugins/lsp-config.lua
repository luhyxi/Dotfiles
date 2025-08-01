--omnisharp setup
local pid = vim.fn.getpid()

return {
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "saadparwaiz1/cmp_luasnip",
            "L3MON4D3/LuaSnip",
            "rafamadriz/friendly-snippets",
        },
    },
    {
        "williamboman/mason.nvim",
        opts = {
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
                nls.formatting.gofmt,
                nls.formatting.goimports,
            })
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        opts = {
            ensure_installed = { "lua_ls", "ts_ls", "bash-language-server", "biome", "omnisharp", "gopls" }
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
            lspconfig.omnisharp.setup({
                capabilities = capabilities,
                root_dir = lspconfig.util.root_pattern("*.sln", "*.csproj", "omnisharp.json", "function.json", "global.json"),
                filetypes = { "cs", "vb" },
                -- this was the only way i managed to link omnisharp to my neovim rn
                cmd = { "/home/luana/.local/share/nvim/mason/packages/omnisharp/OmniSharp", "--languageserver", "--hostPID", tostring(pid) },
            })
            lspconfig.gopls.setup({
                capabilities = capabilities,
                settings = {
                    gopls = {
                        analyses = {
                            unusedparams = true,
                        },
                        staticcheck = true,
                        gofumpt = true,
                    },
                },
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
