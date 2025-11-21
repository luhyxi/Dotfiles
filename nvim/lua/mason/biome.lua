local lspconfig = require("lspconfig")

local M = {}

function M.setup(capabilities, on_attach)
    lspconfig.biome.setup({
        capabilities = capabilities,
        on_attach = function(client, bufnr)
            if on_attach then
                on_attach(client, bufnr)
            end

            -- Biome should always provide formatting
            client.server_capabilities.documentFormattingProvider = true

            -- Biome format on save
            local augroup = vim.api.nvim_create_augroup("BiomeFormatOnSave", { clear = false })
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    vim.lsp.buf.format({
                        bufnr = bufnr,
                        filter = function(format_client)
                            return format_client.name == "biome"
                        end,
                    })
                end,
            })
        end,
    })
end

return M
