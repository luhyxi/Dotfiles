return {
    {
        "akinsho/toggleterm.nvim",
        version = "*",
        keys = {
            { "<C-t>", function() require("toggleterm").toggle() end, desc = "Toggle Terminal" },
        },
        opts = {
            size = 20,
            open_mapping = "<C-t>",
            hide_numbers = true,
            shade_terminals = true,
            persist_size = true,
            close_on_exit = true,
            direction = "float",
            float_opts = {
                border = "curved",
                winblend = 0,
            },
        },
    },
}
