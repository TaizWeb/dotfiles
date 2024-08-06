local util = require("formatter.util")
require("formatter").setup({
	-- Enable or disable logging
	logging = true,
	-- Set the log level
	log_level = vim.log.levels.WARN,
	-- All formatter configurations are opt-in
	filetype = {
		lua = require("plugins.format.lua"),
		python = require("plugins.format.python"),
		typescriptreact = require("plugins.format.typescript"),
		javascript = require("plugins.format.javascript"),
		css = require("plugins.format.css"),
		dart = require("plugins.format.dart"),
		c = require("plugins.format.c"),
		["*"] = {
			-- "formatter.filetypes.any" defines default configurations for any
			-- filetype
			require("formatter.filetypes.any").remove_trailing_whitespace,
		},
	},
})
