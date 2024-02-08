local cmp = require("cmp")
local lspkind = require("lspkind")
local luasnip = require("luasnip")

return {
	completion = {
		completeopt = "menu,menuone",
	},
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	sources = {
		{ name = "nvim_lsp" },
		{ name = "buffer" },
	},
	mapping = cmp.mapping.preset.insert({
		['<C-u>'] = cmp.mapping.scroll_docs(-4), -- Up
		['<C-d>'] = cmp.mapping.scroll_docs(4), -- Down
		['<Tab>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior }),
		['<S-Tab>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior }),
		['<C-Space>'] = cmp.mapping.complete(),
		['<CR>'] = cmp.mapping.confirm {
			behavior = cmp.ConfirmBehavior.Insert,
			select = false,
		},
	}),
	formatting = {
		format = lspkind.cmp_format({
			preset = "default",
			mode = "symbol_text",
            maxwidth = 20,
            ellipsis_char = "...",
		}),
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
}


