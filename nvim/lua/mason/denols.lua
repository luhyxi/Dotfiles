local lspconfig = require("lspconfig")

local M = {}

function M.setup(capabilities, on_attach)
    lspconfig.denols.setup({
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
end

return M
