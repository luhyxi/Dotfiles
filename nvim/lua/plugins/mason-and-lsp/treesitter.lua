return {
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        build = ":TSUpdate",
        install_dir = vim.fn.stdpath("data") .. "/site",
        config = function()
            vim.api.nvim_create_autocmd("FileType", {
                pattern = { "cpp, hpp" },
                callback = function()
                    vim.treesitter.start()
                end,
            })
        end,
    },
}
