local cmp = require("cmp")
local luasnip = require("luasnip")

require("luasnip.loaders.from_vscode").lazy_load()

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
        -- Enhanced navigation
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-p>'] = cmp.mapping.select_prev_item(),
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp', priority = 1000 },
        { name = 'luasnip', priority = 750 },
        { name = 'buffer', priority = 500, keyword_length = 3 },
        { name = 'path', priority = 250 },
        { name = 'calc', priority = 200 }, -- Math calculations
        { name = 'emoji', priority = 100 }, -- Emoji completions
    }),
    formatting = {
        format = function(entry, vim_item)
            -- Add source labels with icons
            vim_item.menu = ({
                nvim_lsp = '[LSP]',
                luasnip = '[Snippet]',
                buffer = '[Buffer]',
                path = '[Path]',
                calc = '[Calc]',
                emoji = '[Emoji]',
            })[entry.source.name]
            return vim_item
        end,
    },
    -- Enhanced completion behavior
    completion = {
        completeopt = 'menu,menuone,noinsert',
        keyword_length = 1,
    },
    -- Experimental features
    experimental = {
        ghost_text = true, -- Shows ghost text for completions
    },
})

-- Enhanced autopairs configuration
local autopairs = require('nvim-autopairs')
autopairs.setup({
    check_ts = true, -- Use treesitter for better context
    ts_config = {
        lua = {'string', 'source'},
        javascript = {'string', 'template_string'},
        java = false,
    },
    disable_filetype = { "TelescopePrompt", "spectre_panel" },
    disable_in_macro = false,
    disable_in_visualblock = false,
    disable_in_replace_mode = true,
    ignored_next_char = [=[[%w%%%'%[%"%.%`%$]]=],
    enable_moveright = true,
    enable_afterquote = true,
    enable_check_bracket_line = false,
    enable_bracket_in_quote = true,
    enable_abbr = false,
    break_undo = true,
    check_comma = true,
    map_cr = true,
    map_bs = true,
    map_c_h = false,
    map_c_w = false,
})

-- Integrate autopairs with cmp
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())

-- Auto-completion for command line
cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    }
})

cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        { name = 'cmdline' }
    }),
    matching = { disallow_symbol_nonprefix_matching = false }
})

