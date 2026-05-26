local gh = require("misc.const").gh

vim.pack.add({
    { src = gh("nvim-telescope/telescope.nvim"), name = "telescope" },
    { src = gh("nvim-telescope/telescope-ui-select.nvim") },
})

require("telescope").setup({
    extensions = {
        ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
        },
    },
})

require("telescope").load_extension("ui-select")
