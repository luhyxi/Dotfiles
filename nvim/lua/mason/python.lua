local M = {}

function M.setup(capabilities, on_attach)
    vim.lsp.config("ruff", {
        init_options = {
            settings = {
                -- Ruff language server settings go here
            },
        },
    })
    vim.lsp.enable("basedpyright")
    vim.lsp.enable("ruff")
end

return M
