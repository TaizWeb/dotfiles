-- Linter File types
local lint = require("lint")
-- local luacheck = lint.linters.luacheck
-- luacheck.args = {
-- 	"--globals",
-- 	"love",
-- 	"-",
-- }

lint.linters_by_ft = {
	-- lua = {
	-- 	{
	-- 		cmd = "luacheck",
	-- 		args = { "--globals", "vim", "love" },
	-- 		stdin = true,
	-- 	},
	-- },
	lua = { cmd = "luacheck", args = { "--globals ", "vim" } },
	lua = { "luacheck" },
	typescriptreact = { "eslint_d" },
}
