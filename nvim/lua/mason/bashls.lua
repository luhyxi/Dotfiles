local lspconfig = require("lspconfig")

local M = {}

function M.setup(capabilities, on_attach)
    lspconfig.bashls.setup({
        capabilities = capabilities,
        on_attach = function(client, bufnr)
            if on_attach then
                on_attach(client, bufnr)
            end
        end,
    })
end

return M
