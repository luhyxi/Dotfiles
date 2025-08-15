local pid = vim.fn.getpid()
return {
    {
        "saghen/blink.cmp",
        lazy = false, -- lazy loading handled internally
        dependencies = "rafamadriz/friendly-snippets",
        version = "v0.*",
        opts = {
            keymap = { preset = "default" },
            appearance = {
                use_nvim_cmp_as_default = true,
                nerd_font_variant = "mono",
            },
            sources = {
                default = { "lsp", "path", "snippets", "buffer" },
                providers = {
                    buffer = {
                        min_keyword_length = 1,
                    },
                    path = {
                        min_keyword_length = 0,
                    },
                },
            },
            completion = {
                accept = {
                    auto_brackets = {
                        enabled = true,
                    },
                },
                menu = {
                    draw = {
                        treesitter = { "lsp" },
                    },
                },
                documentation = {
                    auto_show = true,
                    auto_show_delay_ms = 200,
                },
            },
            signature = {
                enabled = true,
            },
            cmdline = {
                keymap = { preset = "inherit" },
                completion = { menu = { auto_show = true } },
            },
        },
        opts_extend = { "sources.default" },
    },
    {
        "williamboman/mason.nvim",
        opts = {},
    },
    {
        "lewis6991/gitsigns.nvim",
        opts = {},
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
                nls.formatting.prettier.with({
                    filetypes = { "html", "css", "scss", "less", "yaml", "markdown" },
                }),
                nls.formatting.stylua,
                nls.code_actions.gitsigns,
            })
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        opts = {
            ensure_installed = { "lua_ls", "ts_ls", "bash-language-server", "biome", "omnisharp", "gopls" },
        },
        dependencies = {
            "williamboman/mason.nvim",
            "neovim/nvim-lspconfig",
            "saghen/blink.cmp",
        },
        config = function()
            local lspconfig = require("lspconfig")
            local capabilities = require("blink.cmp").get_lsp_capabilities()

            -- Common LSP keymaps and on_attach function
            local on_attach = function(client, bufnr)
                local opts = { buffer = bufnr, silent = true }
                vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
                vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
                vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
                vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
                vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
                vim.keymap.set("n", "<leader>f", function()
                    vim.lsp.buf.format({ async = true })
                end, opts)
            end

            -- Setup LSP servers with enhanced configuration
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

            lspconfig.bashls.setup({
                capabilities = capabilities,
                on_attach = on_attach,
            })

            lspconfig.biome.setup({
                capabilities = capabilities,
                on_attach = on_attach,
            })

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
                    "/home/luana/.local/share/nvim/mason/packages/omnisharp/OmniSharp",
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
                        LoadProjectsOnDemand = false,
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

            -- Enhanced auto-formatting with semicolon insertion for specific languages
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

            -- Auto-format on save for other languages
            vim.api.nvim_create_autocmd("BufWritePre", {
                pattern = { "*.lua", "*.go", "*.cs" },
                callback = function()
                    vim.lsp.buf.format({ timeout_ms = 1000 })
                end,
            })

            -- Auto-insert semicolons for C# and JavaScript/TypeScript
            vim.api.nvim_create_autocmd("InsertLeave", {
                pattern = { "*.cs", "*.js", "*.ts", "*.jsx", "*.tsx" },
                callback = function()
                    local line = vim.api.nvim_get_current_line()
                    local trimmed = vim.trim(line)

                    -- Check if line needs semicolon (simple heuristic)
                    if
                        trimmed ~= ""
                        and not vim.endswith(trimmed, ";")
                        and not vim.endswith(trimmed, "{")
                        and not vim.endswith(trimmed, "}")
                        and not vim.endswith(trimmed, ",")
                        and not vim.startswith(trimmed, "//")
                        and not vim.startswith(trimmed, "/*")
                        and not vim.regex(
                            [[^\s*\(if\|else\|for\|while\|switch\|try\|catch\|finally\|using\|namespace\|class\|interface\|enum\)]]
                        ):match_str(trimmed)
                    then
                        vim.api.nvim_set_current_line(line .. ";")
                    end
                end,
            })

            -- Highlight LSP references
            vim.api.nvim_create_autocmd("LspAttach", {
                callback = function(args)
                    local client = vim.lsp.get_client_by_id(args.data.client_id)
                    if client.supports_method("textDocument/documentHighlight") then
                        vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
                            buffer = args.buf,
                            callback = vim.lsp.buf.document_highlight,
                        })
                        vim.api.nvim_create_autocmd("CursorMoved", {
                            buffer = args.buf,
                            callback = vim.lsp.buf.clear_references,
                        })
                    end
                end,
            })
        end,
    },
}
