-- Swap to the config directory, since CWD is wherever nvim was called
local original_dir = vim.fn.getcwd()
vim.cmd("cd " .. vim.fn.stdpath("config"))

-- Preload stuff
-- Make Python linters shut up about imports
local python_location = vim.fn.system("which python3")
vim.g.python3_host_prog = string.sub(python_location, 1, -2) -- snip last char

-- Load all the plugins
require("plugins.packer-plugins")

-- Misc default setups
require("nvim-tree").setup()
require("mason").setup()
require("gitsigns").setup()

require("plugins.linters")
require("plugins.formatters")
require("plugins.autocompletion")
require("plugins.lsps")
require("plugins.gui")
require("autocmds")
require("settings")
require("keybinds")

-- Tree sitter
require("nvim-treesitter.configs").setup({
	ensure_installed = { "python", "vim" },

	auto_install = true,
	highlight = {
		enable = true,
	},

	rainbow = {
		enable = true,
		query = "rainbow-parens",
		-- Highlight the entire buffer all at once
		strategy = require("ts-rainbow").strategy.global,
	},
})

-- Indent Blankline settings
require("ibl").setup({
	scope = { show_exact_scope = true },
})

-- Now that eveything's loaded, go back to the dir nvim was called from
vim.cmd("cd " .. original_dir)
