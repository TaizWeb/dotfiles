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
	settings = {
		pylsp = {
			plugins = {
				pylint = {
					enabled = false,
				},
				pyflakes = {
					enabled = false,
				},
			},
		},
	},
})

-- Doing this to support virtualenv location and ensure the LSP has it
-- local python_location = os.execute("which python3")
-- vim.g.python3_host_prog = python_location

-- Typescript LSP
require("lspconfig")["eslint"].setup({
	capabilities = capabilities,
})
