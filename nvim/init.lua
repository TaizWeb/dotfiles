-- Swap to the config directory, since CWD is wherever nvim was called
local original_dir = vim.fn.getcwd()
vim.cmd("cd " .. vim.fn.stdpath("config"))

-- Preload stuff
-- Make Python linters shut up about imports
local python_location = vim.fn.system("which python3")
vim.g.python3_host_prog = string.sub(python_location, 1, -2) -- snip last char

-- Force the bootstrap to take place
require("plugins.lazy-bootstrap")

-- Grab lazy and the plugins and set them up
local lazy = require("lazy")
local plugins = require("plugins.lazy-plugins")
local opts = {}
lazy.setup(plugins, opts)

-- Load all the plugins
-- local packer = require("packer")
-- local plugins = require("plugins.packer-plugins")
-- plugins.setup(packer)

-- Misc default setups
require("nvim-tree").setup()
require("mason").setup()
require("gitsigns").setup()
require("trouble").setup()

require("plugins.linters")
require("plugins.formatters")
require("plugins.autocompletion")
require("plugins.lsps")
require("plugins.gui")
require("autocmds")
require("settings")
require("keybinds")

-- Indent Blankline settings
require("ibl").setup({
	scope = { show_exact_scope = true },
})

-- Now that eveything's loaded, go back to the dir nvim was called from
vim.cmd("cd " .. original_dir)
