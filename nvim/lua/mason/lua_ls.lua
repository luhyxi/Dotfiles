local M = {}

function M.setup(capabilities, on_attach)
    vim.lsp.config('lua_ls', {
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
            Lua = {
                telemetry = {
                    enable = false,
                },
            },
        },
    vim.lsp.enable('lua_ls')
    })
end

return M
