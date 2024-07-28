local util = require("formatter.util")

return {
	exe = "clang-format",
	args = {
		util.escape_path(util.get_current_buffer_file_path()),
	},
	stdin = true,
}
