-- LSP
require("lspconfig").lua_ls.setup({}) -- Lua

-- Set up lspconfig.
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Lua LSP
require("lspconfig")["lua_ls"].setup({
	capabilities = capabilities,
})

-- Python LSP
require("lspconfig")["pylsp"].setup({
	capabilities = capabilities,
})
