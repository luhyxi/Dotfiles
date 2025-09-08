return {
  {
	"nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
        config = function ()
        local configs = require("nvim-treesitter.configs")
        configs.setup({
            ensure_installed = { "c", "c_sharp", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html", "go" },
            sync_install = false,
            auto_install = true,
            ignore_install = {},
            modules = {},
            highlight = { enable = true },
            indent = { enable = true },
        })
    end
  }
}
