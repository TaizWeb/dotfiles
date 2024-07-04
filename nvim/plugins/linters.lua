-- Linter File types
require("lint").linters_by_ft = {
	-- lua = {
	-- 	{
	-- 		cmd = "luacheck",
	-- 		args = { "--globals", "vim", "love" },
	-- 		stdin = true,
	-- 	},
	-- },
	lua = { "luacheck", args = { "--globals ", "vim" } },
	lua = { "luacheck" },
	python = { "pylint" },
	typescriptreact = { "eslint_d" },
}
