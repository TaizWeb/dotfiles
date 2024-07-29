return {
	exe = "ruff",
	args = {
		"check",
		"--fix",
		"--select", -- Autofix skill issues
		"PIE",
		"--select", -- Apply Isort
		"I",
	},
	stdin = false,
}
