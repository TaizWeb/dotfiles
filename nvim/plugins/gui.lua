-- Colorscheme
require("onedark").load()

-- Lualine
require("lualine").setup()

-- Bufferline
require("bufferline").setup({
	options = {
		separator_style = "slant",
	},
})

-- Enabling rainbow parenthesis
vim.g.rainbow_active = 1
