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
	"stylua",
	"clang-format",
	"clangd",
}

-- Install packages
local function ensure_installed(packages)
	local installed = require("mason-registry").get_installed_packages()
	for _, pkg in ipairs(packages) do
		if not installed[pkg] then
			require("mason").install(pkg)
		end
	end
end

-- Run the installation function
ensure_installed(dependencies)

-- Automatically quit Neovim after installation
vim.cmd("autocmd User MasonInstallComplete quitall")
