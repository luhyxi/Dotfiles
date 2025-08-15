return {
    {
        "windwp/nvim-autopairs",
        config = function()
            local npairs = require("nvim-autopairs")
            npairs.setup({
                check_ts = true,
                ts_config = {
                    lua = { "string" },
                    javascript = { "template_string" },
                },
            })
        end,
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
        },
    },
}
