local lspconfig = require("lspconfig")
local util = require("lspconfig.util")

local M = {}

function M.setup(capabilities, on_attach)
    lspconfig.ts_ls.setup({
        capabilities = capabilities,
        on_attach = on_attach,

        root_dir = function(fname)
            if util.root_pattern("deno.json", "deno.jsonc")(fname) then
                return nil
            end
            return util.root_pattern("package.json", "tsconfig.json", "jsconfig.json")(fname)
        end,

        single_file_support = false,
        documentFormattingProvider = false,

        settings = {
            typescript = {
                inlayHints = {
                    includeInlayParameterNameHints = "all",
                    includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                    includeInlayFunctionParameterTypeHints = true,
                    includeInlayVariableTypeHints = true,
                    includeInlayPropertyDeclarationTypeHints = true,
                    includeInlayFunctionLikeReturnTypeHints = true,
                    includeInlayEnumMemberValueHints = true,
                },
            },
            javascript = {
                inlayHints = {
                    includeInlayParameterNameHints = "all",
                    includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                    includeInlayFunctionParameterTypeHints = true,
                    includeInlayVariableTypeHints = true,
                    includeInlayPropertyDeclarationTypeHints = true,
                    includeInlayFunctionLikeReturnTypeHints = true,
                    includeInlayEnumMemberValueHints = true,
                },
            },
        },
    })
end

return M

