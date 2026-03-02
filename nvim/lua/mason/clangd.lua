local M = {}

function M.setup(capabilities, on_attach)
    vim.lsp.config('clangd', {
        capabilities = capabilities,
        on_attach = on_attach,
        cmd = {
            "clangd",
            "--background-index",
            "--completion-style=detailed"
       },
        init_options = {
            clangdFileStatus = true,
            usePlaceholders = true,
            completeUnimported = true,
        },
    })
    vim.lsp.enable('clangd')
end

return M

