local util = require("formatter.util")
require("formatter").setup({
	-- Enable or disable logging
	logging = true,
	-- Set the log level
	log_level = vim.log.levels.WARN,
	-- All formatter configurations are opt-in
	filetype = {
		-- Formatter configurations for filetype "lua" go here
		-- and will be executed in order
		lua = {
			-- "formatter.filetypes.lua" defines default configurations for the
			-- "lua" filetype
			require("formatter.filetypes.lua").stylua,
			function()
				return {
					exe = "stylua",
					args = {
						"--search-parent-directories",
						"--stdin-filepath",
						util.escape_path(util.get_current_buffer_file_path()),
						"--",
						"-",
					},
					stdin = true,
				}
			end,
		},
		python = {
			-- "formatter.filetypes.lua" defines default configurations for the
			-- "lua" filetype
			require("formatter.filetypes.python").black,
			function()
				return {
					exe = "black",
					args = {
						"--quiet",
						"--fast",
						"-",
					},
					stdin = true,
				}
			end,
			function()
				return {
					exe = "isort",
					args = {
						"-",
					},
					stdin = true,
				}
			end,
		},
		typescriptreact = {
			require("formatter.filetypes.typescriptreact").prettier,
			function()
				return {
					exe = "prettier",
					args = {
						util.escape_path(util.get_current_buffer_file_path()),
						-- "--quiet",
						-- "--fast",
						-- "-",
					},
					stdin = true,
				}
			end,
		},
		javascript = {
			require("formatter.filetypes.javascript").prettier,
			function()
				return {
					exe = "prettier",
					args = {
						util.escape_path(util.get_current_buffer_file_path()),
						-- "--quiet",
						-- "--fast",
						-- "-",
					},
					stdin = true,
				}
			end,
		},
		css = {
			require("formatter.filetypes.css").prettier,
			function()
				return {
					exe = "prettier",
					args = {
						util.escape_path(util.get_current_buffer_file_path()),
						-- "--quiet",
						-- "--fast",
						-- "-",
					},
					stdin = true,
				}
			end,
		},
		dart = {
			function()
				return {
					exe = "dart",
					args = {
						"format",
					},
					stdin = false,
				}
			end,
		},
		c = {
			require("formatter.filetypes.c").clangformat,
			function()
				return {
					exe = "clang-format",
					args = {
						util.escape_path(util.get_current_buffer_file_path()),
						-- "--quiet",
						-- "--fast",
						-- "-",
					},
					stdin = true,
				}
			end,
		},
		["*"] = {
			-- "formatter.filetypes.any" defines default configurations for any
			-- filetype
			require("formatter.filetypes.any").remove_trailing_whitespace,
		},
	},
})
