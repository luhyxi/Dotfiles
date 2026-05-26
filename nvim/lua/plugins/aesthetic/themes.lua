local gh = require("misc.const").gh

vim.pack.add({
    { src = gh("catppuccin/nvim") },
    { src = gh("Mofiqul/vscode.nvim"), name = "vscode" },
})

require("vscode").setup({
    terminal_colors = true,
    italic_comments = true,
    disable_nvimtree_bg = true,
    underline_links = true,
})

vim.cmd.colorscheme("vscode")
