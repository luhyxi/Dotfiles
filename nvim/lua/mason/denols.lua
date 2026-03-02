local M = {}

function M.setup(capabilities, on_attach)
    vim.lsp.config('denols', {
        capabilities = capabilities,
        on_attach = on_attach,
        root_markers = {"deno.json", "deno.jsonc"},
        settings = {
            deno = {
                enable = true,
                lint = true,
                unstable = false,
            },
        },
    })
    vim.lsp.enable('denols')
end

return M
