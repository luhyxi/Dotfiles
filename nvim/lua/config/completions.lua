local cmp = require ("cmp")

cmp.setup({
	snippet = {
		expand = function(args)
			vim.snippet.expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		['<C-b>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.abort(),
		['<Tab>'] = cmp.mapping.confirm({ select = true }),
	}),
	sources = cmp.config.sources({
		{ name = 'nvim_lsp', priority = 1000 },
		{ name = 'luasnip', priority = 750 },
		{ name = 'buffer', priority = 500 },
		{ name = 'path', priority = 250 },
	}),
	formatting = {
		format = function(entry, vim_item)
			-- Add source labels
			vim_item.menu = ({
				nvim_lsp = '[LSP]',
				luasnip = '[Snippet]',
				buffer = '[Buffer]',
				path = '[Path]',
			})[entry.source.name]
			return vim_item
		end,
	},
})

