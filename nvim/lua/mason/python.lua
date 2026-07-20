local M = {}

function M.setup(capabilities, on_attach)
    vim.lsp.config("ruff", {
        capabilities = capabilities,
        init_options = {
            settings = {
                -- Ruff language server settings go here
            },
        },
    })
    vim.lsp.config("basedpyright", {
        capabilities = capabilities,
    })
    vim.lsp.enable("basedpyright")
    vim.lsp.enable("ruff")
end

return M
