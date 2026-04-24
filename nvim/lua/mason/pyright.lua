local M = {}

function M.setup(capabilities, on_attach)
    vim.lsp.enable('basedpyright')
end

return M
