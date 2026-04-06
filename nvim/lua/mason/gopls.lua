local M = {}

function M.setup(capabilities, on_attach)
    vim.lsp.config('gopls', {
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
            gopls = {
                semanticTokens = true,
                analyses = {
                    unusedparams = true,
                },
                staticcheck = true,
                gofumpt = true,
                usePlaceholders = true,
                completeUnimported = true,
                hints = {
                    assignVariableTypes = true,
                    compositeLiteralFields = true,
                    constantValues = true,
                    functionTypeParameters = true,
                    parameterNames = true,
                    rangeVariableTypes = true,
                },
                matcher = "fuzzy",
            },
        },
    })
    vim.lsp.enable('gopls')
end

return M
