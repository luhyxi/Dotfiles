local gh = require("misc.const").gh

vim.pack.add({
	{ src = gh("tpope/vim-dadbod") },
	{ src = gh("kristijanhusak/vim-dadbod-completion"), ft = { "sql", "mysql", "plsql" } },
	{
		src = gh("kristijanhusak/vim-dadbod-ui"),
		dependencies = {
			{ src = gh("tpope/vim-dadbod") },
			{ src = gh("kristijanhusak/vim-dadbod-completion") },
		},
		config = function()
			vim.g.db_ui_use_nerd_fonts = 1
		end,
	},
})
