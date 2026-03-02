local M = {}

function M.setup(capabilities, on_attach)
    vim.lsp.config('gopls', {
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
    vim.lsp.enable('denols')
end

return M
