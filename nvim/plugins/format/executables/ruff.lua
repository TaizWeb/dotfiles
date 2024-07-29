return {
	exe = "ruff",
	args = {
		"check",
		"--fix-only",
		"--select",
		"ALL",
		"--stdin-filename",
		"-",
	},
	stdin = true,
}
