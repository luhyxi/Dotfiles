local gh = require("misc.const").gh

vim.pack.add({
    { src = gh("MunifTanjim/nui.nvim") },
    { src = gh("rcarriga/nvim-notify") },
    { src = gh("folke/noice.nvim") },
})

require("notify").setup({})

require("noice").setup({
    lsp = {
        override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
        },
    },
    presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
        inc_rename = false,
        lsp_doc_border = true,
    },
})
