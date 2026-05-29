require("vim._core.ui2")

require("misc.const")
require("misc.vim_cmd")
require("misc.utils").load({
    "plugins.navigation",
    "plugins.aesthetic",
    "plugins.misc",
    "plugins.text-editing",
    "plugins.mason-and-lsp",
    "plugins.db",
})

require("misc.keymaps")

vim.cmd.colorscheme("vscode")
