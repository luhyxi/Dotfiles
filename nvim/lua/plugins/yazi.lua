return {
    "mikavilpas/yazi.nvim",
    event = "VeryLazy",
    keys = {
        {
            "<leader>y",
            "<cmd>Yazi<cr>",
            desc = "Open yazi at the current file",
        },
    },
    opts = {
        open_for_directories = true,
        keymaps = {
            show_help = '<f1>',
            change_working_directory = "<c-w>",
        },
    },
}
