local dap_conf = {
	type = "python",
	request = "launch",
	name = "Launch current file",
	-- The file to run
	program = "main.py",
	-- Or, run a module instead
	--module = "module_name",
	console = "integratedTerminal",
}
return dap_conf
