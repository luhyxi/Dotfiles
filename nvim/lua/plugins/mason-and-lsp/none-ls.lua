local gh = require("misc.const").gh

vim.pack.add({
    { src = gh("nvimtools/none-ls.nvim"), name = "none-ls" },
})

local nls = require("null-ls")

nls.setup({
    sources = {
        nls.builtins.formatting.gofmt,
        nls.builtins.formatting.goimports,
        nls.builtins.formatting.clang_format.with({
            extra_args = { "--style=file" },
        }),
        nls.builtins.formatting.prettier.with({
            filetypes = { "html", "css", "scss", "less", "yaml", "markdown" },
        }),
        nls.builtins.formatting.stylua,
        nls.builtins.code_actions.gitsigns,
        nls.builtins.diagnostics.cppcheck,
    },
})
