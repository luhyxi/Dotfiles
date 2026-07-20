local gh = require("misc.const").gh

vim.pack.add({
    { src = gh("saghen/blink.cmp") },
    { src = gh("saghen/blink.lib") },
    { src = gh("rafamadriz/friendly-snippets") },
})

require("blink.cmp").setup({
    keymap = {
        preset = "default",
        ["<Up>"] = {},
        ["<Down>"] = {},
    },
    appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = "mono",
    },
    sources = {
        default = { "lsp", "path", "snippets", "buffer" },
        providers = {
            buffer = { min_keyword_length = 1 },
            path = { min_keyword_length = 0 },
        },
    },
    completion = {
        accept = {
            auto_brackets = { enabled = true },
        },
        menu = {
            draw = { treesitter = { "lsp" } },
        },
        documentation = {
            auto_show = true,
            auto_show_delay_ms = 200,
            window = {
                border = "rounded",
            },
        },
    },
    signature = { enabled = true },
    cmdline = {
        keymap = { preset = "inherit" },
        completion = { menu = { auto_show = true } },
    },
})

if vim.fn.executable("cargo") == 1 then
    require("blink.cmp").build():wait(60000)
end
