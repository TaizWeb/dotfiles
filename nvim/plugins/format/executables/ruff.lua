local util = require("formatter.util")

return {
	exe = "ruff",
	args = {
		"check",
		"--fix",
		"--select", -- Autofix skill issues
		"PIE",
		"--select", -- Apply Isort
		"I",
		"--stdin-filename",
		util.get_current_buffer_file_path(),
	},
	stdin = true,
}
