local lspconfig = require("lspconfig")

local M = {}

function M.setup(capabilities, on_attach)
    lspconfig.gopls.setup({
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
end

return M
