local M = {}

function M.setup(capabilities, on_attach)
    vim.lsp.config("bashls", {
        capabilities = capabilities,
        on_attach = function(client, bufnr)
            if on_attach then
                on_attach(client, bufnr)
            end
        end,
    })
    vim.lsp.enable("bashls")
end

return M
