require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = { "lua_ls" }
})
local lsp = require('lsp-zero')

lsp.on_attach(function(_, bufnr)
	lsp.default_keymaps({buffer = bufnr})
end)

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
cmp.setup({
	mapping = cmp.mapping.preset.insert({
		['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
		['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
		['<C-y>'] = cmp.mapping.confirm(),
		['<C-Space>'] = cmp.mapping.complete(),
	})
})

require("lspconfig").lua_ls.setup {}
