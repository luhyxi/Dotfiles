local gh = require("misc.const").gh
local setup = require("misc.utils").setup

vim.pack.add({
    {
        src = gh("windwp/nvim-autopairs"),
        dependencies = {
            { src = gh("nvim-treesitter/nvim-treesitter") },
        },
        config = setup("nvim-autopairs", {
            check_ts = true,
            ts_config = {
                lua = { "string" },
                javascript = { "template_string" },
            },
        }),
    },
})
