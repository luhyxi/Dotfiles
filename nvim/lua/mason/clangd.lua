local M = {}

function M.setup(capabilities, on_attach)
    vim.lsp.config("clangd", {
        capabilities = capabilities,
        on_attach = on_attach,
        cmd = {
            "clangd",
            "--background-index",
            "--completion-style=detailed",
        },
        init_options = {
            clangdFileStatus = true,
            usePlaceholders = true,
            completeUnimported = true,
        },
        root_markers = { ".clangd", "compile_commands.json" },
        filetypes = { "c", "cpp" },
    })
    vim.lsp.enable("clangd")
end

return M
