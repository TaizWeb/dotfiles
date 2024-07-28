local mason = require("mason")

mason.init({
	display = {
		non_interactive = true,
	},
})

local dependencies = {
	"black",
	"pylint",
	"python-lsp-server",
	"isort",
	"eslint-lsp",
	"eslint_d",
	"css-lsp",
	"prettier",
	"lua-language-server",
	"luacheck",
	"luaformatter",
	"ruff",
	"ruff-lsp",
	"stylua",
	"clang-format",
	"clangd",
}

-- Install packages
vim.cmd("MasonInstall " .. table.concat(dependencies, " "))

-- Automatically quit Neovim after installation
vim.cmd("autocmd User MasonInstallComplete quitall")
