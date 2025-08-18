return {
    {
        "nvimtools/none-ls.nvim",
        opts = function(_, opts)
            local nls = require("null-ls").builtins
            opts.sources = vim.list_extend(opts.sources or {}, {
                nls.formatting.biome.with({
                    args = { "format", "--stdin-file-path", "$FILENAME" },
                }),
                nls.formatting.gofmt,
                nls.formatting.goimports,
                nls.formatting.prettier.with({
                    filetypes = { "html", "css", "scss", "less", "yaml", "markdown" },
                }),
                nls.formatting.stylua,
                nls.code_actions.gitsigns,
            })
        end,
    },
}
