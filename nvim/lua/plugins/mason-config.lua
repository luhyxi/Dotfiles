return {
    "williamboman/mason-lspconfig.nvim",

    dependencies = {
        "williamboman/mason.nvim",
        "neovim/nvim-lspconfig",
        "saghen/blink.cmp",
    },

    config = function()
        require("mason-lspconfig").setup({
            ensure_installed = { "lua_ls", "ts_ls", "biome", "gopls" },
            automatic_installation = true,
        })

        local lspconfig = require("lspconfig")
        local capabilities = require("blink.cmp").get_lsp_capabilities()

        -- shared on_attach for all LSPs
        local on_attach = function(client, bufnr)
            -- Disable formatting from ts_ls; we'll use Biome instead for JS/TS/JSON
            if client.name == "ts_ls" then
                client.server_capabilities.documentFormattingProvider = false
            end

            -- Format on save, preferring Biome for JS/TS/JSON/JSONC
            local augroup = vim.api.nvim_create_augroup("LspFormatOnSave", { clear = false })
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    local ft = vim.bo[bufnr].filetype
                    vim.lsp.buf.format({
                        bufnr = bufnr,
                        filter = function(format_client)
                            if ft == "javascript" or ft == "javascriptreact" or ft == "typescript" or ft == "typescriptreact" or ft == "json" or ft == "jsonc" then
                                return format_client.name == "biome"
                            end
                            return true
                        end,
                    })
                end,
            })
        end

        -- General configs for every single lsp
        -- lua_ls
        lspconfig.lua_ls.setup({
            capabilities = capabilities,
            on_attach = on_attach,
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { "vim" },
                    },
                    workspace = {
                        library = vim.api.nvim_get_runtime_file("", true),
                        checkThirdParty = false,
                    },
                    telemetry = {
                        enable = false,
                    },
                },
            },
        })

        -- ts_ls
        lspconfig.ts_ls.setup({
            capabilities = capabilities,
            on_attach = on_attach,
            documentFormattingProvider = false,
            settings = {
                typescript = {
                    inlayHints = {
                        includeInlayParameterNameHints = "all",
                        includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                        includeInlayFunctionParameterTypeHints = true,
                        includeInlayVariableTypeHints = true,
                        includeInlayPropertyDeclarationTypeHints = true,
                        includeInlayFunctionLikeReturnTypeHints = true,
                        includeInlayEnumMemberValueHints = true,
                    },
                },
                javascript = {
                    inlayHints = {
                        includeInlayParameterNameHints = "all",
                        includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                        includeInlayFunctionParameterTypeHints = true,
                        includeInlayVariableTypeHints = true,
                        includeInlayPropertyDeclarationTypeHints = true,
                        includeInlayFunctionLikeReturnTypeHints = true,
                        includeInlayEnumMemberValueHints = true,
                    },
                },
            },
        })

        -- biome
        lspconfig.biome.setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        -- go
        lspconfig.gopls.setup({
            capabilities = capabilities,
            on_attach = on_attach,
            settings = {
                gopls = {
                    analyses = {
                        unusedparams = true,
                    },
                    staticcheck = true,
                    gofumpt = true,
                    usePlaceholders = true,
                    completeUnimported = true,
                    matcher = "fuzzy",
                },
            },
        })
    end
}

