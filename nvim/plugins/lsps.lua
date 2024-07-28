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
				pycodestyle = {
					enabled = false,
				},
			},
		},
	},
})

-- Python LSP, but with Ruff
require("lspconfig")["ruff_lsp"].setup({
	capabilities = capabilities,
	init_options = {
		settings = {
			args = {},
		},
	},
})

-- C LSP
require("lspconfig")["clangd"].setup({
	capabilities = capabilities,
})

-- Dart LSP
require("lspconfig")["dartls"].setup({
	capabilities = capabilities,
	cmd = { "/usr/bin/dart", "language-server", "--protocol=lsp" },
	on_attach = require("cmp_nvim_lsp").on_attach,
	settings = {
		dart = {
			completeFunctionCalls = true,
			showTodos = true,
		},
	},
	filetypes = { "dart" },
})

-- Doing this to support virtualenv location and ensure the LSP has it
-- local python_location = os.execute("which python3")
-- vim.g.python3_host_prog = python_location

-- Typescript LSP
require("lspconfig")["eslint"].setup({
	capabilities = capabilities,
})

-- CSS LSP
require("lspconfig")["cssls"].setup({
	capabilities = capabilities,
})
