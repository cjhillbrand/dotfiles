local mason = require("mason")
local mason_lsp = require("mason-lspconfig")
local lsp = require('lsp-zero')

mason.setup({})
mason_lsp.setup({
	ensure_installed = {
		'lua_ls'
	},
	handlers = {
		lsp.default_setup,
		lua_ls = function()
			local lua_opts = lsp.nvim_lua_ls()
			require('lspconfig').lua_ls.setup(lua_opts)
		end
	}
})
