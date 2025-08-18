local pid = vim.fn.getpid()

return {
    "williamboman/mason-lspconfig.nvim",

    dependencies = {
        "williamboman/mason.nvim",
        "neovim/nvim-lspconfig",
        "saghen/blink.cmp",
    },

    config = function()
        require("mason-lspconfig").setup({
            ensure_installed = { "lua_ls", "ts_ls", "biome", "omnisharp", "gopls" },
            automatic_installation = true,
        })

        local lspconfig = require("lspconfig")
        local capabilities = require("blink.cmp").get_lsp_capabilities()

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

        -- omnisharp
        lspconfig.omnisharp.setup({
            capabilities = capabilities,
            on_attach = on_attach,
            root_dir = lspconfig.util.root_pattern(
                "*.sln",
                "*.csproj",
                "omnisharp.json",
                "function.json",
                "global.json"
            ),
            filetypes = { "cs", "vb" },
            cmd = {
                "/home/luana/.local/share/nvim/mason/packages/omnisharp/libexec/OmniSharp.dll",
                "--languageserver",
                "--hostPID",
                tostring(pid),
            },
            settings = {
                FormattingOptions = {
                    EnableEditorConfigSupport = true,
                    OrganizeImports = true,
                },
                MsBuild = {
                    LoadProjectsOnDemand = true,
                },
                RoslynExtensionsOptions = {
                    EnableAnalyzersSupport = true,
                    EnableImportCompletion = true,
                },
            },
        })

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

