require("vim._core.ui2")

require("misc.const")
require("misc.keymaps")
require("misc.vim_cmd")
require("misc.utils").load({
    "plugins.aesthetic",
    "plugins.misc",
    "plugins.text-editing",
    "plugins.navigation",
    "plugins.mason-and-lsp",
    "plugins.db",
})

vim.cmd.colorscheme("vscode")
