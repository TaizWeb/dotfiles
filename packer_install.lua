local packer = require("packer")

packer.init({
	display = {
		non_interactive = true,
	},
})

packer.startup(function(use)
	use("wbthomason/packer.nvim")
end)

packer.install()

-- Automatically quit Neovim after installation
vim.cmd("autocmd User PackerComplete quitall")
