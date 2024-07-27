local plugins = require("nvim.plugins.packer-plugins")
local packer = require("packer")

packer.init({
	display = {
		non_interactive = true,
	},
})

plugins.setup(packer)

packer.install()

-- Automatically quit Neovim after installation
vim.cmd("autocmd User PackerComplete quitall")
