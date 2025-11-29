local lspconfig = require("lspconfig")

local M = {}

function M.setup(capabilities, on_attach)
    lspconfig.clangd.setup({
        capabilities = capabilities,
        on_attach = function(client, bufnr)
            if on_attach then
                on_attach(client, bufnr)
            end
        end,
        cmd = {
            "clangd",
            "--background-index",
            "--clang-tidy",
            "--completion-style=detailed",
       },
        init_options = {
            clangdFileStatus = true,
            usePlaceholders = true,
            completeUnimported = true,
        },
    })
end

return M

